<?php namespace App\Controllers;


class IndexController extends ControllerBase
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
    }

	/**
     * Home section
     * 
     * @return view
     */
    public function homeAction()
    {	
    	//Section title
    	$this->view->section_title = 'Inicio';
    	return $this->view->pick('index/index');
    }


    /**
     * Tests
     * 
     * @return view
     */
    public function testAction()
    {	
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
   
        return $this->view->pick('emails/status_notification');
    	// return $this->view->pick('emails/view_report');
    }

}