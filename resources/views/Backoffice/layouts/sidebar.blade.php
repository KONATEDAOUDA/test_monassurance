<aside id="sidebar">
    <div id="sidebar-wrap">
        <div class="panel-group slim-scroll" role="tablist">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" href="#sidebarNav">
                            Mon menu  <i class="fa fa-angle-up"></i>
                        </a>
                   </h4>
                </div>
                <div id="sidebarNav" class="panel-collapse collapse in" role="tabpanel">
                    <div class="panel-body">
                        <ul id="navigation">
                            <li class=""><a  href="{{route('spaceDashboard')}}"><i class="fa fa-dashboard"></i> <span>Mon Tableau de Bord</span></a></li>
                            <li class=""><a  href="{{route('profilepage')}}"><i class="fa fa-user"></i> <span>Mon compte</span></a></li>

                            @role('settingsmanager')
                            <li class=""><a role="button" tabindex="0" href=""><i class="fa fa-cogs"></i> <span>Configuration</span></a>
                                <ul>
                                    <li><a href="{{route('guaranteePage')}}"><i class="fa fa-caret-right"></i> Garantie</a></li>
                                    <li><a href="{{route('categoryPage')}}"><i class="fa fa-caret-right"></i> Catégorie</a></li>
                                    <li><a href=""  role="button"><i class="fa fa-caret-right"></i> Tarif Reglementaire</a>
                                        <ul>
                                            <li><a href="{{route('configOtherReglementary')}}">Autres tarifs</a></li>
                                        </ul>
                                    </li>           
                                    <li><a href="{{route('companyPage')}}"><i class="fa fa-caret-right"></i>Compagnie d'Assurance </a></li>
                                    <li><a href="{{route('configRate')}}"><i class="fa fa-caret-right"></i>Taux de reduction </a></li>
                                    {{-- <li><a href="{{route('configRevive')}}"><i class="fa fa-caret-right"></i>Relance </a></li> --}}
                                    {{-- <li><a href="{{route('exportData')}}"><i class="fa fa-caret-right"></i>Export Data </a></li> --}}
                                    @role('operation')
                                        <li><a href="{{route('deleteTrace')}}"><i class="fa fa-caret-right"></i>Supprimer trace </a></li>
                                    @endrole
                                </ul>
                            </li>
                            @endrole  
                            @role('usermanager') 
                            <li class=""><a tabindex="0" href="{{route('users.afficher')}}"><i class="fa fa-user"></i> <span>Gestion des utilisateurs</span></a></li>
                            @endrole
                            @role('advisor')
                            <li class="">
                                <a role="button" tabindex="0"><i class="fa fa-users"></i> <span>Gérer mes devis</span> <span class="label label-danger pull-right">{{sizeof(newDevis())}}</span></a>
                                <ul>
                                    <li><a href="{{route('devis.creer')}}"><i class="fa fa-caret-right"></i> Créer un devis</a></li>
                                    <li><a href="{{route('devis.list')}}"><i class="fa fa-caret-right"></i> Mes dévis <span class="label label-danger pull-right">{{sizeof(newDevis())}}</span></a></li>
                                    <li><a href="{{route('devis.list.all')}}"><i class="fa fa-caret-right"></i> Toutes les propositions</a></li>    
                                </ul>
                            </li>
                            <li class="">
                                <a role="button" tabindex="0"><i class="fa fa-users"></i> <span>Gérer mes clients</span> </a>
                                <ul>

                                    <li><a href="{{route('client.afficher')}}"><i class="fa fa-caret-right"></i> Gérer</a></li> 
                                    <li class=""><a  href="{{route('contrats')}}"><i class="fa fa-files-o"></i> <span>Mes contrats</span></a></li>
                                    <li class=""><a  href="{{route('espacePerso')}}"><i class="fa fa-user"></i> <span>Espaces Perso</span></a></li>
                                    
                                </ul>
                            </li>
                            @endrole
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</aside>

                