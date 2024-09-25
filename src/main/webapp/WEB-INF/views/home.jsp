<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%
    String contextPath = request.getContextPath();
%>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <%@ include file="./share/sidebar.jsp" %>
        </div>

        <div class="col-md-9">
            <div class="row carousel-holder">
                <div class="col-md-12">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <img class="slide-image" src="${contextPath}/static/images/bn1.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="slide-image" src="${contextPath}/static/images/bn2.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="slide-image" src="${contextPath}/static/images/bn3.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="slide-image" src="${contextPath}/static/images/bn4.jpg" alt="">
                            </div>
                        </div>
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <h3>Наши самые просматриваемые товары</h3>
                    <hr/>
                </div>
            </div>


            <div class="row is-table-row">
                <c:forEach var="product" items="${products}">
                    <div class="col-sm-4">
                        <div class="thumbnail">
                            <div class="product-image-container">
                                <img class="product-image" src="${pageContext.request.contextPath}/static/images/${product.code}.jpg" alt="Product Image">
                            </div>
                            <h5 class="product-name">${product.name}</h5>
                            <a class="btn btn-primary btn-view" href="${pageContext.request.contextPath}/show/${product.id}/product">Подробнее</a>
                        </div>
                    </div>
                </c:forEach>
            </div>


            <style>
                .product-image-container {
                    width: 100%;
                    height: 180px;
                    overflow: hidden;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }

                .product-image {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                }

                .thumbnail {
                    text-align: center;
                    border: 1px solid #ddd;
                    border-radius: 4px;
                    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                    display: flex;
                    flex-direction: column;
                    justify-content: space-between;
                }

                .product-name {
                    margin: 10px 0;
                    max-height: 40px;
                    overflow: hidden;
                    text-overflow: ellipsis;
                    display: -webkit-box;
                    -webkit-line-clamp: 2;
                    -webkit-box-orient: vertical;
                }

                .btn-view {
                    margin-top: 10px;
                    padding: 12px 0;
                    background-color: #f3798f;
                    border: none;
                    border-radius: 4px;
                    color: #fff;
                    font-size: 16px;
                    cursor: pointer;
                    transition: background-color 0.3s;
                    width: 100%;
                    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                }

                .btn-view:hover {
                    background-color: #0056b3;
                }
            </style>

            <div class="row">
                <div class="col-xs-12">
                    <h3>Рекомендации на основе ваших покупок</h3>
                    <hr/>
                </div>
            </div>

            <div class="row is-table-row">
                <c:forEach var="product" items="${bestSellingProducts}">
                    <div class="col-sm-4">
                        <div class="thumbnail">
                            <div class="product-image-container">
                                <img class="product-image" src="${pageContext.request.contextPath}/static/images/${product.code}.jpg" alt="Product Image">
                            </div>
                            <h5 class="product-name">${product.name}</h5>
                            <a class="btn btn-primary btn-view" href="${pageContext.request.contextPath}/show/${product.id}/product">Подробнее</a>
                        </div>
                    </div>
                </c:forEach>
            </div>


            <div class="container">
                <div class="row">
                    <h1>Сайт футбольного клуба Arsenal</h1>
                    <hr/>
                    <p>Здесь вы можете узнать об истории великого лондонского клуба и его достижениях.<br />
                        На сайте также присутствует интернет-магазин, где вы найдете атрибутику вашего любимого клуба.
                    <h2>Об интернет-магазине</h2>
                    <hr/>
                    <p>
                        Интернет-магазин футбольного клуба "Арсенал" (Arsenal) предлагает богатый выбор<br />
                        официальной продукции клуба, включая футболки, куртки, формы и другие товары.<br />
                    </p>
                    <p>
                        Кроме того, в интернет-магазине "Арсенала" можно приобрести различные сувениры и аксессуары<br />
                        с логотипом клуба, такие как мячи, зажигалки и многое другое. Все товары высокого качества и<br />
                        сертифицированы, что гарантирует их подлинность.
                    </p>
                    <p>
                        С помощью удобной навигации на сайте, пользователи могут легко найти нужный товар и оформить заказ<br />
                        в несколько кликов. Доставка товаров осуществляется во многие страны мира, что позволяет болельщикам<br />
                        "Арсенала" в любой точке планеты приобрести официальную продукцию любимого клуба.
                    </p>
                </div>
            </div>

        </div>
    </div>
</div>
