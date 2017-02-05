<?php

/**
 * Created by PhpStorm.
 * User: fedor
 * Date: 23.01.17
 * Time: 12:56
 */
class Admin
{
    public function __construct()
    {

        if ( !User::isGuest() ) {

            if ( !self::checkAdmin() ) {
                header('Location: /');
            }

        } else {
            header('Location: /user/login/');
        }
    }

    public static function checkAdmin()
    {
        $userId = User::checkLogged();
        $user = User::getUserById($userId);

        if ( $user['role'] == 'admin' ) {
            return true;
        }

        return false;
    }
}