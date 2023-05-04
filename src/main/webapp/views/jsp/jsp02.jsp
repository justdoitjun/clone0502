<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="col-sm-8 text-left">
  <div class="container">
      <h3>JSP02</h3>
      <%--  JSTL if   --%>
      <c:if test="${rcust !=null}">
          <hr>
          <h4> ${rcust.id} </h4>
          <c:if test="${rcust.id == 'id01'}">
              <h4>${num}</h4>
              <h4> id가 일치합니다. </h4>
              <hr>
          </c:if>
      </c:if>
      <%--  JSTL if  else  --%>
      <c:choose>
          <c:when test="${num == 3}">
              <h3> num is 3</h3>
          </c:when>
          <c:when test="${num == 2}">
                <h3> num is 2</h3>
          </c:when>
          <c:otherwise>
              <h3> num is ${num} </h3>
              <hr>
          </c:otherwise>
      </c:choose>
      <h3>End of JSP02</h3>
  </div>
</div>

