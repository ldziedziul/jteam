<%@ page import="org.jteam.Blog" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="blog.show" default="Show Blog"/></title>
</head>

<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home"/></a>
  </span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="blog.list"
                                                                         default="Blog List"/></g:link></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="blog.new"
                                                                             default="New Blog"/></g:link></span>
</div>

<div class="body">
  <h1><g:message code="blog.show" default="Show Blog"/></h1>
  <g:if test="${flash.message}">
    <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                    default="${flash.defaultMessage}"/></div>
  </g:if>
  <g:form>
    <g:hiddenField name="id" value="${blogInstance?.id}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="blog.id"
                                                   default="Id"/>:</td>

          <td valign="top" class="value">${fieldValue(bean: blogInstance, field: "id")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="blog.topic"
                                                   default="Topic"/>:</td>

          <td valign="top" class="value">${fieldValue(bean: blogInstance, field: "topic")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="blog.dateCreated"
                                                   default="Date Created"/>:</td>

          <td valign="top" class="value"><g:formatDate date="${blogInstance?.dateCreated}"/></td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="blog.author"
                                                   default="Author"/>:</td>

          <td valign="top" class="value"><g:link controller="author" action="show"
                                                 id="${blogInstance?.author?.id}">${blogInstance?.author?.encodeAsHTML()}</g:link></td>

        </tr>

        </tbody>
      </table>
    </div>

    <div class="buttons">
      <span class="button"><g:actionSubmit class="edit" action="edit"
                                           value="${message(code: 'edit', 'default': 'Edit')}"/></span>
      <span class="button"><g:actionSubmit class="delete" action="delete"
                                           value="${message(code: 'delete', 'default': 'Delete')}"
                                           onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
