@extends('Backoffice.layouts.app')

@section("content")

<div class="page page-tables-datatables">

    <div class="pageheader">
        @if(session('message'))
        <div class="alert alert-danger">
            <strong>Felicitation!</strong> Devis generé avec succès<br><br>
        </div>
        @endif
        <h2>Gérer mes Prospects <span></h2>

        <div class="page-bar">

            <ul class="page-breadcrumb">
                <li>
                <a href="{{route('spaceDashboard')}}"><i class="fa fa-home"></i> MONASSURANCE.CI</a>
                </li>
                <li>
                    <a href="#">Gérer mes Prospects</a>
                </li>
                <li>
                    <a href="">Editer</a>
                </li>
            </ul>

        </div>

    </div>


    <div class="row">
        <!-- col -->
        <div class="col-md-12">

            <section class="tile">

                <!-- tile header -->
                <div class="tile-header dvd dvd-btm">
                    <h1 class="custom-font"><strong>Prospection</strong></h1>
                   
                </div>
                <!-- /tile header -->

                <!-- tile body -->
                <div class="tile-body">
                    <div role="tabpanel">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs tabs-dark" role="tablist">
                                <li role="presentation" class="active"><a href="#devis" aria-controls="settingsTab" role="tab" data-toggle="tab">Proposition</a></li>
                                <li role="presentation" class=""><a href="#commande" aria-controls="settingsTab" role="tab" data-toggle="tab">Dévis/Commande</a></li>
                                <li role="presentation"><a href="#prospect" aria-controls="settingsTab" role="tab" data-toggle="tab">Liste de Prospects</a></li>
                                
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">

                                 <div role="tabpanel" class="tab-pane active" id="devis">

                                    <div class="wrap-reset">
                                        <table class="table table-custom" id="table1">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>N° Dévis</th>
                                                <th>Nom</th>
                                                <th>Prenoms</th>
                                                <th>Contact</th>
                                                <th>Type contrat</th>
                                                <th>Status</th>
                                                <th>Date</th>
                                                <th>Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($prospects as $key => $prospect)
                                                @if($prospect->status<=1)
                                                <tr>
                                                    <td>{{++$key}}</td>
                                                    <td>{{ $prospect->number_n}}</td>
                                                    <td>{{ $prospect->lastname}}</td>
                                                    <td>{{ $prospect->firstname}}</td>
                                                    <td>{{ $prospect->contact}}</td>
                                                    <td>
                                                        @if($prospect->priority==1)
                                                        <div id="raty4" class="inline-block" data-toggle="tooltip" title="Urgent"></div>
                                                        @endif
                                                        @if($prospect->product_type==1)
                                                        Auto
                                                        @elseif($prospect->product_type==3)
                                                        Voyage
                                                        @endif 
                                                    </td>
                                                    <td>
                                                           {!! get_commande_status($prospect->status) !!}
                                                    </td>
                                                    <td>{{ date("d/m/Y H:i:s", strtotime($prospect->date_created))}}</td>
                                                    <td>
                                                        @if($prospect->product_type==1)
                                                            <a title="Détail" href="{{route('devis.details',['id'=>$prospect->qid,'aid'=>$prospect->assurance_infos_id])}}" class="btn btn-success"> <i class="glyphicon glyphicon-plus"></i> Détails</a> 
                                                        @elseif($prospect->product_type==3)
                                                            <a title="Détail" href="{{route('devis.voyage.details',['id'=>$prospect->qid,'aid'=>$prospect->assurance_infos_id])}}" class="btn btn-success"> <i class="glyphicon glyphicon-plus"></i> Détails</a> 
                                                        @endif
                                                    </td>
                                                </tr>
                                                @endif
                                            @endforeach  
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="commande">

                                    <div class="wrap-reset">
                                        <table class="table table-custom" id="table2">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>N° Dévis</th>
                                                <th>Nom</th>
                                                <th>Prenoms</th>
                                                <th>Contact</th>
                                                <th>Type contrat</th>
                                                <th>Status</th>
                                                <th>Date</th>
                                                <th>Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($prospects as $key => $prospect)
                                                @if($prospect->status==2)
                                                <tr>
                                                    <td>{{++$key}}</td>
                                                    <td>{{ $prospect->number_n}}</td>
                                                    <td>{{ $prospect->lastname}}</td>
                                                    <td>{{ $prospect->firstname}}</td>
                                                    <td>{{ $prospect->contact}}</td>
                                                    <td>
                                                        @if($prospect->priority==1)
                                                        <div id="raty4" class="inline-block" data-toggle="tooltip" title="Urgent"></div>
                                                        @endif
                                                        @if($prospect->product_type==1)
                                                        Auto
                                                        @elseif($prospect->product_type==3)
                                                        Voyage
                                                        @endif  
                                                    </td>
                                                    <td>
                                                           {!! get_commande_status($prospect->status) !!}
                                                    </td>
                                                    <td>{{ date("d/m/Y H:i:s", strtotime($prospect->date_created))}}</td>
                                                    <td>
                                                        @if($prospect->product_type==1)
                                                            <a title="Détail" href="{{route('devis.details',['id'=>$prospect->qid,'aid'=>$prospect->assurance_infos_id])}}" class="btn btn-success"> <i class="glyphicon glyphicon-plus"></i> Détails</a> 
                                                        @elseif($prospect->product_type==3)
                                                            <a title="Détail" href="{{route('devis.voyage.details',['id'=>$prospect->qid,'aid'=>$prospect->assurance_infos_id])}}" class="btn btn-success"> <i class="glyphicon glyphicon-plus"></i> Détails</a> 
                                                        @endif
                                                    </td>
                                                </tr>
                                                @endif
                                            @endforeach  
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="prospect">
                                    <button data-toggle="modal" data-target="#splashNew" data-options="splash-2 splash-ef-15" class="btn btn-success mb-10"><i class="glyphicon glyphicon-check"></i> Nouveau</button>
                                    <div class="wrap-reset">
                                            <div class="table-responsive">
                                                <table class="table table-custom" id="table3">
                                                    <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Photo</th>
                                                        <th>Nom & Prénom(s)</th>
                                                        <th>Sexe</th>
                                                        <th>Email</th>
                                                        <th>Contact</th>
                                                        <th>Nombre de devis</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    @foreach($prospects_users as $key=>$p)
                                                        <tr @if($p->status==0)
                                                            class='bg-lightred';
                                                            @endif>
                                                            <td>{{++$key}}</td>
                                                            <td><img width="32x32" src="/back/assets/uploads/avatar/{{$p->avatar}}"</td>
                                                            <td>{{$p->firstname}} {{$p->lastname}}</td>
                                                            <td>{{$p->gender}}</td>
                                                            <td>{{$p->email}}</td>
                                                            <td>{{$p->contact}}</td>
                                                            <td>{{$p->nb_devis}}</td>
                                                            <td>

                                                             <button onclick="getUser({{$p->id}})" class="btn btn-primary" data-toggle="modal" data-target="#splash" data-options="splash-2 splash-ef-15"><i class="glyphicon glyphicon-edit"></i> Modifier</button> 

                                                            </td>
                                                        </tr>
                                                    @endforeach
                                                    </tbody>
                                                </table>
                                            </div>
                                    </div>
                                </div>
                            </div>
                    
                </div>
                <!-- /tile body -->

            </section>
            <!-- /tile -->

        </div>
        <!-- /col -->
    </div>
    <!-- /row -->

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
        
@endsection

@section('footer-script')
        <!--/ vendor javascripts -->
<script src="{{asset('back/assets/js/vendor/sweetalert/sweetalert.min.js')}}"></script>
<script src="{{asset('back/assets/js/vendor/daterangepicker/moment.js')}}"></script>
<script src="{{asset('back/assets/js/vendor/datetimepicker/js/bootstrap-datetimepicker.min.js')}}"></script>
<script src="{{asset('back/assets/js/vendor/raty-fa/jquery.raty-fa.js')}}"></script>
<script src="<?php echo asset('back/assets/js/vendor/datatables/js/jquery.dataTables.min.js'); ?>"></script>
<script src="<?php echo asset('back/assets/js/vendor/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js'); ?>"></script>
<script src="<?php echo asset('back/assets/js/vendor/datatables/extensions/Responsive/js/dataTables.responsive.min.js'); ?>"></script>
<script src="<?php echo asset('back/assets/js/vendor/datatables/extensions/ColVis/js/dataTables.colVis.min.js'); ?>"></script>
<script src="<?php echo asset('back/assets/js/vendor/datatables/extensions/TableTools/js/dataTables.tableTools.min.js'); ?>"></script>
<script src="<?php echo asset('back/assets/js/vendor/datatables/extensions/dataTables.bootstrap.js'); ?>"></script>
@stop



@section('custom-script')
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title custom-font">Supprimer le prospect</h3>
            </div>
            <div class="modal-body">
            <input type="hidden" name="id" id="id_div" value="">
                   <div class="form-group">
                                    <label for="message">Justification: </label>
                                    <textarea class="form-control" rows="6" name="message" id="message" placeholder="Pour quelle raison voulez-vous supprimer ce prospect?" required></textarea>
                                </div>
                <div class="message_div"></div>
            </div>
            <div class="modal-footer">
                <button id="del_btn" class="btn btn-success btn-ef btn-ef-3 btn-ef-3c"><i class="fa fa-arrow-right"></i> Confirmer</button>
                <button class="btn btn-lightred btn-ef btn-ef-4 btn-ef-4c" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Abandonner</button>
            </div>
        </div>
    </div>
</div>

<div class="modal splash fade" id="splash" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title custom-font">Modifier propspect</h3>
            </div>
            <form class="form-horizontal" method="post" action="{{route('user.edit')}}">
            <div class="modal-body">
                {{csrf_field()}}
                <input type="hidden" name="iduser" id="iduser" readonly>
                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">Nom</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="ulastname" name="lastname" placeholder="User lastname">
                    </div>
                </div>
                <div class="form-group">
                    <label for="firstname" class="col-sm-2 control-label">Prénom(s)</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="ufirstname" name="firstname" placeholder="User firstname">
                    </div>
                </div>

                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">Sexe</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="gender" id="ugender">
                            <option value=""></option>
                            <option value="M">Masculin</option>
                            <option value="F">Féminin</option>
                        </select>
                    </div>
                </div>
                <div class="form-group{{ $errors->has('dob') ? ' has-error' : '' }}">
                    <label class="col-sm-2 control-label">Date de naissance</label>
                        <div class="input-group datepicker col-sm-8">
                            <input type="text" name="dob" id="udob" class="form-control">
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                        @if ($errors->has('dob'))
                        <span class="help-block">
                            <strong>{{ $errors->first('dob') }}</strong>
                        </span>
                    @endif
                </div>

                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">Contact</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="ucontact" name="contact" placeholder="User phone">

                    </div>
                </div>
                <div class="form-group">
                    <label for="firstname" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <input type="email" required class="form-control" id="uemail" name="email" placeholder="User email">
                    </div>
                </div>
                  <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">Status</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="status" id="ustatus">
                            <option value=""></option>
                            <option value="1">Actif</option>
                            <option value="0">Innactif</option>
                        </select>
                    </div>
                </div>
               
                    
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-success btn-ef btn-ef-3 btn-ef-3c mb-10">Enregistrer
                 <i class="fa fa-arrow-right"></i></button>
                <button type="reset" class="btn btn-danger btn-ef btn-ef-3 btn-ef-3c mb-10" data-dismiss="modal">Annuler</button>
            </div>
             </form>
        </div>
    </div>
</div>

<div class="modal splash fade" id="splashNew" tabindex="-1" role="dialog" aria-labelledby="splashNew" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title custom-font">Nouveau Prospect</h3>
            </div>
            <form class="form-horizontal" method="post" action="{{route('user.create')}}">
            <div class="modal-body">
                {{csrf_field()}}
                <input type="hidden" name="iduser" id="iduser" readonly>
                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">Nom</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="lastname" placeholder="User lastname">
                    </div>
                </div>
                <div class="form-group">
                    <label for="firstname" class="col-sm-2 control-label">Prénom(s)</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control"  name="firstname" placeholder="User firstname">
                    </div>
                </div>

                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">Sexe</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="gender">
                            <option value=""></option>
                            <option value="M">Masculin</option>
                            <option value="F">Féminin</option>
                        </select>
                    </div>
                </div>
                <div class="form-group{{ $errors->has('dob') ? ' has-error' : '' }}">
                    <label class="col-sm-2 control-label">Date de naissance</label>
                        <div class="input-group datepicker col-sm-8">
                            <input type="text" name="dob" class="form-control">
                            <span class="input-group-addon">
                                <span class="fa fa-calendar"></span>
                            </span>
                        </div>
                        @if ($errors->has('dob'))
                        <span class="help-block">
                            <strong>{{ $errors->first('dob') }}</strong>
                        </span>
                    @endif
                </div>

                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">Contact</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="contact" placeholder="User phone">

                    </div>
                </div>
                <div class="form-group">
                    <label for="firstname" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <input type="email" required class="form-control" name="email" placeholder="User email">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">Mot de passe</label>
                    <div class="col-sm-10">
                        <input type="password" required class="form-control" name="password" placeholder="User password">
                    </div>
                </div>
                  <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">Status</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="status" >
                            <option value=""></option>
                            <option value="1">Actif</option>
                            <option value="0">Innactif</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">Type de compte</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="usertype" >
                            <option value="0">Prospect</option>
                        </select>
                    </div>
                </div>
               
                    
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-success btn-ef btn-ef-3 btn-ef-3c mb-10">Enregistrer
                 <i class="fa fa-arrow-right"></i></button>
                <button type="reset" class="btn btn-danger btn-ef btn-ef-3 btn-ef-3c mb-10" data-dismiss="modal">Annuler</button>
            </div>
             </form>
        </div>
    </div>
</div>
         
        <script>
        function clear () {
            $('#iduser').val("");
            $('#ufirstname').val("");
            $('#ulastname').val("");
            $('#ugender option[value=""]').attr("selected", "selected");
            $('#udob').val("");
            $('#ucontact').val("");
            $('#uemail').val("");
            $('#ustatus option[value=""]').attr("selected", "selected");
        }
        function getUser (id_user) {
             $.get("/admin/getuser/"+id_user, function(d) {
                clear()
                if(d!='0'){
                    if(d.id!=null) $('#iduser').val(d.id);
                    if(d.firstname!=null) $('#ufirstname').val(d.firstname);
                    if(d.lastname!=null) $('#ulastname').val(d.lastname);
                    if(d.gender!=null) $('#ugender option[value='+d.gender+']').attr("selected", "selected");
                    if(d.dob!=null) $('#udob').val(formatdate(d.dob));
                    if(d.contact!=null) $('#ucontact').val(d.contact);
                    if(d.email!=null) $('#uemail').val(d.email);
                    if(d.status!=null) $('#ustatus option[value='+d.status+']').attr("selected", "selected");

                }else
                {
                    clear()
                }
             })
         }

         function formatdate(date){
            split = date.split('-');
            date = split[2]+'/'+split[1]+'/'+split[0];
            return date
         }

        function deleteUser (url) {
            swal({
                title:"Suppession d'utilisateur!",
                text: "Voulez vous vraiment supprimer cet utilisateur?",
                type: "warning",
                showCancelButton: true,
                //confirmButtonColor: "#",
                confirmButtonText: "Oui",
                cancelButtonText: "Non",
                closeOnConfirm: false
            }, function () {
                swal("Supprimé!", "", "success");
                $.ajax(
                {
                    type: "get",
                    url: url,
                    success: function(data){
                    }
                }
                )
                .done(function(data) {
                    swal("Succes!", "L'utilisateur a bien été supprimé!", "success");
                    setTimeout(function(){
                        window.location.reload()
                    }, 1000);
                })
                .error(function(data) {
                    swal("Oops", "Erreur interne!", "error");
                })
            });
        }

            $(window).load(function(){
                //initialize responsive datatable
               var table = $('#table1').DataTable({
                       "dom": 'Rlfrtip'
                   });

               var table = $('#table2').DataTable({
                       "dom": 'Rlfrtip'
                   });

               var table = $('#table3').DataTable({
                       "dom": 'Rlfrtip'
                   });

            });

            $('#raty4').raty({
                readOnly: true,
                score: 5,
                number:1,
                hints : ['Urgent'],
                starOn: 'fa fa-star text-orange'
            });
        </script>
        <!--/ Page Specific Scripts -->


@stop

