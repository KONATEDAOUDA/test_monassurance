<div class="tab-content">
    {{-- Onglet Profile --}}
    <div role="tabpanel" class="tab-pane active" id="profile">
        <form class="profile-settings" enctype="multipart/form-data" action="{{ route('page.myspace.update-profile') }}" method="post">
            {{ csrf_field() }}
            <div class="row">
                <div class="form-group col-sm-6">
                    <label for="name">Nom</label>
                    <input type="text" class="form-control" id="name" name="name" value="{{ \Illuminate\Support\Facades\Auth::guard('space_perso')->user()->name }}" required>
                </div>
                <div class="form-group col-sm-6">
                    <label for="phone">Contact</label>
                    <input type="text" readonly class="form-control" id="phone" name="phone" value="{{ \Illuminate\Support\Facades\Auth::guard('space_perso')->user()->phone_number }}" required>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-rounded btn-primary btn-sm">Modifier</button>
                        <button type="reset" class="btn btn-rounded btn-default btn-sm">Annuler</button>
                    </div>
                </div>
            </div>
        </form>
<hr>
        {{-- Onglet Mot de Passe --}}
        <div role="tabpanel" class="tab-pane" id="motdepasse">
            <form class="profile-settings" method="post" action="{{ route('page.myspace.update-password') }}">
                {{ csrf_field() }}
                <div class="row">
                    <div class="form-group col-md-12 legend">
                        <h4><strong>Paramètres</strong> de sécurité</h4>
                        <p class="text-danger">
                            <strong>Protégez votre compte en mettant à jour votre mot de passe.</strong>
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-6">
                        <label for="phone_number">N° de téléphone</label>
                        <input type="text" class="form-control" id="phone_number" name="phone_number" value="{{ \Illuminate\Support\Facades\Auth::guard('space_perso')->user()->phone_number }}" required readonly>
                    </div>
                    <div class="form-group col-sm-6">
                        <label for="currentpassword">Mot de passe actuel</label>
                        <input type="password" class="form-control" id="currentpassword" name="currentpassword" required>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-6">
                        <label for="newpassword">Nouveau mot de passe</label>
                        <input type="password" class="form-control" id="newpassword" name="newpassword" required>
                    </div>
                    <div class="form-group col-sm-6">
                        <label for="newpasswordrepeat">Confirmer le mot de passe</label>
                        <input type="password" class="form-control" id="newpasswordrepeat" name="newpasswordrepeat" required>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-rounded btn-primary btn-sm">Modifier</button>
                            <button type="reset" class="btn btn-rounded btn-default btn-sm">Annuler</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        </div>
</div>
