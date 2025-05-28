<?php
session_start();
include 'config.php';
if (!isset($_SESSION['admin'])) {
    header("Location: cnxadmin.html");
    exit();
}

$id = $_GET["id"];
$stmt = $conn->prepare("DELETE FROM produits WHERE id = ?");
$stmt->execute([$id]);

header("Location: admin_produits.php");
exit();
