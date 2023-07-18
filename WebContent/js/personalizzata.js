let vuota = document.getElementById("tshirt-new").src;

function changeColor() {
	document.getElementById("tshirt-backgroundpicture").style.backgroundColor = document.getElementById("tshirt-color").value;
}

function addImage() {
	document.getElementById("tshirt-new").src = document.getElementById("tshirt-design").value;
	document.getElementById("rmImage").style.display = 'block';

}

function rmImage() {
	document.getElementById("tshirt-new").src = vuota;
	document.getElementById("rmImage").style.display = 'none';
}

function addNew() {
	let fileInput = document.getElementById("tshirt-custompicture");
	let file = fileInput.files[0];

	if (file) {
		let reader = new FileReader();
		reader.onload = function(e) {
			let newSrc = e.target.result;
			let tshirtNewElement = document.getElementById("tshirt-new");
			tshirtNewElement.setAttribute('src', newSrc);
		};
		reader.readAsDataURL(file);
		document.getElementById("rmImage").style.display = 'block';
	}
}