<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="css\Style.css" type="text/css" rel="stylesheet">

<title>Login Page</title>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<script>

</script>


</head>
<body>

	<span><a href="Login.jsp?locale=in"><img alt=india
			src="image/india.jpg" width="50" height="50"></a></span>
	<span><a href="Login.jsp?locale=fr"><img alt=france
			src="image/french.jpg" width="50" height="50"></a></span>

	<header>
		<%@ include file="Header.jsp"%>
	</header>

	<fmt:setLocale value="${param['locale']}" />

	<fmt:setBundle basename="MessageResources" var="msg" scope="page" />

	<form action="FirstServlet" method="post">

		<table>
			<tr>
				<td><label><fmt:message key="forms.label.role"
							bundle="${msg }" /></label></td>
				<td><select name="role" onblur="getData()">

						<option><label><fmt:message
									key="forms.label.role.admin" bundle="${msg }" /></label></option>
						<option><label><fmt:message
									key="forms.label.role.manager" bundle="${msg }" /></label></option>
						<option><label><fmt:message
									key="forms.label.role.labtechnician" bundle="${msg }" /></label></option>
						<option><label><fmt:message
									key="forms.label.role.operator" bundle="${msg }" /></label></option>
				</select></td>
			</tr>
			<tr>
				<td><label><fmt:message key="forms.label.labcode"
							bundle="${msg }" /></label></td>
				<td><input type="text" name="labCode" id="labCode" list="lab">
					<datalist id="lab"></
					</datalist></td>

			</tr>
			<tr>
				<td><label><fmt:message key="forms.label.userId"
							bundle="${msg }" /></label></td>
				<td><input type="text" name="userId"></td>
			</tr>
			<tr>
				<td><label><fmt:message key="forms.label.passWord"
							bundle="${msg }" /></label></td>
				<td><input type="password" name="pswd"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit"
					value=<fmt:message key= "forms.button.login" bundle= "${msg }"/>></td>
			</tr>


		</table>
	</form>

	<script>
		var inputField = document.getElementById("labCode");
		var dataListField = document.getElementById("lab");
		
		var xmlhttpobject = new XMLHttpRequest();
		xmlhttpobject.open("GET","LabCode.json",true);
		
		xmlhttpobject.onreadystatechange=function(response)
		{if(xmlhttpobject.readyState == 4 && xmlhttpobject.status == 200) {
			
			var jSonOptions = JSON.parse(xmlhttpobject.responseText);
			jSonOptions.forEach(function(item){
				
				var option = document.createElement("option");
				option.value = item.Code;
				dataListField.appendChild(option);
			});
		}
	};
	xmlhttpobject.send();
		</script>
	<footer>
		<%@ include file="Footer.jsp"%>
	</footer>
</body>
</html>