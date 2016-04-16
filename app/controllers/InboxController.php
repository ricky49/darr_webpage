<?php namespace App\Controllers;

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
            $this->flash->warning('Por favor has login antes de continuar');
            return $this->response->redirect('/login');
        }
        if ($this->session->user_data->rol != 'Admin') {
            $this->flash->warning('No tienes permisos para ver este contenido');
            return $this->response->redirect('/');
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
        $this->view->section_title = 'Bandeja de Entrada';
        $response = $this->sdk->getRequests();
        $this->view->requests = $response;
        return $this->view->pick('inbox/index');
    }
}
