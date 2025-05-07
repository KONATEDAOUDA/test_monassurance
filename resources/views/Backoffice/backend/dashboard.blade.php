@extends('Backoffice.layouts.app')
@section("content")
    <div class="page page-dashboard">
        <style type="text/css">
            fieldset.dem-border {
            border: 1px solid #01a29c !important;
            padding: 0 1.4em 1.4em 1.4em !important;
            margin: 0 0 1.5em 0 !important;
            -webkit-box-shadow:  0px 0px 0px 0px #000;
            box-shadow:  0px 0px 0px 0px #000;
            }
        
            legend.dem-border {
            font-size: 1.2em !important;
            font-weight: 500 !important;
            text-align: left !important;
            width:auto;
            padding:0 10px;
            border-bottom:none;
            color: #01a29c
            }
        
            #stop-resume{
                display: block;
                padding: 10px;
                background-color: #f1f1f1;
                margin:10px;
                width: 70px;
                text-align: center;
                border:solid 1px white;
                text-transform: uppercase;
                font-family: sans-serif;
                text-decoration: none;
            }
            #stop-resume:active{
                background-color:white;
                border:solid 1px #f1f1f1;
                color:blue;
            }
        </style>
        <div class="pageheader">

            <h2>Tableau de bord <span>{{ (isset($_GET['start']) && isset($_GET['end']))? "Du ".date("d/m/Y",strtotime($_GET['start']))." au ".date("d/m/Y",strtotime($_GET['end'])):'' }}</span></h2>

            <div class="page-bar"  style="margin-bottom:20px">

                <ul class="page-breadcrumb">
                    <li>
                        <a href="{{route('spaceDashboard')}}"><i class="fa fa-home"></i> MONASSURANCE.CI</a>
                    </li>
                    <li>
                        <a href="{{route('spaceDashboard')}}">Tableau de bord {{ (isset($_GET['start']) && isset($_GET['end']))? "Du ".date("d/m/Y",strtotime($_GET['start']))." au ".date("d/m/Y",strtotime($_GET['end'])):'' }} </a>
                    </li>
                </ul>
                <div class="page-toolbar">
                    <a role="button" tabindex="0" class="btn btn-lightred no-border pickDate">
                        <i class="fa fa-calendar"></i>&nbsp;&nbsp;<span></span>&nbsp;&nbsp;<i class="fa fa-angle-down"></i>
                    </a>
                </div>
            </div>
            
            <form method="get" id="custom_search" action="">
                <input type="hidden" value="<?= (isset($_GET['start']))?$_GET['start']:'' ?>" name="start" id="start">
                <input type="hidden" value="<?= (isset($_GET['start']))?$_GET['end']:'' ?>" name="end" id="end">
            </form>

        </div>

            @if(\Illuminate\Support\Facades\Session::has('error'))
                <div class="text-center container w-420">
                    <div class="alert alert-danger alert-dismissable">
                        <h4><p align="center">{{\Illuminate\Support\Facades\Session::get('error')}}</p></h4>
                    </div>
                </div>
            @endif

            @if(\Illuminate\Support\Facades\Session::has('success'))
                <div class="text-center container w-420">
                    <div class="alert alert-success alert-dismissable">
                        <h4><p align="center">{{\Illuminate\Support\Facades\Session::get('success')}}</p></h4>
                    </div>
                </div>
            @endif

        
        <fieldset class="dem-border">
            <legend class="dem-border">File active des commandes</legend>  
            <div class="row">
                <div class="col-md-12">
                    <!-- cards row -->
                    <div class="row">
                        <div class="col-md-2">

                        <a href=""><section class="tile tile-simple">
                                <div class="tile-widget bg-blue text-center p-30">
                                    <i class="fa fa-check fa-3x"></i>
                                </div>

                                <div class="tile-body text-center">
                                    <h1 class="m-0">{{$confirm_1}}</h1>
                                    <span class="text-muted">Nouveau devis</span>
                                </div>
                            </section></a>

                        </div>

                        <div class="col-md-2">
                            <a href="{{--route('commande.a.traiter')--}}"><section class="tile tile-simple">
                                <!-- tile widget -->
                                <div class="tile-widget bg-orange text-center p-30">
                                    <i class="fa  fa-refresh fa-3x"></i>
                                </div>
                                <!-- /tile widget -->
    
                                <!-- tile body -->
                                <div class="tile-body text-center">
    
                                    <h1 class="m-0">{{$processiong_2}}</h1>
                                    <span class="text-muted">en attente de traitement</span>
    
                                </div>
                                <!-- /tile body -->
                            </section></a> 
                        </div>

                        <div class="col-md-2">
                            <a href=""><section class="tile tile-simple">

                                <div class="tile-widget bg-green text-center p-30">
                                    <i class="fa fa-thumbs-o-up fa-3x"></i>
                                </div>

                                <div class="tile-body text-center">

                                    <h1 class="m-0">{{$complete_5}}</h1>
                                    <span class="text-muted">terminées</span>

                                </div>
                            </section></a> 
                        </div>

                        <div class="col-md-2">

                            <a href=""><section class="tile tile-simple">

                                <div class="tile-widget bg-lightred text-center p-30">
                                    <i class="fa fa-times fa-3x"></i>
                                </div>

                                <div class="tile-body text-center">

                                    <h1 class="m-0">{{$cancel_6}}</h1>
                                    <span class="text-muted">annulées</span>

                                </div>
                            </section></a> 

                        </div>
                    
                    </div>
                </div>
            </div>

        </fieldset>
        <div class="row">

            <div class="col-md-8">
                <section class="tile">

                    <div class="tile-header bg-greensea dvd dvd-btm">
                        <h1 class="custom-font"><strong>Statistiques </strong>des commandes</h1>
                        <ul class="controls">
                            
                            <li class="dropdown">

                                <a role="button" tabindex="0" class="dropdown-toggle settings" data-toggle="dropdown">
                                    <i class="fa fa-cog"></i>
                                    <i class="fa fa-spinner fa-spin"></i>
                                </a>

                                <ul class="dropdown-menu pull-right with-arrow animated littleFadeInUp">
                                    <li>
                                        <a role="button" tabindex="0" class="tile-toggle">
                                            <span class="minimize"><i class="fa fa-angle-down"></i>&nbsp;&nbsp;&nbsp;Minimize</span>
                                            <span class="expand"><i class="fa fa-angle-up"></i>&nbsp;&nbsp;&nbsp;Expand</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a role="button" tabindex="0" class="tile-refresh">
                                            <i class="fa fa-refresh"></i> Refresh
                                        </a>
                                    </li>
                                    <li>
                                        <a role="button" tabindex="0" class="tile-fullscreen">
                                            <i class="fa fa-expand"></i> Fullscreen
                                        </a>
                                    </li>
                                </ul>

                            </li>
                            <li class="remove"><a role="button" tabindex="0" class="tile-close"><i class="fa fa-times"></i></a></li>
                        </ul>
                    </div>

                    <div class="tile-body">

                        <div class="row">

                            <div class="col-md-8 col-sm-12">

                                <h4 class="underline custom-font mb-20"><strong>Statistiques</strong> actuelles</h4>

                                <div class="row">

                                    <div class="col-lg-4 text-center">
                                        <div class="easypiechart" data-percent="100" data-size="140" data-bar-color="#418bca" data-scale-color="false" data-line-cap="round" data-line-width="4" style="width: 140px; height: 140px;">

                                            <i class="fa fa-usd fa-4x text-blue" style="line-height: 140px;"></i>

                                            <canvas height="140" width="140"></canvas>
                                        </div>
                                        <p class="text-uppercase text-elg mt-20 mb-0">
                                            <strong class="text-blue">
                                                @if(isset($_GET['start']) && isset($_GET['end']))
                                                    {{getAllOrders($_GET['start'], $_GET['end'])->count()}}
                                                @else
                                                    {{getAllOrders()->count()}}
                                                @endif
                                            </strong> 
                                            <small class="text-lg text-light text-default lt">Commandes</small>
                                        </p>
                                        <p class="text-light"><i class="text-warning"></i> Commandes vendues</p>
                                    </div>

                                    <div class="col-lg-4 text-center">
                                        <div class="easypiechart" data-percent="100" data-size="140" data-bar-color="#e05d6f" data-scale-color="false" data-line-cap="round" data-line-width="4" style="width: 140px; height: 140px;">

                                            <i class="fa fa-barcode fa-4x text-lightred" style="line-height: 140px;"></i>
                                            <p class="text-uppercase text-elg mt-20 mb-0">
                                                <strong class="text-lightred">
                                                    @if(isset($_GET['start']) && isset($_GET['end']))
                                                        {{sizeof(optionalProductSale($_GET['start'], $_GET['end']))}}
                                                    @else
                                                        {{sizeof(optionalProductSale())}}
                                                    @endif
                                                </strong> 
                                                <small class="text-lg text-light text-default lt">Services</small>
                                            </p>

                                            <p class="text-light"><i class="text-warning"></i> Services facultatifs</p>
                                            <canvas height="140" width="140"></canvas>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 text-center">
                                        <div class="easypiechart" data-percent="4006" data-size="140" data-bar-color="#16a085" data-scale-color="false" data-line-cap="round" data-line-width="4" style="width: 140px; height: 140px;">

                                            <i class="fa fa-file-pdf-o fa-4x text-greensea" style="line-height: 140px;"></i>
                                            <p class="text-uppercase text-elg mt-20 mb-0">
                                                <strong class="text-greensea">
                                                    @if(isset($_GET['start']) && isset($_GET['end']))
                                                        {{getAllQuotation($_GET['start'], $_GET['end'])->count()}}
                                                    @else
                                                        {{getAllQuotation()->count()}}
                                                    @endif
                                                </strong> 
                                                <small class="text-lg text-light text-default lt">Devis</small>
                                            </p>
                                            <p class="text-light"><i class="text-warning"></i> Dévis générés</p>
                                            <canvas height="140" width="140"></canvas>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="col-md-4 col-sm-12">

                                <h4 class="underline custom-font"><strong>5 dernières </strong> Commandes</h4>
                                @if(isset($_GET['start']) && isset($_GET['end']))
                                    @foreach(lastFiveOrders($_GET['start'], $_GET['end']) as $order)
                                        <div class="progress-list">
                                            <div class="details">
                                                <div class="title">{{ get_product_type($order->product_type) }}</div>
                                                <div class="description">{{ $order->number_n }} ( {{ dateAgo($order->created_at) }} )</div>
                                            </div>
                                            <div class="status pull-right">
                                                <span>{{get_commande_percentage($order->status)}}</span>%
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="progress-xs not-rounded progress">
                                            <div class="progress-bar progress-bar-@if($order->status==1 || $order->status==2)info @elseif($order->status==3 || $order->status==4)warning @elseif($order->status==5)success @else danger @endif" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: {{get_commande_percentage($order->status)}}%">
                                                <span class="sr-only">{{get_commande_percentage($order->status)}}%</span>
                                            </div>
                                            </div>
                                        </div>
                                    @endforeach
                                @else
                                    @foreach(lastFiveOrders() as $order)
                                        <div class="progress-list">
                                            <div class="details">
                                                <div class="title">{{ get_product_type($order->product_type) }}</div>
                                                <div class="description">{{ $order->number_n }} ( {{ dateAgo($order->created_at) }} )</div>
                                            </div>
                                            <div class="status pull-right">
                                                <span>{{get_commande_percentage($order->status)}}</span>%
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="progress-xs not-rounded progress">
                                            <div class="progress-bar progress-bar-@if($order->status==1 || $order->status==2)info @elseif($order->status==3 || $order->status==4)warning @elseif($order->status==5)success @else danger @endif" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: {{get_commande_percentage($order->status)}}%">
                                                <span class="sr-only">{{get_commande_percentage($order->status)}}%</span>
                                            </div>
                                            </div>
                                        </div>
                                    @endforeach
                                @endif
                            </div>

                        </div>
                    
                    </div>

                </section>
            </div>

            @role('advisor')
            <div class="col-md-4">

                <section class="tile tile-simple">
                    <div class="tile-header bg-blue">
                        <h1 class="custom-font">Ventes par compagnie</h1>
                        <ul class="controls">
                            <li class="remove"><a role="button" tabindex="0" class="tile-close"><i class="fa fa-times"></i></a></li>
                        </ul>
                    </div>
                    <div class="tile-body">

                        <table class="table table-no-border m-0">
                            <tbody>
                                @if(isset($_GET['start']) && isset($_GET['end']))
                                    @foreach(getSaleByCompany($_GET['start'], $_GET['end'])->get() as $key => $c)
                                    <tr>
                                        <td>{{ ++$key }}</td>
                                        <td>{{ $c->compname }}</td>
                                        <td>{{ $c->sales }}</td>
        
                                        <td>
                                            <div class="progress-xxs not-rounded mb-0 inline-block progress" style="width: 50px; margin-right: 5px">
                                                <div class="progress-bar progress-bar-greensea" role="progressbar" aria-valuenow="{{ $c->sales*100/(getAllProductContratContract($_GET['start'], $_GET['end'],1)->count()+getAllProductContratContract($_GET['start'], $_GET['end'],2)->count()+getAllProductContratContract($_GET['start'], $_GET['end'],3)->count()+getAllProductContratContract($_GET['start'], $_GET['end'],4)->count()) }}" aria-valuemin="0" aria-valuemax="100" style="width: {{ $c->sales*100/(getAllProductContratContract($_GET['start'], $_GET['end'],1)->count()+getAllProductContratContract($_GET['start'], $_GET['end'],2)->count()+getAllProductContratContract($_GET['start'], $_GET['end'],3)->count()+getAllProductContratContract($_GET['start'], $_GET['end'],4)->count()) }}%;"></div>
                                            </div>
                                            <small>{{ round($c->sales*100/(getAllProductContratContract($_GET['start'], $_GET['end'],1)->count()+getAllProductContratContract($_GET['start'], $_GET['end'],2)->count()+getAllProductContratContract($_GET['start'], $_GET['end'],3)->count()+getAllProductContratContract($_GET['start'], $_GET['end'],4)->count()),2) }}%</small>
                                        </td>
        
                                    </tr>
                                    @endforeach
                                @else
                                @foreach(getSaleByCompany()->get() as $key => $c)
        
                                <tr>
                                    <td>{{ ++$key }}</td>
                                    <td>{{ $c->compname }}</td> 
                                    <td>{{ $c->sales }}</td>  
                                    <td>
                                        @php
                                            $totalContracts = getAllProductContratContract(null, null, 1)->count() + 
                                                            getAllProductContratContract(null, null, 2)->count() + 
                                                            getAllProductContratContract(null, null, 3)->count() + 
                                                            getAllProductContratContract(null, null, 4)->count();
                                        @endphp
                                    
                                        @if ($totalContracts == 0)
                                            <!-- Insérer le contenu que vous souhaitez afficher si le total des contrats est 0 -->
                                        @else
                                            <div class="progress-bar progress-bar-greensea" role="progressbar"
                                                aria-valuenow="{{ $c->sales * 100 / $totalContracts }}"
                                                aria-valuemin="0" aria-valuemax="100"
                                                style="width: {{ $c->sales * 100 / $totalContracts }}%;">
                                            </div>
                                        @endif
                                    </td>         
                                </tr>
                                @endforeach
                            @endif
                            </tbody>
                        </table>
                    </div>
                </section> 
            </div>
            @endrole
        </div>

        @role('advisor')
        <div class="row">

            <div class="col-md-4">

                <section class="tile widget-message">

                    <div class="tile-header bg-greensea dvd dvd-btm">
                        <h1 class="custom-font"><strong>Email </strong>Rapide</h1>
                    </div>

                    <form method="post" action="{{ route('sendEmail') }}" enctype="multipart/form-data">
                        {{ csrf_field() }}
                    
                        <div class="tile-widget bg-greensea">
                            <div class="form-group">
                                <select data-placeholder="Sélectionner destinataire..." multiple="" class="chosen-select input-underline" name="emails[]" style="width: 100%;">
                                    @foreach($currentUser as $o)
                                        <option value="{{$o->email}}">
                                            {{$o->firstname . " " . $o->lastname}} - {{$o->email}}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" required name="objet" class="form-control underline-input" placeholder="Objet du mail">
                            </div>
                            <div class="form-group">
                                <label for="attachments">Ajouter des fichiers :</label>
                                <input type="file" id="attachments" name="attachments[]" class="form-control" multiple>
                            </div>
                        </div>
                        <div class="tile-body p-0">
                            <textarea name="mail_note" id="mail_note" rows="10" cols="48" required>Bonjour cher client,</textarea>
                        </div>                        
                    
                        <div class="tile-footer bg-greensea text-right">
                            <button type="submit" class="btn btn-greensea btn-ef btn-ef-7 btn-ef-7h">
                                <i class="fa fa-envelope"></i> Envoyer Mail
                            </button>
                        </div>
                    </form>
                    

                </section>
                
            </div>

            <div class="col-md-4">
                <section class="tile" fullscreen="isFullscreen02">

                    <div class="tile-header dvd dvd-btm">
                        <h1 class="custom-font"><strong>Contrats </strong>d'assurance</h1>
                        <ul class="controls">
                            <li class="dropdown">

                                <a role="button" tabindex="0" class="dropdown-toggle settings" data-toggle="dropdown">
                                    <i class="fa fa-cog"></i>
                                    <i class="fa fa-spinner fa-spin"></i>
                                </a>

                                <ul class="dropdown-menu pull-right with-arrow animated littleFadeInUp">
                                    <li>
                                        <a role="button" tabindex="0" class="tile-toggle">
                                            <span class="minimize"><i class="fa fa-angle-down"></i>&nbsp;&nbsp;&nbsp;Minimize</span>
                                            <span class="expand"><i class="fa fa-angle-up"></i>&nbsp;&nbsp;&nbsp;Expand</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a role="button" tabindex="0" class="tile-refresh">
                                            <i class="fa fa-refresh"></i> Refresh
                                        </a>
                                    </li>
                                    <li>
                                        <a role="button" tabindex="0" class="tile-fullscreen">
                                            <i class="fa fa-expand"></i> Fullscreen
                                        </a>
                                    </li>
                                </ul>

                            </li>
                            <li class="remove"><a role="button" tabindex="0" class="tile-close"><i class="fa fa-times"></i></a></li>
                        </ul>
                    </div>

                    <div class="tile-widget">
                        <div id="contract-product" style="height: 250px"></div>
                    </div>

                    <div class="tile-body p-0">

                        <div class="panel-group icon-plus" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default panel-transparent">
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            <span><i class="fa fa-minus text-sm mr-5"></i> 5 derniers contrats</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                    <div class="panel-body">
                                        <table class="table table-no-border m-0">
                                            <tbody>
                                            @if(isset($_GET['start']) && isset($_GET['end']))
                                                @foreach(getAllOrders($_GET['start'], $_GET['end'])->limit(5)->get() as $key => $contrat)
                                                <tr>
                                                    <td>{{ ++$key }}</td>
                                                    <td>{{ $contrat->policy_number }}</td>
                                                    
                                                    <td>{{get_product_type($contrat->product_type)}}</td>
                                                    <td>{{ dateAgo($contrat->created_at) }}</td>
                                                </tr>
                                                @endforeach
                                            @else
                                                @foreach(getAllOrders()->limit(5)->get() as $key => $contrat)
                                                <tr>
                                                    <td>{{ ++$key }}</td>
                                                    <td>{{ $contrat->policy_number}}</td>
                                                    
                                                    <td>{{get_product_type($contrat->product_type)}}</td>
                                                    <td>{{ dateAgo($contrat->created_at) }}</td>
                                                </tr>
                                                @endforeach
                                            @endif
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        @endrole

    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flot/0.8.3/jquery.flot.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flot/0.8.3/jquery.flot.pie.min.js"></script>

    <script>
        $(document).ready(function() {
            Morris.Donut({
                element: 'contract-product',
                data: [
                    {label: 'Automobile', value: <?= (isset($_GET['start']) && isset($_GET['end']))?getAllProductContratContract($_GET['start'], $_GET['end'],1)->count():getAllProductContratContract(null,null,1)->count() ?>, color: '#a40778'},
                    {label: 'Voyage', value: <?= (isset($_GET['start']) && isset($_GET['end']))?getAllProductContratContract($_GET['start'], $_GET['end'],3)->count():getAllProductContratContract(null,null,3)->count() ?>, color: '#00a3d8'},
                ],
                resize: true
            }); 
        });

    </script>

@endsection