<?php namespace App\Controllers;

use App\Libraries\Validator;
use App\Libraries\Email;

class ReportsController extends ControllerBase
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
     * Create Report
     * 
     * @return view
     */
    public function indexAction()
    {	
    	//Section title
    	$this->view->section_title = 'Creacion de reporte';
        $this->view->centers = $this->sdk->getCenters();
        $this->view->plates = $this->sdk->getAllPlates();
        $this->view->items = $this->sdk->getProducts();
    	return $this->view->pick('reports/index');
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

        $response = $this->sdk->createReport($data);
        foreach ($data['items'] as $key => $value) {
            $this->sdk->createReportProduct([
                'user_id'=>$data['user'],
                'quantity'=>1,
                'product_id'=>$value,
                'report_id'=>$response->_id,
            ]);
        }
        
        if(isset($response->success) && !$response->success && isset($response->body)) {
            $errors = [];
            $str_error = '';
            if (isset($response->body->errmsg)) {
                $str_error = "Error: ".$response->body->errmsg;
            } else {
                foreach ($response->body->errors as $key => $value) {
                    $errors[] = $key; 
                }
                $str_error = ucfirst($response->body->message). ". Formato invalido: ".Validator::stringFromArray($errors);
            }
            $this->flashSession->error((string)$str_error);
            return $this->response->redirect($_SERVER['HTTP_REFERER']);
        } else {
            // $sender = new Email();
            // $sender->sendMessage([
            //     'subject' => 'Nuevo Reporte',
            //     'to_email' => 'rickysotosanchezz@gmail.com',
            //     'message' => $this->di->getViewSimple()->render('emails/view_report',['url'=> getenv('DOMAIN_URL').'/requests/view/'.$response->_id])
            // ]);
            // $this->flashSession->success("Reporte generado");
            return $this->response->redirect('/reports/products/'.$response->_id);
        }
    }

    /**
     * Save Products
     * @param  string $report_id 
     * @param  array $data 
     * @return view            
     */
    public function productsAction($report_id)
    {
        $this->view->section_title = 'Modificacion de productos';
        $response = $this->sdk->getReportProducts($report_id);
        $this->view->products = $response;
        $this->view->report_id = $report_id;
        return $this->view->pick('reports/products');
    }

    /**
     * Save Products
     * @param  string $report_id 
     * @param  array $data 
     * @return view            
     */
    public function savepAction($report_id)
    {
        $input = $this->request->getPost();
        foreach ($input['product'] as $key => $value) {
            $update = $this->sdk->updateReportProduct($input['repoProduct'][$key],
                [
                    'quantity' => $input['quantity'][$key]
                ]
            );
        }

        $sender = new Email();
            $sender->sendMessage([
                'subject' => 'Reporte generado',
                'to_email' => $this->session->get('user_data')->mail,
                'message' => $this->di->getViewSimple()->render('emails/view_report',['url'=> getenv('DOMAIN_URL').'/reports/view/'.$report_id])
            ]);

            $sender->sendMessage([
                'subject' => 'Reporte generado',
                'to_email' => 'darrproject@gmail.com',
                'message' => $this->di->getViewSimple()->render('emails/view_report',['url'=> getenv('DOMAIN_URL').'/reports/view/'.$report_id])
            ]);
        $this->flashSession->success("Reporte generado");
        return $this->response->redirect('/reports');

    }

    

    /**
     * History of requests section
     * 
     * @return view
     */
    public function historyAction()
    {   
        $this->view->section_title = 'Historial de reportes';
        $response = $this->sdk->getUserReports($this->session->get('user_data')->user);
        $this->view->reports =  $response;
        return $this->view->pick('reports/history');
    }


    /**
     * View request
     * 
     * @return view
     */
    public function viewAction($id)
    {   
        $this->view->section_title = 'Vista de reporte';
        $response = $this->sdk->getReport($id);


        if (isset($response->success) && !$response->success) {
            $this->flashSession->error("Reporte no encontrado");
            return $this->response->redirect('/reports');
        }
        $this->view->products = $this->sdk->getReportProducts($id);
        $this->view->report =  $response;
        return $this->view->pick('reports/view');
    }

    
}