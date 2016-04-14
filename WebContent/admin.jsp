<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<script src="jquery-1.12.3.min.js"></script>
<script src="common.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<title>Önlap admin</title>

</head>

<sql:setDataSource dataSource="jdbc/BGazsi"   />

<body>
  <h1>Hello ${pageContext.request.userPrincipal.name}!</h1>
  <div class=table-responsive">
	  <table id="messages" width="100%" style="margin-top: 30px;" class="table table-striped">
	    <thead>
	      <tr>
	        <td width="10%">
	          <b>Törlés</b>
	        </td>
	        <td width="20%">
	          <b>Feladó</b>
	        </td>
	        <td width="70%">
	          <b>Üzenet</b>
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
		           <input type="submit" value="Törlés" form="delete-${row.id}">
		         </td>
	             <td>
	               ${row.user}
	             </td>
	             <td>
	               ${row.message}
					<form id="delete-${row.id}" style="display: none;" action="deleteMessage" method="post">
						<input type="text" name="id" value="${row.id}" />
	  				</form>
	             </td>
	           </tr>
	          </c:forEach>
	       
	    </tbody>
	  </table>
	</div>
</body>

</html>
