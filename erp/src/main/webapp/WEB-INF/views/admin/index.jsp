<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>
<div class="jumbotron" id="subNav">
	<font size="6">받은 쪽지함</font> - 쪽지 기능을 수행할 수 있습니다.
</div>
<div class="container">
<table class="table table-striped">
	
    <thead>
        <tr>
            <th>User</th>
            <th>Roles</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="user" items="${ users }">
            <tr>
                <td>${ user.email }</td>
                <td>
                    <c:forEach var="authority" items="${ user.authorities }">
                        ${ authority.authority }
                    </c:forEach>
                </td>
                  <td>
                    <p>
                        <c:url var="changeRolePath" value="/admin/role/${ user.id }" />
                        <a href="${ changeRolePath }/admin" class="btn btn-default <c:if test="${ user.hasRole('ADMIN') }">btn-primary</c:if>">관리자</a>
                        <a href="${ changeRolePath }/manager" class="btn btn-default <c:if test="${ user.hasRole('MANAGER') }">btn-primary</c:if>">매니저</a>
                        <a href="${ changeRolePath }/user" class="btn btn-default <c:if test="${ user.hasRole('USER') }">btn-primary</c:if>">사용자</a>
                    </p>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>