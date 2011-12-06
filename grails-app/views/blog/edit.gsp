<%@ page import="org.jteam.Blog" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="blog.edit" default="Edit Blog"/></title>
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
  <h1><g:message code="blog.edit" default="Edit Blog"/></h1>
  <g:if test="${flash.message}">
    <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                    default="${flash.defaultMessage}"/></div>
  </g:if>
  <g:hasErrors bean="${blogInstance}">
    <div class="errors">
      <g:renderErrors bean="${blogInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${blogInstance?.id}"/>
    <g:hiddenField name="version" value="${blogInstance?.version}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="topic"><g:message code="blog.topic"
                                          default="Topic"/>:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: blogInstance, field: 'topic', 'errors')}">
            <g:textArea name="topic" rows="5" cols="40" value="${fieldValue(bean: blogInstance, field: 'topic')}"/>

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="dateCreated"><g:message code="blog.dateCreated"
                                                default="Date Created"/>:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: blogInstance, field: 'dateCreated', 'errors')}">
            <g:datePicker name="dateCreated" value="${blogInstance?.dateCreated}"/>

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="author"><g:message code="blog.author"
                                           default="Author"/>:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: blogInstance, field: 'author', 'errors')}">
            <g:select name="author.id" from="${org.jteam.Author.list()}" optionValue="fullName" optionKey="id"
                      value="${blogInstance?.author?.id}"/>

          </td>
        </tr>

        </tbody>
      </table>
    </div>

    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" action="update"
                                           value="${message(code: 'update', 'default': 'Update')}"/></span>
      <span class="button"><g:actionSubmit class="delete" action="delete"
                                           value="${message(code: 'delete', 'default': 'Delete')}"
                                           onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
