<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@include file="../shared/flows-header.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4>Регистрация - личная</h4>
                </div>
                <div class="panel-body">
                    <sf:form method="POST" class="form-horizontal" id="registerForm"
                             modelAttribute="user">
                        <div class="form-group">
                            <label class="control-label col-md-4" for="firstName">Имя</label>
                            <div class="col-md-8">
                                <sf:input path="firstName" type="text" class="form-control"
                                          placeholder="Имя"/>
                                <sf:errors path="firstName" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="lastName">Фамилия</label>
                            <div class="col-md-8">
                                <sf:input path="lastName" type="text" class="form-control"
                                          placeholder="Фамилия"/>
                                <sf:errors path="lastName" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="email">Email</label>
                            <div class="col-md-8">
                                <sf:input path="email" type="email" class="form-control"
                                          placeholder="abc@xyz.com"/>
                                <sf:errors path="email" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="contactNumber">Телефон</label>
                            <div class="col-md-8">
                                <sf:input path="contactNumber" type="number" maxlength="9"
                                          class="form-control" placeholder="XXXXXXXXX"/>
                                <sf:errors path="contactNumber" cssClass="help-block"
                                           element="em"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="password">Пароль</label>
                            <div class="col-md-8">
                                <sf:input path="password" type="password"
                                          class="form-control" placeholder="Пароль"/>
                                <sf:errors path="password" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="confirmPassword">Подтвердить пароль</label>
                            <div class="col-md-8">
                                <sf:input path="confirmPassword" type="password"
                                          class="form-control" placeholder="Повторить пароль"/>
                                <sf:errors path="confirmPassword" cssClass="help-block"
                                           element="em"/>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="control-label col-md-4" for="role"> Выберите роль </label>
                            <div class="col-md-8">
                                <label class="radio-inline"> <sf:radiobutton path="role"
                                                                             value="USER" checked="checked"/> Пользователь
                                </label> <label class="radio-inline"> <sf:radiobutton
                                    path="role" value="SUPPLIER"/> Поставщик
                            </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-4 col-md-8">
                                <button type="submit" class="btn btn-primary"
                                        name="_eventId_billing">
                                    Далее - Адрес <span class="glyphicon glyphicon-chevron-right"></span>
                                </button>

                            </div>

                        </div>

                    </sf:form>

                </div>
            </div>

        </div>
    </div>
</div>

<%@ include file="../shared/flows-footer.jsp" %>