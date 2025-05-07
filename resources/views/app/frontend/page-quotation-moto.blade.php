@extends('layouts.frontend.master')

@section("title")
www.monassurance.ci :: Votre Devis Moto
@endsection

@section("custom-styles")

<link rel="stylesheet" href="{{asset('css/custom.css')}}">
<link rel="stylesheet" href="<?php echo asset('js/datatables/css/jquery.dataTables.min.css')?>">
<link rel="stylesheet" href="<?php echo asset('js/datatables/datatables.bootstrap.min.css')?>">
<link rel="stylesheet" href="<?php echo asset('js/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css')?>">
<link rel="stylesheet" href="<?php echo asset('js/datatables/extensions/Responsive/css/dataTables.responsive.css')?>">
<link rel="stylesheet" href="<?php echo asset('js/datatables/extensions/ColVis/css/dataTables.colVis.min.css')?>">
<link rel="stylesheet" href="<?php echo asset('js/datatables/extensions/TableTools/css/dataTables.tableTools.min.css')?>">
<!-- Step Form Wizard plugin -->
 <link rel="stylesheet" href="{{asset('css/step-form-wizard/css/step-form-wizard-all.css')}}" type="text/css" media="screen, projection">
<link rel="stylesheet" href="{{asset('js/mcustom-scrollbar/jquery.mCustomScrollbar.min.css')}}">
<link rel="stylesheet" href="{{asset('js/parsley/parsley.css')}}" type="text/css">

<style type="text/css">

fieldset{
  padding: 25px;
}
.small_button{
  padding: 8px 20px;
  font-size: 12px;
  line-height: 10px;
  height: 25px;
  margin-bottom: 2px;
}
.select2-container .select2-selection--single {
    box-sizing: border-box;
    cursor: pointer;
    display: block;
    height: 34px;
    user-select: none;
    -webkit-user-select: none; }

/* line 131 */
.select2-container--default .select2-selection--single .select2-selection__rendered {
    color: #444;
    line-height: 32px; }

/* line 139 */
.select2-container--default .select2-selection--single .select2-selection__arrow {
    height: 32px;
    position: absolute;
    top: 1px;
    right: 1px;
    width: 20px; }
body{
  font-size: 14px
}
label{
  font-weight: 100;
  font-size: 14px
}

input[type="text"], input[type="email"], input[type="number"], input[type="password"] {
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 8px;
    width: 100%;
    padding: 0 25px;
    height: 35px;
    font-family: "Open Sans",sans-serif;
}

select .carlist{
  height: 35px;
}
.select2{
    width: 100%;
}

.help_button{
  background-color: #46b8da;
  color:#fff;
  cursor: pointer;
}

.mr25{
  margin-right: 25px
}

.ml25{
  margin-left: 25px
}

#overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: #fff;
    filter:alpha(opacity=70);
    -moz-opacity:0.7;
    -khtml-opacity: 0.7;
    opacity: 0.7;
    z-index: 10000;
}

#overlay img{
  margin: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.top_box{
  margin-top: 100px;
}
@media (max-width: 590px) {
  .btn.get-in-touch-overlay {font-size: 0;padding: 16px 0 11px 41px;position: relative;}
  .btn.get-in-touch-overlay i{ border:0; padding:17px 10px;}
}

</style>
@endsection

@section("custom-scripts")

<script src="<?php echo asset('js/datatables/js/jquery.dataTables.min.js'); ?>"></script>
<script src="<?php echo asset('js/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js'); ?>"></script>
<script src="<?php echo asset('js/datatables/extensions/Responsive/js/dataTables.responsive.min.js'); ?>"></script>
<script src="<?php echo asset('js/datatables/extensions/ColVis/js/dataTables.colVis.min.js'); ?>"></script>
<script src="<?php echo asset('js/datatables/extensions/TableTools/js/dataTables.tableTools.min.js'); ?>"></script>
<script src="<?php echo asset('js/datatables/extensions/dataTables.bootstrap.js'); ?>"></script>
<script src="{{asset('css/step-form-wizard/js/step-form-wizard.js')}}"></script>
<!-- nicer scroll in steps -->

<script src="{{asset('js/mcustom-scrollbar/jquery.mCustomScrollbar.concat.min.js')}}"></script>

<!-- validation library http://parsleyjs.org/ -->

<script src="{{asset('js/parsley/parsley.min.js')}}"></script>
<script src="{{asset('js/parsley/fr.js')}}"></script>
<script src="{{asset('js/cleave.js/dist/cleave.min.js')}}"></script>
<script src="{{asset('js/cleave.js/dist/addons/cleave-phone.ci.js')}}"></script>
<script type="text/javascript" src="{{asset('js/custom-auto-quote.js')}}"></script>
<!-- Modal -->
<div class="modal fade" id="modal-newcar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Ajouter la marque de votre véhicule </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-12">
            <div class="form">
             <form  method="post" action="{{route('auto-quote.createNewCarMake')}}" id="newmakecar">
              <div class="alert alert-danger" style="display:none" id="new_car_error">Saisissez la marque de votre véhicule</div>
              <div class="alert alert-danger" style="display:none" id="car_error">Une erreur s'est produit. Contactez l'administrateur</div>
                {{csrf_field()}}
                <label>Marque du vehicule</label>
                <input type="text" data-delay="300" required placeholder="Marque du véhicule" name="new_make" id="new_make" class="input" >

                <br/>
                <br/>
                <button class="btn btn-primary" type="submit" data-text="Valider">Enregistrer</button> <img src="/images/loader.gif" id="carLoader" style="display:none">
              </form>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-text="Quitter" data-dismiss="modal">Quitter</button>
      </div>
    </div>
</div>
</div>

<div class="modal fade" id="modal-help" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-12 mb15">
            <div style="display: none" class="help-widget">
              <h5>Besoin d'aide ?</h5>
              <p>Appelez nous maintenant au <b>(+225) 220 170 00</b> pour nous poser toutes vos préoccupations. </p>
              <a href="#" class="btn btn-primary btn-white get-in-touch" data-text="FAQ"><i class="fa fa-question"></i>FAQ</a>
            </div>

            <a href="#."  data-toggle="modal" data-target="#call-me" data-dismiss="modal" class="company-presentation-link" style="color:#fff"><i class="fa fa-phone"></i> ou Faite vous appeler pas nos conseillers clients</a>
          </div>
        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-text="Quitter" data-dismiss="modal">Quitter</button>
    </div>
  </div>
</div>
</div>
<div class="modal fade" id="modal-help-cg" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-12 mb15">
            <div style="display: none" class="help-widget">
              <h5>Besoin d'aide ?</h5>
              <p>Appelez nous maintenant au <b>(+225) 220 170 00</b>. </p>
              <div id="div_help_img"></div>
            </div>

            <a href="#."  data-toggle="modal" data-target="#call-me" data-dismiss="modal" class="company-presentation-link" style="color:#fff"><i class="fa fa-phone"></i> ou Faite vous appeler pas nos conseillers clients</a>
          </div>
        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-text="Quitter" data-dismiss="modal">Quitter</button>
    </div>
  </div>
</div>
</div>
@endsection

@section('content')

<section class="subpage-header">
  <div class="container">
    <div class="site-title clearfix">
      <h2>Devis MOTO</h2>
      <ul class="breadcrumbs">
        <li><a href="/">Accueil</a></li>
        <li><a href="{{route('page.moto')}}">Moto</a></li>
        <li>Devis Moto</li>
      </ul>
    </div>
  </div>
</section>


<section>
  <div class="container">

    <div class="row" id="quote_fieldset">
      <div class="col-md-12">
        <form class="form-horizontal form-validation quoteForm" id="quoteFormMoto" method="post">
          <input type="hidden" name="_token" id="_token" value="{{csrf_token()}}">
          <input type="hidden" name="_form_type_" id="_token" value="{{encrypt('AUTO')}}">
            <fieldset>
              <legend>Vous êtes</legend>
              <div class="row" id="div_proprio_veh">
                <div class="col-md-12 text-center">
                    <label class="control-label input-label" for="proprio_veh"><strong> Je souhaite avoir un Devis pour : </strong></label><br/><br/>
                    <div class="radio radio-primary radio-inline mr25">
                      <input type="radio" id="particulier" data-parsley-group="block0"  value="P" name="proprio_veh">
                      <label for="particulier"> Moi même </label>
                    </div>

                    <div class="radio radio-primary radio-inline ml25">
                      <input type="radio" id="entreprise" data-parsley-group="block0" value="E" name="proprio_veh">
                      <label for="entreprise"> Une entreprise </label>
                    </div>
                </div>
              </div>
                <div class="souscripteur_field" style="display:none; border:#ff0000 solid 1px; padding:15px;margin:10px" >
                  <div class="form-group">
                    <div class="col-md-6">
                      <label class="control-label input-label" for="souscripteur_name">Votre nom<span class="text-danger">*</span> </label>
                      <input type="text" data-parsley-group="block0" class="form-control" required  name="souscripteur_name" id="souscripteur_name" placeholder="Nom et prénom de la personne qui effectue le Devis">
                    </div>
                     <div class="col-md-6">
                       <label class="control-label input-label" for="phone_souscr">Votre Numéro WhatsApp <span class="text-danger">*</span></label>
                       <input data-parsley-group="block0" placeholder="Ex: 01020304" type="text" class="form-control" required name="phone_souscr" id="phone_souscr">
                     </div>
                  </div>
                </div>
            </fieldset>
            <fieldset>
                <legend>Votre assurance</legend>
                <div class="row">
                    <div class="col-md-12">
                        <div class="alert alert-info alert-dismissable"><strong>  Selectionnez et définissez la formule d'assurance automobile qui vous convient. </strong></div>
                    </div>
                </div>
                      <div class="row">
                          <div class="col-md-6">
                                      <label class="control-label input-label" for="priseeffet">Date de prise d'effet du contrat souhaitée<span class="text-danger">*</span> </label>
                                      <div class='input-group' id='datetimepicker_priseeffet'>
                                          <input data-parsley-group="block1" type='text' class="form-control date_priseeffet" placeholder="DD/MM/YYYY" required name="priseeffet" id="priseeffet" />
                                          <span class="input-group-addon">
                                              <span class="glyphicon glyphicon-calendar"></span>
                                          </span>
                                    </div>
                          </div>
                          <div class="col-md-6">
                              <label class="control-label input-label" for="priseeffet">Périodicité/Durée du contrat<span class="text-danger">*</span> </label>
                              <select data-parsley-group="block1" class="form-control" required id="periode" name="periode">
                              @foreach($periode as $p)
                                <option value="{{$p->id}}">{{$p->periode}}</option>
                              @endforeach
                              </select>
                          </div>
                        </div>
                      <div class="row">
                        <div class="col-md-12">
                            <select style="display: none" data-parsley-group="block1" class="form-control" name="pref_comp" id="pref_comp">
                              <option value="0">NON</option>
                              @foreach($companies as $c)
                              <option value="{{$c->id}}">{{$c->compname}}</option>
                              @endforeach
                            </select>
                        </div>
                      </div>

                      <div class="col-md-12 text-center" style="margin-bottom:15px; margin-top:15px">
                        <div class="radio radio-primary radio-inline">
                            <input style="display: none;" type="radio" id="formuletype" value="F" name="souscription" checked>
                          </div>
                        <div class="radio radio-primary radio-inline" style="display:none">
                          <input type="radio" disabled id="guaranteetype" value="G" name="souscription">
                          <label for="guaranteetype"> Selectionner vos Garanties (Option avancée) </label>
                        </div>

                      </div>

                      <div class="row">
                          <div class="col-md-12">
                              <div id="div-garantie" style="display:none" class="col-md-6">
                                  <label class="control-label input-label" for="">Garanties<span class="text-danger">*</span> </label><br/>
                                  @foreach($guarantee as $g)
                                    <div class="col-md-6">
                                    <div class="checkbox checkbox-primary">
                                      <input type="checkbox"  id="{{$g->codeguar}}" value="{{$g->codeguar}}" name="guarantee[]"
                                      @if($g->id==1)
                                        {{'checked onclick=return&nbsp;false'}}
                                      @endif
                                       >
                                      <label class="checkpopover" for="{{$g->codeguar}}"> <i title="{{$g->description}}" class="tooltips"> {{$g->titleguar}} </i></label>
                                    </div>
                                    </div>
                                  @endforeach
                              </div>
                              <div id="div-formule"  class="col-md-6">
                                <label class="control-label input-label" for="">Formule d'assurance<span class="text-danger">*</span> </label><br/>
                                <div class="row">
                                  <div class="col-md-12">
                                    <div class="col-md-6">
                                      <div class="radio radio-primary">
                                        <input type="radio" id="tsimple" value="tsimple" name="formule" checked>
                                        <label for="tsimple" id="lb_tsimple"> <i title="L’assurance « au tiers » est la formule d’assurance auto la plus basique et la moins chère. Contrairement à la couverture optimale du contrat « tous risques », la formule « au tiers » ne dédommage que les préjudices physiques et matériels causés à un tiers en cas d’accident." class="tooltips">Tiers Simple </i></label>
                                      </div>
                                    </div>
                                  </div>
                                </div><br/>



                              </div>
                              <div class="col-md-6">
                              <br/>
                                  <div class="alert alert-info alert-dismissable" id="info">


                                       <img src="{{asset('images/help.png')}}" width="24x24"> <strong id="info1">
                                         L'assurance au tiers est la formule Auto la plus basique.</strong> <br/>
                                         <strong id="info2">Les garanties peuvent varier d'une compagnie à une autre!</strong>


                                  </div>
                              </div>
                          </div>
                      </div>

            </fieldset>
            <fieldset>
                            <legend>Votre Moto</legend>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="alert alert-info alert-dismissable">
                                        <strong>Les informations concernant votre Moto sont marquées sur votre <mark>Carte grise</mark>. Veuillez vous en servir pour pouvoir renseigner ces champs.<</strong>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                              <div class="col-md-12">
                                    <label class="control-label input-label" for="immat">Numéro d'immatriculation<span class="text-danger">*</span> </label>
                                <div class="input-group">
                                    <span data-toggle="modal" data-target="#modal-help-cg" id="cg_immat" class="input-group-addon help_button help_cg"><i class="fa fa-question"></i></span>
                                    <input type="text" placeholder="Ex: 1234AB01" onkeyup ="this.value = this.value.toUpperCase();" class="form-control" required data-parsley-group="block2" name="immat" id="immat">


                                  </div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="col-md-6">
                                    <label class="control-label input-label" for="lastname_cg">Nom sur la carte grise<span class="text-danger">*</span> </label>

                                    <div class="input-group">
                                      <span data-toggle="modal" data-target="#modal-help-cg" id="cg_nom" class="input-group-addon help_button help_cg"><i class="fa fa-question"></i></span>
                                      <input type="text" placeholder="Entrez le nom figurant sur la carte grise"  class="form-control" required  data-parsley-group="block2" name="name_cg" id="name_cg">
                                    </div>
                              </div>
                              <div class="col-md-6">
                                <label class="control-label input-label" for="marque">Marque<span class="text-danger">*</span> </label>
                                <div class="input-group">
                                    <span data-toggle="modal" data-target="#modal-help-cg" id="cg_marque" class="input-group-addon help_button help_cg"><i class="fa fa-question"></i></span>
                                  <input type="text" placeholder="Selectionner la marque de votre véhicule" class="form-control" required data-parsley-group="block2" name="marque" id="marque">
                                </div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="col-md-4">
                                  <label class="control-label input-label" for="genre">Genre du véhicule<span class="text-danger">*</span> </label>
                                  <div class="input-group">
                                    <span data-toggle="modal" data-target="#modal-help-cg" id="cg_genre" class="input-group-addon help_button help_cg"><i class="fa fa-question"></i></span>
                                  <select class="form-control" required data-parsley-group="block2" name="genre" id="genre">
                                      @foreach($car_types as $type)
                                       <option value="{{ $type->id_type }}">{{ $type->car_type_desc }}</option>
                                       @endforeach

                                  </select>
                                  </div>
                              </div>
                              <div class="col-md-4">
                                <label class="control-label input-label" for="category">Catégorie/Usage du véviucle<span class="text-danger">*</span> </label>
                                <div class="input-group">
                                    <span data-toggle="modal" data-target="#modal-help-cg" id="cg_usage" class="input-group-addon help_button help_cg"><i class="fa fa-question"></i></span>
                                <select class="form-control" data-placeholder="Entrer une catégorie/usage" required data-parsley-group="block2" name="category" id="category">
                                  @foreach($categories as $cat)
                                  @if($cat->id==5)
                                  <option value="{{$cat->id}}">({{$cat->id}}) {{$cat->shortdesc}}</option>
                                  @endif
                                  @endforeach
                                </select>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <label class="control-label input-label" for="cylindree">Cylindrée (cm3)<span class="text-danger">*</span> </label>
                                <div class="input-group">
                                    <span data-toggle="modal" data-target="#modal-help-cg" id="cg_cylindre" class="input-group-addon help_button help_cg"><i class="fa fa-question"></i></span>
                                <select class="form-control" name="cylindree" id="cylindree">
                                  <option value="1">0-50</option>
                                  <option value="2">51-99</option>
                                  <option value="3">100-175</option>
                                  <option value="4">176-350</option>
                                  <option value="5">Plus de 350</option>
                                </select>
                                </div>
                              </div>
                            </div>


                            <div class="row if_not_tiers_simple" style="display:none">
                              <div class="col-md-6">
                                <label class="control-label input-label" for="vneuve">Prix à neuf<span class="text-danger">*</span> </label>
                                <div class="input-group">
                                <span data-toggle="modal" data-target="#modal-help" class="input-group-addon help_button"><i class="fa fa-question"></i></span>
                                <input type="text" class="form-control vneuve" name="vneuve" id="vneuve"  aria-describedby="addon_vneuve">
                                <span class="input-group-addon" id="addon_vneuve">FCFA</span>
                                </div>
                              </div>
                              <div class="col-md-6">
                                <label class="control-label input-label" for="vvenale">Prix estimé de la vente<span class="text-danger">*</span> </label>
                                <div class="input-group">
                                <span data-toggle="modal" data-target="#modal-help" class="input-group-addon help_button"><i class="fa fa-question"></i></span>
                                <input type="text" class="form-control vvenale" name="vvenale" id="vvenale" aria-describedby="addon_venale">
                                <span class="input-group-addon" id="addon_venale">FCFA</span>
                                </div>
                              </div>
                            </div>

                            <div class="row">
                              <div class="col-md-3">
                                <label class="control-label input-label" for="misecircMonth">Date 1ère mise en circulation<span class="text-danger">*</span>  </label>

                                  <div class='input-group datetimepicker_dateMiseCirc'>
                                      <span data-toggle="modal" data-target="#modal-help-cg" id="cg_mise_circ" class="input-group-addon help_button help_cg"><i class="fa fa-question"></i></span>
                                      <input data-parsley-group="block2" type='text' class="form-control dateMiseCirc" required name="dateMiseCirc" id="dateMiseCirc" placeholder="JJ/MM/AAAA" />
                                      <span class="input-group-addon">
                                          <span class="glyphicon glyphicon-calendar"></span>
                                      </span>
                                </div>
                              </div>
                              <div class="col-md-3">
                                <label class="control-label input-label" for="nbplace">Nombre de place assise<span class="text-danger">*</span></label>
                                <div class='input-group'>
                                      <span data-toggle="modal" data-target="#modal-help-cg" id="cg_place" class="input-group-addon help_button help_cg"><i class="fa fa-question"></i></span>
                                <input type="text"  required data-parsley-group="block2" data-parsley-type="number" class="form-control place" name="nbplace" id="nbplace">
                                </div>
                              </div>
                              <div class="col-md-3">
                                <label class="control-label input-label" for="city">Ville/Zone de stationnement<span class="text-danger">*</span> </label>
                                <select class="form-control" required name="city" data-parsley-group="block2" id="city" placeholder="Zone de stationnement">
                                  @foreach($zones as $z)
                                  <option value="{{$z->id}}">{{$z->city}}</option>
                                  @endforeach
                                </select>
                              </div>
                              <div class="col-md-3">
                                <label class="control-label input-label" for="color">Couleur de la moto</label>
                                <div class='input-group'>
                                      <span data-toggle="modal" data-target="#modal-help-cg" id="cg_place" class="input-group-addon help_button help_cg"><i class="fa fa-question"></i></span>
                                <select class="form-control" required name="color" data-parsley-group="block2" id="color" data-placeholder="Couleur du véhicule">
                                  <option value="1">Blanc</option>
                                  <option value="2">Bleu</option>
                                  <option value="3">Gris</option>
                                  <option value="4">Jaune</option>
                                  <option value="5">Maron</option>
                                  <option value="6">Noir</option>
                                  <option value="7">Orange</option>
                                  <option value="8">Rouge</option>
                                  <option value="9">Vert</option>
                                  <option value="10">Violet</option>
                                  <option value="11">Autres</option>
                                </select>
                                </div>
                              </div>
                            </div>
                            <br/>
                        </fieldset>
                        <fieldset>
                            <legend>Profil de l'assuré</legend>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="alert alert-info alert-dismissable">
                                        <strong>Ces informations nous permettront de vous identifier et editer votre police d'assurance.</strong>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group particulier_field">
                              <div class="col-md-6">
                                <label class="control-label input-label" for="lastname">Nom <span class="text-danger">*</span></label>
                                <input type="text" data-parsley-group="block3" class="form-control repeat" required  name="lastname" id="lastname">
                              </div>
                              <div class="col-md-6">
                                <label class="control-label input-label" for="firstname">Prénom <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" required name="firstname" id="firstname">
                              </div>
                            </div>
                            <div class="form-group entreprise_field" style="display:none">
                              <div class="col-md-6">
                                <label class="control-label input-label" for="company_name">Nom de l'entreprise <span class="text-danger">*</span></label>
                                <input type="text" data-parsley-group="block3" class="form-control repeat" required  name="company_name" id="company_name">
                              </div>
                              <div class="col-md-6">
                                <label class="control-label input-label" for="name_manager">Nom du gérant <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="manager_name" id="manager_name">
                              </div>
                            </div>
                            <div class="form-group particulier_field">
                              <div class="col-md-6">
                                <label class="control-label input-label" for="gender">Sexe <span class="text-danger">*</span></label>

                                <select data-parsley-group="block3" class="form-control" required  name="gender" id="gender">
                                  <option value="H">Homme</option>
                                  <option value="M">Femme</option>
                                </select>
                              </div>
                              <div class="form-group particulier_field">
                                <div class="col-md-6">
                                  <label class="control-label input-label" for="datePC">Date de delivrance permis de conduire <span class="text-danger">*</span></label>
                                    <div class='input-group datetimepicker_datePC'>
                                        <input  type='text' class="form-control datePC" name="datePC" id="datePC" placeholder="JJ/MM/AAAA" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                  </div>

                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class='input-group datetimepicker_dob'>
                                  <input style="visibility: hidden" type="text" class="form-control dob" value="" name="dob" id="dob" placeholder="JJ/MM/AAAA">
                                </div>
                              </div>

                            </div>
                            <div class="form-group">
                              <div class="col-md-6">
                                <label class="control-label input-label" id="label_email" for="email">Adresse email <span class="text-danger">*</span></label>
                                <input type="email" class="form-control" name="email" id="email" placeholder="exemple@email.com">
                              </div>
                               <div class="col-md-6">
                                 <label class="control-label input-label" for="phone">Numéro WhatsApp *</label>
                                 <input data-parsley-group="block3" placeholder="Ex: 01020304" type="text" class="form-control" required name="phone" id="phone">
                               </div>
                            </div>
                        </fieldset>


                        <fieldset>
                            <legend>Services optionnels</legend>
                            <legend>Services optionnels</legend>
                            <div class="row text-center">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <p class="text-center" style="font-size:16px;color:red">
                                            Je souhaite aussi souscrire à ces services supplémentaires
                                        </p>
                                        @foreach($optional_service as $serv)
                                            <div class="col-md-6">
                                                <div class="checkbox checkbox-primary">
                                                    <input type="checkbox"
                                                        id="service_{{$serv->id}}"
                                                        value="{{$serv->id}}"
                                                        name="opt_serv[]">
                                                    <label class="checkpopover" for="service_{{$serv->id}}">
                                                        <i class="tooltips"> {{$serv->service}} ( {{$serv->amount}} FCFA/mois ) </i>
                                                    </label>
                                                </div>
                                                <br/>
                                                <div>
                                                    {!! $serv->description !!}
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>

                        </fieldset>
                        <div id="loader_quote" class="cd-testimonials-all">
                          <div class="cd-testimonials-all-wrapper" id="div_center" >
                            <div class="position-center-center text-center">
                              <div id="loader_img" class="text-center top_box">
                                <div style="margin-top:400px">
                                  <h5 class="loader_img">Plus que quelque instant...</h5>
                                  <img class="loader_img" src="{{asset('images/preloader.gif')}}" alt="" />
                                </div>
                                <div id="box_div" class="" style="margin-top: 400px;"></div>
                                <div id="box_div_table" class="table-responsive" style="display:none;margin-top: 30px;"></div>
                              </div>

                            </div>
                          </div>
                          <a href="javascript:void(0);" class="close-btn" id="close-btn">Close</a>
                        </div>
        </form>

      </div>
    </div>
  </div>
</section>


@endsection

