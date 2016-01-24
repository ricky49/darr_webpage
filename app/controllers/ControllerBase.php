<?php namespace App\Controllers;

class ControllerBase extends \Phalcon\Mvc\Controller
{
	/**
     * Before execute
     */
	public function beforeExecuteRoute($dispatcher)
    {
    	//Stuff	
    }

    /**
     * Verify if is logged
     * 
     * @return bool
     */
   	public function isLogged()
    {
		return $this->session->has('user_data') && $this->session->has('user_session_token');
    }
}