<div>
    <ul class="cases-filter-nav animate fadeInUp">
        <li><a href="#" class="selected" data-filter=".devis">Devis</a></li>
        <li><a href="#" data-filter=".contrats">Contrats/Police</a></li>
        <li><a href="#" data-filter=".docs">Documents</a></li>
        <a href="{{ $newDevisRoute }}"><i class="fa fa-plus"></i>Nouveau dévis</a>
    </ul>

    <ul id="cases-container" class="cases-container">
        {{-- Contrats --}}
        <li class="entry contrats" style="width:100%">
            @if(isset($contrats) && count($contrats) > 0)
            <table class="table table-striped table-hover datatable_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Commande</th>
                        <th>Compagnie</th>
                        <th>Date</th>
                        <th>Echeance</th>
                        <th>Paiement</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($contrats as $key => $c)
                    <tr style="{{ strtotime(date('Y-m-d')) >= strtotime($c->expire) ? 'background:#da565d' : 'background:#85e75e' }}">
                        <td>{{ ++$key }}</td>
                        <td>
                            <a target="_blank" href="{{ route($detailRoute, [$c->qid, $c->comp_id]) }}">
                                {{ $c->number_n }}<br />
                                {{ $c->firstname . ' ' . $c->lastname }}
                            </a>
                        </td>
                        <td>{{ $c->compname }}</td>
                        <td>{{ date('d/m/Y', strtotime($c->created_at)) }}</td>
                        <td>
                            @if($c->is_payed)
                                {{ date('d/m/Y', strtotime($c->expire)) . ' 23:59:59' }}
                            @else
                                {{ number_format($c->inbox_amount, 2) }} FCFA
                            @endif
                        </td>
                        <td>
                            @if(!$c->is_payed)
                                <form action="{{ route('payment.initiate') }}" method="POST" style="display:inline;">
                                    @csrf
                                    <input type="hidden" name="quote_id" value="{{ $c->qid }}">
                                    <button type="submit" class="btn btn-primary btn-sm">Payer</button>
                                </form>
                            @else
                                <span class="badge badge-success">Payé</span>
                            @endif
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            @else
            @endif
        </li>

        {{-- Dévis --}}
        <li class="entry devis">
            @if(isset($devis) && count($devis) > 0)
            <table class="table table-bordered table-striped table-hover datatable_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Commande</th>
                        <th>Date</th>
                        <th>
                            Echeance/Montant
                        </th>
                        <th>Paiement</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($devis as $key => $d)
                        @if($d->inbox_amount == null)
                            @else

                            @if($d->product_type == 3) {{-- Devis voyage --}}

                            @else {{-- Devis auto/moto --}}
                                <?php
                                    $today = date('Y-m-d');
                                    $expire = date('Y-m-d', strtotime($d->releasedate . "+$d->nbmois months -1 days"));
                                    if(strtotime($today) >= strtotime($expire)){
                                        echo "style='background:#da565d'";
                                    } else{ }
                                ?>
                            @endif

                            <tr>
                                <td>{{ ++$key }}</td>
                                <td>
                                    <a target="_blank" href="{{ ($d->company_id == 0) ? route($allDevisRoute, $d->qid) : route($detailRoute, [$d->qid, $d->company_id]) }}">
                                        {{ $d->number_n }}<br />
                                        {{ $d->firstname . ' ' . $d->lastname }}
                                    </a>
                                </td>
                                <td>{{ date('d/m/Y', strtotime($d->created_at)) }}</td>
                                <td>
                                    @if($d->is_payed)
                                        {{date('d/m/Y', strtotime($expire ))}} ({{ $d->nbmois }} mois)
                                    @else
                                        {{ number_format($d->inbox_amount,) }} FCFA
                                    @endif
                                </td>
                                <td>
                                    @if(!$d->is_payed)
                                        <form action="{{ route('payment.initiate') }}" method="POST" style="display:inline;">
                                            @csrf
                                            <input type="hidden" name="quote_id" value="{{ $d->qid }}">
                                            <button type="submit" class="btn btn-primary btn-sm" data-text="Payer" >Payer</button>
                                        </form>
                                    @else
                                        <span class="bg-success badge badge-success">Payé</span>
                                    @endif
                                </td>
                            </tr>
                        @endif
                    @endforeach
                </tbody>
            </table>
            @else
            @endif
        </li>
    </ul>
</div>

