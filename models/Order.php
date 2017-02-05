<?php

/**
 * Created by PhpStorm.
 * User: fedor
 * Date: 23.01.17
 * Time: 11:25
 */
class Order
{
    public static function save(array $orderData)
    {
        $db = Db::getConnection();

        $products = json_encode($orderData['productsInCart']);

        $result = $db->prepare('INSERT INTO product_orders ( user_name, user_phone, user_comment, user_id, products ) 
                                VALUES ( :user_name, :user_phone, :user_comment, :user_id, :products )');
        $result->bindParam(':user_name', $orderData['userName'], PDO::PARAM_STR);
        $result->bindParam(':user_phone', $orderData['userPhone'], PDO::PARAM_STR);
        $result->bindParam(':user_comment', $orderData['userComment']);
        $result->bindParam(':user_id', $orderData['userId'], PDO::PARAM_INT);
        $result->bindParam(':products', $products);

        return $result->execute();

    }
}