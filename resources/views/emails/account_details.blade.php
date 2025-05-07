<!DOCTYPE html>
<html>
<head>
    <title>Vos identifiants de connexion</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
        }
        .content {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #f9f9f9;
        }
        h3 {
            color: #4CAF50;
        }
    </style>
</head>
<body>
    <div class="content">
        <h3>Bonjour,</h3>
        <p>Merci d'avoir choisi MonAssurance. Voici vos identifiants pour accéder à votre espace personnel :</p>
        <p>
            <strong>Login :</strong> {{ $phone }}<br>
            <strong>Mot de passe temporaire :</strong> {{ $password }}
        </p>
        <p>
            Accédez à votre espace personnel à tout moment pour suivre vos devis et commandes :
            <a href="{{ route('page.myspace') }}" style="color: #4CAF50; text-decoration: none;">Mon espace personnel</a>
        </p>
        <p>Cordialement,<br>L'équipe MonAssurance</p>
    </div>
</body>
</html>
