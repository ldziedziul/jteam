<%@ page import="org.jteam.Blog" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="blog.list" default="Blog List"/></title>
</head>

<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home"/></a>
  </span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="blog.new"
                                                                             default="New Blog"/></g:link></span>
</div>

<div class="body">
  <h1><g:message code="blog.list" default="Blog List"/></h1>
  <g:if test="${flash.message}">
    <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                    default="${flash.defaultMessage}"/></div>
  </g:if>
  <div class="list">
    <table>
      <thead>
      <tr>

        <g:sortableColumn property="id" title="Id"
                          titleKey="blog.id"/>

        <g:sortableColumn property="topic" title="Topic"
                          titleKey="blog.topic"/>

        <g:sortableColumn property="dateCreated" title="Date Created"
                          titleKey="blog.dateCreated"/>

        <th><g:message code="blog.author" default="Author"/></th>

      </tr>
      </thead>
      <tbody>
      <g:each in="${blogInstanceList}" status="i" var="blogInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="show"
                      id="${blogInstance.id}">${fieldValue(bean: blogInstance, field: "id")}</g:link></td>

          <td>${fieldValue(bean: blogInstance, field: "topic")}</td>

          <td><g:formatDate date="${blogInstance.dateCreated}"/></td>

          <td>${fieldValue(bean: blogInstance, field: "author")}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>

  <div class="paginateButtons">
    <g:paginate total="${blogInstanceTotal}"/>
  </div>
</div>
</body>
</html>
