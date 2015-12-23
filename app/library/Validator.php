<?php
namespace App\Libraries;

/**
 * All validation functions
 * 
 * @Author: Josue
 * @Date:   2015-12-23 17:34:55
 * @Last Modified by:   Josue
 * @Last Modified time: 2015-12-23 17:34:55
 */
class Validator
{
    /**
     * This method is called on any attempt to compile a function call
     */
    public function start()
    {	
    	
    }

    /** 
     * Validate required keys and return set of error fields if find
     * 
     * @param array $arr_input group of items to compare
     * @param array $keys predefined keys as filter
     * @return object, pass(bool): identify errors,
     *                 errors(array): list of error fields
     *                 data(object): input data filtered by key group
     */
    public static function requiredKeys($arr_input, $keys)
    {
        $error_fields = [];
        $arr = Validator::cleanInput($arr_input, $keys);
        foreach ($keys as $key => $value) {
            if (!array_key_exists($key, $arr) || empty($arr[$key])) {
                $error_fields[] = $key;
            }
        }
        //Check if pass validation
        $pass = (count($error_fields) != 0)? false : true;
        return (object)['pass'=> $pass, 'errors'=> $error_fields, 'data'=> (object)$arr];
    }


    /** 
     * Cleann input with map of fields
     * 
     * @param array $input
     * @param array $keys, map
     * @return array
     * 
     */
    public static function cleanInput($input, $keys)
    {   
        
        $array = array_intersect_key($input, $keys);  
        //ignoreInput and accept default values
        foreach ($keys as $key => $value) {
            if(!empty($value)) {
                $array[$key] = $value;
            }
        }

        return $array;     
    }

     /** 
     * Show array error fields
     * 
     * @param arr $arr one dimension array with errors
     * @param string $prefix optional
     * @param string $sufix optional
     * @return string
     */
    public static function parseError($arr, $prefix = '', $sufix = '')
    {
        if (is_array($arr)) {
           $error = ($prefix.implode(", ", $arr).$sufix);
        } else {
            $error = ($prefix.$arr.$sufix);
        }

        return $error;
    }

    public function emailValidator($email) 
    {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return false;
        }
        return true;
    }
}