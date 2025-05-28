// Fonction pour ajouter un produit au panier
function ajouterAuPanier(id, nom, prix, quantite = 1) {
    fetch('panier.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: `action=ajouter&id=${encodeURIComponent(id)}&nom=${encodeURIComponent(nom)}&prix=${encodeURIComponent(prix)}&quantite=${encodeURIComponent(quantite)}`
    })
    .then(response => response.json())
    .then(data => {
        console.log(data.message);
        mettreAJourNombreArticles();
        alert("Produit ajouté au panier !");
    })
    .catch(error => {
        console.error('Erreur lors de l\'ajout au panier :', error);
    });
}

// Fonction pour mettre à jour le compteur du panier
function mettreAJourNombreArticles() {
    fetch('panier.php')
        .then(res => res.json())
        .then(data => {
            const count = data.length;
            document.getElementById('cart-count').textContent = `(${count})`;
        });
}

// Initialiser le compteur au chargement de la page
document.addEventListener('DOMContentLoaded', () => {
    if (document.getElementById('cart-count')) {
        mettreAJourNombreArticles();
    }
});
