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
            <form  class="form-horizontal" id="update_form" action="">
                <div class="col-sm-6 text-left">
                    <div>
                        <h2 style="text-align: center"> Detail page </h2>
                    </div>
                    <br><br><br>
                    <div class="input-group mb-3">
                        <input
                                type="text"
                                class="form-control"
                                placeholder="아이디"
                                name="id"
                                id="id"
                                value="${gcust.id}"
                                readonly
                        />
                    </div>

                    <div class="input-group mb-3">
                        <input
                                type="password"
                                class="form-control"
                                name="pwd"
                                id="pwd"
                                placeholder="패스워드"
                                value="${gcust.pwd}"
                        />
                    </div>

                    <div class="input-group mb-3">
                        <input
                                type="text"
                                class="form-control"
                                placeholder="이름"
                                name="name"
                                id="username"
                                value="${gcust.name}"
                        />
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary" id="update_btn" onclick="">
                            update
                        </button
                        >&nbsp;&nbsp;
                        <button type="button" class="btn btn-primary" id="remove_btn"  onclick="">
                            remove
                        </button
                        >&nbsp;&nbsp;
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</div>