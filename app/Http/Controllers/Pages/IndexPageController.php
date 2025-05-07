<?php

namespace App\Http\Controllers\Pages;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class IndexPageController extends Controller
{
    public function showIndexPage()
    {
    	return view('app.frontend.index')->with(['active'=>'']);
    }
}
 