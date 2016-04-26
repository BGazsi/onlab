<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">

<script src="jquery-1.12.3.min.js"></script>
<script src="admin.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Önlab admin</title>

</head>

<sql:setDataSource dataSource="jdbc/BGazsi"   />

<body>
  <h1>Hello ${pageContext.request.userPrincipal.name}!</h1>
  <div class="table-responsive">
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
	       
	    </tbody>
	  </table>
	  <div id="forms"></div>
	</div>
</body>

</html>
