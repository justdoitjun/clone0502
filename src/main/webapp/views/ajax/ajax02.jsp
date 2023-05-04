<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let ajax02 = {
      init :()=>{},
      keyUpEvent:()=>{
        $('#r_form > input[name=id]').keyup(()=>{
            var id = $(this).val();
            console.log(id);
            if(id.length <= 3){
                $('#r_form > #idspan').text('Too short');
                return; // 제어해줌.(흐름 제어로 실무에서 당연히 많이 쓰임) 아래 ajax를 안 돌릴 것이기 때문이지.
            }; // id 길이에 따라 너무 작은 건 애초에 보내지 말자.(비용문제)
            $.ajax({
              url:'/checkid',
              data:{'id':id},
              success:(data)=>{
                if(data==true){
                  $('#r_form > #idspan').text('You can use this ID');
                  $('#r_form > #idspan').focus();
                }else{
                  $('#r_form > #idspan').text('You are not able to use this ID');

                }
              }
            });// ajax
                }
        );//InnerKeyUp
      },//keyUp Event
      sendEvent:()=>{}
    };


    $(()=>{
      ajax02.init();
    })
</script>

<div class="col-sm-8 text-left">
  <div class="container">
    <h1>AJAX 02</h1>
    <form id="r_form">
        ID <input type="text" name="id"><span id="idspan"></span><br>
        PWD <input type="text" name="pwd"/><br>
        NAME <input type="text" name="name"/><br>
        <input type="button" value="Register"><br>
    </form>
  </div>
</div>

