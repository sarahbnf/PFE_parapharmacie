<?php

$host = 'localhost';
$dbname = 'parapharmacie';
$username = 'root';
$password = '';

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
} catch (PDOException $e) {
    die("Erreur : " . $e->getMessage());
}


session_start();
require_once 'connexion.php';

if (!isset($_SESSION['utilisateur_id'])) {
    echo json_encode(['success' => false, 'message' => 'Utilisateur non connecté']);
    exit;
}

$utilisateur_id = $_SESSION['utilisateur_id'];

// Calculer le total
$sql = "SELECT SUM(p.prix * pa.quantite) AS total
        FROM panier pa
        JOIN produits p ON pa.produit_id = p.id
        WHERE pa.utilisateur_id = ?";
$stmt = $conn->prepare($sql);
$stmt->execute([$utilisateur_id]);
$total = $stmt->fetchColumn();

// Insérer la commande
$sql = "INSERT INTO commandes (utilisateur_id, total) VALUES (?, ?)";
$stmt = $conn->prepare($sql);
$stmt->execute([$utilisateur_id, $total]);

// Vider le panier
$sql = "DELETE FROM panier WHERE utilisateur_id = ?";
$stmt = $conn->prepare($sql);
$stmt->execute([$utilisateur_id]);

echo json_encode(['success' => true, 'message' => 'Commande enregistrée avec succès.']);
?>
