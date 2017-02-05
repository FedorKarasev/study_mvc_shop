<?php

class ProductController
{
    public function actionView($id)
    {
        $product = Product::getProductById($id);
        $categoriesList = Category::getCategoriesList();

        require_once ROOT.'/views/product/view.php';
    }
}