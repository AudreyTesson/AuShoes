<?php

namespace App\Models;

use App\Utils\Database;
use PDO;

class Product extends CoreModel
{
    private $name;
    private $description;
    private $picture;
    private $price;
    private $rate;
    private $status;
    private $brand_id;
    private $category_id;
    private $type_id;

    public function getName()
    {
        return $this->name;
    }

    public function setName($name)
    {
        $this->name = $name;
        return $this;
    }

    public function getDescription()
    {
        return $this->description;
    }

    public function setDescription($description)
    {
        $this->description = $description;
        return $this;
    }

    public function getPicture()
    {
        return $this->picture;
    }

    public function setPicture($picture)
    {
        $this->picture = $picture;
        return $this;
    }

    public function getPrice()
    {
        return $this->price;
    }

    public function setPrice($price)
    {
        $this->price = $price;
        return $this;
    }

    public function getRate()
    {
        return $this->rate;
    }

    public function setRate($rate)
    {
        $this->rate = $rate;
        return $this;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function setStatus($status)
    {
        $this->status = $status;
        return $this;
    }

    public function getBrandId()
    {
        return $this->brand_id;
    }

    public function setBrandId($brand_id)
    {
        $this->brand_id = $brand_id;
        return $this;
    }

    public function getCategoryId()
    {
        return $this->category_id;
    }

    public function setCategoryId($category_id)
    {
        $this->category_id = $category_id;
        return $this;
    }

    public function getTypeId()
    {
        return $this->type_id;
    }

    public function setTypeId($type_id)
    {
        $this->type_id = $type_id;
        return $this;
    }

    /**
     * Retourne la liste de tous les produits de la BDD
     *
     * @return Product[]
     */
    public function findAll()
    {
        $pdo = Database::getPDO();

        $sql = "SELECT * FROM `product`";
        $pdoStatement = $pdo->query($sql);

        // On récupère les données
        $results = $pdoStatement->fetchAll(PDO::FETCH_CLASS, Product::class);

        return $results;
    }

    /**
     * Retourne un produit spécifique via son id dans la BDD
     *
     * @param int $id
     *
     * @return Product
     */
    public function find($id)
    {
        $pdo = Database::getPDO();

        $sql = "SELECT * FROM `product` WHERE id=$id";
        $pdoStatement = $pdo->query($sql);

        $product = $pdoStatement->fetchObject(Product::class);

        return $product;
    }

    /**
     * Retourne tous les produits liés à une catégories précise
     *
     * @param int $categoryId
     *
     * @return Product[]
     */
    public function findAllByCategory($categoryId)
    {
        $pdo = Database::getPDO();

        $sql = "SELECT * FROM `product` WHERE category_id = $categoryId";
        $pdoStatement = $pdo->query($sql);

        $results = $pdoStatement->fetchAll(PDO::FETCH_CLASS, Product::class);

        return $results;
    }

    /**
     * Retourne tous les produits liés à un type précis
     *
     * @param int $typeId
     *
     * @return Product[]
     */
    public function findAllByType($typeId)
    {
        $pdo = Database::getPDO();

        $sql = "SELECT * FROM `product` WHERE type_id = $typeId";
        $pdoStatement = $pdo->query($sql);

        $results = $pdoStatement->fetchAll(PDO::FETCH_CLASS, Product::class);

        return $results;
    }

    /**
     * Retourne tous les produits liés à une marque précise
     *
     * @param int $brandId
     *
     * @return Product[]
     */
    public function findAllByBrand($brandId)
    {
        $pdo = Database::getPDO();

        $sql = "SELECT * FROM `product` WHERE brand_id = $brandId";
        $pdoStatement = $pdo->query($sql);

        $results = $pdoStatement->fetchAll(PDO::FETCH_CLASS, Product::class);

        return $results;
    }
}
