<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>etnShop</title>

        <spring:url value="/resources/core/css/hello.css" var="coreCss" />
        <spring:url value="/resources/core/css/bootstrap.min.css"
                    var="bootstrapCss" />
        <link href="${bootstrapCss}" rel="stylesheet" />
        <link href="${coreCss}" rel="stylesheet" />
    </head>

    <div class="container">
        <h2>Products</h2>
        <div class="input-group"> <span class="input-group-addon">Search</span>
            <input id="filter" type="text" class="form-control" placeholder="Type here...">
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Serial number</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <tbody class="searchable">
                <c:forEach items="${products}" var="product">
                    <tr>
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td>${product.serialNumber}</td>
                        <td><a class="btn btn-primary btn-lg" href="/etnshop/product/list/edit/${product.id}" role="button">Edit ${product.name}</a></td>                   
                    </tr>	
                </c:forEach>
            </tbody>
        </table>
        <hr>
        <p>
            <a class="btn btn-primary btn-lg" href="/etnshop" role="button">Back to homepage</a>
            <a class="btn btn-primary btn-lg" href="/etnshop/product/list/create" role="button">Create product</a>
        </p>
        <footer>
            <p>&copy; Etnetera a.s. 2015</p>
        </footer>
    </div>

    <spring:url value="/resources/core/js/bootstrap.min.js"
                var="bootstrapJs" />

    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${bootstrapJs}"></script>
</body>
</html>

<script type="text/javascript">
    $(document).ready(function () {

        (function ($) {

            $('#filter').keyup(function () {

                var rex = new RegExp($(this).val(), 'i');
                $('.searchable tr').hide();
                $('.searchable tr').filter(function () {
                    return rex.test($(this).text());
                }).show();

            })

        }(jQuery));

    });
</script>