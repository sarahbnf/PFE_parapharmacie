<?php 
session_start();
require_once '/config/config.php';
require_once '/config/functions.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nom = sanitize($_POST['nom']);
    $password = $_POST['password'];

    $stmt = $pdo->prepare("SELECT * FROM admins WHERE nom = ?");
    $stmt->execute([$nom]);
    $admin = $stmt->fetch();

    if ($admin && password_verify($password, $admin['password'])) {
        $_SESSION['admin_id'] = $admin['id'];
        echo "Connexion admin réussie.";
    } else {
        echo "Email ou mot de passe incorrect.";
    }
}
?>
