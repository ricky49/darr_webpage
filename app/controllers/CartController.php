<?php namespace App\Controllers;

class CartController extends ControllerBase
{

    /**
     * Add item
     *
     * @return view
     */
    public function addAction()
    {
        $input = $this->request->getPost();
        $validate = $this->sdk->userCartAndSingleProduct($this->session->user_data->_id, $this->request->getPost('product_id'));

        if (isset($input['source']) && $input['source'] == 'list') {
            $this->sdk->updateCart($validate[0]->_id, [
                'quantity' => (int) $this->request->getPost('quantity'),
            ]);
            $this->flash->success('Item modificado satisfactoriamente!');
            return $this->dispatcher->forward(
                array(
                    "controller" => "Cart",
                    "action" => "view",
                )
            );
        } else {
            if (empty($validate)) {
                $this->sdk->saveCart([
                    'product_id' => $this->request->getPost('product_id'),
                    'quantity' => $this->request->getPost('quantity'),
                    'user_id' => $this->session->user_data->_id,
                ]);
            } else {
                $this->sdk->updateCart($validate[0]->_id, [
                    'quantity' => (int) $this->request->getPost('quantity') + (int) $validate[0]->quantity,
                ]);
            }
            $this->flash->success('Producto agregado al carrito!');
            return $this->dispatcher->forward(
                array(
                    "controller" => "Index",
                    "action" => "home",
                )
            );
        }

    }

    /**
     * Delete cart
     *
     * @return view
     */
    public function deleteAction($id)
    {
        $this->sdk->deleteCart($id);
        $this->flash->success('Item borrado!');
        return $this->dispatcher->forward(
            array(
                "controller" => "Cart",
                "action" => "view",
            )
        );
    }

    /**
     * Delete cart
     *
     * @return view
     */
    public function deleteCartAction()
    {
        $cart = $this->sdk->userCart($this->session->user_data->_id);
        foreach ($cart as $key => $value) {
            $this->sdk->deleteCart($value->_id);
        }

        $this->flash->success('Carrito limpio!');
        return $this->dispatcher->forward(
            array(
                "controller" => "Cart",
                "action" => "view",
            )
        );
    }

    /**
     * View cart
     *
     * @return view
     */
    public function viewAction()
    {
        $this->view->carts = ($this->sdk->userCart($this->session->user_data->_id));
        $this->view->section_title = 'Carrito';
        return $this->view->pick('cart/cart');
    }

    /**
     * Checkout
     *
     * @return view
     */
    public function checkoutAction()
    {
        die('make checkout');
    }

    public function pdfAction()
    {

        $this->view->disableLevel(\Phalcon\Mvc\View::LEVEL_MAIN_LAYOUT);

        $data = [];
        $data['user'] = $this->session->user_data;
        $data['cart'] = $this->sdk->userCart($this->session->user_data->_id);
        // $data['products'] = $this->sdk->getReportProducts($report_id);;
        // print_r($data);die();

        $html = $this->view->getRender('pdf', 'cart', $data);
        $pdf = new \mPDF();

        $stylesheet = file_get_contents(__DIR__ . '/../../public/pdf_styles/style.css');

        $pdf->WriteHTML($stylesheet, 1);
        $pdf->WriteHTML($html, 2);
        $ispis = "Cotizacion_" . uniqid() . '.pdf';

        $pdf->Output($ispis, "I");
    }
}
