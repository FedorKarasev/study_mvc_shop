<?php

/**
 * Created by PhpStorm.
 * User: fedor
 * Date: 23.01.17
 * Time: 12:55
 */
class AdminController extends Admin
{
    public function actionIndex()
    {
        require_once ROOT.'/views/admin/index.php';
    }
}