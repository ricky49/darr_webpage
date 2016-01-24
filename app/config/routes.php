<?php 

use Phalcon\Mvc\Router\Group as RouterGroup;

$router = new Phalcon\Mvc\Router();

//Remove trailing slashes automatically
$router->removeExtraSlashes(true);

//SECURE ROUTES
$router->add('/login', 'Secure::login');
$router->addGet('/sign-up', 'Secure::signUp');
$router->addGet('/remind-password', 'Secure::remindPassword');
$router->addGet('/logout', 'Secure::logout');
$router->addPost('/register', 'Secure::register');


$router->addGet('/', 'Index::home');

$router->addGet('/users', 'Users::index');
$router->add('/users/create', 'Users::create');
$router->addGet('/users/edit/{id}', 'Users::edit');
$router->addPost('/users/edit/{id}', 'Users::save');
$router->addGet('/users/delete/{id}', 'Users::delete');

return $router;
