<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�nlab messenger</title><!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">

<script src="jquery-1.12.3.min.js"></script>
<script src="common.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


</head>

<sql:setDataSource dataSource="jdbc/BGazsi"   />

<body>
  <div class="table-responsive">
	  <table id="messages" width="100%" style="margin-top: 30px;" class="table table-striped">
	    <thead>
	      <tr>
	        <td width="20J%">
	          <b>Felad�</b>
	        </td>
	        <td width="80%">
	          <b>�zenet</b>
	        </td>
	      </tr>
	    </thead>
	    <tbody>
	       <sql:query var="qryMsgs" >
	                SELECT id, user, message FROM messages;
	        </sql:query>
	        
	        <c:forEach var="row" items="${qryMsgs.rows}">
	           <tr>
	             <td>
	               ${row.user}
	             </td>
	             <td>
	               ${row.message}
	             </td>
	           </tr>
	          </c:forEach>
	    </tbody>
	 </table>
  </div>
  <form action="sendMessage" method="post">
    <input type="text" name="user" style="display: none;" value="${pageContext.request.userPrincipal.name}"/>
    <textarea name="message" rows="8" cols="40" placeholder="�rd ide az �zeneted!" required></textarea>
    <input class="btn btn-default" type="submit" name="button" value="Elk�ld" />
  </form>
</body>

</html>
