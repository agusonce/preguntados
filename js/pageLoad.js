var resultado=document.getElementById("resultado-ajax");
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

		xmlhttp.open("GET","preguntasNuevas.jsp",true);
		xmlhttp.send();