const scrollContainer = document.querySelector('.categories');
const btnLeft = document.querySelector('.scroll-btn.left');
const btnRight = document.querySelector('.scroll-btn.right');

btnLeft.addEventListener('click', () => {
  scrollContainer.scrollBy({ left: -300, behavior: 'smooth' });
});

btnRight.addEventListener('click', () => {
  scrollContainer.scrollBy({ left: 300, behavior: 'smooth' });
});




  window.addEventListener('load', () => {
    document.querySelector('.hero-content').style.animationPlayState = 'running';
    document.querySelector('.heroimg').style.animationPlayState = 'running';
  });


  const links = document.querySelectorAll('a');

  links.forEach(link => {
    link.addEventListener('click', function (e) {
      const href = link.getAttribute('href');
      if (href && href.endsWith('.html')) {
        e.preventDefault();
        document.body.classList.remove('fade-in');
        document.body.style.opacity = 1;

        document.body.style.transition = 'opacity 0.5s ease';
        document.body.style.opacity = 0;

        setTimeout(() => {
          window.location.href = href;
        }, 500);
      }
    });
  });

 // Initialise le panier depuis localStorage
let cart = JSON.parse(localStorage.getItem('cart')) || [];

// Fonction pour ajouter un produit au panier
function addToCart(name, price) {
  cart.push({ name, price });
  localStorage.setItem('cart', JSON.stringify(cart));
  updateCartCount();
}

// Mettre à jour le compteur dans le header
function updateCartCount() {
  document.getElementById('cart-count').textContent = cart.length;
}

// Ajouter les événements sur tous les boutons "Ajouter au panier"
document.querySelectorAll('.produit button').forEach(button => {
  button.addEventListener('click', function() {
    const produitDiv = this.closest('.produit');
    const productName = produitDiv.querySelector('h3').innerText;
    const productPrice = produitDiv.querySelector('p').innerText;
    addToCart(productName, productPrice);

    // Animation visuelle
    this.classList.add('animate');
    setTimeout(() => {
      this.classList.remove('animate');
    }, 400);

    alert(productName + " ajouté au panier !");
  });
});

// Afficher les produits du panier
function displayCart() {
  const cartItemsContainer = document.getElementById('cart-items');
  cartItemsContainer.innerHTML = '';

  if (cart.length === 0) {
    cartItemsContainer.innerHTML = '<p>Votre panier est vide.</p>';
    document.getElementById('total-price').textContent = '0,00 €';
    return;
  }

  let total = 0;

  cart.forEach((item, index) => {
    const itemDiv = document.createElement('div');
    itemDiv.className = 'cart-item';
    itemDiv.innerHTML = `
      <h3>${item.name}</h3>
      <p>${item.price}</p>
      <button onclick="removeItem(${index})">Supprimer</button>
    `;
    cartItemsContainer.appendChild(itemDiv);

    // Calculer le prix total
    let priceNum = parseFloat(item.price.replace(',', '.').replace('€', '').trim());
    total += priceNum;
  });

  document.getElementById('total-price').textContent = total.toFixed(2) + ' €';
}

// Supprimer un article
function removeItem(index) {
  cart.splice(index, 1);
  localStorage.setItem('cart', JSON.stringify(cart));
  displayCart();
  updateCartCount();
}

// Vider tout le panier
document.getElementById('clear-cart').addEventListener('click', function() {
  if (confirm('Êtes-vous sûr de vouloir vider votre panier ?')) {
    cart = [];
    localStorage.setItem('cart', JSON.stringify(cart));
    displayCart();
    updateCartCount();
  }
});

// Passer la commande
document.getElementById('checkout').addEventListener('click', function() {
  if (cart.length === 0) {
    alert('Votre panier est vide.');
  } else {
    alert('Merci pour votre commande !');
    cart = [];
    localStorage.setItem('cart', JSON.stringify(cart));
    displayCart();
    updateCartCount();
  }
});

// Initialisation au chargement de la page
updateCartCount();
displayCart();

//croll doux vers la section produits 
document.querySelector('.hero button').addEventListener('click', () => {
  document.querySelector('.prd').scrollIntoView({ behavior: 'smooth' });
});

