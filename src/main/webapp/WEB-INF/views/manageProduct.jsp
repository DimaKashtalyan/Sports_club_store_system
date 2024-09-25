<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="container">
    <div class="row">
        <c:if test="${not empty message }">
            <div class="col-xs-12">
                <div class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                        ${message }
                </div>
            </div>
        </c:if>

        <div class="col-md-offset-2 col-md-8">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4>Управление товарами</h4>
                </div>
                <div class="panel-body">
                    <sf:form class="form-horizontal" modelAttribute="product"
                             action="/manage/products" method="POST"
                             enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="control-label col-md-4" for="name">Введите название продукции : </label>
                            <div class="col-md-8">
                                <sf:input type="text" path="name" id="name"
                                          placeholder="Название товара" class="form-control"/>
                                <sf:errors path="name" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="brand">Введите название марки : </label>

                            <div class="col-md-8">
                                <sf:input type="text" path="brand" id="brand"
                                          placeholder="Название марки" class="form-control"/>
                                <sf:errors path="brand" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="description">
                                Описание товара : </label>

                            <div class="col-md-8">
                                <sf:textarea path="description" id="description" row="10"
                                             placeholder="Напишите описание к товару"
                                             class="form-control"/>
                                <sf:errors path="description" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="unitPrice">Введите цену : </label>

                            <div class="col-md-8">
                                <sf:input type="number" path="unitPrice" id="unitPrice"
                                          placeholder="Unit Price in &#8381" class="form-control"/>
                                <sf:errors path="unitPrice" cssClass="help-block" element="em"/>

                            </div>
                        </div>


                        <div class="form-group">
                            <label class="control-label col-md-4" for="quantity">Количество доступных : </label>

                            <div class="col-md-8">
                                <sf:input type="number" path="quantity" id="quantity"
                                          placeholder="Количество доступных" class="form-control"/>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="file">Выбрать изображение : </label>

                            <div class="col-md-8">
                                <sf:input type="file" path="file" id="file" class="form-control"/>
                                <sf:errors path="file" cssClass="help-block" element="em"/>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="control-label col-md-4" for="categoryId">Выбрать категорию : </label>

                            <div class="col-md-8">
                                <sf:select path="categoryId" id="categoryId"
                                           class="form-control" items="${categories }" itemLabel="name"
                                           itemValue="id"/>

                                <c:if test="${product.id == 0 }">
                                    <div class="text-right">
                                        <br>
                                        <button type="button" data-toggle="modal"
                                                data-target="#myCategoryModal" class="btn btn-warning btn-xs">Добавить категорию
                                        </button>
                                    </div>
                                </c:if>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-4 col-md-8">
                                <input type="submit" name="submit" id="submit" value="Принять"
                                       class="btn btn-primary"/>
                                <sf:hidden path="id"/>
                                <sf:hidden path="code"/>
                                <sf:hidden path="supplierId"/>
                                <sf:hidden path="purchases"/>
                                <sf:hidden path="views"/>
                                <sf:hidden path="active"/>
                            </div>
                        </div>

                    </sf:form>

                </div>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-xs-12">
            <h3>Доступные товары</h3>
            <hr/>
        </div>
        <div class="col-xs-12">
            <div class="container-fluid">
                <div class="table-responsive">

                    <table id="adminProductsTable"
                           class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>&#160</th>
                            <th>Название</th>
                            <th>Марка</th>
                            <th>Количество</th>
                            <th>Цена</th>
                            <th>Активный</th>
                            <th>Изменить</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Id</th>
                            <th>&#160</th>
                            <th>Название</th>
                            <th>Марка</th>
                            <th>Количество</th>
                            <th>Цена</th>
                            <th>Активный</th>
                            <th>Изменить</th>
                        </tr>
                        </tfoot>

                    </table>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="myCategoryModal" role="dialog"
         tabindex="-1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                    <h4 class="modal-title">Добавить новую категорию</h4>
                </div>

                <div class="modal-body">

                    <sf:form id="categoryForm" modelAttribute="category"
                             action="${contextRoot }/manage/category" method="POST"
                             class="form-horizontal">
                        <div class="form-group">
                            <label for="name" class="control-label col-md-4">
                                Имя категории : </label>
                            <div class="col-md-8">
                                <sf:input type="text" path="name" id="category_name"
                                          class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="description" class="control-label col-md-4">
                                Описание категории : </label>
                            <div class="col-md-8">
                                <sf:textarea cols="" rows="5" path="description"
                                             id="category_description" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-4 col-md-8">
                                <input type="submit" value="Добавить категорию"
                                       class="btn btn-primary"/>
                            </div>
                        </div>

                    </sf:form>

                </div>

            </div>

        </div>

    </div>


</div>