<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Önlab teszt</title><!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<script src="jquery-1.12.3.min.js"></script>
<script src="common.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>


</head>

<sql:setDataSource dataSource="jdbc/BGazsi"   />

<body>
  <form action="sendMessage" method="post">
    <input type="text" name="user" style="display: none;" value="${pageContext.request.userPrincipal.name}"/>
    <textarea name="message" rows="8" cols="40" placeholder="Írd ide az üzeneted!" required></textarea>
    <input class="btn btn-default" type="submit" name="button" value="Elküld" />
  </form>
  <div class=table-responsive">
	  <table id="messages" width="100%" style="margin-top: 30px;" class="table table-striped">
	    <thead>
	      <tr>
	        <td width="20J%">
	          <b>Feladó</b>
	        </td>
	        <td width="80%">
	          <b>Üzenet</b>
	        </td>
	      </tr>
	    </thead>
	    <tbody>
	       <sql:query var="qryMsgs" >
	                SELECT user, message FROM messages;
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
</body>

</html>
