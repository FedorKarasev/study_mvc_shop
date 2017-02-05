<?php

class User
{
    public static function register(array $userData)
    {
        $db = Db::getConnection();

        $result = $db->prepare('INSERT INTO users (name, email, password) VALUES (:name, :email, :password)');
        $result->bindParam(':name', $userData['name'], PDO::PARAM_STR);
        $result->bindParam(':email', $userData['email'], PDO::PARAM_STR);
        $result->bindParam(':password', $userData['password'], PDO::PARAM_STR);

        return $result->execute();
    }

    public static function checkName($name)
    {
        if ( strlen($name) >= 2 ) {
            return true;
        }

        return false;
    }

    public static function checkEmail($email)
    {
        if ( filter_var($email, FILTER_VALIDATE_EMAIL) ) {
            return true;
        }

        return false;
    }

    public static function checkPassword($password)
    {
        if ( strlen($password) >= 6 ) {
            return true;
        }

        return false;
    }

    public static function checkEmailExists($email)
    {
        $db = Db::getConnection();

        $result = $db->prepare('SELECT count(*) FROM users WHERE email = :email');
        $result->bindParam(':email', $email, PDO::PARAM_STR);
        $result->execute();

        if ( $result->fetchColumn() ) {
            return true;
        } else {
            return false;
        }
    }

    public static function checkUserData(array $userData)
    {
        $db = Db::getConnection();

        $result = $db->prepare('SELECT * FROM users WHERE email = :email AND password = :password');
        $result->bindParam(':email', $userData['email'], PDO::PARAM_STR);
        $result->bindParam(':password', $userData['password'], PDO::PARAM_STR);
        $result->execute();

        $user = $result->fetch();
        if ( $user ) {
            return $user['id'];
        }
        return false;
    }

    public static function auth($userId)
    {
        $_SESSION['user'] = $userId;
    }

    public static function checkLogged()
    {
        if ( isset($_SESSION['user']) ) {
            return $_SESSION['user'];
        } else {
            header('Location: /user/login');
        }
    }

    public static function checkPhone($userPhone)
    {
        if ( filter_var($userPhone, FILTER_VALIDATE_INT) && ( strlen($userPhone) == 11 ) ) {
            return true;
        } else {
            return false;
        }
    }

    public static function isGuest()
    {
        if ( isset($_SESSION['user']) ) {
            return false;
        } else {
            return true;
        }
    }

    public static function getUserById($userId)
    {
        $db = Db::getConnection();

        $result = $db->prepare('SELECT * FROM users WHERE id = :id');
        $result->bindParam(':id', $userId, PDO::PARAM_INT);
        $result->execute();

        return $user = $result->fetch(PDO::FETCH_ASSOC);
    }

    public static function edit(array $userData)
    {
        $db = Db::getConnection();

        $result = $db->prepare('UPDATE users SET name = :name, password = :password WHERE id = :id');
        $result->bindParam(':name', $userData['name'], PDO::PARAM_STR);
        $result->bindParam(':password', $userData['password'], PDO::PARAM_STR);
        $result->bindParam(':id', $userData['id'], PDO::PARAM_INT);
        return $result->execute();
    }
}