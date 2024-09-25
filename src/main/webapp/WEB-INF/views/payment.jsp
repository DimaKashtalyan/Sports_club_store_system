<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Оплата успешна</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap-readable-theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/myapp.css">
    <style>
        .payment-success {
            margin-top: 50px;
            text-align: center;
        }
        .payment-success h2 {
            color: #28a745;
        }
        .payment-success p {
            font-size: 1.2em;
        }
        .payment-success .icon {
            font-size: 5em;
            color: #28a745;
        }
        .payment-success .btn {
            margin-top: 20px;
        }
        .order-summary {
            margin-top: 30px;
            text-align: left;
        }
        .order-summary table {
            width: 100%;
            margin: auto;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        .order-summary th, .order-summary td {
            padding: 15px;
            text-align: left;
        }
        .order-summary th {
            background-color: #f8f9fa;
            border-top: 1px solid #dee2e6;
        }
        .order-summary td {
            border-bottom: 1px solid #dee2e6;
        }
        .total-amount {
            text-align: right;
            font-weight: bold;
            font-size: 1.2em;
            padding: 15px;
            background-color: #f8f9fa;
            border-top: 1px solid #dee2e6;
        }
    </style>
</head>
<body>
<div class="container payment-success">
    <div class="icon">
        <i class="fas fa-check-circle"></i>
    </div>
    <h2>Оплата прошла успешно!</h2>
    <p>Ваш заказ был успешно оплачен и обработан.</p>

    <div class="order-summary">
        <h3>Подробности заказа</h3>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Название товара</th>
                <th>Количество</th>
                <th>Цена за единицу</th>
                <th>Общая стоимость</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="cartLine" items="${cartLines}">
                <tr>
                    <td>${cartLine.product.name}</td>
                    <td>${cartLine.productCount}</td>
                    <td>${cartLine.product.unitPrice}</td>
                    <td>${cartLine.productCount * cartLine.product.unitPrice}</td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="3" class="total-amount">Итоговая сумма:</td>
                <td class="total-amount">
                    <c:set var="totalAmount" value="0"/>
                    <c:forEach var="cartLine" items="${cartLines}">
                        <c:set var="totalAmount" value="${totalAmount + (cartLine.productCount * cartLine.product.unitPrice)}"/>
                    </c:forEach>
                    ${totalAmount}
                </td>
            </tr>
            </tfoot>
        </table>
    </div>

    <a href="${pageContext.request.contextPath}/show/all/products" class="btn btn-primary">Продолжить покупки</a>
</div>
<script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>
