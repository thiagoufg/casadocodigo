<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Livros de Java, Android, iPhone, Ruby, PHP e muito mais -
		Casa do Código</title>
	<c:url value="/resources/css" var="cssPath" />
	<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" />
	<link rel="stylesheet" href="${cssPath}/bootstrap-theme.min.css" />
	<style type="text/css">
		body {
			padding-top: 60px;
		}
	</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/cabecalho.jsp" %>
	
	<div class="container">
		<h1>Lista de Produtos</h1>
		<div>${sucesso}</div>
		<div>${falha}</div>
		<p>${message}</p>
		<table class="table table-bordered table-striped table-hover">
			<tr>
				<th>Título</th>
				<th>Descrição</th>
				<th>Páginas</th>
			</tr>

			<c:forEach items="${produtos}" var="produto">
				<tr>
					<td><a
						href="${s:mvcUrl('PC#detalhe').arg(0,produto.id).build()}">${produto.titulo}</a></td>
					<td>${produto.descricao}</td>
					<td>${produto.paginas}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<%@ include file="/WEB-INF/views/rodape.jsp" %>
</body>
</html>