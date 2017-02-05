<?php

/**
 * Created by PhpStorm.
 * User: fedor
 * Date: 22.01.17
 * Time: 13:03
 */
class CartController
{
    public function actionIndex()
    {
        $categoriesList = Category::getCategoriesList();
        $productsInCart = Cart::getProducts();

        if ( $productsInCart ) {
            $productsIds = array_keys($productsInCart);
            $products = Product::getProductsByIds($productsIds);
            $totalPrice = Cart::getTotalPrice($products);
        }

        require_once ROOT.'/views/cart/index.php';
    }

    public function actionAdd($id)
    {
        Cart::addProduct($id);

        $referer = $_SERVER['HTTP_REFERER'];
        header('Location: '.$referer);
    }

    public function actionAddajax($id)
    {
        echo Cart::addProduct($id);
    }

    public function actionCheckout()
    {
        $categoriesList = Category::getCategoriesList();
        $result = false;
        $errors = false;

        if ( isset($_POST['submit']) ) {

            $userName = $_POST['userName'];
            $userPhone = $_POST['userPhone'];
            $userComment = $_POST['userComment'];
            $errors = false;

            $productsInCart = Cart::getProducts();
            $productsIds = array_keys($productsInCart);
            $products = Product::getProductsByIds($productsIds);
            $totalQuantity = Cart::countItems();
            $totalPrice = Cart::getTotalPrice($products);

            if ( !User::checkName($userName) ) {
                $errors[] = 'Имя не должно быть менее двух символов';
            }

            if ( !User::checkPhone($userPhone) ) {
                $errors[] = 'Некорректный номер телефона';
            }

            if ( $errors == false ) {

                $productsInCart = Cart::getProducts();

                if ( User::isGuest() ) {
                    $userId = false;
                } else {
                    $userId = User::checkLogged();
                }

                $orderData['userName'] = $userName;
                $orderData['userPhone'] = $userPhone;
                $orderData['userComment'] = $userComment;
                $orderData['userId'] = $userId;
                $orderData['productsInCart'] = $productsInCart;

                $result = Order::save($orderData);

                if ( $result ) {

                    $adminEmail = 'fedorr.karasev@gmail.com';
                    $subject = 'Новый заказ';
                    $message = 'blablabla';

                    mail($adminEmail, $subject, $message);

                    Cart::clear();

                }

            } else {

            }

        } else {
            $productsInCart = Cart::getProducts();

            if ( $productsInCart == false ) {
                header('Location: /');
            }

            $productsIds = array_keys($productsInCart);
            $products = Product::getProductsByIds($productsIds);
            $totalQuantity = Cart::countItems();
            $totalPrice = Cart::getTotalPrice($products);

            $userName = '';
            $userPhone = '';
            $userComment = '';

            if ( !User::isGuest() ) {

                $userId = User::checkLogged();
                $user = User::getUserById($userId);

                $userName = $user['name'];

            } else {
                $userName = '';
                $userPhone = '';
                $userComment = '';
            }
        }

        require_once ROOT.'/views/cart/checkout.php';
    }

    public function actionDelete($id)
    {
        Cart::deleteProductFromCart($id);
        header('Location: /cart/');
    }
}