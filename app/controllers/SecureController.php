<?php namespace App\Controllers;

use App\Libraries\Email;
use App\Libraries\Validator;

class SecureController extends ControllerBase
{
    /**
     * Login process
     *
     * @return mixed
     */
    public function loginAction()
    {
        if (!$this->request->isPost()) {
            $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
            return $this->view->pick('secure/login');
        }
        $validate_input = Validator::requiredKeys($this->request->getPost(), ['username' => '', 'password' => '']);

        if (!$validate_input->ok) {
            $this->flash->error(Validator::stringFromArray($validate_input->errors, 'Te falta: '));
            return $this->response->redirect('/login');
        }

        $response = $this->sdk->authenticate($validate_input->data->username, $validate_input->data->password);
        if (!$response->success) {
            $this->flash->error($response->message);
            return $this->response->redirect('/login');
        }

        $this->session->set('identity', $response->userData->_id);
        $this->session->set('user_data', $response->userData);
        $this->session->set('user_session_token', $response->token);
        if ($this->isLogged()) {
            return $this->response->redirect('/');
        }
        return $this->response->redirect('/login');
    }

    /**
     * Logout process
     *
     * @return redirect
     */
    public function logoutAction()
    {
        if ($this->session->has('user_data')) {
            $this->session->remove('user_data');
        }
        if ($this->session->has('identity')) {
            $this->session->remove('identity');
        }
        if ($this->session->has('user_session_token')) {
            $this->session->remove('user_session_token');
        }
        return $this->response->redirect('/');
    }

    /**
     * Sign up view
     *
     * @return view
     */
    public function signUpAction()
    {
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        return $this->view->pick('secure/sign-up');
    }

    /**
     * Register user.
     *
     * @return view
     */
    public function registerAction()
    {
        $input = $this->request->getPost();

        if ($input['pass'] != $input['pass_confirm']) {
            $this->flash->error("Las contraseñas no coinciden");
            return $this->response->redirect($_SERVER['HTTP_REFERER']);
        }
        unset($input['pass_confirm']);
        $response = $this->sdk->createUser($input);
        if (isset($response->success) && !$response->success && isset($response->body)) {
            $this->flash->error("El usuario o el email han sido tomados");
            return $this->response->redirect($_SERVER['HTTP_REFERER']);
        } else {
            $response = $this->sdk->authenticate($response->user, $response->pass);
            if (!$response->success) {
                $this->flash->error($response->message);
                return $this->response->redirect('/login');
            }

            //$user_data = $this->sdk->getUserByUsername($response->userData);
            //Notify user on change status
            // print_r($response);die();
            $user_data = $response->userData;
            $sender = new Email();
            $sender->sendMessage([
                'subject' => 'Creacion de Usuario',
                'to_email' => $user_data->mail,
                'message' => $this->di->getViewSimple()->render('emails/new_user',
                    [
                        'url' => getenv('DOMAIN_URL'),
                        'user' => $user_data,
                        'domain' => getenv('DOMAIN_URL'),

                    ]),
            ]);
            $this->session->set('identity', $response->userData->_id);
            $this->session->set('user_data', $response->userData);
            $this->session->set('user_session_token', $response->token);
            if ($this->isLogged()) {
                return $this->response->redirect('/');
            }
            $this->flash->success("Usuario actualizado");
            return $this->response->redirect($_SERVER['HTTP_REFERER']);
        }

    }

    /**
     * Sign up view
     *
     * @return view
     */
    public function remindPasswordAction()
    {
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        // $this->flash->success('cdoi');
        return $this->view->pick('secure/remind-password');
    }

}
