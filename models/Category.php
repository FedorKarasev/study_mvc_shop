<?php

/**
 * Created by PhpStorm.
 * User: fedor
 * Date: 21.01.17
 * Time: 16:48
 */
class Category
{
    public static function getCategoriesList()
    {
        $db = Db::getConnection();

        $result = $db->query('SELECT id, name FROM categories ORDER BY sort_order ASC');

        return $categoriesList = $result->fetchAll(PDO::FETCH_ASSOC);
    }
}