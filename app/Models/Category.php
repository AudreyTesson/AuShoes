<?php

namespace App\Models;

use App\Utils\Database;
use PDO;

/**
 * Model servant à gérer les catégories
 */
class Category extends CoreModel
{
    private $name;

    private $subtitle;

    private $picture;

    private $home_order;

    public function getName()
    {
        return $this->name;
    }

    public function setName($name): self
    {
        $this->name = $name;
        return $this;
    }

    public function getSubtitle()
    {
        return $this->subtitle;
    }

    public function setSubtitle($subtitle): self
    {
        $this->subtitle = $subtitle;
        return $this;
    }

    public function getPicture()
    {
        return $this->picture;
    }

    public function setPicture($picture): self
    {
        $this->picture = $picture;
        return $this;
    }

    public function getHomeOrder()
    {
        return $this->home_order;
    }

    public function setHomeOrder($home_order): self
    {
        $this->home_order = $home_order;
        return $this;
    }

    /**
     * Retourne la liste de toutes les catégories de la BDD
     *
     * @param string $sort Contient le nom d'un champ sur lequel filtrer
     *
     * @return Category[]
     */
    public function findAll($sort = "")
    {
        $pdo = Database::getPDO();

        $sql = "SELECT * FROM `category`";

        if ($sort !== "") {
            // $sql = $sql . " ORDER BY $sort";
            $sql .= " ORDER BY $sort";
        }

        $pdoStatement = $pdo->query($sql);

        return $pdoStatement->fetchAll(PDO::FETCH_CLASS, Category::class);
    }

    /**
     * Retourne une catégorie spécifique via son id dans la BDD
     *
     * @param int $id
     *
     * @return Category
     */
    public function find($id)
    {
        $pdo = Database::getPDO();

        $pdoStatement = $pdo->query("SELECT * FROM `category` WHERE id=$id");

        return $pdoStatement->fetchObject(Category::class);
    }

    /**
     * Retourne la liste de toutes les catégories de la BDD à afficher sur la
     * homepage, dans le bon ordre
     *
     * @return Category[]
     */
    public function findForHomepage()
    {
        $pdo = Database::getPDO();

        $sql = "SELECT *
                FROM `category`
                WHERE `home_order` >  0
                ORDER BY `home_order` ASC
                LIMIT 5";

        $pdoStatement = $pdo->query($sql);

        return $pdoStatement->fetchAll(PDO::FETCH_CLASS, Category::class);
    }
}
