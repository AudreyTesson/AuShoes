<?php

namespace App\Controllers;

use App\Models\Brand;
use App\Models\Category;

class MainController extends CoreController
{
    public function test()
    {
        $object = new Brand();
        $objects = $object->findAll();

        $object3 = $object->find(3);

        dd($objects, $object3, $object3->getName(), $object3->getId());
    }

    public function home()
    {
        $categoryModel = new Category();
        $categoriesForHomepage = $categoryModel->findForHomepage();

        $this->show("home", [
            "categoriesForHomepage" => $categoriesForHomepage
        ]);
    }

    public function legalNotice()
    {
        $this->show("legal_notice");
    }
}