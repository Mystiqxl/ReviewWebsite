

/* trending slider */
    let slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
    slideIndex += n;
    showSlides(slideIndex);
    }

    function showSlides(n) {
    let i;
    let slides = document.getElementsByClassName("movies");
    let totalSlides = slides.length;


    for (i = 0; i < totalSlides; i++) {
    slides[i].style.display = "none";
    slides[i].style.order = ""; 
    }


    for (i = 0; i < 10; i++) {
    let index = (n - 1 + i) % totalSlides;
    if (index < 0) index += totalSlides;
    slides[index].style.display = "block";
    slides[index].style.order = i;
    }
    }

/* spotlight */
    let currentMovie = 0; 
    const itemsPerPage = 5;
    const totalItems = 8;

    const carousel = document.querySelector('.carousel');

    function updateCarousel() {
        const offset = -20 * currentMovie; 
        carousel.style.transform = `translateX(${offset}%)`;
    }

    function nextSlide() {
        if (currentMovie < totalItems - itemsPerPage) {
            currentMovie++; // Move to the next item
        } 
        else {
            currentMovie = 0; // Reset to the first item when we reach the last
        }
        updateCarousel();
        resetAutoScroll();
    }
    function prevSlide() {
        if (currentMovie > 0) {
            currentMovie--; // Move to the previous item
        } 
        else {
            currentMovie = totalItems - itemsPerPage; // Reset to the last set of items
        }
        updateCarousel();
        resetAutoScroll();
    }

    function startAutoScroll() {
        autoScrollTimer = setInterval(nextSlide, 4000); 
    }

    function resetAutoScroll() {
        clearInterval(autoScrollTimer);
        startAutoScroll(); 
    }

    updateCarousel();
    startAutoScroll();


// Hamburger menu 
    var isOpen = false;

    function myFunction() {
    var x = document.getElementById("Menu");

    if (isOpen == false) {
    x.classList.remove('unmove'); // Remove 'unmove' if it exists
    x.classList.add('move');     // Add 'move' class to open the menu
    isOpen = true;
    } 
  
    else {
    x.classList.remove('move');  // Remove 'move' if it exists
    x.classList.add('unmove');  // Add 'unmove' class to close the menu
    
    isOpen = false; // Toggle the state
    }
    
    }