<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css2?family=Bitter:wght@600&family=Nanum+Myeongjo:wght@800&display=swap"
      rel="stylesheet">

<script>


    // 화면 로딩
    $(function () {
        register_form.init();
    });

</script>

<div class="col-sm-8 text-left">
    <div class="container">
        <div class="row content">
            <form  class="form-horizontal" id="register_form" action="">
                <div class="col-sm-6 text-left">
                    <div>
                        <h2 style="text-align: center">회원가입</h2>
                    </div>
                    <br><br><br>
                    <div class="input-group mb-3">
                        <input
                                type="text"
                                class="form-control"
                                placeholder="아이디"
                                name="id"
                                id="id"
                        />
<%--                        <div class="input-group-append">--%>
<%--                            <button class="btn btn-success" type="button" id="btnIdCheck">--%>
<%--                                중복체크--%>
<%--                            </button>--%>
<%--                        </div>--%>
                    </div>

                    <div class="input-group mb-3">
                        <input
                                type="password"
                                class="form-control"
                                name="pwd"
                                id="pwd"
                                placeholder="패스워드"
                        />
                    </div>

<%--                    <div class="input-group mb-3">--%>
<%--                        <input--%>
<%--                                type="password"--%>
<%--                                class="form-control"--%>
<%--                                name="pwd2"--%>
<%--                                id="pwd2"--%>
<%--                                placeholder="패스워드확인"--%>
<%--                        />--%>
<%--                    </div>--%>

                    <div class="input-group mb-3">
                        <input
                                type="text"
                                class="form-control"
                                placeholder="이름"
                                name="name"
                                id="username"
                        />
                    </div>

<%--                    <div class="input-group mb-3">--%>
<%--                        <input--%>
<%--                                type="text"--%>
<%--                                class="form-control"--%>
<%--                                placeholder="닉네임"--%>
<%--                                name="nickname"--%>
<%--                                id="nickname"--%>
<%--                        />--%>
<%--                    </div>--%>

<%--                    <div class="input-group mb-3">--%>
<%--                        <input--%>
<%--                                type="text"--%>
<%--                                class="form-control"--%>
<%--                                placeholder="email"--%>
<%--                                name="email"--%>
<%--                                id="email"--%>
<%--                        />--%>
<%--                    </div>--%>

<%--                    <div class="input-group mb-3">--%>
<%--                        <input--%>
<%--                                type="text"--%>
<%--                                class="form-control"--%>
<%--                                placeholder="전화번호"--%>
<%--                                name="phone"--%>
<%--                                id="phone"--%>
<%--                        />--%>
<%--                    </div>--%>

<%--                    <div class="input-group mb-3">--%>
<%--                        <input--%>
<%--                                type="text"--%>
<%--                                class="form-control"--%>
<%--                                id="zipcode"--%>
<%--                                name="zipcode"--%>
<%--                                placeholder="우편번호"--%>
<%--                        />--%>
<%--                        <input--%>
<%--                                type="button"--%>
<%--                                onclick="execDaumPostcode()"--%>
<%--                                value="우편번호 찾기"--%>
<%--                        /><br/>--%>
<%--                    </div>--%>
<%--                    <div class="input-group mb-3">--%>
<%--                        <input--%>
<%--                                type="text"--%>
<%--                                class="form-control"--%>
<%--                                placeholder="도로명 또는 지번주소"--%>
<%--                                name="address1"--%>
<%--                                id="address1"--%>
<%--                        />--%>
                        <!-- <input type="text" id="sample4_jibunAddress" placeholder="지번주소" /> -->
<%--                    </div>--%>
<%--                    <span id="guide" style="color: #999; display: none"></span>--%>
<%--                    <div class="input-group mb-3">--%>
<%--                        <input--%>
<%--                                type="text"--%>
<%--                                class="form-control"--%>
<%--                                placeholder="상세주소"--%>
<%--                                name="address2"--%>
<%--                                id="address2"--%>
<%--                        />--%>
<%--                    </div>--%>
                    <!-- <div class="input-group mb-4">
                      <input type="text" id="sample4_extraAddress" placeholder="참고항목" />
                    </div> -->
                    <!-- 다음 우편 api :주소체계 번지 -> 길  -->
                </div>
                <div class="btn-group">
                    <button type="button" class="btn btn-primary" id="register_btn" onclick="">
                        회원가입
                    </button
                    >&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" id="cancel_btn"  onclick="">
                        취소
                    </button
                    >&nbsp;&nbsp;
                </div>
            </form>
        </div>
    </div>
</div>
</div>