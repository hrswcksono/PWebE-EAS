<%-- 
    Document   : registrasi
    Created on : Nov 27, 2020, 9:45:11 PM
    Author     : USER
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Login</title>
            <link rel="stylesheet" href="assets/css/login.css">
    </head>
    <body>
    <div class="login-page">
  <div class="form">
    <form class="login-form" method="post" action="prosesregis.jsp">
      <input type="text" placeholder="name" name="username" value=""/>
      <input type="password" placeholder="password" name="password" value=""/>
      <input type="text" placeholder="email address" name="email" value=""/>
      <button type="submit" value="Submit">create</button>
      <p class="message">Already registered? <a href="index.jsp">Sign In</a></p>
    </form>
  </div>
</div>
        </body>
</html>