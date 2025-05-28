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

  document.addEventListener('DOMContentLoaded', () => {
    fetch('backend/panier.php')
        .then(res => res.json())
        .then(data => {
            if (data.success) {
                const container = document.getElementById('cart-items');
                const totalEl = document.getElementById('total-price');
                let total = 0;

                data.panier.forEach(item => {
                    const div = document.createElement('div');
                    div.innerHTML = `
                        <p>${item.nom} - ${item.prix} € x ${item.quantite}</p>
                    `;
                    container.appendChild(div);
                    total += item.prix * item.quantite;
                });

                totalEl.textContent = total.toFixed(2) + ' €';
            } else {
                alert(data.message);
            }
        });

    // Passer la commande
    document.getElementById('checkout').addEventListener('click', () => {
        fetch('backend/commander.php', { method: 'POST' })
            .then(res => res.json())
            .then(data => {
                alert(data.message);
                if (data.success) location.reload();
            });
    });

    // Vider le panier (optionnel si tu veux)
    document.getElementById('clear-cart').addEventListener('click', () => {
        fetch('backend/vider_panier.php', { method: 'POST' })
            .then(res => res.json())
            .then(data => {
                alert(data.message);
                if (data.success) location.reload();
            });
    });
});
