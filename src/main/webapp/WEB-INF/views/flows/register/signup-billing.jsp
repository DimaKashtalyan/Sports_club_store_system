<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@include file="../shared/flows-header.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4>Регистрация - Адрес</h4>
                </div>
                <div class="panel-body">
                    <sf:form method="POST" class="form-horizontal" id="billingForm"
                             modelAttribute="billing">

                        <div class="form-group">
                            <label class="control-label col-md-4" for="country">Страна</label>
                            <div class="col-md-8">
                                <sf:input path="country" type="text" class="form-control"
                                          placeholder="Введите страну"/>
                                <sf:errors path="country" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="state">Область/Штат</label>
                            <div class="col-md-8">
                                <sf:input path="state" type="text" class="form-control"
                                          placeholder="Введите область/штат"/>
                                <sf:errors path="state" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="city">Город</label>
                            <div class="col-md-8">
                                <sf:input path="city" type="text" class="form-control"
                                          placeholder="Введите город"/>
                                <sf:errors path="city" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="postalCode">Почтовый индекс</label>
                            <div class="col-md-8">
                                <sf:input path="postalCode" type="number" class="form-control"
                                          placeholder="XXXXXX" maxlength="6"/>
                                <sf:errors path="postalCode" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="addressLineOne">Улица</label>
                            <div class="col-md-8">
                                <sf:input path="addressLineOne" type="text" class="form-control"
                                          placeholder="Введите улицу"/>
                                <sf:errors path="addressLineOne" cssClass="help-block"
                                           element="em"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="addressLineTwo">Подъезд,этаж</label>
                            <div class="col-md-8">
                                <sf:input path="addressLineTwo" type="text" class="form-control"
                                          placeholder="Введите подъезд,этаж"/>
                                <sf:errors path="addressLineTwo" cssClass="help-block"
                                           element="em"/>
                            </div>
                        </div>





                        <div class="form-group">
                            <div class="col-md-offset-4 col-md-8">
                                <!-- submit button inside the form -->
                                <button type="submit" class="btn btn-primary"
                                        name="_eventId_personal">
                                    <span class="glyphicon glyphicon-chevron-left"></span>Назад
                                </button>

                                <button type="submit" class="btn btn-primary"
                                        name="_eventId_confirm">
                                   Далее<span class="glyphicon glyphicon-chevron-right"></span>
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