<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="resultados.css"/>
				<link rel="stylesheet" type="text/css" href="../style.css"/>
				<link rel="shortcut icon" href="imagenes/logo.png"/>
				<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"/>
				<title>Resultados</title>
			</head>
			<header>
				<div class="brand">
					<span class="logo"><img src="../imagenes/logo.png"/></span>
					<h1>D-TEK</h1>
				</div>
				<span class="fas fa-bars" id="menuIcon" onclick="toggle()"></span>
				<div class="navbar" id="nav">
					<ul>
						<li>
							<span class="fas fa-home" id="headIcon"></span>
							<a href="../inicio.html" id="headtitle">Inicio</a>
						</li>
						<li>
							<span class="fas fa-hand-paper" id="headIcon"></span>
							<a href="../nosotros.html" id="headtitle">Nosotros</a>
						</li>
						<li>
							<span class="fas fa-book-open" id="headIcon"></span>
							<a href="../productos.html" id="headtitle">Productos</a>
						</li>
						<li class="active">
							<span class="far fa-user-circle" id="headIcon"></span>
							<a href="../clientes3.html">Clientes</a>
						</li>
						<li class="ultima">
							<span class="fas fa-question-circle" id="headIcon"></span>
							<a href="../preguntas.html" id="headtitle">Preguntas</a>
						</li>
					</ul>
				</div>
			</header>
			<body class="resultados"> 
				<h1 class="title">DIAGNÓSTICO</h1>
				<a href="../clientes3.html" class="volver"><span class="fas fa-arrow-left"></span></a>
				<br/>
					<table>
						<tr>
							<th><b>ID PACIENTE</b></th>
							<th><b>ESPECIALISTA</b></th>
							<th><b>FECHA DE DIAGNÓSTICO</b></th>
							<th><b>RESULTADO</b></th>
							<th class="imagen"><b>IMÁGEN</b></th>
						</tr>
						<xsl:for-each select="Página_web/Cliente/Usuario/Diagnóstico">
							<tr> 
								<td><xsl:value-of select="ID_paciente"/></td>
								<td><xsl:value-of select="concat(../Nombre/Médico, ' ',../Nombre/Apellidos)"/></td>
								<td><xsl:value-of select="Fecha_del_diagnóstico"/></td>
								<xsl:choose>
									<xsl:when test="Resultado_de_diagnóstico[Resultado = 'Con tumor'] or Resultado_de_diagnóstico[Resultado = 'Sin tumor']">  
										<td><xsl:value-of select="Resultado_de_diagnóstico/Resultado"/></td>
									</xsl:when>	
									<xsl:otherwise>
										<td class="sin-resultado">*<xsl:value-of select="Resultado_de_diagnóstico/Resultado"/>*</td>
									</xsl:otherwise>										
								</xsl:choose>
								<td>
									<figure>
										<xsl:element name="img">
											<xsl:attribute name="src">
												<xsl:value-of select="Resultado_de_diagnóstico/Gráfico/@imagen"/>
											</xsl:attribute>
										</xsl:element>
									</figure>
								</td>
							</tr>
						</xsl:for-each>
					</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>