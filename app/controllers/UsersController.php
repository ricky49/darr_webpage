<?php namespace App\Controllers;

use App\Libraries\Validator;

class UsersController extends ControllerBase
{

    /**
     * BEfore execute
     *
     * @param  dispatcher $dispatcher
     * @return void
     */
    public function beforeExecuteRoute($dispatcher)
    {
        if (!$this->isLogged()) {
            $this->flash->warning('Por favor ingrese sus datos para iniciar sesion');
            return $this->response->redirect('/login');
        }

        if ($this->session->user_data->rol != 'Admin') {
            $this->flash->warning('No tienes permisos para ver este contenido');
            return $this->response->redirect('/');
        }
    }
    /**
     * Default  user view.
     *
     * @return view
     */
    public function indexAction()
    {
        //Section title
        $this->view->section_title = 'Usuarios';
        $this->view->users = $this->sdk->getUsers();
        return $this->view->pick('users/index');
    }

    /**
     * Create user.
     *
     * @return view
     */
    public function createAction()
    {
        $this->view->section_title = 'Creacion de usuario';
        if ($this->request->isPost()) {
            $response = $this->store($this->request->getPost());
            if (isset($response->success) && !$response->success && isset($response->body)) {
                $errors = [];
                $str_error = '';
                if (isset($response->body->errmsg)) {
                    $str_error = "Error: " . $response->body->errmsg;
                } else {
                    foreach ($response->body->errors as $key => $value) {
                        $errors[] = $key;
                    }
                    $str_error = ucfirst($response->body->message) . ". Te falta: " . Validator::stringFromArray($errors);
                }
                $this->flash->error((string) $str_error);
                return $this->view->pick('users/create');
            } else {
                $this->flash->success("Usuario creado satisfactoriamente");
                return $this->response->redirect('users');
            }
        }
        $this->view->roles = $this->sdk->getRoles();
        return $this->view->pick('users/create');
    }

    private function store($data)
    {
        return $this->sdk->createUser([
            'user' => $data['user'],
            'pass' => $data['pass'],
            'mail' => $data['email'],
            'lastname' => $data['lastname'],
            'name' => $data['name'],
            'document' => $data['document'],
            'rol' => $data['rol'],
        ]);
    }

    /**
     * Edit user.
     *
     * @return view
     */
    public function editAction($id)
    {
        $this->view->section_title = 'Edicion de usuario';
        $response = $this->sdk->getUser($id);
        if (isset($response->success) && !$response->success) {
            $this->flash->error('Usuario no encontrado');
            return $this->response->redirect('/users');
        }
        $this->view->user = $response;
        if (!isset($response->lastname)) {
            $response->lastname = "";
        }

        $this->view->roles = $this->sdk->getRoles();
        return $this->view->pick('users/edit');
    }

    /**
     * Save user.
     *
     * @return view
     */
    public function saveAction($id)
    {

        $response = ($this->sdk->updateUser($id, $this->request->getPost()));

        if (isset($response->success) && !$response->success && isset($response->body)) {
            $errors = [];
            $str_error = '';
            if (isset($response->body->errmsg)) {
                $str_error = "Error: " . $response->body->errmsg;
            } else {
                foreach ($response->body->errors as $key => $value) {
                    $errors[] = $key;
                }
                $str_error = ucfirst($response->body->message) . ". Te falta: " . Validator::stringFromArray($errors);
            }
            $this->flash->error((string) $str_error);
            return $this->response->redirect($_SERVER['HTTP_REFERER']);
        } else {
            $this->flash->success("Usuario actualizado");
            return $this->response->redirect($_SERVER['HTTP_REFERER']);
        }

    }
    /**
     * Delete user.
     *
     * @return view
     */
    public function deleteAction($id)
    {
        $response = $this->sdk->deleteUser($id);
        if (isset($response->success) && !$response->success && isset($response->body)) {
            if (isset($response->body->status) && $response->body->status == "404") {
                $this->flash->error("No se encuentra el usuario");
                return $this->response->redirect('users');
            }
        }

        $this->flash->success("Usuario borrado");
        return $this->response->redirect('users');
    }

}
