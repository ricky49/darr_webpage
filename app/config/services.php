<?php
use App\Libraries\SDK;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\View;
use App\Libraries\GeneralHelper;
use App\Libraries\Validator;
use Phalcon\Mvc\View\Engine\Volt as VoltEngine;

/**
 * The FactoryDefault Dependency Injector automatically register the right services providing a full stack framework
 */
$di = new \Phalcon\DI\FactoryDefault();

/**
 * The URL component is used to generate all kind of urls in the application
 */
$di->set('url', function() use ($config) {
	$url = new \Phalcon\Mvc\Url();
	$url->setBaseUri($config->application->baseUri);
	return $url;
});
/**
 * Global configuration
 */
$di->set('config', $config);
//registering sdk
$di->set('sdk', function () {
    $sdk = new SDK();
    return $sdk;
});


$di->set('router', function () use ($config) {
    $request = new \Phalcon\Http\Request();
    return include __DIR__ . "/routes.php";

}, true);

/**
 * Setting up the view component
 */
$di->set('view', function() use ($config) {
	$view = new \Phalcon\Mvc\View();
	$view->setViewsDir($config->application->viewsDir);
	return $view;
});

$di->set('viewSimple', function () use ($config) {
    $view = new \Phalcon\Mvc\View\Simple();

    $view->setViewsDir($config->application->viewsDir);

    $view->registerEngines(['.volt' => function ($view, $di) {
        return new \Phalcon\Mvc\View\Engine\Volt($view, $di);
    }]);

    return $view;
});

$di->set('view', function () use ($config) {

    $view = new View();

    $view->setViewsDir($config->application->viewsDir);

    $view->registerEngines(array(
        '.volt' => function ($view, $di) use ($config) {

            $volt = new VoltEngine($view, $di);

            $volt->setOptions(array(
                'compiledPath' => $config->application->cacheDir, //CACHE save DISABLED IN DEV ENVIRONMENT
                'compiledSeparator' => '_',
                'compileAlways' => true,
            ));

            //agregamos toda la sfuncoines de php
            $volt->getCompiler()->addExtension(new \App\Libraries\PhpFunctionExtension());

            return $volt;
        },
        '.phtml' => 'Phalcon\Mvc\View\Engine\Php',
        '.php' => 'Phalcon\Mvc\View\Engine\Php',
    ));

    return $view;
}, true);

/**
 * View cache
 */
$di->set('viewCache', function () use ($config) {

    if (!$config->application->production) {
        $frontCache = new \Phalcon\Cache\Frontend\None();
    } else {
        //Cache data for one day by default
        $frontCache = new \Phalcon\Cache\Frontend\Output(array(
            "lifetime" => 172800,
        ));
    }

    return new \Phalcon\Cache\Backend\File($frontCache, array(
        "cacheDir" => APP_PATH . "/app/cache/views/",
        "prefix" => "site-cache-",
    ));
}
);

// Registering a dispatcher
$di->set('dispatcher', function () {
    $dispatcher = new Dispatcher();
    $dispatcher->setDefaultNamespace("App\Controllers");
    return $dispatcher;
});

/**
 * Database connection is created based in the parameters defined in the configuration file
 */
$di->set('db', function() use ($config) {
	return new \Phalcon\Db\Adapter\Pdo\Mysql(array(
		"host" => $config->database->host,
		"username" => $config->database->username,
		"password" => $config->database->password,
		"dbname" => $config->database->name
	));
});

/**
 * Start the session the first time some component request the session service
 */
$di->set('session', function() {
	$session = new \Phalcon\Session\Adapter\Files();
	$session->start();
	return $session;
});

/**
 * Set up the flash service
 */
$di->set('flash', function () {
    return new \Phalcon\Flash\Session(
        array(
            'error' => 'alert alert-danger',
            'success' => 'alert alert-success',
            'notice' => 'alert alert-info',
            'warning' => 'alert alert-warning',
        )
    );
});


/**
 * Set up the general helper service
 */
$di->set('generalHelper', function () {
    return new GeneralHelper();
});

/**
 * Set up the validator service
 */
$di->set('validator', function () {
    return new Validator();
});
