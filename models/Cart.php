<?php

/**
 * Created by PhpStorm.
 * User: fedor
 * Date: 22.01.17
 * Time: 13:05
 */
class Cart
{
    public static function addProduct($id)
    {
        $productsInCart = [];

        if ( isset($_SESSION['products']) ) {
            $productsInCart = $_SESSION['products'];
        }

        if ( array_key_exists($id, $productsInCart) ) {
            $productsInCart[$id] ++;
        } else {
            $productsInCart[$id] = 1;
        }

        $_SESSION['products'] = $productsInCart;

        return self::countItems();
    }

    public static function countItems()
    {
        if ( isset($_SESSION['products']) ) {
            $count = 0;
            foreach ($_SESSION['products'] as $id => $quantity) {
                $count += $quantity;
            }
            return $count;
        } else {
            return 0;
        }
    }

    public static function getProducts()
    {
        if ( isset($_SESSION['products']) ) {
            return $_SESSION['products'];
        } else {
            return false;
        }
    }

    public static function getTotalPrice($products)
    {
        $productsInCart = self::getProducts();
        $total = 0;

        if ( $productsInCart ) {
            foreach ($products as $product) {
                $total += $product['price'] * $productsInCart[$product['id']];
            }
        }

        return $total;
    }

    public static function clear()
    {
        unset($_SESSION['products']);
    }

    public static function deleteProductFromCart($id)
    {
        $productsInCart = self::getProducts();
        unset($productsInCart[$id]);
        $_SESSION['products'] = $productsInCart;
    }
}