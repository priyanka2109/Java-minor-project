<%-- 
    Document   : employee
    Created on : Nov 22, 2019, 8:52:30 PM
    Author     : priyanka21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>employee</title>
    </head>
    <body>
        <h1>Hello user</h1>
        
        <h1 font="italic"> you can only enter with correct username and password</h1>
        <form name='f' method="post">
            <table>
                <tr><td>enter username</td><td ><input type='text' name='txtuid'/></td></tr>
                <tr><td>enter password</td><td><input type='text' name='txtpwd'/></td></tr>
                <tr><td><input type='submit' name='btnlogin' value='LOGIN'/></td></tr>
                
            </table>
            <%
                String uid,pwd;
                uid=request.getParameter("txtuid");
                pwd=request.getParameter("txtpwd");
                if(request.getParameter("btnlogin")!=null)
                {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/employee1","priyanka","priyanka");
                    Statement stmt=conn.createStatement();
                    ResultSet rs=stmt.executeQuery("select *from logindetails");
                    while(rs.next())
                    {
                        if((uid.equals(rs.getString(1)))&&pwd.equals(rs.getString(2)))
                        {
                            response.sendRedirect("employee1.jsp");
                        }
                        else
                            out.println("you are not an authorised user");
                    }
                }
                %>
        </form>
    </body>
</html>
