<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Backoffice\Auth\LoginController;
use App\Http\Controllers\Backoffice\AdminController;
use App\Http\Controllers\Backoffice\AccountManager\AccountManagerController;
use App\Http\Controllers\Backoffice\Prospection\ProspectingController;
use App\Http\Controllers\Backoffice\CRUD\Guarantee\GuaranteeController;
use App\Http\Controllers\Backoffice\CRUD\Category\CategoryController;
use App\Http\Controllers\Backoffice\CRUD\Reglementary\OtherController;
use App\Http\Controllers\Backoffice\CRUD\Company\CompanyController;
use App\Http\Controllers\Backoffice\UsersManager\UsersManagerController;
use App\Http\Controllers\Backoffice\Order\DetailsOrderController;
use App\Http\Controllers\Backoffice\Order\UpdateOrderInfosController;
use App\Http\Controllers\Backoffice\Client\ClientManagerController;
use App\Http\Controllers\Backoffice\Contracts\ContractsController;
use App\Http\Controllers\Backoffice\Client\EspacePersoController;
use App\Http\Controllers\Backoffice\Notifications\CallMeController;
use App\Http\Controllers\Backoffice\Repports\RepportsController;
use App\Http\Controllers\Backoffice\DeliveryTour\DeliveryTourController;
use App\Http\Controllers\Backoffice\Order\StatusOrderController;
use App\Http\Controllers\Backoffice\Revives\RevivesController;
use App\Http\Controllers\Backoffice\ImportExportData\ExportDataController;
use App\Http\Controllers\Backoffice\Search\AdvancedSearchController;
use App\Http\Controllers\Pages\IndexPageController;
use App\Http\Controllers\Pages\RubriqueController;
use App\Http\Controllers\MySpace\MySpaceController;
use App\Http\Controllers\Quotation\AutoQuotationController;
use App\Http\Controllers\Api\V1\RestAPI;
use App\Http\Controllers\Auth\ResetPasswordController;
use App\Http\Controllers\Backoffice\PaymentsController;
use App\Http\Controllers\Pages\ProductPageController;
use App\Http\Controllers\PaymentController;

Route::controller(LoginController::class)->group(function () {

    Route::get('loginadmin', 'showLoginForm')->name('loginform')->middleware('guest');
    Route::post('/myspace/login',  'PostLogin')->name('PostLogin');
    Route::get('/myspace/locked', 'showLocked')->name('showspaceLocked');
    Route::post('/myspace/dologinfromlock', 'PostLocked')->name('PostSpaceLocked');
    Route::get('logout', 'logout')->name('logout');

});


Route::middleware(['auth'])->group(function () {

    Route::controller(AdminController::class)->group(function () {

        Route::get('/me/dashboard', 'showDashboard')->name('spaceDashboard');
    });

    Route::controller(AccountManagerController::class)->group(function () {
        Route::get('/me/profil', 'showProfile')->name('profilepage');
        Route::post('/me/editprofile', 'editProfile')->name('editProfile');
        Route::post('/me/editpassword', 'editPassword')->name('editPassword');
    });

    // Attestations
    Route::post('/attestations/upload', [ProspectingController::class, 'upload'])->name('attestations.upload');

  // gerer mes prospects
    Route::controller(ProspectingController::class)->group(function () {
        Route::get('/admin/devis/creer', 'ShowCreateQuotationForm')->name('devis.creer');
        Route::get('/admin/devis/list', 'ShowListQuotationPage')->name('devis.list');
        Route::get('/admin/devis/list/all', 'ShowListAllQuotationPage')->name('devis.list.all');
        Route::get('/admin/prospect/send_sms', 'ShowSendSMSPage')->name('prospect.send-sms');
        Route::post('/admin/devisauto/post', 'CreateAutoQuotation')->name('devis.auto.post');
        Route::post('/admin/devismoto/post', 'traitMotoQuotation')->name('devis.moto.post');
        Route::post('/admin/devisvoyage/post', 'traitVoyageQuotation')->name('devis.voyage.post');
        Route::get('/admin/devis/moto/creer', 'ShowCreateMotoQuotationForm')->name('devis.moto.creer');
        Route::get('/admin/devis/voyage/creer', 'ShowCreateVoyageQuotationForm')->name('devis.voyage.creer');
        Route::get('/admin/commandes/waitingdelivery/list', 'ShowListOrderWaitingDeliveryPage')->name('orders.waitingdelivery.list');
        Route::get('/admin/commandes/waitingdelivery/liste', 'ShowListOrderWaitingDeliveryTour')->name('orders.waitingdelivery.list.tour');
        Route::get('/admin/commandes/list', 'ShowListOrderPage')->name('orders.list');
        Route::get('/admin/delete/ordertodeliverytour/{id_order}', 'deleteOrderToDeliverytour')->name('deleteOrderToDeliveryTour');
    });

    //Details devis
    Route::controller(DetailsOrderController::class)->group(function () {
        Route::get('/admin/devis/details/{id}/{aid}', 'Quotedetails')->name('devis.details');
        Route::get('/admin/devis/voyage/details/{id}/{aid}', 'TravelQuotedetails')->name('devis.voyage.details');
        Route::get('/admin/devis/timeline/{id}', 'OrderTimeLine')->name('devis.timeline');
        Route::get('/admin/devis/details/{id}/{aid}', 'Quotedetails')->name('devis.details');
        Route::get('/admin/commande/a-encaisser', 'commandeAencaisser')->name('commande.a.encaisser');
        Route::get('/admin/commande/traitees', 'commandeTraiter')->name('commande.traitees');
        Route::get('/admin/devis/pdf/{comp_id}/{quote_id}', 'loadDevisPDF')->name('showDevisPDF');
        Route::get('/admin/devis/voyage/pdf/{comp_id}/{quote_id}', 'loadDevisVoyagePDF')->name('showDevisVoyagePDF');
    });


    Route::controller(DeliveryTourController::class)->group(function () {
        Route::get('/admin/livraison/tocash/list', 'ShowListOrderDeliveryToCash')->name('delivery.tocash.list');
        Route::get('/admin/tocash/tour-details/{id_tour}', 'ShowDeliveryTourDetailsToCashPage')->name('delivery.tocash.details');
        Route::get('/admin/livraison/list', 'ShowListOrderWaitingDeliveryPage')->name('delivery.list');
        Route::get('/admin/livraison/tour-details/{id_tour}', 'ShowDeliveryTourDetailsPage')->name('delivery.details');
        Route::post('/order/notdelivery', 'orderNotDelivery')->name('order.notdelivery');
        Route::post('/order/confirmdelivery','orderConfirmDelivery')->name('order.notdelivery');
        Route::get('/admin/operation/tour-details/{id_tour}', 'ShowDeliveryTourOperationDetailsPage')->name('delivery.operation.details');
        Route::post('/admin/deliverytour/post', 'createDeliveryTour')->name('deliverytour.post');
        Route::post('/admin/deliverytour/update', 'updateDeliveryTour')->name('deliverytour.update');
        Route::post('/admin/settodelivery/post', 'setOrderToDeliveryTour')->name('settodelivery.post');
        Route::get('/admin/deliverytour/signature/pdf/{id_sign}', 'DeliveryTourSignaturePdf')->name('deliverytour.signature.pdf');
        Route::get('/admin/startdeliverytour/{id_tour}', 'startDeliveryTour')->name('deliverytour.start');
        Route::get('/admin/closedeliverytour/{id_tour}', 'closeDeliveryTour')->name('deliverytour.close');
        Route::get('/admin/getdeliverytour/{id_tour}', 'getDeliveryTour')->name('deliverytour.get');
    });


    Route::controller(UpdateOrderInfosController::class)->group(function () {
        Route::post('/admin/devis/update/vehicule', 'updateVehicule')->name('devis.vehicule.update');
        Route::post('/admin/devis/update/client', 'updateClient')->name('devis.client.update');
        Route::post('/admin/devis/update/garantie', 'updateGarantie')->name('devis.garantie.update');
        Route::post('/admin/devis/update/service', 'updateService')->name('devis.service.update');
        Route::post('/admin/devis/update/reduction', 'updateReduction')->name('devis.reduction.update');
        Route::get('/admin/priority-order/{qid}', 'priorityOrder')->name('devis.priority.up');
    });

    Route::controller(StatusOrderController::class)->group(function () {
        Route::post('/admin/devis-auto/validation', 'validateOrder')->name('devis.vehicule.validate');
        Route::post('/admin/devis-auto/confirm', 'confirmDevis')->name('devis.vehicule.confirm');
        Route::get('/admin/cancel-commande/{id_quote}', 'cancelCommande')->name('order.cancel');
    });

    Route::controller(RevivesController::class)->group(function () {
	    Route::post('/admin/revive/create', 'saveReviveForOrder')->name('createRevive');
        Route::get('/admin/revive', 'showReviveConfigPage')->name('configRevive');
    });

    Route::controller(CompanyController::class)->group(function () {
        Route::get('/admin/company', 'showPage')->name('companyPage');
        Route::get('/admin/company/tarif/{id_comp}', 'showTarifPage')->name('tarifCompany');
        Route::get('/admin/deletecompany/{id_comp}', 'deleteCompany')->name('deleteCompany');
        Route::post('/admin/editcompany', 'editCompany')->name('editCompany');
    });

    Route::controller(ClientManagerController::class)->group(function () {

        Route::get('/admin/clients', 'afficherClient')->name('client.afficher');
        Route::get('/admin/client/detail/{id}', 'detailClient')->name('client.detail');
    });

    Route::controller(OtherController::class)->group(function () {
        Route::get('/admin/config/other','showConfigPage')->name( 'configOtherReglementary');
        Route::post('/admin/auto/otherrate', 'editAutoOtherRate')->name('editAutoReglementaryOther');
    });

    Route::controller(EspacePersoController::class)->group(function () {
        Route::get('/admin/espace-perso', 'showAllSpace')->name('espacePerso');
        Route::post('/admin/espace-perso/create/', 'createNewSpace')->name('createEspacePerso');
        Route::post('/admin/reset-password/espace-perso', 'resetPassword')->name('espace-perso.resetPassword');
        Route::get('/admin/espace-perso/delete/{phone_number}', 'deleteSpace')->name('deleteEspacePerso');

    });


    //Config Garanties AUTO
    Route::controller(GuaranteeController::class)->group(function () {
        Route::get('/admin/guarantee', 'showPage')->name('guaranteePage');
        Route::get('/admin/guarantee/{id}',  'getGuarantee')->name('getGuarantee');
        Route::post('/admin/editguarantee',  'editGuarantee')->name('editGuarantee');
    });

    //Config Categories AUTO
    Route::controller(CategoryController::class)->group(function () {
        Route::get('/admin/category', 'showPage')->name('categoryPage');
        Route::get('/admin/category/{id}', 'getCategory')->name('getCategory');
        Route::post('/admin/editcategory', 'editCategory')->name('editCategory');
    });



    //gestion des utilisateurs
    Route::controller(UsersManagerController::class)->group(function () {
	    Route::get('/admin/users', 'showUsersList')->name('users.afficher');
        Route::get('/admin/userdetails/{id_user}', 'showUserDetails')->name('userDetails');
        Route::get('/admin/getuser/{id_user}', 'getUser')->name('getUser');
        Route::post('/admin/edituser', 'editUser')->name('user.edit');
        Route::post('/admin/createuser', 'createUser')->name('user.create');
        Route::post('/admin/edituserrole', 'editUserRole')->name('userrole.edit');
        Route::get('/admin/deleteuser/{id_user}', 'deleteUser')->name('deleteUser');
    });

    Route::controller(ContractsController::class)->group(function () {
	    Route::get('/admin/contracts', 'showContracts')->name('contrats');
        Route::get('/admin/rates', 'showRates')->name('configRate');
        Route::post('/admin/editrate', 'editRate')->name('editAutoReduction');
        Route::post('/admin/renewcontract', 'renewContract')->name('renewContract');
        Route::get('/admin/loadcontrat/{id_contrat}', 'loadContrat')->name('loadContrat');
        Route::get('/admin/details-contrat/{id_cont}', 'showDetailsContrat')->name('details-contrat');
    });

    Route::controller(CallMeController::class)->group(function () {
        Route::post('/admin/notification/send_sms', 'sendSMS')->name('sendSMS');
        Route::post('/admin/notification/send_email', 'sendEmail')->name('sendEmail');
        Route::post('/admin/notification/send_sms_simple', 'sendSMSSimple')->name('sendSMSSimple');
        Route::post('/admin/notification/send_email_simple', 'sendEmailSimple')->name('sendEmailSimple');
        Route::get('/admin/notifications/call', 'showCallNotifPage')->name('notiication.call');
        Route::get('/admin/notifications/call/{notif_id}', 'showSingleCallNotifPage')->name('single.notiication.call');
        Route::post('/admin/notifications/call/post', 'postCallNotif')->name('call-me.post');
    });

    Route::controller(RepportsController::class)->group(function () {
        Route::get('/admin/stats/devis', 'showRepportsQuotesPage')->name('stats.devis');
    });

    Route::controller(ExportDataController::class)->group(function () {
        Route::get('/admin/export-data', 'showExportPage')->name('exportData');
        Route::post('/post/export-client', 'postExportClient')->name('postExportClient');
    });

    Route::controller(AdvancedSearchController::class)->group(function () {
        Route::get('/delete/trace-devis', 'showdeleteTracePage')->name('deleteTrace');
        Route::post('/delete/trace-devis', 'deleteInfoDevisPost')->name('deleteInfoDevisPost');
    });

    Route::post('/payments/store', [PaymentsController::class, 'store'])->name('payments.store');

});

// API REST Routes
Route::prefix('rest-api/v1')->group(function () {
    Route::get('/autoQuote/{auto_id}/{user_id}/{assur_id}', [AutoQuotationController::class, 'caculAutoQuotationFromDb'])->name('autoQuoteBD');
    Route::get('/searchuser/{id}', [RestAPI::class, 'searchTravelProfil'])->name('searchUser');
    Route::get('/searchcar/{immat}', [RestAPI::class, 'searchImmat'])->name('searchImmat');
    Route::get('/searchmoto/{immat}', [RestAPI::class, 'searchImmatMoto'])->name('searchImmatMoto');
    Route::get('/getguaranties/{idcomp}/{formule}', [RestAPI::class, 'getGuarantiesFormule'])->name('getGuarantiesFormule');
});

// Page d'accueil
Route::get('/', [IndexPageController::class, 'showIndexPage'])->name('page.index');

// Pages rubrique
Route::prefix('rubrique')->group(function () {
    Route::get('/pourquoi-monassurance-ci', [RubriqueController::class, 'showWhyMonAssurance'])->name('rubrique.why-monassurance');
    Route::get('/comment-comparer', [RubriqueController::class, 'showHowToCompare'])->name('rubrique.how-to-compare');
    Route::get('/assurance-voyage', [RubriqueController::class, 'showInsuranceVoyage'])->name('rubrique.travel.insurance');
});

// MySpace avec authentification
Route::middleware(['auth.persoaccount'])->group(function () {
    Route::prefix('myspace')->group(function () {
        Route::get('/', [MySpaceController::class, 'showSpacePage'])->name('page.myspace');
        Route::post('/update-profile', [MySpaceController::class, 'UpdateProfile'])->name('page.myspace.update-profile');
        Route::post('/update-password', [MySpaceController::class, 'updateAccountPassword'])->name('page.myspace.update-password');
        Route::post('/renew-contract', [MySpaceController::class, 'renewContract'])->name('page.myspace.renewContract');
        Route::get('/loadcontrat/{id_contrat}', [MySpaceController::class, 'loadContrat'])->name('loadContrat');
    });
});

// Gestion des devis
Route::prefix('devis')->group(function () {
    Route::get('/search', [ProductPageController::class, 'showSearchPage'])->name('page.search');
    Route::post('/search', [ProductPageController::class, 'submitSearch'])->name('submit.search');

    Route::get('/automobile', [ProductPageController::class, 'showAutoQuotationPage'])->name('page.quote.auto');
    Route::get('/moto', [ProductPageController::class, 'showMotoQuotationPage'])->name('page.quote.moto');
    Route::get('/voyage', [ProductPageController::class, 'showVoyageQuotationPage'])->name('page.quote.voyage');

    Route::get('/all/{quote_id}', [ProductPageController::class, 'showDevisAllResult'])->name('showDevisAllResult');
    Route::post('/update/guarante', [ProductPageController::class, 'updateAutoFormule'])->name('updateGuaranteAssurance');

    Route::get('/pdf/{comp_id}/{quote_id}', [ProductPageController::class, 'loadDevisPDF'])->name('showDevisPDF');
    Route::get('/contrat/pdf/{comp_id}/{quote_id}', [ProductPageController::class, 'loadContratPDF'])->name('showContratPDF');
    Route::get('/voyage/pdf/{comp_id}/{quote_id}', [ProductPageController::class, 'loadDevisVoyagePDF'])->name('showDevisVoyagePDF');

    Route::get('/automobile/congrate/{id_quote}', [ProductPageController::class, 'showAutoCongratePage'])->name('page.congrate.auto');
    Route::get('/voyage/congrate/{id_quote}', [ProductPageController::class, 'showVoyageCongratePage'])->name('page.congrate.voyage');

    Route::post('/auto/getquotation', [ProductPageController::class, 'traitAutoQuotation'])->name('getQuotation');
    Route::post('/moto/getquotation', [ProductPageController::class, 'traitMotoQuotation'])->name('getMotoQuotation');
    Route::post('/voyage/getquotation', [ProductPageController::class, 'traitVoyageQuotation'])->name('getVoyageQuotation');
    Route::post('/auto/confirmquotation', [ProductPageController::class, 'ConfirmAutoQuotation'])->name('confirm.auto.quotation');
});


//Route paiements
// Route pour initier un paiement
Route::post('/payment/initiate', [PaymentController::class, 'initiatePayment'])->name('payment.initiate');

// Route pour compléter un paiement après retour de CinetPay
Route::get('/payment/complete', [PaymentController::class, 'completePayment'])->name('payment.complete');

// Route pour la notification de CinetPay
Route::post('/payment/notify', [PaymentController::class, 'notify'])->name('payment.notify');


//Home
Route::get('/home', 'App\Http\Controllers\HomeController@index')->name('home');

// Others routes
Route::get('/voyage/details/devis/{id_quote}/{id_comp}', [ProductPageController::class, 'showTravelQuoteDetails'])->name('details.quote.travel');
Route::get('/details/devis/{id_quote}/{id_comp}', [ProductPageController::class, 'showQuoteDetails'])->name('details.quote.auto');
Route::get('/automobile', [ProductPageController::class, 'showAutoPage'])->name('page.auto');
Route::get('/moto', [ProductPageController::class, 'showMotoPage'])->name('page.moto');
Route::get('/voyage', [ProductPageController::class, 'showVoyagePage'])->name('page.voyage');
Route::get('/habitation', [ProductPageController::class, 'showHabitationPage'])->name('page.habitation');

// Autres
Route::get('/details/devis-moto/{id_quote}/{id_comp}', [MySpaceController::class, 'showMotoQuoteDetails'])->name('details.quote.moto');
Route::post('/call-me', [CallMeController::class, 'requestCall'])->name('callme');
Route::get('/register', [MySpaceController::class, 'createSpace'])->name('myspace.register');

// Réinitialisation des mots de passe
Route::prefix('reset')->group(function () {
    Route::post('/password', [ResetPasswordController::class, 'resetPassword'])->name('reset.password');
    Route::get('/password/otp', [ResetPasswordController::class, 'optPage'])->name('password.otp');
    Route::post('/check/otp', [ResetPasswordController::class, 'checkPin'])->name('reset.checkpin');
    Route::get('/password/token={remember_token}', [ResetPasswordController::class, 'showResetPasswordPage'])->name('password.reset.page');
    Route::post('/update/password', [ResetPasswordController::class, 'updatePassword'])->name('reset.updatepassword');
});

// Surprise
Route::get('/surprises', "App\Http\Controllers\PagesController@surprise");
Route::post('/add/newmakecar', 'App\Http\Controllers\Quotation\AutoQuotationController@createNewCarMake')->name('auto-quote.createNewCarMake');

// Authentification
Auth::routes();
