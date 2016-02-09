<?php
namespace App\Libraries;


class SDK extends \GuzzleHttp\Client
{
    private $base_url;
    private $token;
    private $ph_session;
    
    /**
     * Constructor
     */
    public function __construct()
    {
        parent::__construct();
        $this->token = true;
        $this->ph_session = (new \Phalcon\DI())->getDefault()->getSession();
        $this->base_url = getenv('API_URL');
    }

    /**
     * Authenticate
     *
     * @param int $user_id
     * @param string $password
     * @return std object
     */
    public function authenticate($user, $password)
    {
        $this->token = false;
        return $this->makeRequest(
            "authenticate", 
            [   
                'user' => $user, 
                'pass' => $password
            ]
        );
    }

    /**
     * Create user
     *
     * @param int $data
     * @return std object
     */
    public function createUser($data)
    {
        $this->token = false;
        return $this->makeRequest(
            "index/register", 
            [   
                'user' => $data['user'],
                'pass' => $data['pass'],
                'mail' => $data['mail'],
                'lastname' => $data['lastname'],
                'name' => $data['name'],
                'document' => $data['document'],
                'rol' => $data['rol']
            ]
        );
    }

    /**
     * Create request
     *
     * @param int $data
     * @return std object
     */
    public function createRequest($data)
    {
        return $this->makeRequest("api/request", $data);
    }


    /**
     * Get cart
     *
     * @param int $id
     * @return std object
     */
    public function getCart($id)
    {
        return $this->makeRequest("api/cars/{$id}");
    }


    /**
     * Get user cart
     *
     * @return std object
     */
    public function userCart($user_id)
    {
        $url = $this->base_url."api/cars?token=".$this->ph_session->get('user_session_token')."&user_id={$user_id}"; 
      
        return $this->getRequest($url);
    }




    /**
     * Get user cart
     *
     * @return std object
     */
    public function userCartAndSingleProduct($user_id, $product_id)
    {
        $url = $this->base_url."api/cars?token=".$this->ph_session->get('user_session_token')."&user_id={$user_id}&product_id={$product_id}"; 
      
        return $this->getRequest($url);
    }
    /**
     * Create save cart
     *
     * @param int $data
     * @return std object
     */
    public function saveCart($data)
    {
        return $this->makeRequest("api/cars", $data);
    }

    /**
     * Update cart
     *
     * @param string $id
     * @param int    $data
     * @return std   object
     */
    public function updateCart($id, $data)
    {   
        $data['put'] = 'put';
        return $this->makeRequest("api/cars/{$id}", $data);
    }


    /**
     * Delete cart
     *
     * @param int $data
     * @return std object
     */
    public function deleteCart($id)
    {
       return $this->deleteRequest('api/cars/'.$id);
    }


    /**
     * Create report
     *
     * @param int $data
     * @return std object
     */
    public function createReport($data)
    {
        return $this->makeRequest("api/report", $data);
    }

     /**
     * Update user
     *
     * @param int $data
     * @return std object
     */
    public function updateUser($id, $data)
    {   
        $data['put'] = 'put';
        return $this->makeRequest("api/users/{$id}", $data);
    }


    /**
     * Update requests
     *
     * @param int $data
     * @return std object
     */
    public function updateRequestStatus($id, $data)
    {   
      
        $data['put'] = 'put';
        return $this->makeRequest("api/request/{$id}", $data);
    }

    /**
     * Delete user
     *
     * @param int $data
     * @return std object
     */
    public function deleteUser($id)
    {
       return $this->deleteRequest('api/users/'.$id);
    }

    /**
     * Get All Users
     *
     * @return std object
     */
    public function getUsers()
    {
        return $this->makeRequest("api/users");
    }

    /**
     * Get All products
     *
     * @return std object
     */
    public function getProducts()
    {
        return $this->makeRequest("api/products");
    }


    /**
     * Get  product
     *
     * @return std object
     */
    public function getProduct($id)
    {
        return $this->makeRequest("api/products/{$id}");
    }



    /**
     * Get All Users
     *
     * @return std object
     */
    public function getCenters()
    {
        return $this->makeRequest("api/center");
    }

     /**
     * Get procedures
     *
     * @return std object
     */
    public function getProcedures()
    {
        return $this->makeRequest("api/procedure");
    }

    /**
     * Get procedure
     *
     * @return std object
     */
    public function getProcedure($id)
    {
        return $this->makeRequest("api/procedure/{$id}");
    }

     /**
     * Get plates
     *
     * @return std object
     */
    public function getPlates($id)
    {
        $url = $this->base_url."api/plates?token=".$this->ph_session->get('user_session_token')."&procedure_id={$id}"; 
      
        return $this->getRequest($url);
    }

    /**
     * Get plate
     *
     * @return std object
     */
    public function getPlate($id)
    {
        return $this->makeRequest("api/plates/{$id}");
    }

    /**
     * Get All Roles
     *
     * @return std object
     */
    public function getRoles()
    {
        return $this->makeRequest("api/roles");
    }

    

    /**
     * Get user
     *
     * @param string $id
     * @return std object
     */
    public function getUser($id)
    {
        return $this->makeRequest("api/users/{$id}");
    }
    
    /**
     * Get user by user
     *
     * @param string $user
     * @return std object
     */
    public function getUserByUsername($user)
    {   
         $url = $this->base_url."api/users?token=".$this->ph_session->get('user_session_token')."&user={$user}"; 
      
        return $this->getRequest($url);
    }

    /**
     * Get requests
     *
     * @param string $user
     * @return std object
     */
    public function getRequests($user)
    {   
         $url = $this->base_url."api/request?token=".$this->ph_session->get('user_session_token'); 
      
        return $this->getRequest($url);
    }

    /**
     * Get user requests
     *
     * @param string $user
     * @return std object
     */
    public function getUserRequests($user)
    {   
         $url = $this->base_url."api/request?token=".$this->ph_session->get('user_session_token')."&user={$user}"; 
      
        return $this->getRequest($url);
    }
    /**
     * Get user requests
     *
     * @param string $user
     * @return std object
     */
    public function getUserReports($user)
    {   
         $url = $this->base_url."api/report?token=".$this->ph_session->get('user_session_token')."&user={$user}"; 
      
        return $this->getRequest($url);
    }

    /**
     * Get  requests
     *
     * @param string $id
     * @return std object
     */
    public function getSolicitud($id)
    {   
         $url = $this->base_url."api/request/{$id}?token=".$this->ph_session->get('user_session_token'); 
      
        return $this->getRequest($url);
    }
    /**
     * Get  reportt
     *
     * @param string $id
     * @return std object
     */
    public function getReport($id)
    {   
         $url = $this->base_url."api/report/{$id}?token=".$this->ph_session->get('user_session_token'); 
      
        return $this->getRequest($url);
    }
    
    /**
     *  Make post/get requests
     *
     * @param string $url
     * @param array $data, assoc array, optional
     * @return std object
     */
    private function makeRequest($url, $data = null)
    {   
        if ($this->token != false) {
            if (!$this->ph_session->has('user_session_token')) {
                return (object)['success'=>0, 'message'=> "Missing user session"];
            }
            $this->token = $this->ph_session->get('user_session_token');
        }

        $url = $this->base_url .$url;
        try {
            if ($data != null && is_array($data)) {
                if ($this->token != false)
                    $data['x-token-access'] = $this->token;

                $url .= "?token=".$this->token; 
                if (array_key_exists('put', $data)) {
                    $response =  $this->putRequest($url, $data);
                } else {
                    $response =  $this->postRequest($url, $data);
                }
            } else {
                if ($this->token != false)
                    $url .= "?token=".$this->token; 
                $response =  $this->getRequest($url);
            }
        } catch (\Guzzle\Http\Exception\BadResponseException $e) {
            return (object)((['success'=>0, 'type'=> 'BADRESPONSE', 'message'=> "Guzzle: ".$e->getMessage()]));
        } catch (\GuzzleHttp\Exception\ClientException $e) {
            return (object)((['success'=>0, 'type'=> 'CLIENT', 'message'=> "Guzzle: ".$e->getMessage(), 'body'=>  json_decode($e->getResponse()->getBody(true))]));
        } catch (\GuzzleHttp\Exception\ConnectException $e) {
            return (object)((['success'=>0, 'type'=> 'CONNECT', 'message'=> "Guzzle: ".$e->getMessage()]));
        } catch (\GuzzleHttp\Exception\ServerException $e) {
            return (object)((['success'=>0, 'type'=> 'SERVER', 'message'=> "Guzzle: ".$e->getMessage(), 'body'=>  json_decode($e->getResponse()->getBody(true))]));
        }
        return $response;
    }


    /**
     *  Make post requests
     *
     * @param string $url
     * @param array $data, assoc array
     * @return std object
     */
    private function postRequest($url, $data)
    {   
        return json_decode((string) $this->post($url, ['form_params' => $data])->getBody());
    }

    /**
     *  Make put requests
     *
     * @param string $url
     * @param array $data, assoc array
     * @return std object
     */
    private function putRequest($url, $data)
    {          

        try {

            $response = $this->put($url, ['form_params' => $data])->getBody();

        } catch (\Guzzle\Http\Exception\BadResponseException $e) {
            return (object)((['success'=>0, 'type'=> 'BADRESPONSE', 'message'=> "Guzzle: ".$e->getMessage()]));
        } catch (\GuzzleHttp\Exception\ClientException $e) {
            return (object)((['success'=>0, 'type'=> 'CLIENT', 'message'=> "Guzzle: ".$e->getMessage(), 'body'=>  json_decode($e->getResponse()->getBody(true))]));
        } catch (\GuzzleHttp\Exception\ConnectException $e) {
            return (object)((['success'=>0, 'type'=> 'CONNECT', 'message'=> "Guzzle: ".$e->getMessage()]));
        } catch (\GuzzleHttp\Exception\ServerException $e) {
            return (object)((['success'=>0, 'type'=> 'SERVER', 'message'=> "Guzzle: ".$e->getMessage(), 'body'=>  json_decode($e->getResponse()->getBody(true))]));
        }
        return json_decode((string) $response);
    }
    

    /**
     *  Make delete requests
     *
     * @param string $url
     * @return std object
     */
    private function deleteRequest($url)
    {   
        if ($this->token != false) {
           if (!$this->ph_session->has('user_session_token')) {
                return (object)['success'=>0, 'message'=> "Missing user session"];
            }
            $this->token = $this->ph_session->get('user_session_token');
        }
        $url = $this->base_url .$url."?token=".$this->token;

        try {
            $response = json_decode((string) $this->delete($url)->getBody());
        } catch (\Guzzle\Http\Exception\BadResponseException $e) {
            return (object)((['success'=>0, 'type'=> 'BADRESPONSE', 'message'=> "Guzzle: ".$e->getMessage()]));
        } catch (\GuzzleHttp\Exception\ClientException $e) {
            return (object)((['success'=>0, 'type'=> 'CLIENT', 'message'=> "Guzzle: ".$e->getMessage(), 'body'=>  json_decode($e->getResponse()->getBody(true))]));
        } catch (\GuzzleHttp\Exception\ConnectException $e) {
            return (object)((['success'=>0, 'type'=> 'CONNECT', 'message'=> "Guzzle: ".$e->getMessage()]));
        } catch (\GuzzleHttp\Exception\ServerException $e) {
            return (object)((['success'=>0, 'type'=> 'SERVER', 'message'=> "Guzzle: ".$e->getMessage()]));
        }
        return $response;
       
    }
     /**
     *  Make get requests
     *
     * @param string $url
     * @return std object
     */
    private function getRequest($url)
    {
        try {

            $response = $this->get($url)->getBody();

        } catch (\Guzzle\Http\Exception\BadResponseException $e) {
            return (object)((['success'=>0, 'type'=> 'BADRESPONSE', 'message'=> "Guzzle: ".$e->getMessage()]));
        } catch (\GuzzleHttp\Exception\ClientException $e) {
            return (object)((['success'=>0, 'type'=> 'CLIENT', 'message'=> "Guzzle: ".$e->getMessage(), 'body'=>  json_decode($e->getResponse()->getBody(true))]));
        } catch (\GuzzleHttp\Exception\ConnectException $e) {
            return (object)((['success'=>0, 'type'=> 'CONNECT', 'message'=> "Guzzle: ".$e->getMessage()]));
        } catch (\GuzzleHttp\Exception\ServerException $e) {
            return (object)((['success'=>0, 'type'=> 'SERVER', 'message'=> "Guzzle: ".$e->getMessage(), 'body'=>  json_decode($e->getResponse()->getBody(true))]));
        }
        return json_decode((string) $response);
    }
}
