<!-- #include file="../connect.asp" -->
<%
    dim id
    id = Request.QueryString("id")
    If (cint(id)<>0) Then
        Set cmdPrep = Server.CreateObject("ADODB.Command")
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType = 1
        cmdPrep.CommandText = "SELECT * FROM USERS WHERE ID=?"
        cmdPrep.Parameters(0)=id
        Set Result = cmdPrep.execute
        If not Result.EOF then
            status = not Result("status")
        End If
        Result.Close()
        cmdPrep.CommandText = "UPDATE USERS SET STATUS=? WHERE ID=?"
        if(status) then
            cmdPrep.Parameters(0) = 1
        else
            cmdPrep.Parameters(0) = 0
        end if
        cmdPrep.Parameters(1)= id
        dim result
        set result = cmdPrep.execute()
        if(status) then
            Response.Write("true")
        else
            Response.Write("false")
        end if
    End if
%>