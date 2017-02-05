<?php

function __autoload($className)
{
    $array_path = [
        '/models/',
        '/components/'
    ];

    foreach ($array_path as $path) {
        $path = ROOT.$path.$className.'.php';
        if ( is_file($path) ) {
            require_once $path;
        }
    }
}