<?php

namespace App\Controllers;

use App\Models\Brand;
use App\Models\Category;
use App\Models\Type;

class CoreController
{
    /**
     * Affiche la page
     *
     * @param string $viewName
     * @param array $viewData (Facultatif)
     */
    protected function show($viewName, $viewData = [])
    {
        global $router; // Ca c'est hyper degueulasse mais pour l'instant ça fait le café

        $baseUri = $_SERVER['BASE_URI'] . '/';

        $categoryModel = new Category();
        $categoriesList = $categoryModel->findAll('name');

        $typeModel = new Type();
        $typesList = $typeModel->findAll('name');

        $brandModel = new Brand();
        $brandsList = $brandModel->findAll('name');

        $categoriesListById = [];
        foreach ($categoriesList as $categoryElement) {
            $categoriesListById[$categoryElement->getId()] = $categoryElement;
        }

        $typesListById = [];
        foreach ($typesList as $typeElement) {
            $typesListById[$typeElement->getId()] = $typeElement;
        }

        $brandsListById = [];
        foreach ($brandsList as $brandElement) {
            $brandsListById[$brandElement->getId()] = $brandElement;
        }

        require_once __DIR__ . "/../views/header.tpl.php";
        require_once __DIR__ . "/../views/$viewName.tpl.php";
        require_once __DIR__ . "/../views/footer.tpl.php";
    }
}