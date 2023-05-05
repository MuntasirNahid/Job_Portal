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
<title>Edit Jobs</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

     <c:if test="${userobj.role ne 'admin' }">

          <c:redirect url="login.jsp"></c:redirect>

     </c:if>
     <%@include file="all_component/navbar.jsp"%>

     <div class="container p-2">
          <div class="col-md-10 offset-md-1">
               <div class="card">
                    <div class="card-body">
                         <div class="text-center text-success">
                              <i class="fa-solid fa-users-medical"></i>


                              <%
                              int id = Integer.parseInt(request.getParameter("id"));
                              jobDAO dao = new jobDAO(DBConnect.getConn());
                              Jobs j = dao.getJobByID(id);
                              %>


                              <h5>Edit Jobs</h5>
                         </div>
                         <form
                              action="update"
                              method="post"
                         >
                         
                         <!--keeping it hidden for updating task -->
                         
                         <input type ="hidden" value = "<%=j.getId() %>" name ="id">
                         
                         
                         
                              <div class="form-group">
                                   <label>Enter Title</label> <input
                                        type="text"
                                        name="title"
                                        required
                                        class="form-control"
                                        value="<%=j.getTitle()%>"
                                   >
                              </div>
                              <div class="form-row">
                                   <div class="form group col-md-4">
                                        <label>Location</label> <select
                                             name="location"
                                             class="custom-select"
                                             id="inlineFormCustomSelectPref"
                                        >
                                             <option
                                                  value="<%=j.getLocation()%>"
                                             ><%=j.getLocation()%></option>
                                             <option value="Dhaka">Dhaka</option>
                                             <option value="Chittagong">Chittagong</option>
                                             <option value="Khulna">Khulna</option>
                                             <option value="Comilla">Comilla</option>
                                             <option value="Jessore">Jessore</option>
                                             <option value="Sylhet">Sylhet</option>
                                             <option value="Rangpur">Rangpuira</option>
                                        </select>
                                   </div>
                                   <div class="form group col-md-4">
                                        <label>Category</label> <select
                                             name="category"
                                             class="custom-select"
                                             id="inlineFormCustomSelectPref"
                                        >
                                             <option
                                                  value="<%=j.getCategory()%>"
                                             ><%=j.getCategory()%></option>
                                             <option value="IT">IT</option>
                                             <option value="Developer">Developer</option>
                                             <option value="Teacher">Teacher</option>
                                             <option value="Engineer">Engineer</option>

                                        </select>
                                   </div>

                                   <div class="form group col-md-4">
                                        <label>Status</label> <select
                                             name="status"
                                             class="form-control"
                                        >
                                             <option
                                                  class="Active"
                                                  value="<%=j.getStatus()%>"
                                             ><%=j.getStatus()%></option>
                                             <option
                                                  class="Active"
                                                  value="Active"
                                             >Active</option>

                                             <option value="Inactive">Inactive</option>

                                        </select>
                                   </div>
                              </div>

                              <div class="form-group">
                                   <label>Enter Description</label>
                                   <textarea
                                        required
                                        rows="6"
                                        cols=""
                                        name="desc"
                                        class="form-control"
                                   ><%=j.getDescription() %></textarea>
                              </div>
                              <button class="btn btn-success">Update
                                   Job</button>
                         </form>
                    </div>
               </div>
          </div>
     </div>

</body>
</html>