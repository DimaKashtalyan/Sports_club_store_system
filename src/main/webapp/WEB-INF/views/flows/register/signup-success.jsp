<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@include file="../shared/flows-header.jsp" %>


<div class="container">

    <div class="row">
        <div class="col-sm-offset-4 col-sm-4">
            <div class="text-center">
                <h1>Добро пожаловать!</h1>
                <h6>Вы можете использовать свой адрес электронной почты для авторизации!</h6>
                <div>
                    <a href="${contextRoot }/login" class="btn btn-lg btn-success">Авторизация</a>
                </div>
            </div>

        </div>

    </div>


</div>


<%@ include file="../shared/flows-footer.jsp" %>