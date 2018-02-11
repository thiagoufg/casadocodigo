<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="Livros de Java, Android, IOs, Mobile e muito mais...">
     
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
					<form:form action='${s:mvcUrl("PC#finalizar").build()}' method="post">
						<td colspan="3"><input type="submit" class="checkout"
							name="checkout" value="Finalizar compra" /></td>
	
						<td class="numeric-cell">${carrinhoCompras.getTotal() }
					</form:form>
					</td>
					<td></td>
				</tr>
			</tfoot>
		</table>

	</section>
    
</tags:pageTemplate>