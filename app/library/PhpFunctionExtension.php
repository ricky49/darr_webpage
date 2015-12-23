<?php
namespace App\Libraries;

/**
 * Add the php function to volt
 * 
 * @Author: kaioken
 * @Date:   2015-05-03 17:34:55
 * @Last Modified by:   kaioken
 * @Last Modified time: 2015-11-03 21:00:50
 */
class PhpFunctionExtension
{
    /**
     * This method is called on any attempt to compile a function call
     */
    public function compileFunction($name, $arguments)
    {
        if (function_exists($name)) {
            return $name . '('. $arguments . ')';
        }
    }
}