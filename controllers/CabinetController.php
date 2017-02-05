<?php

class CabinetController
{
    public function actionIndex()
    {
        $userId = User::checkLogged();
        $user = User::getUserById($userId);

        require_once ROOT.'/views/cabinet/index.php';
    }

    public function actionEdit()
    {
        $userId = User::checkLogged();
        $user = User::getUserById($userId);
        $errors = false;
        $result = false;

        $name = $user['name'];
        $password = $user['password'];

        if ( isset($_POST['submit']) ) {
            $name = $_POST['name'];
            $password = $_POST['password'];

            if ( !User::checkName($name) ) {
                $errors[] = 'Имя не должно быть менее двух символов';
            }

            if ( !User::checkPassword($password) ) {
                $errors[] = 'Пароль не может быть короче 6 символов';
            }

            if ( $errors == false) {

                $userData['name'] = $name;
                $userData['password'] = $password;
                $userData['id'] = $user['id'];

                $result = User::edit($userData);
            }
        }

        require_once ROOT.'/views/cabinet/edit.php';
    }
}