<%@ page import="java.util.Collection" %>
<%@ page import="java.math.RoundingMode" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="model.maglietta.MagliettaBean" %>

<% Collection<?> magliette = (Collection<?>) request.getAttribute("magliette");
  if (magliette == null)
    response.sendRedirect("./Home");
%>

<!DOCTYPE html>
<html lang="it">
	<head>
	  <meta charset="UTF-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <link rel="stylesheet" href="css/home.css">
	  <title>Home</title>
	</head>

	<body>
		<%@ include file="pages/header.jsp"%>
		<div class="container">
			<div class="slider-button-container">
				<button class="left" onclick="prec()"><img class="negative" src="${pageContext.request.contextPath}/images/system/arrow-left.png" alt="Precedente"></button>
				<button class="right" onclick="next()"><img class="negative" src="${pageContext.request.contextPath}/images/system/arrow-right.png" alt="Successivo"></button>
			</div>
	
			<div class="slider">
				<div class="img-per-slider">
					<img id="img-1" class="active" src="${pageContext.request.contextPath}/images/system/adv/adv-1.png" data-value="naruto" alt="Naruto image">
					<img id="img-2" src="${pageContext.request.contextPath}/images/system/adv/adv-2.png" data-value="garfield" alt="Garfield image">
					<img id="img-3" src="${pageContext.request.contextPath}/images/system/adv/adv-3.png" data-value="marvel" alt="Marvel image">
					<img id="img-4" src="${pageContext.request.contextPath}/images/system/adv/adv-4.png" data-value="personalizzata" alt="Custom image">
				</div>
			</div>

		</div>
		


		<h1 class="cat-Title"><a href="${pageContext.request.contextPath}/Catalogo?ordine=tipo">Le nostre categorie</a></h1>
		
		<div class="slider-categories">
		 	<div class="slide-category" id="cat-1">
			 	<div class="card">
	    			<img src="${pageContext.request.contextPath}/images/system/tv-series.png" alt="Film e Serie TV" class="card-image">
	    			<div class="card-text">
	      				Film e Serie TV
	    			</div>
	  			</div>
			</div>
			<div class="slide-category" id="cat-2">
			 	<div class="card">
	    			<img src="${pageContext.request.contextPath}/images/system/manga.png" alt="Anime e Manga" class="card-image">
	    			<div class="card-text">
	      				Anime e Manga
	    			</div>
	  			</div>
			</div>
			<div class="slide-category" id="cat-3">
			 	<div class="card">
	    			<img src="${pageContext.request.contextPath}/images/system/comic.png" alt="Fumetti" class="card-image">
	    			<div class="card-text">
	      				Fumetti
	    			</div>
	  			</div>
			</div>
			<div class="slide-category" id="cat-4">
			 	<div class="card">
	    			<img src="${pageContext.request.contextPath}/images/system/girl-power.png" alt="Cirl Power" class="card-image">
	    			<div class="card-text">
	      				Girl Power
	    			</div>
	  			</div>
			</div>
		  </div>
		  
		  <div class="button-container">
			<button class="button-cat" onclick="showPreviousCard()"><img src="${pageContext.request.contextPath}/images/system/arrow-left.png" alt="Precedente"></button>
			<button class="button-cat" onclick="showNextCard()"><img src="${pageContext.request.contextPath}/images/system/arrow-right.png" alt="Successivo"></button>
		  </div>
		  <h1 class="cat-Title"><a href="${pageContext.request.contextPath}/Catalogo">I nostri prodotti</a></h1>
		  <div class="magliette">
		    <%
		      if (magliette != null && magliette.size() != 0) {
		        DecimalFormat df = new DecimalFormat("#.##");
		        df.setRoundingMode(RoundingMode.FLOOR);
				
		        // Stampa primi 10 del catalogo
		        int i = 0;
		        for (Object o : magliette) {
		          i++;
		          if (i <= 10) {
			          MagliettaBean maglietta = (MagliettaBean) o;
			          String prezzo = df.format(maglietta.getPrezzo());
			
			          if (prezzo.matches("[0-9]+"))
			            prezzo += ".00";
		    %>
		    	<div class="elemento">
			    	<table class="dettagli">
						<caption hidden>Catalogo</caption>
						<tr hidden>
							<th>Grafica</th>
							<th>Descrizione</th>
							<th>Bottoni</th>
						</tr>
			    		<tr>
			    			<td colspan="2" class="maglietta">
								<a href="${pageContext.request.contextPath}/DescrizioneMaglietta?id=<%= maglietta.getID() %>">
								  <img src="<%= maglietta.getGrafica() %>" alt="<%= maglietta.getNome() %>"></a>
			    			</td>
			    		</tr>
			    		<tr>
				    		<td colspan="2">
				    			<%= maglietta.getTipo() %><br>
				    			<%= maglietta.getNome() %><br>
				    			&euro;&nbsp;<%= prezzo %> + <%= maglietta.getIVA() %> &percnt; IVA<br>
				    			Colore: <%= maglietta.getColore() %> <br>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td class="bottoni" colspan="2">
				    			<form action="DescrizioneMaglietta" method="GET">
				          			<input type="hidden" name="id" value="<%= maglietta.getID() %>">
				          			<button class="btn-shine button" type="submit">
			    						<span>Mostra Descrizione</span>
										<script src="https://cdn.lordicon.com/bhenfmcm.js" integrity="sha384-VY539ll5TIagHE4WlmKaJKJ4gKxfKtGxK0MgVqVuFG4RXvATOK4KWfapoPR/PE9K" crossorigin="anonymous"></script>
										<lord-icon src="https://cdn.lordicon.com/msoeawqm.json" trigger="hover" colors="primary:#1663c7,secondary:#f24c00" stroke="120"></lord-icon>
									</button>
				        		</form>
				        		<p style="font-size:2%">&nbsp;</p>
				        		<form action="AggiungiMaglietta" method="POST">
				          			<input type="hidden" name="ID" value="<%= maglietta.getID() %>">
				         			<button class="btn-shine button" type="submit">
			    						<span>Aggiungi al carrello</span>
										<script src="https://cdn.lordicon.com/bhenfmcm.js" integrity="sha384-VY539ll5TIagHE4WlmKaJKJ4gKxfKtGxK0MgVqVuFG4RXvATOK4KWfapoPR/PE9K" crossorigin="anonymous"></script>
										<lord-icon src="https://cdn.lordicon.com/dnoiydox.json" trigger="hover" colors="primary:#1663c7,secondary:#f24c00" stroke="85"></lord-icon>
									</button>
									<span class="taglie">
									<label><select name="taglia" class="button2" id="size" required>
										  <option value="XS" selected>XS</option>
										  <option value="S">S</option>
										  <option value="M">M</option>
										  <option value="L">L</option>
										  <option value="XL">XL</option>
										  <option value="XXL">XXL</option>
									  </select></label>
									</span>
				        		</form>
				    		</td>
			    		</tr>
			    	</table>
		    	</div>
		    <%
		      // Parentesi del for e dell'if
		          } } } else {
		    %>
		    <p class="niente">Nessun prodotto disponibile</p>
		    <script src="https://cdn.lordicon.com/bhenfmcm.js" integrity="sha384-VY539ll5TIagHE4WlmKaJKJ4gKxfKtGxK0MgVqVuFG4RXvATOK4KWfapoPR/PE9K" crossorigin="anonymous"></script>
			<lord-icon
			    src="https://cdn.lordicon.com/imamsnbq.json"
			    trigger="loop"
			    delay="1500"
			    colors="primary:#000000,secondary:#000000"
			    stroke="85"
			    style="width:25%;height:25%">
			</lord-icon>
		    <% } %>
		 </div>
		
		<script src="${pageContext.request.contextPath}/js/home.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha384-UG8ao2jwOWB7/oDdObZc6ItJmwUkR/PfMyt9Qs5AwX7PsnYn1CRKCTWyncPTWvaS" crossorigin="anonymous"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				for(let ii = 1; ii < 5; ii ++ ){
					let searchInput = document.getElementById("img-"+i);
					searchInput.addEventListener("click", function () {
						let searchQuery = searchInput.value;
						let divRisultati = document.getElementById("risultati");
						if(searchQuery !== "" && searchQuery !== " ") {
							$(divRisultati).css("display", "block")
							$.ajax ({
								url: '${pageContext.request.contextPath}/SearchBar',
								type: 'POST',
								data: {search: searchQuery},
								success: function (data) {
									divRisultati.innerHTML = " "
									let jsonarray = eval(data);
									console.log(jsonarray);
									if(data.length > 0) {
										 for (let i = 0; i < jsonarray.length; i++) {
											  let obj = jsonarray[i];
											  divRisultati.innerHTML += '<td>' +'<a href="DescrizioneMaglietta?id='+ obj.ID + '">' + '<img class ="search-img" src="' + obj.grafica + '" alt="'+ obj.nome +'">' +'</a>' +'</td>';
										 }
									}
									else {
										 divRisultati.innerHTML = '<p class="nessun-articolo">'+ 'Nessun risultato trovato'+ '</p>';
									}
								},
								error: function() {
									console.log("errore");
								}
							})
						}
						else {
							$(divRisultati).css("display", "none")
						}
					})
				}
			})
		</script>
		<%@ include file="pages/footer.jsp"%>
	</body>

</html>
