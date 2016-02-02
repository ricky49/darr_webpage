<?php namespace App\Controllers;

use App\Libraries\Validator;
use App\Libraries\Email;

class InboxController extends ControllerBase
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
     * Create Report
     * 
     * @return view
     */
    public function indexAction()
    {	
    	//Section title
    	$this->view->section_title = 'Inbox';
        $response = $this->sdk->getRequests();
        $this->view->requests =  $response;   
         	return $this->view->pick('inbox/index');
    }
}