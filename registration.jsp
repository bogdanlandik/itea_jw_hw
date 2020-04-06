<%
// login (email) type: text    (errors emty or not email)
// name type: text     (errors not empty)
// age type: text  12~100
// address select  (check address)
// gender radiobutton (errors not empty)
// comments textarea (not empty)(check not null)
// i agree to install AmigoBrowser (no DB) checkbox
// password password  min:8char(2-numbers,2-Headletters Latin only)(errors pass not ???)
// repeat password  (no DB) password


// rightside Error text
%>

<%
String login = request.getParameter("login");
String name = request.getParameter("name");
String password = request.getParameter("password");
String repassword = request.getParameter("re-password");
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String address = request.getParameter("address");
String comments = request.getParameter("comments");
String amigo = request.getParameter("amigo");



String errorText = "";

boolean showForm = true;

//out.write(login+","+password+","+repassword+","+age+","+gender+","+address+","+comments+","+amigo);

if(login!=null){
		
	boolean existError = false;
	errorText = "<td width = 300><ul>";
	boolean emailMatches = login.matches("\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*\\.\\w{2,4}");
	boolean passwordValues = password.matches("(?=.*[0-9]{2,})(?=.*[a-z])(?=.*[A-Z]{2,}).{8,}");
	boolean ageMatches = age.matches("-?\\d+(\\.\\d+)?");
	
	if(login.length() == 0) {
		existError = true;
		errorText += "<li>Empty Login</li>";
	}else if(!emailMatches){
		existError = true;
		errorText += "<li>Not e-mail address</li>";
	}
	
	if(name.length() == 0){
		existError = true;
		errorText += "<li>Empty Name</li>";
	}
	
	if(password.length() == 0) {
		existError = true;
		errorText += "<li>Empty Password</li>";
	}else if(!passwordValues){
		existError = true;
		errorText += "<li>Password must be at least 8 characters long, contain 2 digits, 2 capital letters (latin only)</li>";
	}else if(!password.equals(repassword)){
		existError = true;
		errorText += "<li>Password mismatch</li>";
		}
	
	if (age.length() == 0){
		existError = true;
		errorText += "<li>Empty age</li>";
	}else if(!ageMatches){
		existError = true;
		errorText += "<li>Щnly numbers can be entered in the age field</li>";
	}else if(Integer.valueOf(age)<12 || Integer.valueOf(age)>100){
		existError = true;
		errorText += "<li>Registration is available to users from 12 to 100 years</li>";
	}
	
	if(gender == null || (!gender.equals("F") && !gender.equals("M"))){
		existError = true;
		errorText += "<li>Choose one of the two genders</li>";
	}
	
	if(address == null || (!address.equals("1") && !address.equals("2") && !address.equals("3"))){
		existError = true;
		errorText += "<li>Choose an address from the list</li>";
	}
	
	if(comments.length() == 0){
		existError = true;
		errorText += "<li>Empty comments</li>";
	}
	
	if(amigo == null || !amigo.equals("on")){
		existError = true;
		errorText += "<li>You must agree to install Amigo</li>";
	}
	
	errorText +="</ul></td>";
	
	if(errorText.equals("<td width = 300><ul></ul></td>")){
				showForm = false;
		out.write("Registration Success");
	}
}
if (showForm){
%>	



	
<center>
<table>
<tr>
<td align = 'center'>
<form action = ''>
	<table border = '1'>
	<tr>
		<td align = 'center'>
		Login (e-mail)
		</td>
		<td align = 'center'>
		<input type = 'text', name = 'login'/>
		</td>
	  </tr>
	
		<tr>
		<td align = 'center'>
		Name
		</td>
		<td align = 'center'>
		<input type = 'text', name = 'name'/>
		</td>
	  </tr>
	  
	  <tr>
		<td  align = 'center'>
		Password
		</td>
		<td align = 'center'>
		<input type = 'password', name = 'password'/>
		</td>
	  </tr>
	  
	  <tr>
		<td align = 'center'>
		Repeat password
		</td>
		<td align = 'center'>
		<input type = 'password', name = 're-password'/>
		</td>
	  </tr>
	  
	  <tr>
		<td align = 'center'>
		Age
		</td>
		<td align = 'center'>
		<input type = 'text', name = 'age'/>
		</td>
	  </tr>
	  
	  <tr>
		<td align = 'center'>
		Gender
		</td>
		<td align = 'center'>
		F<input type = 'radio', name = 'gender' value='F'/>
		M<input type = 'radio', name = 'gender' value='M'/>
		</td>
	  </tr>
	  
	  	  <tr>
		<td align = 'center'>
		Address
		</td>
		<td align = 'center'>
		<select name='address'>
			<option style="color:gray" value = '' >-choose an address-</option>
			<option value= '1'> DNR </option>
			<option value= '2'> LNR </option>
			<option value= '3'> Crimea </option>
		</select>
		</td>
	  </tr>
	  
	  	  <tr>
		<td align = 'center'>
		Comments
		</td>
		<td align = 'center'>
		<textarea name='comments' cols='20' rows='10'></textarea>
		</td>
	  </tr>
	  
	  	  <tr>
		<td width= '150' align = 'center'>
		Do you agree to install Amigo browser?
		</td>
		<td align = 'center'>
		<input type = 'checkbox', name = 'amigo'/>
		</td>
	  </tr>
	  
	  <tr>
		<td align = 'center'>
		Click -->
		</td>
		<td align = 'center'>
		<input type = 'submit', value = 'Sign up'/>
		</td>
	  </tr>
	  
	</table>
</form>	
</td>

<%
out.write(errorText);
%>

</table>

<%
} 
%>

