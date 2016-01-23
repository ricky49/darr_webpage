<?php 

use Phalcon\Mvc\Router\Group as RouterGroup;

$router = new Phalcon\Mvc\Router();

//Remove trailing slashes automatically
$router->removeExtraSlashes(true);


$router->add('/users', 'Users::index');
$router->add('/users/create', 'Users::create');
$router->add('/users/edit/{id}', 'Users::edit');
$router->addGet('/users/delete/{id}', 'Users::delete');

return $router;