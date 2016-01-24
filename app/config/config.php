<?php

Dotenv::load(__DIR__.'/../../');

return new \Phalcon\Config(array(
	'database' => array(
		'adapter'     => 'Mysql',   
        'host'        => '',
        'username'    => '',
        'password'    => '',
        'dbname'      => ''
	),
	'application' => array(
		'controllersDir' => __DIR__ . '/../../app/controllers/',
		'modelsDir'      => __DIR__ . '/../../app/models/',
		'viewsDir'       => __DIR__ . '/../../app/views/',
		'libDir'         => __DIR__ . '/../../app/library/',
		'cacheDir'       => __DIR__ . '/../../app/cache/',
		'baseUri'        => '/',
	),
	'mail'=> [
    	'fromName'     => getenv('EMAILFROMNAME'),
    	'fromEmail'    => getenv('EMAILFROMEMAIL'),
    	'smtp'         => [
			'server'     =>  getenv('EMAILSERVER'), 
			'port'       => getenv('EMAILPORT'),
			'security'   => getenv('EMAILSECURITY'),  
			'username'   => getenv('EMAILUSERNAME'),  
			'password'   => getenv('EMAILPASSWORD'),  
    	]
    ]
));