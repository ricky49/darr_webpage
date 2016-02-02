<?php namespace App\Controllers;

use App\Libraries\Validator;
use App\Libraries\Email;

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
    		$this->flash->warning('Please login before continue');
    		return $this->response->redirect('/login');
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
    	$this->view->section_title = 'Create request';
        $this->view->centers = $this->sdk->getCenters();
        $this->view->procedures = $this->sdk->getProcedures();

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
            $html[]= ['value'=> $value->_id, 'text'=> $value->plate_id];
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
        $this->view->section_title = 'View request';
        $response = $this->sdk->getSolicitud($id);
        if (isset($response->success) && !$response->success) {
            $this->flashSession->error("Request not found");
            return $this->response->redirect('/requests');
        }


        $this->view->req =  $response;
        $this->view->req->procedure_name_label = $this->sdk->getProcedure($response->procedure_name)->procedure_desc;
         $plates = [];
        foreach (explode(',', $response->item_manuales) as $value) {
            $plates[] = $this->sdk->getPlate($value);
        }
        $this->view->plates = $plates;
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
                 if (empty( $data['item_manuales'])) {
                    $this->flashSession->error("Debe seleccionar al menos una bandeja");
                    return $this->response->redirect($_SERVER['HTTP_REFERER']);
                }
                $data['item_manuales'] = (implode(',', $data['item_manuales']));

                $request_data = $this->session->set('request_process', $data);

                

            }
        }  

        $request_data = (object)$this->session->get('request_process');
         // $this->session->remove('request_process');
        $this->view->req =  $request_data;
        $this->view->req->procedure_name = $this->sdk->getProcedure($request_data->procedure_name)->procedure_desc;
        $plates = [];
        foreach (explode(',', $request_data->item_manuales) as $value) {
            $plates[] = $this->sdk->getPlate($value);
        }
        $this->view->plates = $plates;
        return $this->view->pick('requests/preview');
    }

    /**
     * Create  requests section
     * 
     * @return view
     */
    public function createAction()
    {   
        $request_data = (array)$this->session->get('request_process');
        $response = $this->sdk->createRequest($request_data);
       
        if(isset($response->success) && !$response->success && isset($response->body)) {
            $errors = [];
            $str_error = '';
            if (isset($response->body->errmsg)) {
                $str_error = "Error: ".$response->body->errmsg;
            } else {
                foreach ($response->body->errors as $key => $value) {
                    $errors[] = $key; 
                }
                $str_error = ucfirst($response->body->message). ". Invalid format in: ".Validator::stringFromArray($errors);
            }
            $this->flashSession->error((string)$str_error);
            return $this->response->redirect($_SERVER['HTTP_REFERER']);
        } else {
            $sender = new Email();
            $sender->sendMessage([
                'subject' => 'New Request',
                'to_email' => 'rickysotosanchezz@gmail.com',
                'message' => $this->di->getViewSimple()->render('emails/view_report',['url'=> getenv('DOMAIN_URL').'/requests/view/'.$response->_id])
            ]);
            $this->flashSession->success("Request sent");
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

        $this->view->section_title = 'Histoy of requests';
        $response = $this->sdk->getUserRequests($this->session->get('user_data')->user);
        $this->view->requests =  $response;
        return $this->view->pick('requests/history');
    }




    
}