<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    $(()=>{
      jsp01.init(${num});
    })
</script>

<div class="col-sm-8 text-left">
  <h1 id="jsp01">JSP 01</h1>
  <hr>
  <h3>${cust}</h3>
  <h3>${cust.id}</h3>
  <h3>${cust.pwd}</h3>
  <hr>
  <h1> 보안상 가장 중요한 것 : c를 써라... </h1>
  <P> Cust cust = new Cust("id01","pwd01", "<a href=''>K</a>") 이렇게 썼다면... 아래처럼 나온다. </P>
<%--  따라서, <c:out~ 을 사용해주자> 2번라인에서 prefix="c 때문에 앞에 <c:out으로 나옴 --%>
  <h3>${cust.name}</h3>
  <h3><c:out value="${cust.name}"/></h3>
  <hr>
  <h1> date Format </h1>
  <h3><fmt:formatDate  value="${cdate}" pattern="dd-MM-yyyy:hhmmss"/></h3>
  <h3><fmt:parseNumber integerOnly="true" type="number" value="${num}" /></h3>
  <h3> <fmt:formatNumber value="${num}" type="currency" />  </h3>
  <h3> <fmt:formatNumber type="number" pattern="###.###$" value='${num}' />  </h3>
  <h3>  ${num*2}  </h3>
  <c:set var="mynum" value="${num * 3}"/>
  <h5><c:out value="${mynum}"/></h5>

</div>

