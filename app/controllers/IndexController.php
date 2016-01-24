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
    		$this->flash->warning('Please login before continue');
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
    	$this->view->section_title = 'Home';
    	return $this->view->pick('index/index');
    }

}