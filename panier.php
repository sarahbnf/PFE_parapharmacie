<?php

$host = 'localhost';
$dbname = 'ton_nom_de_bdd';
$username = 'root';
$password = '';

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
} catch (PDOException $e) {
    die("Erreur : " . $e->getMessage());
}


session_start();
header('Content-Type: application/json');

// Initialisation du panier 
if (!isset($_SESSION['panier'])) {
    $_SESSION['panier'] = [];
}

// Gérer les actions : ajouter, retirer, vider, afficher
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'] ?? '';

    if ($action === 'ajouter') {
        $id = $_POST['id'];
        $nom = $_POST['nom'];
        $prix = $_POST['prix'];
        $quantite = $_POST['quantite'];

        $_SESSION['panier'][$id] = [
            'id' => $id,
            'nom' => $nom,
            'prix' => $prix,
            'quantite' => $quantite
        ];

        echo json_encode(['message' => 'Produit ajouté']);
    } elseif ($action === 'vider') {
        $_SESSION['panier'] = [];
        echo json_encode(['message' => 'Panier vidé']);
    } elseif ($action === 'retirer') {
        $id = $_POST['id'];
        unset($_SESSION['panier'][$id]);
        echo json_encode(['message' => 'Produit retiré']);
    }
} else {
    // Afficher le panier
    echo json_encode(array_values($_SESSION['panier']));
}

<?php
session_start();
require_once 'connexion.php';

if (!isset($_SESSION['utilisateur_id'])) {
    echo json_encode(['success' => false, 'message' => 'Utilisateur non connecté']);
    exit;
}

$utilisateur_id = $_SESSION['utilisateur_id'];

$sql = "SELECT p.id, p.nom, p.prix, p.photo, pa.quantite 
        FROM panier pa
        JOIN produits p ON pa.produit_id = p.id
        WHERE pa.utilisateur_id = ?";
$stmt = $conn->prepare($sql);
$stmt->execute([$utilisateur_id]);
$articles = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode(['success' => true, 'panier' => $articles]);
?>
