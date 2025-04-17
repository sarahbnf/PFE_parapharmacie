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