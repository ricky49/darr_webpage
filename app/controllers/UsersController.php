<?php namespace App\Controllers;

use App\Models\Users;


class UsersController extends ControllerBase
{
	/**
     * Default  user view.
     * 
     * @return view
     */
    public function indexAction()
    {	
    	$users = Users::get();
    	$this->view->users = $users;
    	return $this->view->pick('users/index');
    }

	/**
     * Create user.
     * 
     * @return view
     */
    public function createAction()
    {	

    	if ($this->request->isPost()) {
    		$data_post = $this->request->getPost();
	    	$data = $this->validator->requiredKeys($data_post, [
		    			'firstname'=>'',
		    			'lastname'=>'', 
		    			'display_name'=>'', 
		    			'email'=>'',
		    			'status_id'=>''
	    		 	]);

	    	if (!$data->pass) {
	    		$this->flash->error($this->validator->parseError($data->errors, "Error, you are missing: "));
	    		return $this->response->redirect('/users/create');
	    	}

	    	if (!$this->validator->emailValidator($data_post['email'])) {
    			$this->flash->error("Invalid email format");
	    		return $this->response->redirect('/users/create');
    		}

	    	$insert_user = Users::insert((array)$data->data);
	    	$this->flash->success("User Created");
	    	return $this->response->redirect('/users');
    	}

    	return $this->view->pick('users/create');
    }

	/**
     * Edit user.
     * 
     * @return view
     */
    public function editAction($id)
    {	
    	$user = Users::where('id',$id);
    	if (!$user->exists()) {
    		$this->flash->warning("User not found");
    		return $this->response->redirect('/users');
    	} 
    	
		if ($this->request->isPost()) {
			$data_post = $this->request->getPost();
	    	$data = $this->validator->requiredKeys($data_post, [
		    			'firstname'=>'',
		    			'lastname'=>'', 
		    			'display_name'=>'', 
		    			'email'=>'',
		    			'status_id'=>''
	    		 	]);

	    	if (!$data->pass) {
	    		$this->flash->error($this->validator->parseError($data->errors, "Error, you are missing: "));
	    		return $this->response->redirect("/users/edit/{$id}");
	    	}

	    	if (!$this->validator->emailValidator($data_post['email'])) {
				$this->flash->error("Invalid email format");
	    		return $this->response->redirect("/users/edit/{$id}");
			}

	    	$user->update((array)$data->data);
	    	$this->flash->success("User Updated");
	    	return $this->response->redirect("/users/edit/{$id}");
		}
		$this->view->user = $user->first();
		return $this->view->pick('users/edit');
    }

    /**
     * Delete user.
     * 
     * @return view
     */
    public function deleteAction($id)
    {	
    	if (!Users::where('id',$id)->exists()) {
    		$this->flash->warning("User not found");
    	} else {
    		$delete_user = Users::where('id',$id)->delete();
			$this->flash->success("User deleted");
    	}
    	
    	return $this->response->redirect('/users');
    }

}