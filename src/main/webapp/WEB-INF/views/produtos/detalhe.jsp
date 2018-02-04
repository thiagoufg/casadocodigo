<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html class="no-js" lang="pt">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>${produto.titulo}</title>
</head>

<c:url value="/shopping" var="shoppingCartUrl" />
<body class="produto">

	<a href='<c:url value="/carrinho"/>'>Seu carrinho (${carrinhoCompras.quantidade })</a>

	<article id="${produto.id}" itemscope itemtype="http://schema.org/Book">
		<header id="produto-highlight" class="clearfix">
			<div id="produto-overview" class="container">
				<img itemprop="image" width="280px" height="395px" src='http://cdn.shopify.com/s/files/1/0155/7645/produtos/cover-apis-java_large.jpeg?v=1423244220' class="produto-featured-image" alt="${produto.titulo}">
				<h1 class="produto-title" itemprop="name">${produto.titulo}</h1>
				<p class="produto-author">
					<span class="produto-author-link"></span>
				</p>

				<p itemprop="descricao" class="book-descricao">
					${produto.descricao}<br/>
					 Veja o <a href="<c:url value='/${produto.sumarioPath}'/>" target="_blank">sum&#225;rio</a> completo do livro!
				</p>
			</div>
		</header>
		
		<section class="buy-options clearfix">
			<form:form action='/casadocodigo/carrinho/add' method="post" class="container">
				<input type="hidden" value="${produto.id}" name="produtoId"/>
				<ul id="variants" class="clearfix">
					<c:forEach items="${produto.precos}" var="preco">
						<li class="buy-option">
							<input type="radio" name="tipo" id="${produto.id}-${preco.tipo}"
								value="${preco.tipo}" ${preco.tipo.name() == 'COMBO' ? 'checked' : ''}>
							 
							<label class="variant-label" for="${produto.id}-${preco.tipo}"> 
								${preco.tipo}
							</label>
							<p class="variant-preco">${preco.valor}</p>
						</li>
					</c:forEach>
				</ul>

				<input type="submit" class="submit-image icon-basket-alt" alt="Compre agora" title="Compre agora '${produto.titulo}'!" value="comprar"/>
			</form:form>
		</section>

		<div class="container">
			<section class="author produto-detail" itemprop="author" itemscope itemtype="http://schema.org/Person">
				<h2 class="section-title" itemprop="name">${produto.titulo}</h2>
				<span itemprop="descricao">
					<p class="book-descricao">${produto.descricao}</p>
				</span>
			</section>
			<section class="data produto-detail">
				<h2 class="section-title">Sumário</h2>
				<p>
					<a href="#">Veja o sumário</a>
				</p>
			</section>
			<section class="data produto-detail">
				<h2 class="section-title">Dados do livro:</h2>
				<p>
					Número de paginas: <span itemprop="paginas">${produto.paginas}</span>
				</p>
				<p>
					Data de publicação: <span itemprop="paginas"><fmt:formatDate pattern="dd/MM/yyyy" value="${produto.dtLancamento.time}"/></span>
				</p>

				<p></p>
			</section>
		</div>
	</article>

</body>
</html>