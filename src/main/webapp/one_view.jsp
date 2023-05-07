<%@page import="com.entity.Jobs"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.jobDAO"%>
<%@ page
     language="java"
     contentType="text/html; charset=ISO-8859-1"
     pageEncoding="ISO-8859-1"
%>
<%@ taglib
     prefix="c"
     uri="http://java.sun.com/jsp/jstl/core"
%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User : Single Jobs</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">


     <c:if test="${empty userobj }">
          <c:redirect url="login.jsp" />
     </c:if>

     <%@include file="all_component/navbar.jsp"%>

     <div class="container">
          <div class="row">
               <div class="col-md-12">

                    <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    jobDAO dao = new jobDAO(DBConnect.getConn());
                    Jobs j = dao.getJobByID(id);
                    %>


                    <div class="card mt-5">
                         <div class="card-body">
                              <div class="text-center text-success">
                                   <i class="fa-solid fa-users-medical"></i>
                              </div>

                              <h6><%=j.getTitle() %></h6>
                              <p><%=j.getDescription() %>.
                              </p>
                              <br>


                              <div class="form-row">
                                   <div class="form-group col-md-3">
                                        <input
                                             type="text"
                                             class="form-control form-control-sm"
                                             value="Location:<%=j.getLocation() %>"
                                             readonly
                                        >
                                   </div>

                                   <div class="form-group col-md-3">
                                        <input
                                             type="text"
                                             class="form-control form-control-sm"
                                             value="Category:<%=j.getCategory() %>"
                                             readonly
                                        >
                                   </div>
                              </div>
                              <h6>Publish date: Today</h6>


                         </div>
                    </div>
               </div>
          </div>
     </div>

</body>
</html>