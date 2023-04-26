<!-- #include file="../connect.asp" -->
<%
On Error Resume Next
Sub handleError(message)
    Session("Error") = message
End Sub

    dim page
    page = Request.QueryString("page")

    If (isnull(Session("email")) OR TRIM(Session("email")) = "") Then
        response.redirect("../login.asp")
    else
        dim id
        id = Request.QueryString("id")
        If (isnull(id) OR trim(id) = "") then 
            id=0
        End if

        If (cint(id)<>0) Then
            Set cmdPrep = Server.CreateObject("ADODB.Command")
            cmdPrep.ActiveConnection = connDB
            cmdPrep.CommandType = 1
            cmdPrep.CommandText = "SELECT * FROM PROMOTION WHERE ID=?"
            cmdPrep.Parameters(0)=id
            Set Result = cmdPrep.execute
            If not Result.EOF then
                status = not Result("IS_ACTIVE")
            End If
            Result.Close()
            cmdPrep.CommandText = "UPDATE PROMOTION SET IS_ACTIVE=? WHERE ID=?"
            if(status) then
                cmdPrep.Parameters(0) = 1
            else
                cmdPrep.Parameters(0) = 0
            end if
            cmdPrep.Parameters(1)= id
            dim result
            set result = cmdPrep.execute()
            If Err.Number = 0 Then 
                Session("Success") = "Status has changed"
                response.redirect("../management.asp?page="&page&"&type=3")
            else
                handleError(Err.Description)
                Session("Error") = "something wrong, try again"
                response.redirect("../management.asp?page=1&type=3")
            End If
            Result.Close()
            connDB.Close()
        End if
    End If
%>