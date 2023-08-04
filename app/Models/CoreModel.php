<?php

namespace App\Models;

class CoreModel
{
    /** @var int C'est l'identifiant unique de notre objet */
    protected $id;

    /** @var string Date de création au format Y-m-d H:i:s */
    protected $created_at;

    /** @var string Date de modification au format Y-m-d H:i:s */
    protected $updated_at;

    public function getId()
    {
        return $this->id;
    }

    public function setId($id): self
    {
        $this->id = $id;
        return $this;
    }

    public function getCreatedAt()
    {
        return $this->created_at;
    }

    public function setCreatedAt($created_at): self
    {
        $this->created_at = $created_at;
        return $this;
    }

    public function getUpdatedAt()
    {
        return $this->updated_at;
    }

    public function setUpdatedAt($updated_at): self
    {
        $this->updated_at = $updated_at;
        return $this;
    }
}