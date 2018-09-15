
	var resultado=document.getElementById("resultado-ajax");

	

	function mostrar_preguntas(preci){
		alert(preci);
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp=new XMLHttpRequest();
		}else{
			xmlhttp=new ActiveXObject("microsoft.XMLHTTP");
		}

		
			xmlhttp.onreadystatechange=function(){
				if (this.readyState===4 && this.status===200) {
					resultado.innerHTML=this.responseText;
				}
			}
			
		xmlhttp.open("GET","preguntasNuevas.jsp?res="+preci+"",true);
		xmlhttp.send();
	}






 
  
