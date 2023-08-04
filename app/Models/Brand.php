<?php

namespace App\Models;

use App\Utils\Database;
use PDO;

/**
 * Model servant à gérer les marques
 */
class Brand extends CoreModel
{
    /** @var string */
    private $name;

    public function getName()
    {
        return $this->name;
    }

    public function setName($name)
    {
        $this->name = $name;
        return $this;
    }

    /**
     * Retourne la liste de toutes les marques de la BDD
     *
     * @param string $sort Contient le nom d'un champ sur lequel filtrer
     *
     * @return Brand[]
     */
    public function findAll($sort = "")
    {
        $pdo = Database::getPDO();

        $sql = "SELECT * FROM `brand`";

        if ($sort !== "") {
            $sql .= " ORDER BY $sort";
        }

        $pdoStatement = $pdo->query($sql);

        $results = $pdoStatement->fetchAll(PDO::FETCH_CLASS, Brand::class);

        return $results;
    }

    /**
     * Retourne une marque spécifique via son id dans la BDD
     *
     * @param int $id
     *
     * @return Brand
     */
    public function find($id)
    {
        $pdo = Database::getPDO();

        $sql = "SELECT * FROM `brand` WHERE id=$id";
        $pdoStatement = $pdo->query($sql);

        return $pdoStatement->fetchObject(Brand::class);
    }
}
