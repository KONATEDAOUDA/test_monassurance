@extends('Backoffice.layouts.app')

@section("content")
  <div class="page page-shop-single-order">
      <div class="pageheader">
          <h2>Détails de la commande #{{$prospect->number_n}}</h2>
          <div class="page-bar">
              <ul class="page-breadcrumb">
                  <li>
                      <a href="{{route('spaceDashboard')}}"><i class="fa fa-home"></i> MONASSURANCE.CI</a>
                  </li>
                  <li>
                      <a href="#">Commande</a>
                  </li>
                  <li>
                      <a href="">Détails</a>
                  </li>
              </ul>
          </div>
      </div>

        <div class="pagecontent">
            <div class="add-nav">
              <div class="nav-heading">
                <h3>N° COMMANDE : <strong class="text-greensea">{{$prospect->number_n}}</strong></h3><br/>
                <h6>N° POLICE : <strong class="text-greensea">{{$prospect->policy_number}}</strong></h6>
                <span class="controls pull-right">
                  @php
                    // Récupérer le numéro de téléphone et le formater
                    $clientPhone = $prospect->contact;
                    $clientPhoneFormatted = preg_replace('/\D/', '', $clientPhone);

                    // Générer un message pré-rempli pour WhatsApp
                    $message = urlencode("Bonjour, je vous contacte concernant votre commande #{$prospect->number_n}. Merci de confirmer !");
                    $whatsappLink = "https://wa.me/225{$clientPhoneFormatted}?text={$message}";
                    @endphp

                    <a href="{{ $whatsappLink }}" target="_blank" class="btn btn-ef btn-ef-1 btn-ef-1-Success btn-rounded-20" style="color: green; border-color:#4cae4c">
                        <i class="fa fa-whatsapp"></i> Contacter via WhatsApp
                    </a>


                    <a class="btn btn-ef btn-ef-1 btn-ef-1-warning btn-ef-1a btn-rounded-20 revive_client_btn"   data-toggle="modal" data-target="#revive" data-options="splash-2 splash-ef-15"><i class="fa fa-calendar"></i> Relancer</a>
                </span><br><br>


                    <form action="{{ route('payments.store') }}" method="POST">
                        @csrf

                        <div class="form-group">
                            <label for="amount">Montant</label>
                            <input type="number" name="amount" id="amount" value="{{ $prospect->inbox_amount }}" class="form-control" disabled  required>
                        </div>

                        <button type="submit" class="btn btn-success">Enregistrer le paiement</button>
                    </form>


                    <div class="tile">
                        @php
                            // Vérification si une attestation existe pour ce devis spécifique
                            $attestationExistsForQuotation = \App\Models\Backoffice\Attestation::where('user_id', $prospect->user_id)
                                ->where('quotation_id', $prospect->qid)
                                ->exists();
                        @endphp

                        @if ($attestationExistsForQuotation)
                            <p class="text-success">
                                Une attestation a déjà été téléversée pour ce devis.
                            </p>
                        @else
                            <form method="POST" action="{{ route('attestations.upload') }}" enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="user_id" value="{{ $prospect->user_id }}">
                                <input type="hidden" name="quotation_id" value="{{ $prospect->qid }}">

                                <div class="form-group">
                                    <label for="file">Téléverser une attestation :</label>
                                    <input type="file" name="file" id="file" class="form-control" required>
                                </div>

                                <button type="submit" class="btn btn-success btn-sm">
                                    <i class="fa fa-upload"></i> Téléverser
                                </button>
                            </form>
                        @endif
                    </div>


              </div>
                <div role="tabpanel">

                  <!-- Nav tabs -->
                  <ul class="nav nav-tabs" role="tablist">
                      <li role="presentation" class="active"><a href="#details" aria-controls="details" role="tab" data-toggle="tab">Commande</a></li>
                  </ul>

                  <div class="tab-content">
                    <!-- tab in tabs -->
                    <div role="tabpanel" class="tab-pane active" id="details">
                        <!-- row -->
                        <div class="row">
                            <!-- col -->
                            <div class="col-md-12">
                                <!-- tile -->
                              <div class="box">
                                <section class="tile time-simple">                                    <!-- tile body -->
                                    <div class="tile-body">
                                        <!-- row -->
                                        <div class="row">
                                            <!-- col -->
                                            <div class="col-md-9">
                                                <p class="text-default lt">Date de la commande: {{date('d/m/Y H:i:s', strtotime($prospect->created_at))}}</p>
                                                <p class="text-uppercase text-strong mt-40 mb-0 custom-font">Status</p>
                                                <a href="#"><h3 class="text-uppercase {{($prospect->status==-1)?'text-danger':'text-success'}} mt-0 mb-20">{{ get_commande_status_by_text($prospect->status) }}</h3></a>
                                            </div>
                                            <!-- /col -->
                                            <!-- col -->
                                            <div class="col-md-3" style="z-index:2">

                                                <a href="javascript:;"  data-toggle="modal" data-target="#modal_client" class="btn btn-default btn-rounded-20 btn-xs pull-right"><i class="fa fa-pencil"></i></a>
                                                <p class="text-uppercase text-strong mb-10 custom-font">{{ get_users_status($prospect->usertype) }}</p>
                                                <ul class="list-unstyled text-default lt mb-20">

                                                    <li><strong class="inline-block w-xs">Nom:</strong> {{$prospect->lastname}}</li>
                                                    <li><strong class="inline-block w-xs">Prenoms:</strong> {{$prospect->firstname}}</li>
                                                    <li><strong class="inline-block w-xs">Sexe:</strong> {{$prospect->gender}}</li>

                                                    <li><strong class="inline-block w-xs">Contact:</strong> {{$prospect->contact}}</li>

                                                    <li><strong class="inline-block w-xs"> Email:</strong> <a href="javascript:;">{{$prospect->email}}</a></li>

                                                </ul>
                                            </div>
                                            <!-- /col -->

                                        </div>

                                        <!-- row -->
                                        <div class="row b-t pt-20">


                                            <div class="col-md-3 b-r">
                                                <p class="text-uppercase text-strong mb-10 custom-font">
                                                    ASSURANCE
                                                     @if($prospect->status<2)
                                                    <a href="javascript:;" data-toggle="modal" data-target="#modal_assurance" class="btn btn-default btn-rounded-20 btn-xs pull-right"><i class="fa fa-pencil"></i></a>
                                                    @endif
                                                </p>
                                                <div class="col-md-12">
                                                    <ul class="list-unstyled text-default lt mb-20">


                                                      <li><strong>Nationalité:</strong> <a href="javascript:;">
                                                           {{getCountryById($prospect->nationality_id)}}</a>
                                                      </li>
                                                      <li><strong>N°Passeport:</strong> <a href="javascript:;">
                                                           {{$prospect->passport_num}} (Exp.:{{ date("d/m/Y", strtotime($prospect->date_expire_passport))}})</a>
                                                      </li>
                                                      <li><strong>Destination:</strong> <a href="javascript:;">
                                                           {{$prospect->pays_name}} ({{$prospect->pays_zone}})</a>
                                                      </li>
                                                      <li><strong>Adresse courante:</strong> <a href="javascript:;">
                                                           {{$prospect->current_addr}}</a>
                                                      </li>
                                                      <li><strong>Adresse Destination:</strong> <a href="javascript:;">
                                                           {{$prospect->destination_addr}}</a>
                                                      </li>

                                                      <li><strong>Date de départ:</strong> <a href="javascript:;">
                                                           {{ date("d/m/Y", strtotime($prospect->departure_date))}}</a>
                                                      </li>
                                                      <li><strong>Date d'arrivée:</strong> <a href="javascript:;">
                                                           {{ date("d/m/Y", strtotime($prospect->arrival_date))}}</a>
                                                      </li>

                                                      <li><strong>Durée du voyage:</strong> <a href="javascript:;">
                                                           {{ $quotations[0]->ASSURANCE->DUREE ?? $correct_duration}} Jours</a>
                                                      </li>
                                                    </ul>
                                                </div>
                                            </div>

                                            <!-- /col -->

                                        </div>
                                        <!-- /row -->
                                    </div>
                                </section>
                                @if($prospect->priority==1)
                                <div class="ribbon ribbon-top-left"><span>urgent</span></div>
                                @endif
                                @if($prospect->renew_order==1)
                                <div class="ribbon ribbon-top-right"><span>Renouvelement</span></div>
                                @endif
                                @if(sizeof($revives)>0)
                                <div class="ribbon ribbon-top-right"><span>relance</span></div>
                                @if($prospect->renew_order==1)
                                <div class="ribbon ribbon-bottom-right"><span>Renouvelement</span></div>
                                @endif
                                @endif
                              </div>
                              <section class="tile tile-simple">

                                 <!-- tile body -->
                                 <div class="tile-body p-0">

                                     <div class="table-responsive">
                                         <table class="table table-hover table-striped">
                                             <thead>
                                                 <tr>
                                                     <th>Compagnie</th>
                                                     <th>Prime</th>
                                                     <th>Livraison</th>
                                                     <th>Services</th>
                                                     <th>Total</th>
                                                     <th>Commander</th>

                                                 </tr>
                                             </thead>
                                              <tbody>
                                                @foreach($quotations as $q)
                                                <tr class="{{ $q->idcomp && $prospect->company_id && $prospect->company_id == $q->idcomp ? 'active-row' : '' }}">
                                                  <style>
                                                      .active-row {
                                                      background-color: #5cb85c !important;
                                                      color: #fff !important;
                                                  }
                                                  </style>
                                                        <td><img width="20%" src="{{asset('images/assureurs/').'/'.$q->logo}}"></td>
                                                        <td>{{ number_format($q->PRIME) }}</td>
                                                        <td>{{ number_format($q->FG) }}</td>
                                                        <td>{{ number_format($q->AMOUNT_SERVICES) }}</td>
                                                        <td>{{ number_format($q->PRIME + $q->FG + $q->AMOUNT_SERVICES) }}</td>
                                                        <td>
                                                          <a title="Voir détails" href="{{route('details.quote.travel',[$q->id_quote,$q->idcomp])}}" style="background-color:#4cae4c;" class="btn btn-success"><i class="fa fa-shopping-cart "></i></a>

                                                        <a target="_blank" href="{{route('showDevisVoyagePDF',[$q->idcomp, $prospect->qid])}}"
                                                        {{ ($prospect->company_id!=$q->idcomp && $prospect->status>=4) ? 'disabled':'' }}

                                                         class="btn btn-primary"> <i class="fa fa-print"></i></a>
                                                        </td>
                                                @endforeach
                                              </tbody>
                                          </table>
                                      </div>
                                  </div>
                              </section>
                            </div>
                        </div>
                      </div>

                  </div>
                </div>
            </div>
        </div>
  </div>
@endsection

@section('header-script')
<link rel="stylesheet" href="{{asset('back/assets/css/vendor/sweetalert/sweetalert.css')}}">
<link rel="stylesheet" href="{{asset('back/assets/js/vendor/datetimepicker/css/bootstrap-datetimepicker.min.css')}}">
<link rel="stylesheet" href="<?php echo asset('back/assets/js/vendor/datatables/css/jquery.dataTables.min.css')?>">
<link rel="stylesheet" href="<?php echo asset('back/assets/js/vendor/datatables/datatables.bootstrap.min.css')?>">
<link rel="stylesheet" href="<?php echo asset('back/assets/js/vendor/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css')?>">
<link rel="stylesheet" href="<?php echo asset('back/assets/js/vendor/datatables/extensions/Responsive/css/dataTables.responsive.css')?>">
<link rel="stylesheet" href="<?php echo asset('back/assets/js/vendor/datatables/extensions/ColVis/css/dataTables.colVis.min.css')?>">
<link rel="stylesheet" href="<?php echo asset('back/assets/js/vendor/datatables/extensions/TableTools/css/dataTables.tableTools.min.css')?>">
<link rel="stylesheet" type="text/css" href="{{asset('back/assets/css/ribbon-style.css')}}">
@stop


@section('footer-script')
<script src="{{asset('back/assets/js/vendor/sweetalert/sweetalert.min.js')}}"></script>
<script src="{{asset('back/assets/js/vendor/daterangepicker/moment.js')}}"></script>
<script src="{{asset('back/assets/js/vendor/datetimepicker/js/bootstrap-datetimepicker.min.js')}}"></script>
<!--/ vendor javascripts -->
<script src="<?php echo asset('back/assets/js/vendor/datatables/js/jquery.dataTables.min.js'); ?>"></script>
<script src="<?php echo asset('back/assets/js/vendor/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js'); ?>"></script>
<script src="<?php echo asset('back/assets/js/vendor/datatables/extensions/Responsive/js/dataTables.responsive.min.js'); ?>"></script>
<script src="<?php echo asset('back/assets/js/vendor/datatables/extensions/ColVis/js/dataTables.colVis.min.js'); ?>"></script>
<script src="<?php echo asset('back/assets/js/vendor/datatables/extensions/TableTools/js/dataTables.tableTools.min.js'); ?>"></script>
<script src="<?php echo asset('back/assets/js/vendor/datatables/extensions/dataTables.bootstrap.js'); ?>"></script>

@stop



@section('custom-script')
<div class="modal fade" id="modal_client" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title custom-font">Modifier infos client</h3>
            </div>
            <div class="modal-body">
                <section class="tile">
                  <div class="tile-body">

                    <form method="post" action="{{route('devis.client.update')}}" role="form" id="form_client">
                      {{ csrf_field() }}


                      <div class="row">
                        <div class="form-group col-md-6 mb-0">
                            <label for="last_name">Nom*: </label>
                            <input type="hidden" value="{{$prospect->user_id}}" name="uid" id="uid" class="form-control">
                            <input type="hidden" value="{{$prospect->assur_voy_id}}" name="assur_voy_id" id="assur_voy_id" class="form-control">
                            <input type="hidden" value="{{$prospect->pays_zone}}" name="pays_zone" id="pays_zone" class="form-control">
                            <input type="text" value="{{$prospect->lastname}}" name="last_name" id="last_name" class="form-control"
                            required>
                        </div>
                        <div class="form-group col-md-6 mb-0">
                            <label for="first_name">Prénoms*: </label>
                            <input type="text" value="{{$prospect->firstname}}" name="first_name" id="first_name" class="form-control"
                            required>
                        </div>
                      </div>
                      <div class="row">
                          <div class="form-group col-md-6 mb-0">
                              <label for="email">E-mail*: </label>
                              <input type="text" value="{{$prospect->email}}" name="email" id="email" class="form-control"
                              required>
                          </div>
                          <div class="form-group col-md-6 mb-0">
                              <label for="contact">Contact*: </label>
                              <input type="text" value="{{$prospect->contact}}" name="contact" id="contact" class="form-control"
                              required>
                          </div>
                      </div>
                      <div class="row">
                        <div class="form-group col-md-6 mb-0">
                            <label for="gender">Sexe: </label>
                            <select class="form-control" name="gender" id="gender">
                              <option value="H" {{($prospect->gender=="H")?'selected':''}}>Homme</option>
                              <option value="F" {{($prospect->gender=="F")?'selected':''}}>Femme</option>
                            </select>

                        </div>
                        <div class="form-group col-md-6 mb-0">
                            <label for="first_name">Date de naissance: </label>
                            <div class="input-group datepicker">
                                <input type="text" class="form-control datepicker" value="{{ date('d/m/Y', strtotime($prospect->dob)) }}" name="dob" id="dob">
                                <span class="input-group-addon">
                                    <span class="fa fa-calendar"></span>
                                </span>
                            </div>

                        </div>
                      </div>
                    </form>

                  </div>
                  <!-- /tile body -->

                  </section>
            </div>
            <div class="modal-footer">
                <button id="customer_btn" class="btn btn-success btn-ef btn-ef-3 btn-ef-3c"><i class="fa fa-arrow-right"></i> Confirmer</button>
                <button class="btn btn-lightred btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Abandonner</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="modal_assurance" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title custom-font">Modifier infos Assurance</h3>
            </div>
            <div class="modal-body">
                <div id="assurance_message_div"></div>
            </div>

            <div class="modal-footer">
                <button id="travel_update_btn" class="btn btn-success btn-ef btn-ef-3 btn-ef-3c"><i class="fa fa-arrow-right"></i> Confirmer</button>
                <button class="btn btn-lightred btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Abandonner</button>
            </div>
        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="revive" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title custom-font">Relance client sur commande</h3>
            </div>
            <div class="modal-body">
              <div role="tabpannel">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#list-revives" aria-controls="list-revives" role="tab" data-toggle="tab">Liste</a></li>
                    <li role="presentation" class=""><a href="#new-revive" aria-controls="new-revive" role="tab" data-toggle="tab">Nouveau</a></li>
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="list-revives">
                      <table class="table table-hover table-striped">
                        <thead>
                          <th>#</th>
                          <th>Mail</th>
                          <th>Sms</th>
                          <th>Observation</th>
                          <th>Date de relance</th>
                          <th>Action</th>
                        </thead>
                        <tbody>
                          @foreach($revives as $k => $r)
                          <tr>
                            <td>{{++$k}}</td>
                            <td>{{($r->revive_by_mail==1)? "Oui":"Non"}}</td>
                            <td>{{($r->revive_by_sms==1)? "Oui":"Non"}}</td>
                            <td><i>{!! $r->advisor_note !!}</i></td>
                            <td>{{date('d/m/Y', strtotime($r->revive_date))}}</td>
                            {{-- <td>
                                <a href="" class="btn btn-info"><i class="fa fa-edit"></i></a>&nbsp;<a href="" class="btn btn-danger"><i class="fa fa-trash"></i></a>
                            </td> --}}
                          </tr>
                          @endforeach
                        </tbody>
                      </table>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="new-revive">
                      <form class="form-horizontal" method="post" action="{{ route('createRevive') }}">
                        {{csrf_field()}}
                        <input type="hidden" value="{{ $prospect->qid }}" name="qid">
                        {{-- {{$prospect->id }} --}}
                        <div class="form-group">
                          <h4></h4>
                          {{-- <label class="checkbox checkbox-custom">
                              <input type="checkbox" checked disabled name="dash_notice" id="dash_notice"><i></i>
                              Alert sur dashboard
                          </label> --}}
                          {{-- <label class="checkbox checkbox-custom">
                              <input type="checkbox" name="sms_notice" id="sms_notice"><i></i>
                              Notififier le client par SMS
                          </label> --}}
                          <label class="checkbox checkbox-custom">
                              <input type="checkbox" name="email_notice" id="email_notice"><i></i>
                              Notififier le client par Email
                          </label>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Date de relance*</label>
                            <div class="input-group datepicker w-360 mt-10">
                                <input type="text" class="form-control datepicker" required name="revivedate" id="revivedate">
                                <span class="input-group-addon">
                                    <span class="fa fa-calendar"></span>
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label">Note/Observation</label>
                            <textarea class="form-control" placeholder="Ecrivez une note pour vous aidez à vous souvenir de la relance" required rows="3" name="obs_revive" id="obs_revive"></textarea>
                        </div>
                        <div class="form-group">
                          <button type="submit" class="btn btn-success">Enregistrer</button>
                          <button type="reset" data-dismiss="modal" class="btn btn-danger">Annuler</button>
                        </div>
                      </form>
                    </div>
                </div>
              </div>

            </div>
            <div class="modal-footer">
                <button class="btn btn-default btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i>Quitter</button>
            </div>
        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="validation_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title custom-font">Confirmation</h3>
            </div>
            <div class="modal-body">
               <form method="post" action="{{route('devis.vehicule.validate')}}" id="form_validation">
               {{ csrf_field() }}
                <input type="hidden" name="status" id="status_input" value="">
                <input type="hidden" name="qid" id="qid_input_2" value="">
                <div id="box_div_2"></div>
                <div class="validation_message_div"></div>
              </form>
            </div>
            <div class="modal-footer">
                <button id="validation_save_btn" disabled class="btn btn-success btn-ef btn-ef-3 btn-ef-3c"><i class="fa fa-arrow-right"></i> Oui je confirme</button>
                <button class="btn btn-lightred btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i>Non j'abandonne</button>
            </div>
        </div>
    </div>
</div>

<script>
$(window).load(function(){
  function formatMoney(num , localize,fixedDecimalLength){
    num=num+"";
    var str=num;
    var reg=new RegExp(/(\D*)(\d*(?:[\.|,]\d*)*)(\D*)/g)
    if(reg.test(num)){
      var pref=RegExp.$1;
      var suf=RegExp.$3;
      var part=RegExp.$2;
        if(fixedDecimalLength/1)part=(part/1).toFixed(fixedDecimalLength/1);
        if(localize)part=(part/1).toLocaleString();
      str= pref +part.match(/(\d{1,3}(?:[\.|,]\d*)?)(?=(\d{3}(?:[\.|,]\d*)?)*$)/g )+suf ;
    };
    return str;
  }



  $("#customer_btn").click(function(){
    var last_name = $("#last_name").val();
    var first_name = $("#first_name").val();
    var email = $("#email").val();
    var contact = $("#contact").val();

    $.ajax({

       url: $('#form_client').attr('action'),
       type : $('#form_client').attr('method'),
       data : $('#form_client').serialize(),
       dataType:'html',
       success :function(html)
       {
        location.reload();
        },

        error: function(){
             alert("Une erreur s'est produite");
         }
    });
  });

  $(".cancel_devis_btn").click(function(e){
    e.preventDefault();
    var qid = $(this).attr("id");
    var url = "/admin/cancel-commande/"+qid
    swal({
          title:"Annulation de la commande!",
          text: "Voulez vous vraiment annuler cette commande?",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#e05d6f",
          confirmButtonText: "Oui",
          cancelButtonText: "Non",
          closeOnConfirm: false
      }, function () {
          swal("Annulé!", "", "success");
          $.ajax(
          {
              type: "get",
              url: url,
              success: function(data){
              }
          }
          )
          .done(function(data) {
              swal("Succes!", "La commande à bien été annulée!", "success");
              setTimeout(function(){
                  window.location.reload()
              }, 1000);
          })
          .error(function(data) {
              swal("Oops", "Erreur interne!", "error");
          })
      });
  });

  $(".set_as_priority").click(function(e){
    e.preventDefault();
    var qid = $(this).attr("id");
    var url = "/admin/priority-order/"+qid
    swal({
          title:"Prioriser!",
          text: "Voulez vous vraiment Prioriser cette commande?",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#e05d6f",
          confirmButtonText: "Oui",
          cancelButtonText: "Non",
          closeOnConfirm: false
      }, function () {
          swal("Annulé!", "", "success");
          $.ajax(
          {
              type: "get",
              url: url,
              success: function(data){
              }
          }
          )
          .done(function(data) {
              swal("Succes!", "La commande à bien été priorisée!", "success");
              setTimeout(function(){
                  window.location.reload()
              }, 1000);
          })
          .error(function(data) {
              swal("Oops", "Erreur interne!", "error");
          })
      });
  });

  $(".set_as_not_priority").click(function(e){
    e.preventDefault();
    var qid = $(this).attr("id");
    var url = "/admin/unpriority-order/"+qid
    swal({
          title:"Priorité!",
          text: "Voulez vous vraiment Retirer la priorité à cette commande?",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#e05d6f",
          confirmButtonText: "Oui",
          cancelButtonText: "Non",
          closeOnConfirm: false
      }, function () {
          swal("Annulé!", "", "success");
          $.ajax(
          {
              type: "get",
              url: url,
              success: function(data){
              }
          }
          )
          .done(function(data) {
              swal("Succes!", "La commande n'est plus prioritaire!", "success");
              setTimeout(function(){
                  window.location.reload()
              }, 1000);
          })
          .error(function(data) {
              swal("Oops", "Erreur interne!", "error");
          })
      });
  });

  $(".confirm_btn").click(function(){
      var id = $(this).attr("id");
      var res = id.split("&");

       $("#idcomp_input").val(res[0]);
       $("#qid_input").val(res[1]);
       $("#confirm_modal").modal({backdrop: 'static'});

       user_id = $("#uid").val();
       assur_id = $("#assur_voy_id").val();
       pays_zone = $("#pays_zone").val();
       $.ajax({
        url: "/rest-api/v1/VoyageQuote/"+user_id+"/"+assur_id+"/"+pays_zone,
        type: "get",
        data: $("#form_confirm").serialize(),
        success: function(data){
          var obj =JSON.parse(data)
          var c = obj[0];
          $('#box_div').html('')
          html = '<div class="row">';
          html +=     '<div class="col-md-12">';
          html +=         '<p style="color:#000">Le montant de votre assurance est de <b>'+formatMoney(Math.floor(c.PRIME))+' FCFA</b> avec la compagnie <img width="83x25" src="/images/assureurs/'+c.logo+'")}}"> </p>';
          html +=     '</div>';
          html +='</div>';
          html += '<div class="row">';
          html +=     '<div class="col-md-12">';
          html +=         '<table class="table">';
          html +=             '<tr>';
          html +=                 '<td>Montant Assurance</td>';
          html +=                 '<td>:</td>';
          html +=                 '<td>'+formatMoney(Math.floor(c.PRIME))+'</td>';
          html +=             '</<tr>';
          html +=             '<tr>';
          html +=                 '<td>Services supplémentaire</td>';
          html +=                 '<td>:</td>';
          html +=                 '<td>'+formatMoney(Math.floor(c.AMOUNT_SERVICES))+'</td>';
          html +=             '</<tr>';
          html +=             '<tr>';
          html +=                 '<td>Livraison</td>';
          html +=                 '<td>:</td>';
          html +=                 '<td>'+formatMoney(Math.floor(c.FG))+'</td>';
          html +=             '</<tr>';
          html +=             '<tr>';
          html +=                 '<td>TOTAL</td>';
          html +=                 '<td>:</td>';
          html +=                 '<td>'+formatMoney(Math.floor(c.PRIME + c.AMOUNT_SERVICES + c.FG))+'</td>';
          html +=             '</<tr>';
          html +=         '</table>';
          html +=     '</div>';
          html +='</div>';

          $('#box_div').append(html);
        }
      })
      .done(function() {
        $("#validation_save_btn").prop("disabled", false);
      });
  });

  $(".validation_devis_btn").click(function(){
      var id = $(this).attr("id");
      $("#status_input").val("2");
      $("#qid_input_2").val(id);
      $("#validation_modal").modal({backdrop: 'static'});

        user_id = $("#uid").val();
       assur_id = $("#assur_voy_id").val();
       pays_zone = $("#pays_zone").val();
       $.ajax({
        url: "/rest-api/v1/VoyageQuote/"+user_id+"/"+assur_id+"/"+pays_zone,
        type: "get",
        success: function(data){
        var obj =JSON.parse(data)
        var c = obj[0];
        $('#box_div_2').html('')
        html = '<div class="row">';
        html +=     '<div class="col-md-12 alert-danger alert-dismissable alert-danger text-center">';
        html +=       '<div id="required_msg"></div>';
        html +=     '</div>';
        html +='</div><br/>';
        html += '<div class="row">';
        html +=     '<div class="col-md-12">';
        html +=       '<div class="form-group">';
        html +=         '<label for="delivery_location" class="col-sm-4 control-label">Numéro de téléphone</label>';
        html +=         '<div class="col-sm-8">'
        html +=           '<input type="text" value="{{ addslashes($prospect->contact) }}" class="form-control delivery" required id="delivery_phone" name="delivery_phone" />'
        html +=         '</div>';
        html +=       '</div>';
        html +=     '</div>';
        html +='</div><br/>';
        html += '<div class="row">';
        html +=     '<div class="col-md-12">';
        html +=       '<div class="form-group">';
        html +=         '<label for="delivery_location" class="col-sm-4 control-label">Adresse de livraison</label>';
        html +=         '<div class="col-sm-8">'
        html +=           '<textarea class="form-control delivery" required id="delivery_location" name="delivery_location" row="4"><?=  str_replace(array("\n", "\r","\r\n"), " ",trim(addslashes($prospect->delivery_location))) ?></textarea>'
        html +=         '</div>';
        html +=       '</div>';
        html +=     '</div>';
        html +='</div><br/>';
        html += '<div class="row">';
        html +=     '<div class="col-md-12 text-center">';
        html +=       '<label class="checkbox checkbox-custom">';
        html +=       '<input name="espace_perso" id="espace_perso" type="checkbox"><i></i> Envoyer Accès de connexion Espace Perso';
        html +=       '</label>';
        html +=     '</div>';
        html += '</div>';
        html += '<div class="row">';
        html +=     '<div class="col-md-12">';
         html +=         '<table class="table">';
          html +=             '<tr>';
          html +=                 '<td>Montant Assurance</td>';
          html +=                 '<td>:</td>';
          html +=                 '<td>'+formatMoney(Math.floor(c.PRIME))+'</td>';
          html +=             '</<tr>';
          html +=             '<tr>';
          html +=                 '<td>Services supplémentaire</td>';
          html +=                 '<td>:</td>';
          html +=                 '<td>'+formatMoney(Math.floor(c.AMOUNT_SERVICES))+'</td>';
          html +=             '</<tr>';
          html +=             '<tr>';
          html +=                 '<td>Livraison</td>';
          html +=                 '<td>:</td>';
          html +=                 '<td>'+formatMoney(Math.floor(c.FG))+'</td>';
          html +=             '</<tr>';
          html +=             '<tr>';
          html +=                 '<td>TOTAL</td>';
          html +=                 '<td>:</td>';
          html +=                 '<td>'+formatMoney(Math.floor(c.PRIME + c.AMOUNT_SERVICES + c.FG))+'</td>';
          html +=             '</<tr>';
          html +=         '</table>';
        html +=     '</div>';
        html +='</div>';


        $('#box_div_2').append(html);

        //$("#validation_save_btn").attr("disabled", "true");

        }
      })
      .done(function() {
        $("#validation_save_btn").prop("disabled", false);

      });
  });

  $(".finish_trait_btn").click(function(){
      var id = $(this).attr("id");
       $("#status_input").val("3");
       $("#qid_input_2").val(id);
       $("#validation_modal").modal({backdrop: 'static'});
       user_id = $("#uid").val();
      assur_id = $("#assur_voy_id").val();
      pays_zone = $("#pays_zone").val();
      $.ajax({
       url: "/rest-api/v1/VoyageQuote/"+user_id+"/"+assur_id+"/"+pays_zone,
        type: "get",
        success: function(data){
        var obj =JSON.parse(data)
        var c = obj[0];
        $('#box_div_2').html('')
        html = '<div class="row">';
        html +=     '<div class="col-md-12 alert-danger alert-dismissable alert-danger text-center">';
        html +=       '<div id="required_msg"></div>';
        html +=     '</div>';
        html +='</div><br/>';
        html += '<div class="row">';
        html +=     '<div class="col-md-12">';
        html +=       '<div class="form-group has-error">';
        html +=         '<label for="policy_number" class="col-sm-4 control-label">Numéro de police</label>';
        html +=         '<div class="col-sm-8">'
        html +=           '<input type="text" class="form-control delivery" value="<?= htmlentities(addslashes($prospect->policy_number)) ?>" required id="policy_number" name="policy_number" />'
        html +=         '</div>';
        html +=       '</div>';
        html +=     '</div>';
        html +='</div><br/>';
        html += '<div class="row">';
        html +=     '<div class="col-md-12">';
        html +=       '<div class="form-group">';
        html +=         '<label for="delivery_location" class="col-sm-4 control-label">Numéro de téléphone</label>';
        html +=         '<div class="col-sm-8">'
        html +=           '<input type="text" class="form-control delivery" value="<?= htmlentities(addslashes($prospect->phone_client)) ?>" required id="delivery_phone" name="delivery_phone" />'
        html +=         '</div>';
        html +=       '</div>';
        html +=     '</div>';
        html +='</div><br/>';
        html += '<div class="row">';
        html +=     '<div class="col-md-12">';
        html +=       '<div class="form-group">';
        html +=         '<label for="delivery_location" class="col-sm-4 control-label">Adresse de livraison</label>';
        html +=         '<div class="col-sm-8">'
        html +=           '<textarea class="form-control delivery" required id="delivery_location" name="delivery_location" row="4"> <?=  str_replace(array("\n", "\r","\r\n"), " ",trim(addslashes($prospect->delivery_location))) ?></textarea>'
        html +=         '</div>';
        html +=       '</div>';
        html +=     '</div>';
        html +='</div><br/>';
        html += '<div class="row">';
        html +=     '<div class="col-md-12">';
        html +=         '<table class="table">';
        html +=             '<tr>';
        html +=                 '<td>Montant Assurance</td>';
        html +=                 '<td>:</td>';
        html +=                 '<td>'+formatMoney(Math.floor(c.PRIME))+'</td>';
        html +=             '</<tr>';
        html +=             '<tr>';
        html +=                 '<td>Services supplémentaire</td>';
        html +=                 '<td>:</td>';
        html +=                 '<td>'+formatMoney(Math.floor(c.AMOUNT_SERVICES))+'</td>';
        html +=             '</<tr>';
        html +=             '<tr>';
        html +=                 '<td>Livraison</td>';
        html +=                 '<td>:</td>';
        html +=                 '<td>'+formatMoney(Math.floor(c.FG))+'</td>';
        html +=             '</<tr>';
        html +=             '<tr>';
        html +=                 '<td>TOTAL</td>';
        html +=                 '<td>:</td>';
        html +=                 '<td>'+formatMoney(Math.floor(c.PRIME + c.AMOUNT_SERVICES + c.FG))+'</td>';
        html +=             '</<tr>';
        html +=         '</table>';
        html +=     '</div>';
        html +='</div>';


        $('#box_div_2').append(html);



        }
      })
      .done(function() {
        $("#validation_save_btn").prop("disabled", false);

      });
  });

  $(".confirm_delivery_btn").click(function(){
      var id = $(this).attr("id");
       $("#status_input").val("4");
       $("#qid_input_2").val(id);
       $("#validation_modal").modal({backdrop: 'static'});
       user_id = $("#uid").val();
       assur_id = $("#assur_voy_id").val();
       pays_zone = $("#pays_zone").val();
       $.ajax({
        url: "/rest-api/v1/VoyageQuote/"+user_id+"/"+assur_id+"/"+pays_zone,
         type: "get",
         success: function(data){
         var obj =JSON.parse(data)
         var c = obj[0];
         $('#box_div_2').html('')
         html = '<div class="row">';
         html +=     '<div class="col-md-12 alert-danger alert-dismissable alert-danger text-center">';
         html +=       '<div id="required_msg"></div>';
         html +=     '</div>';
         html +='</div><br/>';
         html += '<div class="row">';
         html +=     '<div class="col-md-12">';
         html +=       '<div class="form-group has-error">';
         html +=         '<label for="policy_number" class="col-sm-4 control-label">Numéro de Police</label>';
         html +=         '<div class="col-sm-8">'
         html +=           '<input type="text" class="form-control delivery" value="<?= htmlentities(addslashes($prospect->policy_number)) ?>" required id="policy_number" name="policy_number" />'
         html +=         '</div>';
         html +=       '</div>';
         html +=     '</div>';
         html +='</div><br/>';
         html += '<div class="row">';
         html +=     '<div class="col-md-12">';
         html +=       '<div class="form-group">';
         html +=         '<label for="delivery_location" class="col-sm-4 control-label">Numéro de téléphone</label>';
         html +=         '<div class="col-sm-8">'
         html +=           '<input type="text" class="form-control delivery" required id="delivery_phone" name="delivery_phone" value="<?= htmlentities(addslashes($prospect->phone_client)) ?>" />'
         html +=         '</div>';
         html +=       '</div>';
         html +=     '</div>';
         html +='</div><br/>';
         html += '<div class="row">';
         html +=     '<div class="col-md-12">';
         html +=       '<div class="form-group">';
         html +=         '<label for="delivery_location" class="col-sm-4 control-label">Adresse de livraison</label>';
         html +=         '<div class="col-sm-8">'
         html +=           '<textarea class="form-control delivery" required id="delivery_location" name="delivery_location" row="4"><?=  str_replace(array("\n", "\r","\r\n"), " ",trim(addslashes($prospect->delivery_location))) ?></textarea>'
         html +=         '</div>';
         html +=       '</div>';
         html +=     '</div>';
         html +='</div><br/>';
         html += '<div class="row">';
         html +=     '<div class="col-md-12">';
         html +=         '<table class="table">';
         html +=             '<tr>';
         html +=                 '<td>Montant Assurance</td>';
         html +=                 '<td>:</td>';
         html +=                 '<td>'+formatMoney(Math.floor(c.PRIME))+'</td>';
         html +=             '</<tr>';
         html +=             '<tr>';
         html +=                 '<td>Services supplémentaire</td>';
         html +=                 '<td>:</td>';
         html +=                 '<td>'+formatMoney(Math.floor(c.AMOUNT_SERVICES))+'</td>';
         html +=             '</<tr>';
         html +=             '<tr>';
         html +=                 '<td>Livraison</td>';
         html +=                 '<td>:</td>';
         html +=                 '<td>'+formatMoney(Math.floor(c.FG))+'</td>';
         html +=             '</<tr>';
         html +=             '<tr>';
         html +=                 '<td>TOTAL</td>';
         html +=                 '<td>:</td>';
         html +=                 '<td>'+formatMoney(Math.floor(c.PRIME + c.AMOUNT_SERVICES + c.FG))+'</td>';
         html +=             '</<tr>';
         html +=         '</table>';
         html +=     '</div>';
         html +='</div>';


         $('#box_div_2').append(html);

         //$("#validation_save_btn").attr("disabled", "true");
         }
       })
        .done(function() {
          $("#validation_save_btn").prop("disabled", false);

        });
  });



  $(".encaisse_and_close_btn").click(function(){
      var id = $(this).attr("id");
       $("#status_input").val("5");
       $("#qid_input_2").val(id);
       $("#validation_modal").modal({backdrop: 'static'});
       user_id = $("#uid").val();
       assur_id = $("#assur_voy_id").val();
       pays_zone = $("#pays_zone").val();
       $.ajax({
        url: "/rest-api/v1/VoyageQuote/"+user_id+"/"+assur_id+"/"+pays_zone,
         type: "get",
         success: function(data){
         var obj =JSON.parse(data)
         var c = obj[0];
         $('#box_div_2').html('')
         html = '<div class="row">';
         html +=     '<div class="col-md-12 alert-danger alert-dismissable alert-danger text-center">';
         html +=       '<div id="required_msg"></div>';
         html +=     '</div>';
         html +='</div><br/>';

         html += '<div class="row">';
         html +=     '<div class="col-md-12">';
         html +=       '<div class="form-group has-error">';
         html +=         '<label for="policy_number" class="col-sm-4 control-label">Numéro de Police</label>';
         html +=         '<div class="col-sm-8">'
         html +=           '<input type="text" class="form-control delivery" value="<?= htmlentities(addslashes($prospect->policy_number)) ?>" required id="policy_number" name="policy_number" />'
         html +=         '</div>';
         html +=       '</div>';
         html +=     '</div>';
         html +='</div><br/>';
         html += '<div class="row">';
         html +=     '<div class="col-md-12">';
         html +=       '<div class="form-group">';
         html +=         '<label for="delivery_location" class="col-sm-4 control-label">Numéro de téléphone</label>';
         html +=         '<div class="col-sm-8">'
         html +=           '<input type="text" class="form-control delivery" readonly required id="delivery_phone" name="delivery_phone" value="<?= htmlentities(addslashes($prospect->phone_client)) ?>"/>'
         html +=         '</div>';
         html +=       '</div>';
         html +=     '</div>';
         html +='</div><br/>';
         html += '<div class="row">';
         html +=     '<div class="col-md-12">';
         html +=       '<div class="form-group">';
         html +=         '<label for="delivery_location" class="col-sm-4 control-label">Adresse de livraison</label>';
         html +=         '<div class="col-sm-8">'
         html +=           '<textarea class="form-control delivery" required readonly id="delivery_location" name="delivery_location" row="4"><?=  str_replace(array("\n", "\r","\r\n"), " ",trim(addslashes($prospect->delivery_location))) ?></textarea>'
         html +=         '</div>';
         html +=       '</div>';
         html +=     '</div>';
         html +='</div><br/>';
         html += '<div class="row">';
         html +=     '<div class="col-md-12">';
         html +=       '<div class="form-group has-error">';
         html +=         '<label for="delivery_location" class="col-sm-4 control-label">Montant Encaissé</label>';
         html +=         '<div class="col-sm-8">'
         html +=           '<input type="text" class="form-control delivery" required id="amount_inbox" name="amount_inbox" value="'+Math.floor(c.PRIME + c.AMOUNT_SERVICES + c.FG)+'" />'
         html +=         '</div>';
         html +=       '</div>';
         html +=     '</div>';
         html +='</div><br/>';
         html += '<div class="row">';
         html +=     '<div class="col-md-12">';
         html +=         '<table class="table">';
         html +=             '<tr>';
         html +=                 '<td>Montant Assurance</td>';
         html +=                 '<td>:</td>';
         html +=                 '<td>'+formatMoney(Math.floor(c.PRIME))+'</td>';
         html +=             '</<tr>';
         html +=             '<tr>';
         html +=                 '<td>Services supplémentaire</td>';
         html +=                 '<td>:</td>';
         html +=                 '<td>'+formatMoney(Math.floor(c.AMOUNT_SERVICES))+'</td>';
         html +=             '</<tr>';
         html +=             '<tr>';
         html +=                 '<td>Livraison</td>';
         html +=                 '<td>:</td>';
         html +=                 '<td>'+formatMoney(Math.floor(c.FG))+'</td>';
         html +=             '</<tr>';
         html +=             '<tr>';
         html +=                 '<td>TOTAL</td>';
         html +=                 '<td>:</td>';
         html +=                 '<td>'+formatMoney(Math.floor(c.PRIME + c.AMOUNT_SERVICES + c.FG))+'</td>';
         html +=             '</<tr>';
         html +=         '</table>';
         html +=     '</div>';
         html +='</div>';


         $('#box_div_2').append(html);
         }
       })
        .done(function() {
          $("#validation_save_btn").prop("disabled", false);

        });
  });

  $(".sinistre_btn").click(function(){
    $("#modal_sinistre").modal({backdrop: 'static'});
  });

  $("#confirm_save_btn").click(function(e){
    e.preventDefault();
    $.ajax({
             url: $('#form_confirm').attr('action'),
             type : "POST",
             data : $('#form_confirm').serialize(),
             dataType:'html',
             success :function(html)
             {
                  if(html==1)
                  {
                    location.reload();
                  }
                  else
                  {
                      $('.confirmation_message_div').html("<p class='alert alert-danger'>Réessayer svp une erreure s'est produite</p>");
                  }
              },

                error: function(){
                   $('.confirmation_message_div').html("<p class='alert alert-danger'>Erreur interne du serveur</p>");
               }
    });
  });

  $("#validation_save_btn").click(function(e){
      e.preventDefault();
      var valid = true;
        $('.delivery[required]').each(function(i, el){
          if(valid && $(el).val()=='' ) valid = false;
        })

      if(valid){
        $.ajax({
               url: $('#form_validation').attr('action'),
               type : $('#form_validation').attr('method'),
               data : $('#form_validation').serialize(),
               dataType:'html',
               success :function(html)
               {
                if(html==1)
                    {
                      location.reload();
                    }
                    else
                    {
                        $('.validation_message_div').html("<p class='alert alert-danger'>Réessayer svp une erreure s'est produite</p>");

                    }
                },

                  error: function(){
                     $('.validation_message_div').html("<p class='alert alert-danger'>Réessayer svp une erreure s'est produite</p>");
                 }
        });
      }
      else{
        $("#required_msg").html("<b>Tous les champs sont obligatoire</b>")
      }
  });

  $("#sinistre_save_btn").click(function(e){
    e.preventDefault();
    $.ajax({
                     url: $('#form_sinistre').attr('action'),
                     type : $('#form_sinistre').attr('method'),
                     data : $('#form_sinistre').serialize(),
                     dataType:'html',
                     success :function(html)
                     {
                         if(html==0)
                         {
                             ("#modal_sinistre").html("<p class='alert alert-danger'>Une erreur s'est produite</p>");
                         }
                         else
                         {
                             $("#modal_sinistre").modal("hide");
                          location.href="/admin/devis/"+html;
                         }
                      },

                        error: function(){
                            ("#modal_sinistre").html("<p class='alert alert-danger'>Une erreur s'est produite</p>");

                       }
    });
  });

  $('#travel_update_btn').click(function(e){
    e.preventDefault();
    $('#travel_update_form').submit();
  });

});

</script>
@stop
