<?php require_once ROOT.'/views/layouts/header.php'; ?>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="left-sidebar">
                        <h2>Каталог</h2>
                        <div class="panel-group category-products">

                            <?php foreach ($categoriesList as $category): ?>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a href="/category/<?php echo $category['id']; ?>"><?php echo $category['name']; ?></a></h4>
                                    </div>
                                </div>
                            <?php endforeach; ?>

                        </div>

                    </div>
                </div>

                <div class="col-sm-9 padding-right">
                    <div class="features_items"><!--features_items-->
                        <h2 class="title text-center">Последние товары</h2>

                        <?php
                        if ($latestProducts == false) {
                            echo '<h3>Отсутствует список продуктов.</h3>';
                        }
                        ?>

                        <?php foreach ($latestProducts as $product): ?>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="<?php echo $product['image']; ?>" alt="" />
                                            <h2>$<?php echo $product['price']; ?></h2>
                                            <p><a href="product/<?php echo $product['id']; ?>"><?php echo $product['name']; ?></a></p>

                                            <a href="#" class="btn btn-default add-to-cart"
                                               data-id="<?php echo $product['id']; ?>"><i class="fa fa-shopping-cart"></i>В корзину</a>

                                        </div>
                                        <?php if ( $product['is_new'] ): ?>
                                            <img src="../../template/images/home/new.png" class="new" alt="">
                                        <?php endif; ?>
                                    </div>
                                </div>
                            </div>
                        <?php endforeach; ?>

                    </div><!--features_items-->

                </div>
            </div>
        </div>
    </section>

<?php require_once ROOT.'/views/layouts/footer.php'; ?>