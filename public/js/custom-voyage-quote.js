var sfw;
$(document).ready(function() {
	$("#phone").mask("99 99 99 99 99");
	$("#phone_souscr").mask("99 99 99 99 99");
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
	        str= pref +part.match(/(\d{1,3}(?:[\.|,]\d*)?)(?=(\d{3}(?:[\.|,]\d*)?)*$)/g ).join('.')+suf ;
	    };
	    return str;
	}

	function getQuotation(url){
	    var t = $('#box_table').DataTable({
	        "dom": '<"bottom"p>',
	        "pageLength": 3,
	        "bSort" : true,
	        "aaSorting": [[ 2, "asc" ]],
	        "aoColumnDefs": [
	        { "sType": "numeric" }
	        ],
	        "oLanguage": {
	            "oPaginate": {
	                "sFirst": "Premier",
	                "sLast": "Dernier",
	                "sNext": "<i class='fa fa-arrow-circle-right'></i>",
	                "sPrevious": "<i class='fa fa-arrow-circle-left'></i>",
	                "sEmptyTable": "Aucun Devis ne correspond à vos critères"
	            }
	        }
	    });

        $.ajax({
            url: url,
            type: "post",
            data: $("#quoteFormVoyage").serialize(),
            success: function(data) {
                try {
                    var obj = JSON.parse(data);
                    var html = "";
                    
                    // Vérification et correction des données
                    obj.forEach(function(c) {
                        // Correction de la durée
                        if (c.PROSPECT && c.PROSPECT.departure_date && c.PROSPECT.arrival_date) {
                            var depDate = new Date(c.PROSPECT.departure_date);
                            var arrDate = new Date(c.PROSPECT.arrival_date);
                            // Calcul correct de la durée (inclusif)
                            c.ASSURANCE.DUREE = Math.floor((arrDate - depDate) / (1000 * 60 * 60 * 24));
                        } else {
                            c.ASSURANCE.DUREE = c.ASSURANCE.DUREE || 1;
                        }
                        
                        // Correction de l'âge
                        c.ASSURANCE.AGE = c.ASSURANCE.AGE || calculateAge(c.PROSPECT.dob);
                        
                        // Correction des montants
                        c.PRIME = c.PRIME || 0;
                        c.FG = c.FG || 2000; // Valeur par défaut pour les frais
                        c.AMOUNT_SERVICES = c.AMOUNT_SERVICES || 0;
                    });
    
                    // Fonction pour calculer l'âge à partir de la date de naissance
                    function calculateAge(dob) {
                        if (!dob) return 'N/A';
                        var birthDate = new Date(dob);
                        var diff = Date.now() - birthDate.getTime();
                        var ageDate = new Date(diff);
                        return Math.abs(ageDate.getUTCFullYear() - 1970);
                    }
    
                    // Génération du HTML (votre code existant modifié)
                    var c = obj[0];
                    html = '<div class="row">';
                    html += '<div class="col-md-12">';
                    html += '<p style="font-size:19px; color:#000">Le montant de votre assurance VOYAGE est de <b>'+formatMoney(Math.ceil(c.PRIME))+' FCFA</b> avec la compagnie <img width="60" src="/images/assureurs/'+c.logo+'"></p>';
                    html += '</div>';
                    html += '</div>';
                    
                    html += '<div class="row">';
                    html += '<div class="col-md-12">';
                    html += '<table style="width:100%" align="center"><tr><td>Destination</td><td>Age</td><td>Durée</td></tr>';
                    html += '<tr><td>'+c.PROSPECT.pays_name+'('+c.PROSPECT.pays_zone+')</td><td>'+(c.ASSURANCE.AGE || 'N/A')+' an(s)</td><td>'+c.ASSURANCE.DUREE+' Jour(s)</td></tr></table>';
                    html += '</div>';
                    html += '</div>';
    
                    // ... (le reste de votre HTML)
    
                    $('#box_div').append(html);
                    
                    $.each(obj, function(i,c) {
                        var html1 = '<img width="83x30" src="/images/assureurs/'+c.logo+'" />';
                        var html2 = '<span>'+c.ASSURANCE.DUREE+'</span>';
                        var html4 = '<span>'+formatMoney(Math.ceil(c.PRIME))+' FCFA</span>';
                        var html5 = '<span>'+formatMoney(Math.ceil(c.FG))+' FCFA</span>';
                        var html6 = '<span>'+formatMoney(Math.ceil(c.AMOUNT_SERVICES))+' FCFA</span>';
                        var html7 = '<span>'+formatMoney(Math.ceil(c.PRIME+c.AMOUNT_SERVICES+c.FG))+' FCFA</span>';
                        var html8 = '<a title="Voir détails" href="/voyage/details/devis/'+c.id_quote+'/'+c.idcomp+'" style="background-color:#4cae4c;" class="btn btn-success"><i class="fa fa-search"></i></a>';
    
                        t.row.add([html1, html2, html4, html5, html6, html7, html8]).draw(false);
                    });
    
                } catch (e) {
                    console.error("Erreur de traitement des données:", e);
                    alert("Une erreur est survenue lors du traitement des données.");
                }
            },
            error: function(xhr, status, error) {
                console.error("Erreur AJAX:", status, error);
                alert("Une erreur est survenue lors de la récupération des devis.");
            },
            complete: function() {
                $(".loader_img").fadeOut();
                $("#box_div_table").fadeIn();
            }
        });
	}

	$("#quoteFormVoyage").submit(function (e){
	    e.preventDefault();
	    //validate fields
        var fail = false;
        var fail_log = '';
        $("#quoteFormVoyage").find( 'select, textarea, input' ).each(function(){
        	if( ! $( this ).prop( 'required' )){

		       } else {
		           if ( ! $( this ).val() ) {
		               fail = true;
		               name = $( this ).attr( 'label' );
		               fail_log += name + " est obligatoire \n";
		           }

		       }
        });
        if ( ! fail ) {
            //process form here.
	    	$('.cd-testimonials-all').addClass('is-visible');
	    	$('body').css('overflow','hidden');
	        $("#loader_quote").fadeIn();
	        html='<table class="table" id="box_table">';
	        html+='<thead>';
	        html+='<tr><th>Compagnie</th><th>Durée(Jours)</th><th>Prime</th><th>FAC</th><th>Services</th><th>Total</th> <th>Details</th></tr>';
	        html+='</thead>';
	        html+='<tbody id="box"></tbody>';
	        html+='</table>';

	        $('#box_div_table').html(html);

	        x_timer = setTimeout(function(){
	            getQuotation("/devis/voyage/getquotation")
	        }, 3000);
	      }else{
	      	alert( fail_log );
	      }

	});

	$("#close-btn").click(function(){
	    $('#box_div').html("");
	    $( "#loader_quote" ).fadeOut();
	    $( "#box_div_table" ).hide();
	    $(".loader_img").fadeIn("slow");

	});

	function showLoader () {
          var overlay = jQuery('<div id="overlay"> <img src="/images/travel-loader.gif" /> </div>');
          overlay.appendTo(document.body)
        }

        function stopLoader () {
          $( "#overlay" ).remove();
          window.sfw.next()


        }

        function switchProprioVeh(){
            showLoader();

            if($('input[name=proprio_veh]:checked').val()=='E' || $('input[name=proprio_veh]:checked').val()=='A'){
            	$('.souscripteur_field').show()
            	$("#souscripteur_name").attr("required","true");
            	$("#souscripteur_name").attr("data-parsley-group","block0");
            	$("#email_sousc").attr("required","true");
            	$("#email_sousc").attr("data-parsley-group","block0");
            	$("#phone_souscr").attr("required","true");
            	$("#phone_souscr").attr("data-parsley-group","block0");
            	$('#label_email').html("Adresse email de l'assuré");
            	$("#email").removeAttr("required");
            	$("#email").removeAttr("data-parsley-group");
            }else{
            	$('.souscripteur_field').hide()
            	$("#souscripteur_name").removeAttr("required");
            	$("#souscripteur_name").removeAttr("data-parsley-group");
            	$("#email_sousc").removeAttr("required");
            	$("#email_sousc").removeAttr("data-parsley-group");
            	$("#phone_souscr").removeAttr("required");
            	$("#phone_souscr").removeAttr("data-parsley-group");
            	$('#label_email').html("Adresse email de l'assuré*");
            	$("#email").attr("required","true");
            	$("#email").attr("data-parsley-group","block1");

            }
            setTimeout(function() {stopLoader()}, 1500);
        }

        $("input[name=proprio_veh]").click(function (e){
            switchProprioVeh();
        })

});




