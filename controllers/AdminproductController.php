<?php

class AdminproductController extends Admin
{
    public function actionIndex()
    {
        $productsList = Product::getAllProducts();

        require_once ROOT.'/views/admin_product/index.php';
    }

    public function actionCreate()
    {
        $categoriesList = Category::getCategoriesList();
        $errors = false;

        if ( isset($_POST['submit']) ) {

            $options['name'] = $_POST['name'];
            $options['code'] = $_POST['code'];
            $options['price'] = $_POST['price'];
            $options['category_id'] = $_POST['category_id'];
            $options['brand'] = $_POST['brand'];
            $options['availability'] = $_POST['availability'];
            $options['description'] = $_POST['description'];
            $options['is_new'] = $_POST['is_new'];
            $options['is_recommended'] = $_POST['is_recommended'];
            $options['status'] = $_POST['status'];

            if ( !isset($options['name']) || empty($options['name']) ) {
                $errors[] = 'Заполните имя';
            }

            if ( !isset($options['code']) || empty($options['code']) ) {
                $errors[] = 'Заполните код';
            }

            if ( !isset($options['price']) || empty($options['price']) ) {
                $errors[] = 'Заполните цену';
            }

            if ( !isset($options['category_id']) || empty($options['category_id']) ) {
                $errors[] = 'Выберите категорию';
            }

            if ( !isset($options['brand']) || empty($options['brand']) ) {
                $errors[] = 'Заполните бренд';
            }

            if ( $errors == false ) {

                $id = Product::createProduct($options);

                if ( $id ) {

                    if ( is_uploaded_file($_FILES['image']['tmp_name']) ) {

                        $image =$_FILES['image']['name'];
                        $file = new SplFileInfo($image);

                        move_uploaded_file($_FILES['image']['tmp_name'], $_SERVER['DOCUMENT_ROOT'].'/upload/images/products/'.$id.'.'.$file->getExtension());
                    }

                }

                header('Location: /admin/product');

            }

        }

        require_once ROOT.'/views/admin_product/create.php';
    }

    public function actionDelete($id)
    {
        if ( isset($_POST['submit']) ) {

            Product::deleteProductById($id);
            header('Location: /admin/product');

        }

        require_once ROOT.'/views/admin_product/delete.php';
    }

    public function actionUpdate($id)
    {
        $categoriesList = Category::getCategoriesList();
        $product = Product::getProductById($id);
        $errors = false;

        if ( isset($_POST['submit']) ) {

            $options['name'] = $_POST['name'];
            $options['code'] = $_POST['code'];
            $options['price'] = $_POST['price'];
            $options['category_id'] = $_POST['category_id'];
            $options['brand'] = $_POST['brand'];
            $options['availability'] = $_POST['availability'];
            $options['description'] = $_POST['description'];
            $options['is_new'] = $_POST['is_new'];
            $options['is_recommended'] = $_POST['is_recommended'];
            $options['status'] = $_POST['status'];

            if ( !isset($options['name']) || empty($options['name']) ) {
                $errors[] = 'Заполните имя';
            }

            if ( !isset($options['code']) || empty($options['code']) ) {
                $errors[] = 'Заполните код';
            }

            if ( !isset($options['price']) || empty($options['price']) ) {
                $errors[] = 'Заполните цену';
            }

            if ( !isset($options['category_id']) || empty($options['category_id']) ) {
                $errors[] = 'Выберите категорию';
            }

            if ( !isset($options['brand']) || empty($options['brand']) ) {
                $errors[] = 'Заполните бренд';
            }

            if ( $errors == false ) {

                Product::updateProductById($id, $options);

                if ( is_uploaded_file($_FILES['image']['tmp_name']) ) {

                    $image = $_FILES['image']['name'];
                    $file = new SplFileInfo($image);

                    move_uploaded_file($_FILES['image']['tmp_name'], $_SERVER['DOCUMENT_ROOT'] . '/upload/images/products/' . $id . '.' . $file->getExtension());

                }

                header('Location: /admin/product');

            }

        }

        require_once ROOT.'/views/admin_product/update.php';
    }
}