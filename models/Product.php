<?php

class Product
{
    const SHOW_BY_DEFAULT = 10;

    public static function getAllProducts()
    {
        $db = Db::getConnection();

        $result = $db->prepare('SELECT * FROM products ORDER BY id ASC');
        $result->execute();

        return $result->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function getLatestProducts($count = self::SHOW_BY_DEFAULT)
    {
        $count = intval($count);

        $db = Db::getConnection();

        $result = $db->prepare('SELECT * FROM products WHERE status="1" ORDER BY id DESC LIMIT :count');
        $result->bindParam(':count', $count, PDO::PARAM_INT);
        $result->execute();

        return $productList = $result->fetchAll();
    }

    public static function getProductsListByCategory($id, $page = 1)
    {
        $count = self::SHOW_BY_DEFAULT;
        $page = intval($page);
        $offset = ($page - 1) * $count;

        $db = Db::getConnection();

        $result = $db->prepare('SELECT * FROM products WHERE status="1" AND category_id = :id ORDER BY id ASC LIMIT :limit OFFSET :offset');
        $result->bindParam(':id', $id, PDO::PARAM_INT);
        $result->bindParam(':limit', $count, PDO::PARAM_INT);
        $result->bindParam(':offset', $offset, PDO::PARAM_INT);
        $result->execute();

        return $categoryProducts = $result->fetchAll();
    }

    public static function getProductById($id)
    {
        $db = Db::getConnection();

        $result = $db->prepare('SELECT * FROM products WHERE id = :id');
        $result->bindParam(':id', $id, PDO::PARAM_INT);
        $result->execute();

        return $product = $result->fetch();
    }

    public static function getTotalProductsInCategory($id)
    {
        $db = Db::getConnection();

        $result = $db->prepare('SELECT count(id) AS count FROM products WHERE category_id = :id');
        $result->bindParam(':id', $id, PDO::PARAM_INT);
        $result->execute();

        $total = $result->fetch(PDO::FETCH_ASSOC);

        return $total['count'];
    }

    public static function getProductsByIds($productsIds)
    {
        $db = Db::getConnection();

        $idsStr = implode(',', $productsIds);

        $result = $db->query('SELECT id, name, code, price FROM products WHERE status = "1" AND id IN ('.$idsStr.')');

        return $products = $result->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function getRecommendedProducts()
    {
        $db = Db::getConnection();

        $result = $db->prepare('SELECT * FROM products WHERE is_recommended = 1');
        $result->execute();

        return $result->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function deleteProductById($id)
    {
        $db = Db::getConnection();

        $result = $db->prepare('DELETE FROM products WHERE id = :id');
        $result->bindParam(':id', $id, PDO::PARAM_INT);
        $result->execute();
    }

    public static function createProduct(array $options)
    {
        $db = Db::getConnection();

        $result = $db->prepare('INSERT INTO products ( name, category_id, code, price, availability, brand,
                                description, is_new, is_recommended, status ) VALUES ( :name, :category_id, :code, :price,
                                :availability, :brand, :description, :is_new, :is_recommended, :status )');
        $result->bindParam(':name', $options['name']);
        $result->bindParam(':category_id', $options['category_id']);
        $result->bindParam(':code', $options['code']);
        $result->bindParam(':price', $options['price']);
        $result->bindParam(':availability', $options['availability']);
        $result->bindParam(':brand', $options['brand']);
        $result->bindParam(':description', $options['description']);
        $result->bindParam(':is_new', $options['is_new']);
        $result->bindParam(':is_recommended', $options['is_recommended']);
        $result->bindParam(':status', $options['status']);

        if ( $result->execute() ) {
            return $db->lastInsertId();
        }

        return false;
    }

    public static function updateProductById($id, array $options)
    {
        $db = Db::getConnection();

        $result = $db->prepare('UPDATE products SET name = :name,
                                                    category_id = :category_id,
                                                    code =  :code,
                                                    price = :price,
                                                    availability = :availability,
                                                    brand = :brand,
                                                    description = :description,
                                                    is_new = :is_new,
                                                    is_recommended = :is_recommended,
                                                    status = :status
                                                WHERE id = :id');
        $result->bindParam(':id', $id, PDO::PARAM_INT);
        $result->bindParam(':name', $options['name']);
        $result->bindParam(':category_id', $options['category_id']);
        $result->bindParam(':code', $options['code']);
        $result->bindParam(':price', $options['price']);
        $result->bindParam(':availability', $options['availability']);
        $result->bindParam(':brand', $options['brand']);
        $result->bindParam(':description', $options['description']);
        $result->bindParam(':is_new', $options['is_new']);
        $result->bindParam(':is_recommended', $options['is_recommended']);
        $result->bindParam(':status', $options['status']);

        return $result->execute();
    }

    public static function getImage($productId)
    {
        $noImage = 'no-image.png';
        $path = '/upload/images/products/';
        $pathToProductImage = $path.$productId.'.jpg';

        if ( file_exists($_SERVER['DOCUMENT_ROOT'].$pathToProductImage) ) {
            return $pathToProductImage;
        } else {
            return $path.$noImage;
        }
    }
}