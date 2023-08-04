<?php

namespace App\Models;

use App\Utils\Database;
use PDO;

/**
 * Model servant à gérer les types
 */
class Type extends CoreModel
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
     * Retourne la liste de tous les types de la BDD
     *
     * @param string $sort Contient le nom d'un champ sur lequel filtrer
     *
     * @return Type[]
     */
    public function findAll($sort = "")
    {
        $pdo = Database::getPDO();

        $sql = "SELECT * FROM `type`";

        if ($sort !== "") {
            $sql .= " ORDER BY $sort";
        }

        $pdoStatement = $pdo->query($sql);

        $results = $pdoStatement->fetchAll(PDO::FETCH_CLASS, Type::class);

        return $results;
    }

    /**
     * Retourne un type spécifique via son id dans la BDD
     *
     * @param int $id
     *
     * @return Type
     */
    public function find($id)
    {
        $pdo = Database::getPDO();

        $sql = "SELECT * FROM `type` WHERE id=$id";
        $pdoStatement = $pdo->query($sql);

        return $pdoStatement->fetchObject(Type::class);
    }
}
