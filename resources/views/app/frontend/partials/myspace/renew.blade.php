<div>
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#automobile2" aria-controls="automobile2" role="tab" data-toggle="tab">Automobile</a></li>
    </ul>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="automobile2">
            <form id="form_renew_auto" class="form-horizontal" method="post" action="{{ route('page.myspace.renewContract') }}">
                {{ csrf_field() }}
                <div class="form-group">
                    <label>Mes contrats</label>
                    <select class="form-control" onchange="loadContrat(this.value)" name="list_contrat_auto" id="list_contrat_auto">
                        <option>Choisir un contrat à renouveler</option>
                        @foreach($contrats_auto as $key => $c)
                        <option value="{{ $c->qid }}">{{ $c->number_n }} - {{ $c->firstname . ' ' . $c->lastname }}</option>
                        @endforeach
                    </select>
                </div>

                {{-- Formulaire de renouvellement --}}
                <div id="renew-details" style="display:none">
                    @include('app.frontend.partials.myspace.renew-details')
                </div>
            </form>
        </div>
    </div>
</div>
