<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
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
<title>User:Filter Job</title>
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

                    <h5 class="text-center text-primary">All Jobs</h5>

                    <%
                    String loc = request.getParameter("loc");
                    String cat = request.getParameter("cat");
                    String msg = "";

                    jobDAO dao = new jobDAO(DBConnect.getConn());
                    List<Jobs> list = null;

                    //default values are "lo" and "ca" in home.jsp which means given no value.
                    if ("lo".equals(loc) && "ca".equals(cat)) {

                    	list = new ArrayList<Jobs>();
                    	msg = "No Job Available";

                    } else if ("lo".equals(loc) || "ca".equals(cat)) {

                    	list = dao.getJobsOrLocationAndCate(cat, loc);

                    } else {
                    	list = dao.getJobsAndLocationAndCate(cat, loc);
                    }

                    if (list.isEmpty()) {
                    %>
                    <h4 class="text-center text-danger">No Job
                         Available</h4>
                    <%
                    }

                    if (list != null) {
                    for (Jobs j : list) {
                    %>

                    <div class="card mt-2">
                         <div class="card-body">
                              <div class="text-center text-primary">
                                   <i class="fa-solid fa-users-medical"></i>
                              </div>

                              <h6><%=j.getTitle()%></h6>
                              <p><%=j.getDescription()%>.
                              </p>
                              <br>


                              <div class="form-row">
                                   <div class="form-group col-md-3">
                                        <input
                                             type="text"
                                             class="form-control form-control-sm"
                                             value="Location:<%=j.getLocation()%>"
                                             readonly
                                        >
                                   </div>

                                   <div class="form-group col-md-3">
                                        <input
                                             type="text"
                                             class="form-control form-control-sm"
                                             value="Category: <%=j.getCategory()%>"
                                             readonly
                                        >
                                   </div>
                              </div>
                              <h6>Publish date: Today</h6>
                              <div class="text-center">
                                   <a
                                        href="one_view.jsp?id=<%=j.getId()%> "
                                        class="btn btn-sm bg-success text-white"
                                   >Details</a>
                              </div>
                         </div>
                    </div>
                    <%
                    }
                    } else {
                    %>
                    <h4 class="text-center text-danger"><%=msg%></h4>
                    <%
                    }
                    %>
               </div>
          </div>
     </div>
</body>
</html>