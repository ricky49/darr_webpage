<?php namespace App\Controllers;

class IndexController extends CartController
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
            $this->flash->warning('Por favor ingrese sus datos para iniciar sesion');
            return $this->response->redirect('/login');
        }

        if ($this->session->user_data->rol == 'Instrumentista') {
            // $this->flash->warning('No tienes permisos para ver este contenido');
            return $this->response->redirect('/reports');
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
        $this->view->section_title = 'Inicio | Carrito de productos';
        $this->view->products = $this->sdk->getProducts();
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
