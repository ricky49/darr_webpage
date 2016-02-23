<?php namespace App\Controllers;

use App\Libraries\Validator;
use App\Libraries\Email;

class CartController extends ControllerBase
{


    // print_r($this->sdk->saveCart([
    //     'product_id' => $this->request->getPost('product_id'),
    //     'quantity' => $this->request->getPost('quantity'),
    //     'user_id' => $this->session->user_data->_id
    // ]));
    //  print_r($this->sdk->updateCart('56b9588a0a8139492035d8a0', [
    //     'quantity' => 2
    // ]));

    // print_r($this->sdk->deleteCart('56b9588a0a8139492035d8a0'));

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
                'quantity' => (int)$this->request->getPost('quantity')
            ]);
            $this->flash->success('Item modificado satisfactoriamente!');
            return  $this->dispatcher->forward(
                array(
                    "controller" => "Cart",
                    "action"     => "view"
                )
            );
        } else {
            if (empty($validate)) {
                $this->sdk->saveCart([
                    'product_id' => $this->request->getPost('product_id'),
                    'quantity' => $this->request->getPost('quantity'),
                    'user_id' => $this->session->user_data->_id
                ]);
            } else {
                $this->sdk->updateCart($validate[0]->_id, [
                    'quantity' => (int)$this->request->getPost('quantity') + (int)$validate[0]->quantity
                ]);
            }
            $this->flash->success('Producto agregado al carrito!');
            return  $this->dispatcher->forward(
                array(
                    "controller" => "Index",
                    "action"     => "home"
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
        return  $this->dispatcher->forward(
            array(
                "controller" => "Cart",
                "action"     => "view"
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
        return  $this->dispatcher->forward(
            array(
                "controller" => "Cart",
                "action"     => "view"
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
        $this->view->carts =  ($this->sdk->userCart($this->session->user_data->_id));
        $this->view->section_title  = 'Carrito';
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
}