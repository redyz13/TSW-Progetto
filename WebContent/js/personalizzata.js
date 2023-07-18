var vuota = document.getElementById("tshirt-new").src;

function changeColor() {
	let selectedColor = document.getElementById("tshirt-color").value;

	document.getElementById("tshirt-backgroundpicture").style.backgroundColor = selectedColor;
}

function addImage() {
	let selectedImage = document.getElementById("tshirt-design").value;
	document.getElementById("tshirt-new").src = selectedImage;
	document.getElementById("rmImage").style.display = 'block';

}

function rmImage() {
	let selectedImage = vuota;
	document.getElementById("tshirt-new").src = selectedImage;
	document.getElementById("rmImage").style.display = 'none';
}

function addNew() {
	var fileInput = document.getElementById("tshirt-custompicture");
	var file = fileInput.files[0];

	if (file) {
		var reader = new FileReader();
		reader.onload = function(e) {
			var newSrc = e.target.result;
			var tshirtNewElement = document.getElementById("tshirt-new");
			tshirtNewElement.setAttribute('src', newSrc);
		};
		reader.readAsDataURL(file);
		document.getElementById("rmImage").style.display = 'block';
	}
}