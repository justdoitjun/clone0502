<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let ajax01 = {
      init: () => {
          setInterval(() => {
            $.ajax({
              url: '/getservertime',
              success: (data) => {
                ajax01.display(data);
              },
              error: () => {
                alert('Error');
              }
            });  //ajax
          }, 3000)// interval time 3seconds
        },//end of init

        display:(data) => {
          $("#server_time").text(data);
        }
    }; // end of ajax01

    $(()=>{
      ajax01.init();
    });
</script>

<div class="col-sm-8 text-left">
  <div class="container">
    <h1>AJAX 01</h1>
    <h5 id="server_time"></h5>
  </div>
</div>

