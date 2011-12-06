<%@ page import="org.jteam.Author" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'author.label', default: 'Author')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label"
                                                                             args="[entityName]"/></g:link></span>
</div>

<div class="body">
  <h1><g:message code="default.list.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="list">
    <table>
      <thead>
      <tr>

        <g:sortableColumn property="id" title="${message(code: 'author.id.label', default: 'Id')}"/>

        <g:sortableColumn property="firstname"
                          title="${message(code: 'author.firstname.label', default: 'Firstname')}"/>

        <g:sortableColumn property="lastname" title="${message(code: 'author.lastname.label', default: 'Lastname')}"/>

        <g:sortableColumn property="nip" title="${message(code: 'author.nip.label', default: 'Nip')}"/>

        <g:sortableColumn property="age" title="${message(code: 'author.age.label', default: 'Age')}"/>

      </tr>
      </thead>
      <tbody>
      <g:each in="${authorInstanceList}" status="i" var="authorInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="show"
                      id="${authorInstance.id}">${fieldValue(bean: authorInstance, field: "id")}</g:link></td>

          <td><jteam:hello>${fieldValue(bean: authorInstance, field: "firstname")}</jteam:hello></td>

          <td><jteam:hello happy="true">${fieldValue(bean: authorInstance, field: "lastname")}</jteam:hello></td>

          <td>${fieldValue(bean: authorInstance, field: "nip")}</td>

          <td>${fieldValue(bean: authorInstance, field: "age")}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>

  <div class="paginateButtons">
    <g:paginate total="${authorInstanceTotal}"/>
  </div>
</div>
</body>
</html>
