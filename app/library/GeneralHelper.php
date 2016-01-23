<?php
namespace App\Libraries;

/**
 * General helper for styles
 * 
 * @Author: Josue
 * @Date:   2015-12-23 17:34:55
 * @Last Modified by:   Josue
 * @Last Modified time: 2015-12-23 17:34:55
 */
class GeneralHelper
{
    /**
     * Status color class
     */
    public static function statusColor($id)
    {   
    	$values = [
					'1' => 'label-success',
					'2' => 'label-info',
					'3' => 'label-warning',
					'4' => 'label-warning'
    			];

    	return $values[$id];
    }
}