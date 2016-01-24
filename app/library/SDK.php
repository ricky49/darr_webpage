<?php
namespace App\Libraries;


class SDK extends \GuzzleHttp\Client
{
    private $base_url;
    private $token;
    
    /**
     * Constructor
     */
    public function __construct()
    {
        parent::__construct();
        $this->token = true;
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
     *  Make post/get requests
     *
     * @param string $url
     * @param array $data, assoc array, optional
     * @return std object
     */
    private function makeRequest($url, $data = null)
    {   
       
        if ($this->token != false) {
            @session_start();
            if (!isset($_SESSION['user_session_token']) || empty($_SESSION['user_session_token'])) {
                return (object)['success'=>0, 'message'=> "Missing user session"];
            }
            $this->token = $_SESSION['user_session_token'];
        }

        session_write_close();
        $url = $this->base_url .$url;
        try {
            if ($data != null && is_array($data)) {
                if ($this->token != false)
                    $data['x-token-access'] = $this->token;


                if (array_key_exists('put', $data)) {
                    $url .= "?token=".$this->token; 
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
        return json_decode((string) $this->put($url, ['form_params' => $data])->getBody());
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
            session_start();
            if (!isset($_SESSION['user_session_token']) || empty($_SESSION['user_session_token'])) {
                return (object)['success'=>0, 'message'=> "Missing user session"];
            }
            $this->token = $_SESSION['user_session_token'];
        }
        session_write_close();
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
        return json_decode((string) $this->get($url)->getBody());
    }
}
