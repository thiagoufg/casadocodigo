<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<c:url value="/" var="contextPath" />
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<title>Livros de Java, SOA, Android, iPhone, Ruby on Rails e
	muito mais - Casa do Código</title>
<c:url value="/resources/css" var="cssPath" />
<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" />
<link rel="stylesheet" href="${cssPath}/bootstrap-theme.min.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/cabecalho.jsp" %>

	<section class="container middle">
		<h2 id="cart-title">Seu carrinho de compras
			(${carrinhoCompras.quantidade})</h2>


		<table id="cart-table">
			<colgroup>
				<col class="item-col" />
				<col class="item-price-col" />
				<col class="item-quantity-col" />
				<col class="line-price-col" />
				<col class="delete-col" />
			</colgroup>
			<thead>
				<tr>
					<th class="cart-img-col"></th>
					<th width="65%">Item</th>
					<th width="10%">Preço</th>
					<th width="10%">Quantidade</th>
					<th width="10%">Total</th>
					<th width="5%"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${carrinhoCompras.itens }" var="item">
					<tr>
						<td class="cart-img-col"><img
							src="http://cdn.shopify.com/s/files/1/0155/7645/products/css-eficiente-featured_large.png?v=1435245145"
							width="71px" height="100px" /></td>
						<td class="item-title">${item.produto.titulo }</td>
						<td class="numeric-cell">${item.getPreco() }</td>
						<td class="quantity-input-cell"><input type="number" min="0"
							id="quantidade" name="quantidade"
							value="${carrinhoCompras.getQuantidade(item) }" /></td>
						<td class="numeric-cell">${carrinhoCompras.getTotal(item) }</td>
						<form action="${s:mvcUrl('CCC#remover').arg(0,item.produto.id).arg(1,item.tipoPreco).build()}" method="post">
							<td class="remove-item"><input type="image"
								src="${contextPath }resources/imagens/excluir.png" alt="Excluir"
								title="Excluir" /></td>
						</form>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<form action='${s:mvcUrl("PC#finalizar").build()}' method="post">
						<td colspan="3"><input type="submit" class="checkout"
							name="checkout" value="Finalizar compra" /></td>
	
						<td class="numeric-cell">${carrinhoCompras.getTotal() }
					</form>
					</td>
					<td></td>
				</tr>
			</tfoot>
		</table>

	</section>

	<%@ include file="/WEB-INF/views/rodape.jsp" %>
</body>
</html>