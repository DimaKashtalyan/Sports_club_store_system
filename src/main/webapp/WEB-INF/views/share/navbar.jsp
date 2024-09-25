<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="security"
          uri="http://www.springframework.org/security/tags" %>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${contextRoot }/home">Arsenal</a>
        </div>
        <div class="collapse navbar-collapse"
             id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li id="about"><a href="${contextRoot }/about">О клубе</a></li>

                <li id="contact"><a href="${contextRoot }/contact">Контакты</a></li>

                <li id="listProducts"><a
                        href="${contextRoot }/show/all/products">Посмотреть товары</a></li>
                <security:authorize access="hasAuthority('ADMIN')">
                    <li id="manageProducts"><a
                            href="${contextRoot }/manage/products">Управление товарами</a></li>
                </security:authorize>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <security:authorize access="isAnonymous()">
                    <li id="manageProducts"><a href="${contextRoot }/register">Регистрация</a></li>


                    <li id="manageProducts"><a href="${contextRoot }/login">Логин</a></li>

                </security:authorize>
                <security:authorize access="isAuthenticated()">
                    <li class="dropdown" id="userCart"><a
                            class="btn btn-default dropdown-toggle" href="javascript:void(0)"
                            id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="true"> ${userModel.fullName } <span
                            class="caret"></span>
                    </a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                            <security:authorize access="hasAuthority('USER')">
                                <li id="cart"><a href="${contextRoot}/cart/show"> <span
                                        class="glyphicon glyphicon-shopping-cart"></span>&#160;<span
                                        class="badge">${userModel.cart.cartLines }</span> -
                                        ${userModel.cart.grandTotal } руб.
                                </a></li>

                                <li role="separator" class="divider"></li>
                            </security:authorize>
                            <li id="logout"><a href="${contextRoot}/logout">Выйти</a></li>
                        </ul>
                    </li>
                </security:authorize>
            </ul>
        </div>
    </div>
</nav>


<script type="text/javascript">

    window.userRole = '${userModel.role }';

</script>






