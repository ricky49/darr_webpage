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
    	return $this->view->pick('requests/index');
    }

    /**
     * Create  requests section
     * 
     * @return view
     */
    public function createAction()
    {   
        $data = $this->request->getPost();
        $data['user'] = $this->session->get('user_data')->user;

        $response = $this->sdk->createRequest($data);
       
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
        return $this->view->pick('requests/view');
    }

    
}