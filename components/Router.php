<?php

/**
 * Created by PhpStorm.
 * User: fedor
 * Date: 20.01.17
 * Time: 14:21
 */
class Router
{
 private $routes;

 private function getUri()
 {
     if ( !empty($_SERVER['REQUEST_URI']) ) {
         return $uri = trim($_SERVER['REQUEST_URI'], '/');
     }
 }

 public function __construct()
 {
    $routesPath = ROOT.'/config/routes.php';
    $this->routes = require_once($routesPath);
 }

 public function run()
 {
     $uri = strtolower($this->getUri());

     foreach ($this->routes as $uriPattern => $path) {
         if ( preg_match("~$uriPattern~", $uri) ) {
             $internalRoute = preg_replace("~$uriPattern~", $path, $uri);
             $segments = explode('/', $internalRoute);

             $controllerName = ucfirst(strtolower(array_shift($segments))).'Controller';
             $controllerFile = ROOT.'/controllers/'.$controllerName.'.php';
             $actionName = 'action'.ucfirst(strtolower(array_shift($segments)));

             if ( file_exists($controllerFile) ) {
                 require_once $controllerFile;

                 $controllerObject = new $controllerName();
                 call_user_func_array([$controllerObject, $actionName], $segments);
                 break;
             }
         }
     }
 }
}