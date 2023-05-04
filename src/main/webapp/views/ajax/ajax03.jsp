<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  #getdata > div{
    width:500px;
    border:2px solid red;
  }
</style>
<script>
  //JSON으로 받은 데이터를 가공해서 JSON 형태로 반환한다
    let ajax03 = {
      init:()=>{
        // $('#button').click(()=>{
        //   $.ajax({
        //     url:'/getdata',
        //     success: (data)=>{
        //       console.log(data);
        //       ajax03.display(data);
        //     },
        //     fail:()=>{}
        //   });
        // });      // 버튼을 눌러야 되는 경우
        setInterval( function(){
          $.ajax({
            url:'/getdata',
            success: (data)=>{
              console.log(data);
              ajax03.display(data);
            },
            fail:()=>{}
          });
        }, 3000);     // 실시간 검색어 기능

      } , //end of ajax03-init
      display:(data)=>{
          let result = "";
          $(data).each((index, item)=>{
            result += '<h5>';
            result += item.id + '' + item.pwd + '' + item.name;
            result += '</h5>';
          });
          $('#contents').html(result);
      } // end of ajax03-display
    }; // end of ajax03
    $(()=>{
        ajax03.init();
    });
</script>

<div class="col-sm-8 text-left">
  <div class="container" id="getdata">
    <h1>AJAX 03</h1>
    <button type="button" id="button" class="btn">Get Date</button>
    <div id="contents"></div>
  </div>
</div>

