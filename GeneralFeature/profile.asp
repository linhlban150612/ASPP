<!--#include file="../connect.asp"-->
<!--#include file="../models/customers.asp"-->

<%
    
    if (isnull(Session("Id")) or Session("Id") = "") then
        Response.Redirect("./Errors/404.asp")
    else
        dim cmdPrep
        Set cmdPrep = Server.CreateObject("ADODB.Command")
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType = 1
        cmdPrep.Prepared = True
        id = Session("Id")
        name = Request.Form("name")
        phone = Request.Form("phone")
        address = Request.Form("address")
        if (Request.ServerVariables("REQUEST_METHOD") = "POST") then 
            cmdPrep.commandText = "UPDATE USERS SET NAME='" & name & "', PHONE='" & phone & "',ADDRESS='" & address & "' WHERE ID = '" & id & "'"
            cmdPrep.execute
            Session("Name") = name 
            Session("Success") = "Change Successfully"
        end if
        cmdPrep.commandText = "select * from USERS WHERE ID = '" & id & "'"
        set Result = cmdPrep.execute
        set cust = New customers
        cust.Id = Result("ID")
        cust.Address = trim(Result("ADDRESS"))
        cust.Name = trim(Result("NAME"))
        cust.Email = trim(Result("EMAIL"))
        cust.Phone = trim(Result("PHONE"))
        cust.Status = Result("STATUS")
        Result.Close
        set Result = nothing
%>
<!--#include file="header.asp"-->

<form action="" method="POST">
    Email: <%=cust.Email%>
    Name: <input type="text" value="<%=cust.Name%>" name="name">
    Phone: <input type="text" value="<%=cust.Phone%>" name="phone"> 
    Address: <input type="text" value="<%=cust.Address%>" name="address">
    <button type="submit">Submit</button>
</form> 

<h1>changepassword</h1>
<form action="changepassword.asp?id=<%=Session("Id")%>" method="POST">
password: <input type="text" name="password">
password change: <input type="text" name="passwordchange">
re-enter password: <input type="text" name="passwordreenter"> 
<button type="submit">change password</button>
</form> 
<%end if%>

