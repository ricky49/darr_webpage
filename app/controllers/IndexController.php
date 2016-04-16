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

        $rol = $this->session->user_data->rol;
        switch ($rol) {
            case 'Instrumentista':
                return $this->dispatcher->forward(
                    array(
                        "controller" => "Reports",
                        "action" => "index",
                    )
                );
                break;
            case 'Admin':
                return $this->dispatcher->forward(
                    array(
                        "controller" => "Inbox",
                        "action" => "index",
                    )
                );

            default:
                continue;
                break;
        }
        // Section title
        $this->view->section_title = 'Inicio | Carrito de Productos';
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

        return $this->view->pick('emails/new_user');
    }

}
