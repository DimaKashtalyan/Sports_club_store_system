<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <ol class="breadcrumb">
                <li><a href="/home">Домой</a></li>
                <li><a href="/show/all/products">Товары</a></li>
                <li class="active">${product.name }</li>
            </ol>
        </div>

    </div>

    <div class="row">
        <div class="col-xs-12 col-sm-4">
            <div class="thumbnail">
                <img src="${contextRoot }/static/images/${product.code}.jpg"
                     class="img img-responsive"/>
            </div>
        </div>

        <div class="col-xs-12 col-sm-8">
            <h3>${product.name }</h3>
            <hr/>
            <p>${product.description }</p>
            <hr/>
            <h4>
                    Цена : ${product.unitPrice } руб.
            </h4>
            <hr/>


            <c:choose>
                <c:when test="${product.quantity < 1}">
                    <h6>
                        В наличии : <span style="color: red;">Нет в наличии</span>
                    </h6>
                </c:when>
                <c:otherwise>
                    <h6>В наличии : ${product.quantity }</h6>

                </c:otherwise>

            </c:choose>

            <security:authorize access="hasAuthority('USER')">
                <c:choose>
                    <c:when test="${product.quantity < 1 }">
                        <a href="javascript:void(0);" class="btn btn-success disabled"><strike><span
                                class="glyphicon glyphicon-shopping-cart"></span>Добавить в корзину</strike></a>
                    </c:when>
                    <c:otherwise>
                        <a href="${contextRoot }/cart/add/${product.id }/product" class="btn btn-success"><span
                                class="glyphicon glyphicon-shopping-cart"></span>Добавить в корзину</a>

                    </c:otherwise>

                </c:choose>
            </security:authorize>

            <security:authorize access="hasAuthority('ADMIN')">

                <a href="${contextRoot }/manage/${product.id }/product" class="btn btn-warning"><span
                        class="glyphicon glyphicon-pencil"></span> Изменить</a>

            </security:authorize>

            <a href="/show/all/products" class="btn btn-primary">Назад</a>

        </div>
    </div>
</div>