<?php

/**
 * Created by PhpStorm.
 * User: fedor
 * Date: 20.01.17
 * Time: 16:23
 */
class Db
{
    public static function getConnection()
    {
        $paramsPath = ROOT.'/config/db_params.php';
        $params = require($paramsPath);
        $dsn = "mysql:host={$params['host']};dbname={$params['dbname']};charset={$params['charset']}";

        return $db = new PDO($dsn, $params['user'], $params['password']);
    }
}