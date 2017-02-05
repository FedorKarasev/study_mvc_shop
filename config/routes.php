<?php

return [
    'catalog' => 'catalog/index',
    'category/([0-9]+)/page-([0-9]+)' => 'catalog/category/$1/$2',
    'category/([0-9]+)' => 'catalog/category/$1',

    'product/([0-9]+)' => 'product/view/$1',

    'contacts' => 'site/contacts',

    'cart/add/([0-9]+)' => 'cart/add/$1',
    'cart/addajax/([0-9]+)' => 'cart/addajax/$1',
    'cart/checkout' => 'cart/checkout',
    'cart/delete/([0-9]+)' => 'cart/delete/$1',
    'cart' => 'cart/index',

    'cabinet/edit' => 'cabinet/edit',
    'cabinet' => 'cabinet/index',

    'user/register' => 'user/register',
    'user/login' => 'user/login',
    'user/logout' => 'user/logout',

    'admin/product/create' => 'adminproduct/create',
    'admin/product/update/([0-9]+)' => 'adminproduct/update/$1',
    'admin/product/delete/([0-9]+)' => 'adminproduct/delete/$1',
    'admin/product' => 'adminproduct/index',

    'admin/category/create' => 'admincategory/create',
    'admin/category/update/([0-9]+)' => 'admincategory/update/$1',
    'admin/category/delete/([0-9]+)' => 'admincategory/delete/$1',
    'admin/category' => '',

    'admin/order/create' => 'adminorder/create',
    'admin/order/update/([0-9]+)' => 'adminrder/update/$1',
    'admin/order/delete/([0-9]+)' => 'adminorder/delete/$1',
    'admin/order' => '',

    'admin' => 'admin/index',

    '' => 'site/index'
];