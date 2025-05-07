<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#automobile" aria-controls="automobile" role="tab" data-toggle="tab">Automobile</a></li>
    <li role="presentation"><a href="#moto" aria-controls="moto" role="tab" data-toggle="tab">Moto</a></li>
    <li role="presentation"><a href="#voyage" aria-controls="voyage" role="tab" data-toggle="tab">Voyage</a></li>
</ul>

<div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="automobile">
        @include('app.frontend.partials.myspace.devis-section', [
            'title' => 'Automobile',
            'contrats' => $contrats_auto,
            'devis' => $devis_auto,
            'newDevisRoute' => route('page.quote.auto'),
            'detailRoute' => 'details.quote.auto',
            'allDevisRoute' => 'showDevisAllResult'
        ])
    </div>

    <div role="tabpanel" class="tab-pane" id="moto">
        @include('app.frontend.partials.myspace.devis-section', [
            'title' => 'Moto',
            'contrats' => $contrats_moto,
            'devis' => $devis_moto,
            'newDevisRoute' => route('page.quote.moto'),
            'detailRoute' => 'details.quote.auto',
            'allDevisRoute' => 'showDevisAllResult'
        ])
    </div>

    <div role="tabpanel" class="tab-pane" id="voyage">
        @include('app.frontend.partials.myspace.devis-section', [
            'title' => 'Voyage',
            'contrats' => $contrats_voyage,
            'devis' => $devis_voyage,
            'newDevisRoute' => route('page.quote.voyage'),
            'detailRoute' => 'details.quote.travel',
            'allDevisRoute' => 'showDevisAllResult'
        ])
    </div>
</div>
