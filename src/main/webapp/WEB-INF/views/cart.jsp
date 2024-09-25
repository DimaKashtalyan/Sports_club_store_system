<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<div class="container">

    <c:if test="${not empty message }">
        <div class="alert alert-info">
            <h3 class="text-center">${message }</h3>
        </div>
    </c:if>

    <c:choose>
        <c:when test="${not empty cartLines }">
            <table id="cart" class="table table-hover table-condensed">
                <thead>
                <tr>
                    <th style="width: 50%">Товар</th>
                    <th style="width: 10%">Цена</th>
                    <th style="width: 8%">Количество</th>
                    <th style="width: 22%" class="text-center">Итог</th>
                    <th style="width: 10%"></th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${cartLines }" var="cartLine">
                    <tr>
                        <td data-th="Product">
                            <div class="row">
                                <div class="col-sm-2 hidden-xs">
                                    <img src="${rootContext }/static/images/${cartLine.product.code}.jpg"
                                         alt="${cartLine.product.name }"
                                         class="img-responsive cartImg"/>
                                </div>
                                <div class="col-sm-10">
                                    <h4 class="nomargin">${cartLine.product.name }
                                        <c:if test="${cartLine.available == false }">
                                            <strong class="unavailable">(Not Available)</strong>
                                        </c:if>
                                    </h4>
                                    <p>Марка - ${cartLine.product.brand }</p>
                                    <p>Описание - ${cartLine.product.description }</p>
                                </div>
                            </div>
                        </td>
                        <td data-th="Price">${cartLine.buyingPrice } руб.</td>
                        <td data-th="Quantity">
                            <input type="number" class="form-control text-center" id="count_${cartLine.id }"
                                   min="1" max="5" value="${cartLine.productCount }">
                        </td>
                        <td data-th="Subtotal" class="text-center">${cartLine.total } руб.</td>
                        <td class="actions" data-th="">
                            <button type="button" name="refreshCart" value="${cartLine.id }"
                                    class="btn btn-info btn-sm">
                                <span class="glyphicon glyphicon-refresh"></span>
                            </button>
                            <a href="${contextRoot }/cart/${cartLine.id}/delete" class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash"></span>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>

                <tfoot>
                <tr class="visible-xs">
                    <td class="text-center"><strong>Итого ${userModel.cart.grandTotal } руб.</strong></td>
                </tr>
                <tr>
                    <td><a href="${contextRoot }/show/all/products" class="btn btn-warning">
                        <span class="glyphicon glyphicon-chevron-left"></span> Продолжить покупки</a>
                    </td>
                    <td colspan="2" class="hidden-xs"></td>
                    <td class="hidden-xs text-center"><strong>Итого ${userModel.cart.grandTotal } руб.</strong></td>
                    <td><a href="${contextRoot }/flows/payment" class="btn btn-success btn-block">Оплатить
                        <span class="glyphicon glyphicon-chevron-right"></span></a>
                    </td>
                </tr>
                </tfoot>

            </table>
        </c:when>
        <c:otherwise>
            <div class="jumbotron">
                <div class="text-center">
                    <h1>Ваша корзина пустая!</h1>
                </div>
            </div>
        </c:otherwise>
    </c:choose>

</div>
