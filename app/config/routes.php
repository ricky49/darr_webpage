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
$router->add('/plates/{id}', 'Requests::plates');

//testing porpuses
$router->addGet('/test', 'Index::test');


//Requests section
$router->addGet('/requests', 'Requests::index');
$router->addGet('/requests/history', 'Requests::history');
$router->addPost('/requests/create', 'Requests::create');
$router->addPost('/requests/view/{id}', 'Requests::view');
$router->addGet('/requests/status/{id}/{id_status}', 'Requests::changeStatus');

//Inbox section
$router->addGet('/inbox', 'Inbox::index');



//Reports section
$router->addGet('/reports', 'Reports::index');
$router->addGet('/reports/history', 'Reports::history');
$router->addPost('/reports/create', 'Reports::create');
$router->addPost('/reports/view/{id}', 'Reports::view');

$router->addGet('/', 'Index::home');

$router->addGet('/users', 'Users::index');
$router->add('/users/create', 'Users::create');
$router->addGet('/users/edit/{id}', 'Users::edit');
$router->addPost('/users/edit/{id}', 'Users::save');
$router->addGet('/users/delete/{id}', 'Users::delete');

return $router;
