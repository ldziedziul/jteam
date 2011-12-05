<%@ page import="org.jteam.Author" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'author.label', default: 'Author')}"/>
  <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label"
                                                                         args="[entityName]"/></g:link></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label"
                                                                             args="[entityName]"/></g:link></span>
</div>

<div class="body">
  <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${authorInstance}">
    <div class="errors">
      <g:renderErrors bean="${authorInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${authorInstance?.id}"/>
    <g:hiddenField name="version" value="${authorInstance?.version}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="firstname"><g:message code="author.firstname.label" default="Firstname"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: authorInstance, field: 'firstname', 'errors')}">
            <g:textField name="firstname" value="${authorInstance?.firstname}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="lastname"><g:message code="author.lastname.label" default="Lastname"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: authorInstance, field: 'lastname', 'errors')}">
            <g:textField name="lastname" value="${authorInstance?.lastname}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="nip"><g:message code="author.nip.label" default="Nip"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: authorInstance, field: 'nip', 'errors')}">
            <g:textField name="nip" value="${authorInstance?.nip}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="age"><g:message code="author.age.label" default="Age"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: authorInstance, field: 'age', 'errors')}">
            <g:textField name="age" value="${fieldValue(bean: authorInstance, field: 'age')}"/>
          </td>
        </tr>

        </tbody>
      </table>
    </div>

    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" action="update"
                                           value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
      <span class="button"><g:actionSubmit class="delete" action="delete"
                                           value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
