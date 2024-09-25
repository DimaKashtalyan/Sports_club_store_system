<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../shared/flows-header.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-sm-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4>Личная информация</h4>

                </div>
                <div class="panel-body">

                    <div class="text-center">
                        <h4>Имя : ${registerModel.user.firstName } ${registerModel.user.lastName }</h4>
                        <h5>Email : ${registerModel.user.email }</h5>
                        <h5>Телефон : ${registerModel.user.contactNumber }</h5>
                        <h5>Роль : ${registerModel.user.role }</h5>
                    </div>

                </div>
                <div class="panel-footer">
                    <a href="${flowExecutionUrl }&_eventId_personal"
                       class="btn btn-primary">Изменить</a>

                </div>

            </div>

        </div>

        <div class="col-sm-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4>Адрес</h4>

                </div>
                <div class="panel-body">


                    <div class="text-center">
                        <h4>Улица : ${registerModel.billing.addressLineOne }</h4>
                        <h4>Подъезд,этаж : ${registerModel.billing.addressLineTwo }</h4>
                        <h4>Город-индекс : ${registerModel.billing.city }-${registerModel.billing.postalCode }</h4>
                        <h4>Область-страна : ${registerModel.billing.state }-${registerModel.billing.country }</h4>
                    </div>

                </div>
                <div class="panel-footer">
                    <a href="${flowExecutionUrl }&_eventId_billing"
                       class="btn btn-primary">Изменить</a>

                </div>

            </div>

        </div>
    </div>

    <div class="row">
        <div class="col-sm-4 col-sm-offset-4">
            <div class="text-center">
                <a href="${flowExecutionUrl }&_eventId_submit"
                   class="btn btn-primary">Подтвердить</a>

            </div>
        </div>
    </div>
</div>


<%@ include file="../shared/flows-footer.jsp" %>