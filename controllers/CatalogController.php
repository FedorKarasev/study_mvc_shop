<?php

class CatalogController
{
    public function actionIndex()
    {
        $categoriesList = Category::getCategoriesList();
        $latestProducts = Product::getLatestProducts(15);

        require_once ROOT.'/views/catalog/index.php';
    }

    public function actionCategory($id, $page = 1)
    {
        $categoriesList = Category::getCategoriesList();
        $categoryProducts = Product::getProductsListByCategory($id, $page);
        $total = Product::getTotalProductsInCategory($id);

        $pagination = new Pagination($total, $page, Product::SHOW_BY_DEFAULT, 'page-');

        require_once ROOT.'/views/catalog/category.php';
    }
}