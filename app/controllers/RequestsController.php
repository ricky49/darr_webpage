<?php namespace App\Controllers;

use App\Libraries\Email;
use App\Libraries\Validator;

class RequestsController extends ControllerBase
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
            $this->flash->warning('Por favor has login antes de continuar');
            return $this->response->redirect('/login');
        }
        if ($this->session->user_data->rol == 'Instrumentista') {
            $this->flash->warning('No tienes permisos para ver este contenido');
            return $this->response->redirect('/');
        }
        if ($this->session->user_data->rol == 'Vendedor') {
            $this->flash->warning('No tienes permisos para ver este contenido');
            return $this->response->redirect('/');
        }
    }

    /**
     * Home section
     *
     * @return view
     */
    public function indexAction()
    {
        //Section title
        $this->view->section_title = 'Creacion de solicitud';
        $this->view->centers = $this->sdk->getCenters();
        $this->view->procedures = $this->sdk->getProcedures();
        $this->view->items = $this->sdk->getProducts();
        if ($this->session->has('request_process')) {
            $this->session->remove('request_process');
        }
        return $this->view->pick('requests/index');
    }

    /**
     * Ajax plates from procedure id
     *
     * @return view
     */
    public function platesAction($id)
    {

        $response = $this->sdk->getPlates($id);
        if (isset($response->success) && !$response->success) {
            $response = [];
        }
        $html = [];
        foreach ($response as $key => $value) {
            $html[] = ['value' => $value->_id, 'text' => $value->plate_id];
        }
        echo json_encode($html);
        exit();
    }

    /**
     * View request
     *
     * @return view
     */
    public function viewAction($id)
    {
        $this->view->section_title = 'Vista de solicitud';
        $response = $this->sdk->getSolicitud($id);
        if (isset($response->success) && !$response->success) {
            $this->flashSession->error("Solicitud no encontrada");
            return $this->response->redirect('/requests');
        }

        $this->view->req = $response;
        $this->view->req->procedure_name_label = $this->sdk->getProcedure($response->procedure_name)->procedure_desc;
        $plates = [];
        foreach (explode(',', $response->item_manuales) as $value) {
            $items[] = $this->sdk->getProduct($value);
        }
        $this->view->items = $items;
        return $this->view->pick('requests/view');
    }

    /**
     * Preview request
     *
     * @return view
     */
    public function previewAction()
    {
        if (!$this->request->isPost()) {
            return $this->response->redirect('/requests');
        }
        $this->view->section_title = 'Previsualizacion de solicitud';

        if (!$this->session->has('request_process')) {
            $data = $this->request->getPost();

            if (!empty($data)) {
                $data['user'] = $this->session->get('user_data')->user;
                if (empty($data['item_manuales'])) {
                    $this->flashSession->error("Debe seleccionar al menos un  producto");
                    return $this->response->redirect($_SERVER['HTTP_REFERER']);
                }
                $data['item_manuales'] = (implode(',', $data['item_manuales']));
                $request_data = $this->session->set('request_process', $data);
            }
        }

        $request_data = (object) $this->session->get('request_process');
        // $this->session->remove('request_process');
        $this->view->req = $request_data;
        $this->view->req->procedure_name = $this->sdk->getProcedure($request_data->procedure_name)->procedure_desc;
        $items = [];
        foreach (explode(',', $request_data->item_manuales) as $value) {
            $items[] = $this->sdk->getProduct($value);
        }

        $this->view->items = $items;
        return $this->view->pick('requests/preview');
    }

    /**
     * Create  requests section
     *
     * @return view
     */
    public function createAction()
    {
        $request_data = (array) $this->session->get('request_process');
        $response = $this->sdk->createRequest($request_data);

        if (isset($response->success) && !$response->success && isset($response->body)) {
            $errors = [];
            $str_error = '';
            if (isset($response->body->errmsg)) {
                $str_error = "Error: " . $response->body->errmsg;
            } else {
                foreach ($response->body->errors as $key => $value) {
                    $errors[] = $key;
                }
                $str_error = ucfirst($response->body->message) . ". Formato invalido en: " . Validator::stringFromArray($errors);
            }
            $this->flashSession->error((string) $str_error);
            return $this->response->redirect($_SERVER['HTTP_REFERER']);
        } else {
            $sender = new Email();
            $sender->sendMessage([
                'subject' => 'Solicitud generada',
                'to_email' => $this->session->get('user_data')->mail,
                'message' => $this->di->getViewSimple()->render('emails/new_request_user_notification', ['url' => getenv('DOMAIN_URL') . '/requests/view/' . $response->_id]),
            ]);

            $sender->sendMessage([
                'subject' => 'Solicitud generada',
                'to_email' => 'darrproject@gmail.com',
                'message' => $this->di->getViewSimple()->render('emails/new_request_admin_notification', ['url' => getenv('DOMAIN_URL') . '/requests/view/' . $response->_id]),
            ]);
            $this->flashSession->success("Solicitud enviada");
            $this->session->remove('request_process');
            return $this->response->redirect($_SERVER['HTTP_REFERER']);
        }
    }

    /**
     * History of requests section
     *
     * @return view
     */
    public function historyAction()
    {
        $this->view->section_title = 'Historial de solicitudes';
        $response = $this->sdk->getUserRequests($this->session->get('user_data')->user);
        $this->view->requests = $response;
        return $this->view->pick('requests/history');
    }

    /**
     * Change status of request
     *
     * @return view
     */
    public function changeStatusAction($id_request, $id_status)
    {
        switch ($id_status) {
            case '1':
                $status = 'enviado';
                break;
            case '2':
                $status = 'en progreso';
                break;
            case '3':
                $status = 'completado';
                break;
            case '4':
                $status = 'cancelado';
                break;

            default:
                $status = 'enviado';
                break;
        }

        $response = $this->sdk->updateRequestStatus($id_request, ['status' => $status]);

        $request_data = $this->sdk->getSolicitud($id_request);

        $user_data = $this->sdk->getUserByUsername($request_data->user);
        //Notify user on change status
        $sender = new Email();
        $sender->sendMessage([
            'subject' => 'Actualizacion de estado de solicitud',
            'to_email' => $user_data[0]->mail,
            'message' => $this->di->getViewSimple()->render('emails/status_notification',
                [
                    'url' => getenv('DOMAIN_URL') . '/requests/view/' . $id_request,
                    'request_status' => $status,

                ]),
        ]);
        $this->flashSession->success("Estatus cambiado satisfactoriamente");
        return $this->response->redirect($_SERVER['HTTP_REFERER']);
    }

}
