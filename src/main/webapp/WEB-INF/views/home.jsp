<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<!DOCTYPE html>
<html>
<head>
<c:url value="/" var="contextPath" />
<title>Livros de Java, SOA, Android, iPhone, Ruby on Rails e
	muito mais - Casa do Código</title>
<link href="${contextPath}resources/css/cssbase-min.css"
	rel="stylesheet" type="text/css" media="all" />
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

	<div id="header-content">
		<nav id="main-nav">
			<ul class="clearfix">
				<security:authorize access="isAuthenticated()">
					<li><a href="${s:mvcUrl('PC#listar').build() }" rel="nofollow">Listagem
							de Produtos</a></li>
					<li><a href="${s:mvcUrl('PC#form').build() }" rel="nofollow">Cadastro
							de Produtos</a></li>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="${s:mvcUrl('PC#listar').build() }" rel="nofollow">Listagem
							de Produtos</a></li>
					<li><a href="${s:mvcUrl('PC#form').build() }" rel="nofollow">Cadastro
							de Produtos</a></li>
				</security:authorize>
				<li><a href="/cart" rel="nofollow">Carrinho</a></li>
				<li><a href="/pages/sobre-a-casa-do-codigo" rel="nofollow">Sobre
						Nós</a></li>
			</ul>
		</nav>
	</div>


	<section id="index-section" class="container middle">

		<ul class="clearfix book-collection">

			<c:forEach items="${produtos}" var="produto">
				<li><a
					href="${s:mvcUrl('PC#detalhe').arg(0,produto.id).build() }"><small
						class="buy-button">Compre ${produto.titulo}</small> </a></li>
			</c:forEach>

		</ul>

	</section>

</body>
</html>

