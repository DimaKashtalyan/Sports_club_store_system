<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<p class="lead">Магазин атрибутики</p>

<div class="list-group">
    <c:forEach items="${categories }" var="category">
        <a href="/show/category/${category.id }/products" class="list-group-item"
           id="a_${category.name }">${category.name }</a>
    </c:forEach>
</div>