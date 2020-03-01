<%-- 
    Document   : employee1
    Created on : Nov 22, 2019, 9:17:17 PM
    Author     : priyanka21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello user! Welcome to employee window portal</h1>
        <h1>You are requested to fill details correctly and do not leave necessory details empty</h1>
        <form name='f'>
            <table>
                <tr><td>Enter employee ID</td><td><input type='text' name='eid'  mandatory/></tr>
                <tr><td>Enter employee name</td><td><input type='text' name='ename' mandatory/></tr>
                <tr><td>Enter employee salary</td><td><input type='text' name='sal' mandatory/></tr>
                <tr>
                    <td>gender</td>
                    <td><input type='radio' name='gender' value="male" checked=''/>male</td>
                    <td><input type='radio' name='gender' value="female" checked=''/>female</td>
                    
                </tr>
                <tr>
                    <td>language</td>
                    <td><input type='checkbox' name='language' value='hindi' />hindi</td>
                    <td><input type='checkbox' name='langauge' value='english' />english</td>
                </tr>
                <tr><td><input type ='submit' name='btnadd' value='ADD/INSERT' /></td></tr>
                <tr><td><input type ='submit' name='btnupdate' value='UPDATE' /></td></tr>
                <tr><td><input type ='submit' name='btndelete' value='DELETE' /></td></tr>
                <tr><td><input type ='submit' name='btnview' value='VIEW' /></td></tr>
                
                <%
                    String eid1,ename1,language1,gender1;
                    int salary1;
                    try{
                        if(request.getParameter("btnadd")!=null)
                        {
                            out.println("insert");
                            eid1=request.getParameter("eid");
                            ename1=request.getParameter("ename");
                            salary1=Integer.parseInt(request.getParameter("sal"));
                            gender1=request.getParameter("gender");
                            language1=request.getParameter("language");
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/employee1","priyanka","priyanka");
                    Statement stmt=conn.createStatement();
                    int x =stmt.executeUpdate("insert into empinfo values('"+eid1+"','"+ename1+"','"+language1+"','"+gender1+"',"+salary1+")");
                     if(x>0)
                     {
                         out.println("inserted successfully");
                         
                     }
                     else
                         out.println("not inserted successfully");
                            
                        }
                     else   if(request.getParameter("btnview")!=null)
                        {
                            out.println("view");
                      Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/employee1","priyanka","priyanka");
                    Statement stmt=conn.createStatement();
                     ResultSet rs=stmt.executeQuery("select *from empinfo");
                     while(rs.next())
                     {
                         out.println(rs.getString(1));
                         out.println(rs.getString(2));
                         out.println(rs.getString(3));
                         out.println(rs.getString(4));
                         out.println(rs.getInt(5));
                     }
                     out.println("viewed");
                        }
                        if(request.getParameter("btnupdate")!=null)
                        {
                            out.println("update");
                           eid1=request.getParameter("eid");
                            ename1=request.getParameter("ename");
                            salary1=Integer.parseInt(request.getParameter("sal"));
                            gender1=request.getParameter("gender");
                            language1=request.getParameter("language");
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/employee1","priyanka","priyanka");
                    Statement stmt=conn.createStatement();
                    out.println("updatedbv");
                    int x=stmt.executeUpdate("update empinfo set ename='"+ename1+"',language='"+language1+"',gender='"+gender1+"',salary="+salary1+" where eid='"+eid1+"' ");
                    out.println("updated");
                    if(x>0)
                    {
                        out.println("updated successfully");
                    }
                    else
                        out.println("not updated successfully");
                        }
                        if(request.getParameter("btndelete")!=null)
                        {
                           eid1=request.getParameter("eid");
                             Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/employee1","priyanka","priyanka");
                    Statement stmt=conn.createStatement();
                            int x=stmt.executeUpdate("delete from empinfo where eid='"+eid1+"' ");
                      
                      if(x>0)
                          out.println("deleted successfully");
                      else
                          out.println("not");
                        }
                    }
                    
                    catch(Exception ex)
                    {
                        System.out.println(ex);
                    }
                    %>
                    
                        
            </table>
        </form>
            
        
    </body>
</html>
