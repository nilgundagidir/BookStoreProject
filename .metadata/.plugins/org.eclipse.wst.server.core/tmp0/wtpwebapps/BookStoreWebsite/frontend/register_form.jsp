<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>

/* The message box is shown when the user clicks on the password field */
#message {
	display: none;
	background: white;
	position: relative;
	padding: 20px;
	margin-top: 10px;
	font-style: italic;
	color: salmon;
}

#message p {
	padding: 10px 35px;
	font-size: 18px;
}

/* Add a salmon text color when the requirements are right */
.valid {
	color: salmon;
}

.valid:before {
	position: relative;
	left: -35px;

}

/* Add a crimson text color when the requirements are wrong */
.invalid {
	color: crimson;
}

.invalid:before {
	position: relative;
	left: -35px;

}
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register as a Customer</title>

<link rel="stylesheet" href="css/mycss.css">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>

</head>
<body>
	<jsp:directive.include file="header.jsp" />

	<div align="center">
		<h2 class="pageheading">Register as a Customer</h2>
	</div>

	<div align="center">
		<form action="register_customer" method="post" id="customerForm">

			<table class="form">
				<tr>
					<td align="right">E-mail:</td>
					<td align="left"><input type="text" id="email" name="email"
						size="45" /></td>
				</tr>
				<tr>
					<td align="right">Full Name:</td>
					<td align="left"><input type="text" id="fullName"
						name="fullName" size="45" /></td>
				</tr>
				<tr>
					<td align="right">Password:</td>
					<td align="left"><input type="password" id="password" name="password" size="45" /></td>
				</tr>
				<tr>
					<td align="right">Confirm Password:</td>
					<td align="left"><input type="password" id="confirmPassword"
						name="confirmPassword" size="45" /></td>
				</tr>
				<tr>
					<td align="right">Phone Number:</td>
					<td align="left"><input type="text" id="phone" name="phone"
						size="45" /></td>
				</tr>
				<tr>
					<td align="right">Address:</td>
					<td align="left"><input type="text" id="address"
						name="address" size="45" /></td>
				</tr>
				<tr>
					<td align="right">City:</td>
					<td align="left"><input type="text" id="city" name="city"
						size="45" /></td>
				</tr>
				<tr>
					<td align="right">Zip Code:</td>
					<td align="left"><input type="text" id="zipCode"
						name="zipCode" size="45" /></td>
				</tr>
				<tr>
					<td align="right">Country:</td>
					<td align="left"><input type="text" id="country"
						name="country" size="45" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<div id="message">
					<h3>Password must include:</h3>
					<p id="capital" class="invalid">
						At least one <b>UPPERCASE LETTER</b>
					</p>
					<p id="number" class="invalid">
						At least one <b>DIGIT</b>
					</p>
					<p id="special" class="invalid">
						At least one <b>SPECIAL CHARACTER</b>
					</p>
				</div>
				<tr>
					<td colspan="2" align="center">
						<button type="submit">Save</button>&nbsp;&nbsp;&nbsp; <input
						type="button" value="Cancel" id="buttonCancel">
					</td>
				</tr>
			</table>
		</form>
	</div>

	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#customerForm").validate({
			rules : {
				email : {
					required : true,
					email : true
				},
				fullName : "required",
				password : "required",

				confirmPassword : {
					required : true,
					equalTo : "#password"
				},

				phone : "required",
				address : "required",
				city : "required",
				zipCode : "required",
				country : "required",
			},

			messages : {
				email : {
					required : "Please enter e-mail address",
					email : "Please enter a valid e-mail address"
				},

				fullName : "Please enter full name",
				password : "Please enter password",

				confirmPassword : {
					required : "Please confirm password",
					equalTo : "Confirm password does not match password"
				},

				phone : "Please enter phone number",
				address : "Please enter address",
				city : "Please enter city",
				zipCode : "Please enter zip code",
				country : "Please enter country",
			}
		});

		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});
</script>
<script>
	var myInput = document.getElementById("password");
	var capital = document.getElementById("capital");
	var number = document.getElementById("number");
	var special = document.getElementById("special");

	// When the user clicks on the password field, show the message box
	myInput.onfocus = function() {
		document.getElementById("message").style.display = "block";
	}

	// When the user clicks outside of the password field, hide the message box
	myInput.onblur = function() {
		document.getElementById("message").style.display = "none";
	}

	// When the user starts to type something inside the password field
	myInput.onkeyup = function() {
		// Validate special characters
		var specialCharacters = /[ `!@#$%^&*()_+\-=\[\]{};:\\|,.<>\/?~]/;
		if (myInput.value.match(specialCharacters)) {
			special.classList.remove("invalid");
			special.classList.add("valid");
		} else {
			special.classList.remove("valid");
			special.classList.add("invalid");
		}

		// Validate capital letters
		var upperCaseLetters = /[A-Z]/g;
		if (myInput.value.match(upperCaseLetters)) {
			capital.classList.remove("invalid");
			capital.classList.add("valid");
		} else {
			capital.classList.remove("valid");
			capital.classList.add("invalid");
		}

		// Validate numbers
		var numbers = /[0-9]/g;
		if (myInput.value.match(numbers)) {
			number.classList.remove("invalid");
			number.classList.add("valid");
		} else {
			number.classList.remove("valid");
			number.classList.add("invalid");
		}
	}
</script>
</html>
