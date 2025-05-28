<?php
session_start();
include 'config.php';
if (!isset($_SESSION['admin'])) {
    header("Location: cnxadmin.html");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nom = $_POST["nom"];
    $prix = $_POST["prix"];
    $description = $_POST["description"];
    $categorie = $_POST["categorie"];

    $sql = "INSERT INTO produits (nom, prix, description, categorie_id) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$nom, $prix, $description, $categorie]);

    header("Location: admin_produits.php");
    exit();
}
?>

<form method="post">
    Nom : <input type="text" name="nom" required><br>
    Prix : <input type="number" name="prix" step="0.01" required><br>
    Description : <textarea name="description"></textarea><br>
    Catégorie : <input type="text" name="categorie" required><br>
    <button type="submit">Ajouter</button>
</form>
