<?php

class SiteController
{
    public function actionIndex()
    {

        $categoriesList = Category::getCategoriesList();
        $latestProducts = Product::getLatestProducts(6);
        $recommendedProducts = Product::getRecommendedProducts();

        require_once ROOT.'/views/site/index.php';
    }

    public function actionContacts()
    {
        $mail = 'fedorr.karasev@gmail.com';
        $subject = 'Тема';
        $message = 'Сообщение';
        $result = mail($mail, $subject, $message);

        require_once ROOT.'/views/site/contacts.php';
    }
}