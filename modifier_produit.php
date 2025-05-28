<?php
session_start();
include 'config.php';
if (!isset($_SESSION['admin'])) {
    header("Location: admin_login.html");
    exit();
}

$id = $_GET["id"];
$stmt = $conn->prepare("SELECT * FROM produits WHERE id = ?");
$stmt->execute([$id]);
$produit = $stmt->fetch();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nom = $_POST["nom"];
    $prix = $_POST["prix"];
    $description = $_POST["description"];
    $categorie = $_POST["categorie"];

    $stmt = $conn->prepare("UPDATE produits SET nom = ?, prix = ?, description = ?, categorie_id = ? WHERE id = ?");
    $stmt->execute([$nom, $prix, $description, $categorie, $id]);

    header("Location: admin_produits.php");
    exit();
}
?>

<form method="post">
    Nom : <input type="text" name="nom" value="<?= htmlspecialchars($produit['nom']) ?>" required><br>
    Prix : <input type="number" name="prix" value="<?= $produit['prix'] ?>" step="0.01" required><br>
    Description : <textarea name="description"><?= htmlspecialchars($produit['description']) ?></textarea><br>
    Catégorie : <input type="text" name="categorie" value="<?= htmlspecialchars($produit['categorie']) ?>" required><br>
    <button type="submit">Modifier</button>
</form>
