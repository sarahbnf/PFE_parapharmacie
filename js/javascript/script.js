var arryslide = [
  {
    title: "Basic template",
    img: "/images/caspar-camille-rubin-fPkvU7RDmCo-unsplash.jpg",
    content:
      "JavaScript est un langage de programmation de scripts principalement employé dans les pages web interactives et à ce titre est une partie essentielle des applications web. Avec les langages HTML et CSS, JavaScript est au cœur des langages  utilisés par les développeurs web. ",
  },
    {
      title: "second template",
      img: "/images/luca-bravo-XJXWbfSo2f0-unsplash.jpg",
      content:
        "JavaScript est un langage de programmation de scripts principalement employé dans les pages web interactives et à ce titre est une partie essentielle des applications web. Avec les langages HTML et CSS, JavaScript est au cœur des langages  utilisés par les développeurs web. ",
    },
    {
      title: "last template",
      img: "/images/emile-perron-xrVDYZRGdw4-unsplash.jpg",
      content:
        "JavaScript est un langage de programmation de scripts principalement employé dans les pages web interactives et à ce titre est une partie essentielle des applications web. Avec les langages HTML et CSS, JavaScript est au cœur des langages  utilisés par les développeurs web. ",
    },
  ];
  var myimg = document.getElementById("img");
  var mytitle = document.getElementById("basic");
  var mycontent = document.getElementById("par");
  
  var i = 0;
  function slidshownext() {
    myimg.src = arryslide[i].img;
    mytitle.textContent = arryslide[i].title;
    mycontent.textContent = arryslide[i].content;
  
    if (i < arryslide.length - 1) {
      i++;
    } else {
      i = 0;
    }
  }
  function slidshowpre() {
    myimg.src = arryslide[i].img;
    mytitle.textContent = arryslide[i].title;
    mycontent.textContent = arryslide[i].content;
  
    if (i > 0) {
      i--;
    } else {
      i = arryslide.length - 1;
    }
  }
  
  var inptname = document.getElementById("inptname");
  var inptemail = document.getElementById("inptemail");
  var inptpw = document.getElementById("inptpw");
  var errname = document.getElementById("errname");
  var erremail = document.getElementById("erremail");
  var errpw = document.getElementById("errpw");
  
  function validatform() {
    if (inptname.value == "" || inptname.value == null) {
      inptname.style.border = "2px solid red";
      errname.textContent = "you must write your name";
      errname.style.color = "red";
      errname.style.marginLeft = "10px";
  
      return false;
    }
    if (inptemail.value == "" || inptemail.value == null) {
      inptemail.style.border = "2px solid red";
      erremail.textContent = "you must write your email";
      erremail.style.color = "red";
      erremail.style.marginLeft = "10px";
  
      return false;
    }
    if (inptpw.value.length <= 6) {
      inptpw.style.border = "2px solid red";
      errpw.textContent = "your password must be greater than 6";
      errpw.style.color = "red";
      errpw.style.marginLeft = "10px";
  
      return false;
    } else {
      return true;
    }
  }


 var loupe=document.getElementById("search");
 function search(){
  loupe.inputMode="search";
 }
  
  