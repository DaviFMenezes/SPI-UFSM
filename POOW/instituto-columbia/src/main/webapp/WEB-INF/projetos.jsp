
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/projetos.css?v=2'/>">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
</head>

<body>
<div class="page-wrapper">
  <jsp:include page="/WEB-INF/includes/header.jsp" />
  <c:choose>
    <c:when test="${param.msg == 'salvo'}">
      <div class="msg">Projeto cadastrado!</div>
    </c:when>
    <c:when test="${param.msg == 'excluido'}">
      <div class="msg">Projeto excluído!</div>
    </c:when>
    <c:when test="${param.msg == 'editado'}">
      <div class="msg">Projeto atualizado!</div>
    </c:when>
  </c:choose>
  <div class="container">
    <div class="card">
      <h2>Lista de Projetos</h2>
      <table>
        <tr>
          <th>#</th>
          <th>ID</th>
          <th>Título</th>
          <th>Descrição</th>
          <th>Categoria</th>
          <th>Imagem</th>
          <th>Data de Início</th>
          <th>Data de Término</th>
          <th>ID do Criador</th>
          <th>Ações</th>
        </tr>
        <c:forEach var="p" items="${projetos}" varStatus="status">
          <tr>
            <td>${status.index + 1}</td>
            <td>${p.id}</td>
            <td>${p.titulo}</td>
            <td>${p.descricao}</td>
            <td>${p.categoria}</td>
            <td>${p.imagemUrl}</td>
            <td>${p.dataInicio}</td>
            <td>${p.dataTermino}</td>
            <td>${p.id_usuario}</td>
            <td>
              <a href="projeto?acao=editar&id=${p.id}">Editar</a>
              <a href="projeto?acao=excluir&id=${p.id}" onclick="return confirm('Excluir?')">Excluir</a>
            </td>
          </tr>
        </c:forEach>
      </table>
    </div>
    <div class="card">
      <h2>Cadastrar Projeto</h2>
      <form action="projeto" method="post">

        <input type="hidden" name="id" value="${projeto.id}">
        <label>Título</label>

        <input type="text" name="titulo" value="${projeto.titulo}">
        <label>Descrição</label>

        <input type="text" name="descricao" value="${projeto.descricao}">
        <label>Categoria</label>

        <select name="categoria">
          <option value="Cultura"${projeto != null && projeto.categoria == 'Cultura' ? 'selected' : ''}>Cultura</option>
          <option value="Esporte"${projeto != null && projeto.categoria == 'Esporte' ? 'selected' : ''}>Esporte</option>
        </select>
        <label>Imagem URL</label>

        <input type="text" name="imagemUrl" value="${projeto.imagemUrl}">
        <label>Data de Início</label>

        <input type="date" name="dataInicio" value="${projeto.dataInicio}">
        <label>Data de Término</label>

        <input type="date" name="dataTermino" value="${projeto.dataTermino}">


        <button type="submit">
          ${projeto.id != null ? 'Atualizar' : 'Cadastrar'}
        </button>
      </form>
    </div>
  </div>
  <c:if test="${sessionScope.usuario.permissao == 'ADMIN'}">
    <div class="container-voltar">
      <a href="${pageContext.request.contextPath}/dashboard" class="btn-dashboard">Voltar</a>
    </div>
  </c:if>

  <jsp:include page="/WEB-INF/includes/footer.jsp" />
</div>
</body>
</html>