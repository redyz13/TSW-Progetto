function openPopUp() {
	let box = document.getElementsByClassName("modifica-pagamento")[0];
	box.classList.add("activeModifica");

	let overlay = document.getElementById("overlay")
	overlay.classList.add("activeOverlay");

	document.getElementById("defNav").style.backgroundColor = "transparent";
}

function closePopUp() {
	let box = document.getElementsByClassName("modifica-pagamento")[0];
	box.classList.remove("activeModifica");

	let overlay = document.getElementById("overlay");
	overlay.classList.remove("activeOverlay");

	document.getElementById("defNav").style.backgroundColor = "white";
}