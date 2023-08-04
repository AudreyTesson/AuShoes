<?php

namespace App\Controllers;

use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\Type;

class CatalogController extends CoreController
{
    /**
     * Méthode qui affiche une catégorie ciblée avec son id
     *
     * @param int $id
     */
    public function category($id)
    {
        $categoryModel = new Category();
        $category = $categoryModel->find($id);

        $productModel = new Product();
        $products = $productModel->findAllByCategory($id);

        $this->show("products_list", [
            'object' => $category,
            'products' => $products
        ]);
    }

    /**
     * Méthode qui affiche un type ciblé avec son id
     *
     * @param int $id
     */
    public function type($id)
    {
        $typeModel = new Type();
        $type = $typeModel->find($id);

        $productModel = new Product();
        $products = $productModel->findAllByType($id);

        $this->show("products_list", [
            'object' => $type,
            'products' => $products
        ]);
    }

    /**
     * Méthode qui affiche une marque ciblée avec son id
     *
     * @param int $id
     */
    public function brand($id)
    {
        $brandModel = new Brand();
        $brand = $brandModel->find($id);

        $productModel = new Product();
        $products = $productModel->findAllByBrand($id);

        $this->show("products_list", [
            'object' => $brand,
            'products' => $products
        ]);
    }

    /**
     * Méthode qui affiche un produit ciblé avec son id
     *
     * @param int $id
     */
    public function product($id)
    {
        $productModel = new Product();
        $product = $productModel->find($id);

        $this->show("product", ['product' => $product]);
    }
}