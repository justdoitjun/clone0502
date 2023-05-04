<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  .small_img{
    width : 50px;
    height : 50px;
  }
</style>
<div class="col-sm-8 text-left">
  <div class="container">
    <div class = "row-content">
      <div class="col-sm-6 text-left">
        <h3>Cust All page</h3>
        <table class="table table-hover">
          <thead>
          <tr>
            <th>ID</th>
            <th>name</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="obj" items="${cpage.getList()}">
            <%--                        cpage는 어레이가 아니라 pageinfo라서 안돈다. getList로 어레이리스트를 만들어야 돈다      --%>
            <tr>
              <td>${obj.id}</td>
              <td>${obj.name}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
        <jsp:include page="../page.jsp"/>
      </div>
    </div><!-- row content end-->
  </div>
</div>