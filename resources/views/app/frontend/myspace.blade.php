@extends('layouts.frontend.master')

@section("title")
www.monassurance.ci ::  Soyez rassurés, tout est géré.
@endsection

@section("custom-styles")
    <link rel="stylesheet" href="{{ asset('css/image-picker/image-picker.css') }}">
    <link rel="stylesheet" href="{{ asset('css/custom.css') }}">
    <link rel="stylesheet" href="{{ asset('js/gallery/css/blueimp-gallery.min.css') }}">
    <link rel="stylesheet" href="{{ asset('js/datatables/css/jquery.dataTables.min.css') }}">
    <link rel="stylesheet" href="{{ asset('js/datatables/datatables.bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('js/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css') }}">
    <link rel="stylesheet" href="{{ asset('js/datatables/extensions/Responsive/css/dataTables.responsive.css') }}">
    <link rel="stylesheet" href="{{ asset('js/datatables/extensions/ColVis/css/dataTables.colVis.min.css') }}">
    <link rel="stylesheet" href="{{ asset('js/datatables/extensions/TableTools/css/dataTables.tableTools.min.css') }}">
@endsection


@section("custom-scripts")
    <script src="{{ asset('js/gallery/js/blueimp-gallery.min.js') }}"></script>
    <script src="{{ asset('css/image-picker/image-picker.min.js') }}"></script>
    <script src="{{ asset('js/datatables/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('js/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js') }}"></script>
    <script src="{{ asset('js/datatables/extensions/Responsive/js/dataTables.responsive.min.js') }}"></script>
    <script src="{{ asset('js/datatables/extensions/ColVis/js/dataTables.colVis.min.js') }}"></script>
    <script src="{{ asset('js/datatables/extensions/TableTools/js/dataTables.tableTools.min.js') }}"></script>

<script>
    $(document).ready(function () {
        function switchMenu(menuId, contentId) {
            $(".space_main").removeClass("active"); // Retire les styles "active" de tous les menus
            $(menuId).addClass("active"); // Ajoute le style "active" au menu sélectionné
            $("div[id^='content_']").hide(); // Cache tous les contenus
            $(contentId).show(); // Affiche le contenu sélectionné
        }

        $("#menu_compte").click(function (e) {
            e.preventDefault();
            switchMenu("#menu_compte", "#content_compte");
        });

        $("#menu_contrat").click(function (e) {
            e.preventDefault();
            switchMenu("#menu_contrat", "#content_contrat");
        });

        $("#menu_renouveler").click(function (e) {
            e.preventDefault();
            switchMenu("#menu_renouveler", "#content_renouveler");
        });

        $("#menu_plan").click(function (e) {
            e.preventDefault();
            switchMenu("#menu_plan", "#content_plan");
        });
    });
</script>

<script>
    const MySpace = {
        init: function () {
            this.initGallery();
            this.initDataTable();
            this.bindEvents();
        },

        initGallery: function () {
            document.getElementById('links').onclick = function (event) {
                event = event || window.event;
                const target = event.target || event.srcElement;
                const link = target.src ? target.parentNode : target;
                const options = { index: link, event: event };
                const links = this.getElementsByTagName('a');
                blueimp.Gallery(links, options);
            };
        },

        initDataTable: function () {
            $('.datatable_table').DataTable({
                "dom": '<f<t>ip>',
                "pageLength": 5,
                "oLanguage": {
                    "oPaginate": {
                        "sFirst": "Premier",
                        "sLast": "Dernier",
                        "sNext": "<i class='fa fa-arrow-circle-right'></i>",
                        "sPrevious": "<i class='fa fa-arrow-circle-left'></i>"
                    },
                    "sSearch": "Rechercher: ",
                    "sInfo": "_START_ - _END_ lignes sur _TOTAL_",
                    "sEmptyTable": "Aucune ligne ne correspond à vos critères",
                    "sZeroRecords": "Aucun résultat trouvé"
                }
            });
        },

        bindEvents: function () {
            $(".space_main").on("click", function (e) {
                e.preventDefault();
                const target = $(this).attr("id").replace("menu_", "content_");
                $(".space_main").removeClass("active");
                $(this).addClass("active");
                $(".col-md-8.animate").hide();
                $(`#${target}`).show();
            });

            $("#phone").mask("99 99 99 99 99");
            $('.datepicker_newreleasedate').datetimepicker({ format: 'DD/MM/YYYY' });
        },

        loadContractDetails: function (id_contrat) {
            $.get(`/myspace/loadcontrat/${id_contrat}`, function (data) {
                if (data !== '0') {
                    $('#form_renew_auto').show();
                    const d = JSON.parse(data);
                    $('#id_cont').val(d.qid);
                    $('#police').val(d.number_n);
                    $('#client').val(`${d.firstname} ${d.lastname}`);

                    const releaseDate = new Date(d.releasedate);
                    releaseDate.setMonth(releaseDate.getMonth() + d.nbmois);
                    const formattedDate = releaseDate.toISOString().split('T')[0];

                    const [year, month, day] = formattedDate.split('-');
                    $('#echeance').val(`${day}/${month}/${year} 00:00:00`);
                    $('#newreleasedate').val(`${day}/${month}/${year}`);

                    if (releaseDate < new Date()) {
                        $('#status').html("<h3 class='alert alert-danger'>Contrat Expiré</h3>");
                    } else {
                        $('#status').html("<h3 class='alert alert-success'>Contrat en cours</h3>");
                    }
                } else {
                    $('#form_renew_auto').hide();
                    $('#id_cont').val("");
                    $('#police').val("");
                    $('#client').val("");
                }
            });
        }
    };

    $(document).ready(function () {
        MySpace.init();
    });

    $(document).ready(function () {
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        const target = $(e.target).attr("aria-controls");
        $(".tab-pane").removeClass("active");
        $("#" + target).addClass("active");
    });
    });

</script>

@endsection


@section('content')
    <section class="subpage-header">
        <div class="container">
            <div class="site-title clearfix">
                <h2>Mon espace</h2>
                <ul class="breadcrumbs">
                    <li><a href="/">Accueil</a></li>
                    <li>Mon espace personnel</li>
                </ul>
            </div>
            <a href="{{route('page.quote.auto')}}" class="btn btn-primary get-in-touch" data-text="Demander un dévis Auto"><i class="fa fa-file-o"></i>Demander un dévis Auto</a>
        </div>
    </section>

    <section>
        <div class="container">
            {{-- Gestion des alertes --}}
            @if(\Illuminate\Support\Facades\Session::has("success"))
                <div class="alert alert-success text-center">
                    {{ \Illuminate\Support\Facades\Session::get("success") }}
                </div>
            @endif
            @if(\Illuminate\Support\Facades\Session::has("error"))
                <div class="alert alert-danger text-center">
                    {{ \Illuminate\Support\Facades\Session::get("error") }}
                </div>
            @endif

            <div class="row">
                {{-- Barre latérale --}}
                <div class="col-md-4 animate fadeInLeft">
                    @include('app.frontend.partials.myspace.sidebar')
                </div>

                {{-- Contenu principal : Contrats / Devis --}}
                <div class="col-md-8 animate fadeInRight" id="content_contrat" style="display:none">
                    @include('app.frontend.partials.myspace.tabs')
                </div>

                {{-- Renouveler Contrats --}}
                <div class="col-md-8 animate fadeInRight" id="content_renouveler" style="display:none">
                    @include('app.frontend.partials.myspace.renew')
                </div>

                {{-- Paramètres du compte --}}
                <div class="col-md-8 animate fadeInRight" id="content_compte">
                    @include('app.frontend.partials.myspace.account')
                </div>

                {{-- Bon Plan --}}
                <div class="col-md-8 animate fadeInRight" id="content_plan" style="display:none">
                    <div class="alert alert-info">
                        <strong><i class="fa fa-info"></i></strong> Fonctionnalités bientôt disponibles !
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
