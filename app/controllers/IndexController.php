<?php namespace App\Controllers;

use App\Models\Users;

class IndexController extends ControllerBase
{

    public function indexAction()
    {	
    	//Example
		$ciudades = Users::all();
		print_r($ciudades->toArray());
		die();
    }

}