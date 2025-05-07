<?php

namespace App\Http\Controllers\Backoffice\CRUD\Category;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Backoffice\AutoCategories;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;

class CategoryController extends Controller
{
    public function showPage()
    {
        $categories = AutoCategories::all();
        return view('Backoffice.backend.config.category', compact('categories'));
    }


    public function getCategory($id)
    {
        $categorie = AutoCategories::where('id', $id)->first();
        if ($categorie) {
            return json_encode($categorie);
        } else {
            return response()->json(0);
        }
    }


    public function editCategory(Request $req)
    {
    	($req['enabled'] =='on') ? $enabled=1:$enabled=0;
    	AutoCategories::where('id', $req['idcat'])->update([
    		'categorie'=> $req['category'],
    		'shortdesc'=> $req['description'],
    		'enabled' => $enabled
    	]);
        Log::info('Mise à jour catégorie automobile.');
    	Session::flash('success','La catégorie a bien été mise à jour');
	    return redirect()->route('categoryPage');
    }

}
