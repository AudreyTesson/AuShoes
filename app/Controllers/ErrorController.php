<?php

namespace App\Controllers;

class ErrorController extends CoreController
{
    public function error404()
    {
        $this->show("error404");
    }
}