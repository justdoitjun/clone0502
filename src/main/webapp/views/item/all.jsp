<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
  .medium_img{
    width:100px;
  }
</style>

<div class="col-sm-8 text-left">
  <div class="container">
    <div class="col-sm-6 text-left">
      <table class="table table-hover">
        <thead>
        <tr>
          <th>IMG</th>
          <th>ID</th>
          <th>Name</th>
          <th>Price</th>
          <th>Regdate</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="obj" items="${ilist}">
          <tr>
            <td><img class="medium_img" src="/uimg/${obj.imgname}" ></td>
            <td>${obj.id}</td>
            <td>${obj.name}</td>
            <td><fmt:formatNumber value="${obj.price}" type="currency" /></td>
            <td><fmt:formatDate  value="${obj.rdate}" pattern="dd-MM-yyyy" /></td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div> <!--end of sm-6-->
  </div>

</div>

