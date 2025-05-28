<?php
session_start();
require_once '/config/config.php';
require_once '/config/functions.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = sanitize($_POST['name']);
    $email = sanitize($_POST['email']);
    $adresse= sanitize($_POST['adresse']);
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $stmt = $pdo->prepare("SELECT * FROM utilisateurs WHERE email = ?");
    $stmt->execute([$email]);
    if ($stmt->rowCount() > 0) {
        echo "Email déjà utilisé.";
        exit;
    }

    $stmt = $pdo->prepare("INSERT INTO utilisateurs (name, email, adresse, password) VALUES (?, ?, ?, ?)");
    if ($stmt->execute([$name, $email, $adresse, $password])) {
        echo "Inscription réussie.";
    } else {
        echo "Erreur lors de l'inscription.";
    }
}
?>
