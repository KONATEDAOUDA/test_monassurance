<!doctype html>
<html class="no-js" lang="fr">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>www.monassurance.ci ::  1er comparateur d'assurance en côte d'Ivoire</title>
        <link rel="icon" type="image/ico" href="{{asset('images/favicon.ico')}}" />
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- vendor css files -->
        <link rel="stylesheet" href="{{asset('back/assets/css/vendor/bootstrap.min.css')}}">
        <link rel="stylesheet" href="{{asset('back/assets/css/vendor/animate.css')}}">
        <link rel="stylesheet" href="{{asset('back/assets/css/vendor/font-awesome.min.css')}}">
        <link rel="stylesheet" href="{{asset('back/assets/js/vendor/animsition/css/animsition.css')}}">
        <link rel="stylesheet" href="{{asset('back/assets/js/vendor/daterangepicker/daterangepicker-bs3.css')}}">

        <link rel="stylesheet" href="{{asset('back/assets/js/vendor/datetimepicker/css/bootstrap-datetimepicker.min.css')}}">
        <link rel="stylesheet" href="{{asset('back/assets/js/vendor/chosen/chosen.css')}}">
        <link rel="stylesheet" href="{{asset('back/assets/js/vendor/summernote/summernote.css')}}">
        <link rel="stylesheet" href="{{asset('back/assets/js/vendor/owl-carousel/owl.carousel.css')}}">
        <link rel="stylesheet" href="{{asset('back/assets/js/vendor/owl-carousel/owl.theme.css')}}">
        <link rel="stylesheet" href="{{asset('back/assets/js/vendor/morris/morris.css')}}">
        <script type="text/javascript">
        // var module = {}
        </script>
        <link rel="stylesheet" href="{{asset('back/assets/css/vendor/sweetalert/sweetalert.css')}}">

        <link rel="stylesheet" href="{{asset('back/assets/css/main.css')}}">
        <!--/ stylesheets -->
        <script src="{{asset('back/assets/js/vendor/modernizr/modernizr-2.8.3-respond-1.4.2.min.js')}}"></script>
        <!--/ modernizr -->
        <link rel="stylesheet" href="{{asset('back/assets/js/vendor/datetimepicker/css/bootstrap-datetimepicker.min.css')}}">
        <!-- Scripts -->
        <!-- DataTables CSS -->

        <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css">




        <link rel="stylesheet" href="{{asset('back/assets/js/vendor/chosen/chosen.css')}}">
        <link rel="stylesheet" href="{{ asset('back/assets/js/vendor/datatables/css/jquery.dataTables.min.css')}}">
        <link rel="stylesheet" href="{{ asset('back/assets/js/vendor/datatables/datatables.bootstrap.min.css')}}">
        <link rel="stylesheet" href="{{ asset('back/assets/js/vendor/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css')}}">
        <link rel="stylesheet" href="{{ asset('back/assets/js/vendor/datatables/extensions/Responsive/css/dataTables.responsive.css')}}">
        <link rel="stylesheet" href="{{ asset('back/assets/js/vendor/datatables/extensions/ColVis/css/dataTables.colVis.min.css')}}">
        <link rel="stylesheet" href="{{ asset('back/assets/js/vendor/datatables/extensions/TableTools/css/dataTables.tableTools.min.css')}}">


<!-- blueimp Gallery styles -->
<link rel="stylesheet" href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
<link rel="stylesheet" href="{{asset('back/assets/js/vendor/file-upload/css/jquery.fileupload.css')}}">
<link rel="stylesheet" href="{{asset('back/assets/js/vendor/file-upload/css/jquery.fileupload-ui.css')}}">



    </head>

    <body id="minovate" class="appWrapper">
        <div id="wrap" class="animsition">

           @include('Backoffice.layouts.header')

            <div id="controls">
                @include('Backoffice.layouts.sidebar')
                @include('Backoffice.layouts.rightbar')
            </div>

            <section id="content">

                @yield('content')

                <audio id="myAudio">
                  <source src="/back/assets/audio/bells.ogg" type="audio/ogg">
                  <source src="/back/assets/audio/bells.mp3" type="audio/mpeg">
                  Your browser does not support the audio element.
                </audio>

                <audio id="chatAudio">
                  <source src="/back/assets/audio/beep.ogg" type="audio/ogg">
                  <source src="/back/assets/audio/beep.mp3" type="audio/mpeg">
                  Your browser does not support the audio element.
                </audio>
            </section>
            <!--/ CONTENT -->
        </div>
        <!--/ Application Content -->
        @yield('custom-styles')

        <!-- ============================================
        ============== Vendor JavaScripts ===============
        ============================================= -->
        <!-- DataTables JS -->

        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
        <script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
        <script>window.jQuery || document.write('<script src="/back/assets/js/vendor/jquery/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="{{asset('back/assets/js/ajax.jquery.min.js')}}"></script>

        <script src="{{asset('back/assets/js/vendor/bootstrap/bootstrap.min.js')}}"></script>

        <script src="{{asset('back/assets/js/vendor/jRespond/jRespond.min.js')}}"></script>

        <script src="{{asset('back/assets/js/vendor/sparkline/jquery.sparkline.min.js')}}"></script>

        <script src="{{asset('back/assets/js/vendor/slimscroll/jquery.slimscroll.min.js')}}"></script>

        <script src="{{asset('back/assets/js/vendor/animsition/js/jquery.animsition.min.js')}}"></script>

        <script src="{{asset('back/assets/js/vendor/screenfull/screenfull.min.js')}}"></script>

        <script src="{{asset('back/assets/js/main.js')}}"></script>

        @yield('footer-script')

         <!-- ===============================================
        ============== Echo pusher ===============
        ================================================ -->

        <script src="{{asset('back/assets/js/echo.js')}}"></script>
        <script src="{{asset('back/assets/js/pusher.min.js')}}"></script>

        <script src="{{asset('back/assets/js/vendor/notify/easyNotify.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/sweetalert/sweetalert.min.js')}}"></script>

        <script src="{{asset('back/assets/js/vendor/inputmask/dist/inputmask/inputmask.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/inputmask/dist/inputmask/inputmask.extensions.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/inputmask/dist/inputmask/inputmask.numeric.extensions.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/inputmask/dist/inputmask/inputmask.date.extensions.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/inputmask/dist/inputmask/inputmask.phone.extensions.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/inputmask/dist/inputmask/jquery.inputmask.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/inputmask/dist/inputmask/phone-codes/phone.js')}}"></script>



        <script src="{{asset('back/assets/js/vendor/daterangepicker/moment.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/daterangepicker/daterangepicker.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/datetimepicker/js/bootstrap-datetimepicker.min.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/owl-carousel/owl.carousel.min.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/easypiechart/jquery.easypiechart.min.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/raphael/raphael-min.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/morris/morris.min.js')}}"></script>

        <script src="{{asset('back/assets/js/vendor/flot/jquery.flot.min.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/flot-tooltip/jquery.flot.tooltip.min.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/flot-spline/jquery.flot.spline.min.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/flot/jquery.flot.pie.min.js')}}"></script>

        <script src="{{asset('back/assets/js/vendor/chosen/chosen.jquery.min.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/summernote/summernote.min.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/summernote/lang/summernote-fr-FR.js')}}"></script>

        <script src="{{asset('back/assets/js/vendor/ticker/style.css')}}"></script>
        <script src="{{asset('back/assets/js/vendor/ticker/theme.css')}}"></script>



        <script src="{{asset('back/assets/js/vendor/datetimepicker/js/bootstrap-datetimepicker.min.js')}}"></script>


        <script src="{{asset('back/assets/js/vendor/sweetalert/sweetalert.min.js')}}"></script>



        <script src="{{asset('back/assets/js/vendor/raty-fa/jquery.raty-fa.js')}}"></script>

        <script src="{{asset('back/assets/js/vendor/datatables/js/jquery.dataTables.min.js')}} "></script>
        <script src="{{asset('back/assets/js/vendor/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/datatables/extensions/Responsive/js/dataTables.responsive.min.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/datatables/extensions/ColVis/js/dataTables.colVis.min.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/datatables/extensions/TableTools/js/dataTables.tableTools.min.js')}}"></script>
        <script src="{{asset('back/assets/js/vendor/datatables/extensions/dataTables.bootstrap.js')}}"></script>

        @yield('custom-script')
        
<!--/ vendor javascripts -->







    </body>
</html>
