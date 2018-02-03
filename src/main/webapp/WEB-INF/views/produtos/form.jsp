<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Livros de Java, Android, iPhone, Ruby, PHP e muito mais - Casa do Código</title>
</head>
<body>
<form:form action="${s:mvcUrl('PC#gravar').build() }" method="post" commandName="produto" enctype="multipart/form-data">
    <div>
        <label>Título</label>
        <form:errors path="titulo"/>
        <form:input path="titulo" />
    </div>
    <div>
        <label>Descrição</label>
        <form:errors path="descricao"/>
        <form:textarea rows="10" cols="20" path="descricao"/>
    </div>
    <div>
        <label>Páginas</label>
        <form:errors path="paginas"/>
        <form:input path="paginas" />
    </div>
    <div>
        <label>Data de lançamento</label>
        <form:errors path="dtLancamento"/>
        <form:input path="dtLancamento" />
    </div>
    <div>
        <label>Sumário</label>
        <input type="file" name="sumario"/>
    </div>
    <c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
        <div>
            <label>${tipoPreco}</label>
            <form:input path="precos[${status.index}].valor" />
            <form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}" />
        </div>
    </c:forEach>
    <button type="submit">Cadastrar</button>
</form:form>
</body>
</html>