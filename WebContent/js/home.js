var n_img = document.querySelectorAll('.img-per-slider img').length;
var corrente = 1;
var intervalID;

const slideContainer = document.querySelector('.slider-categories');
const cards = document.querySelectorAll('.slide-category');

let currentIndex = 0;



function next() {
	clearInterval(intervalID); // Cancella l'intervallo corrente
	var currentImg = document.getElementById('img-' + corrente);
	currentImg.classList.remove('active');
	corrente = (corrente % n_img) + 1;
	var nextImg = document.getElementById('img-' + corrente);
	nextImg.classList.add('active');
	intervalID = setInterval(next, 3500); // Imposta un nuovo intervallo
}

function prec() {
	clearInterval(intervalID); // Cancella l'intervallo corrente
	var currentImg = document.getElementById('img-' + corrente);
	currentImg.classList.remove('active');
	corrente = ((corrente - 2 + n_img) % n_img) + 1;
	var prevImg = document.getElementById('img-' + corrente);
	prevImg.classList.add('active');
	intervalID = setInterval(next, 3500); // Imposta un nuovo intervallo
}

function showCard(index) {
	cards.forEach(card => {
		card.style.transform = `translateX(-${index * 100}%)`;
	});
}

function showNextCard() {
	  if (window.innerWidth >= 768 && currentIndex === 1) {
	    currentIndex = 0;
	  } else if (currentIndex === 2) {
	    currentIndex = 0;
	  } else {
	    currentIndex = (currentIndex + 1) % cards.length;
	  }
	  showCard(currentIndex);
	}

function showPreviousCard() {
	  if (window.innerWidth >= 768 && currentIndex === 0) {
	    currentIndex = 1;
	  } else if (window.innerWidth < 768 && currentIndex === 0) {
		currentIndex = 2;  
	  } else {
	    currentIndex = (currentIndex - 1 + cards.length) % cards.length;
	  }
	  showCard(currentIndex);
	}

intervalID = setInterval(next, 3500); // Imposta l'intervallo iniziale

showCard(currentIndex);