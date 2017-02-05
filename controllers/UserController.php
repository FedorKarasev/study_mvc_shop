<?php

class UserController
{
    public function actionRegister()
    {
        $name = '';
        $email = '';
        $password = '';

        $errors = false;

        if ( isset($_POST['submit']) ) {
            $name = $_POST['name'];
            $email = $_POST['email'];
            $password = $_POST['password'];

            if ( !User::checkName($name) ) {
                $errors[] = 'Имя не должно быть менее двух символов';
            }

            if ( !User::checkEmail($email) ) {
                $errors[] = 'Неправильный email';
            }

            if ( !User::checkPassword($password) ) {
                $errors[] = 'Пароль не может быть короче 6 символов';
            }

            if ( User::checkEmailExists($email) ) {
                $errors[] = 'Данный email уже используется';
            }

            if ( $errors == false ) {

                $userData['name'] = $name;
                $userData['email'] = $email;
                $userData['password'] = $password;

                $result = User::register($userData);

                if ( $result ) {
                    header('Location: /');
                }
            }
        }

        require_once ROOT.'/views/user/register.php';
    }

    public function actionLogin()
    {
        $email = '';
        $password = '';

        if ( isset($_POST['submit']) ) {
            $email = $_POST['email'];
            $password = $_POST['password'];

            if ( !User::checkEmail($email) ) {
                $errors[] = 'Неправильный email';
            }

            if ( !User::checkPassword($password) ) {
                $errors[] = 'Пароль не может быть короче 6 символов';
            }

            $userData['email'] = $email;
            $userData['password'] = $password;

            $userId = User::checkUserData($userData);

            if ( !$userId ) {
                $errors[] = 'Неправильные данные для входа на сайт';
            } else {
                User::auth($userId);
                header('Location: /cabinet/');
            }
        }

        require_once ROOT.'/views/user/login.php';
    }

    public function actionLogout()
    {
        session_start();
        unset($_SESSION['user']);
        header('Location: /');
    }
}