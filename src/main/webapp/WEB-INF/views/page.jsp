<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta name="_csrf" content="${_csrf.token }">
    <meta name="_csrf_header" content="${_csrf.headerName }">


    <title>Online Shopping - ${title }</title>
    <script type="text/javascript">
        window.menu = '${title }';
        window.contextRoot = '${contextRoot}'
    </script>

    <link href="${contextRoot }/static/css/bootstrap.min.css"
          rel="stylesheet">

    <link href="${contextRoot }/static/css/bootstrap-readable-theme.css"
          rel="stylesheet">


    <link href="${contextRoot }/static/css/dataTables.bootstrap.css"
          rel="stylesheet">


    <link href="${contextRoot }/static/css/myapp.css" rel="stylesheet">

</head>

<body>


<div class="wrapper">


    <%@include file="share/navbar.jsp" %>


    <div class="content">

        <c:if test="${userClickHome == true }">
            <%@include file="home.jsp" %>
        </c:if>

        <c:if test="${userClickAbout == true }">
            <%@include file="about.jsp" %>
        </c:if>

        <c:if test="${userClickContact == true }">
            <%@include file="contact.jsp" %>
        </c:if>


        <c:if
                test="${userClickAllProducts == true or  userClickCategoryProducts == true}">
            <%@include file="listProducts.jsp" %>
        </c:if>



        <c:if test="${userClickShowProduct == true }">
            <%@include file="singleProduct.jsp" %>
        </c:if>

        <c:if test="${userClickManageProducts == true }">
            <%@include file="manageProduct.jsp" %>
        </c:if>


        <c:if test="${userClickShowCart == true }">
            <%@include file="cart.jsp" %>
        </c:if>


    </div>

    <%@include file="share/footer.jsp" %>


    <script src="${contextRoot }/static/js/jquery.js"></script>

    <script src="${contextRoot }/static/js/jquery.validate.js"></script>

    <script src="${contextRoot }/static/js/bootstrap.min.js"></script>

    <script src="${contextRoot }/static/js/jquery.dataTables.js"></script>

    <script src="${contextRoot }/static/js/dataTables.bootstrap.js"></script>

    <script src="${contextRoot }/static/js/bootbox.min.js"></script>

    <script src="${contextRoot }/static/js/myapp.js"></script>
</div>
</body>

</html>

