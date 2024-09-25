<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<div class="container">

    <div class="row">


        <div class="col-md-3">
            <%@include file="share/sidebar.jsp" %>

        </div>

        <div class="col-md-9">

            <div class="row">

                <div class="col-lg-12">
                    <c:if test="${userClickAllProducts == true}">
                        <script>
                            window.categoryId = '';
                        </script>

                        <ol class="breadcrumb">
                            <li><a href="/home">Домой</a></li>
                            <li class="active"><span>Все товары</span></li>
                        </ol>


                    </c:if>

                    <c:if test="${userClickCategoryProducts == true}">
                        <script>
                            window.categoryId = '${category.id}';
                        </script>
                        <ol class="breadcrumb">
                            <li><a href="/home">Домой</a></li>
                            <li class="active"><a href="#">Категория</a></li>
                            <li class="active"><span>${category.name }</span></li>

                        </ol>
                    </c:if>
                </div>
            </div>


            <div class="row">

                <div class="col-xs-12">
                    <div class="container-fluid">
                        <div class="table-responsive">


                            <table id="productListTable"
                                   class="table table-striped table-borderd">


                                <thead>
                                <tr>
                                    <th></th>
                                    <th>Название</th>
                                    <th>Марка</th>
                                    <th>Цена</th>
                                    <th>Доступно</th>
                                    <th></th>
                                </tr>
                                </thead>


                                <tfoot>
                                <tr>
                                    <th></th>
                                    <th>Название</th>
                                    <th>Марка</th>
                                    <th>Цена</th>
                                    <th>Доступно</th>
                                    <th></th>
                                </tr>
                                </tfoot>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
