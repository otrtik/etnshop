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
        <h2>Edit ${product.name}</h2>
        <form method="POST" modelAttribute="product" action="${pageContext.servletContext.contextPath}/product/list/edit/${product.id}">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" name="name" id="name" value="${product.name}">
            </div>
            <div class="form-group">
                <label for="serialNumber">Serial number:</label>
                <input type="text" class="form-control" name="serialNumber" id="serialNumber" value="${product.serialNumber}">
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
        <hr>
        <p>
            <a class="btn btn-primary btn-lg" href="/etnshop/product/list" role="button">Back to products</a>           
        </p>
        <footer>
            <p>&copy; Etnetera a.s. 2015</p>
        </footer>
    </div>

    <spring:url value="/resources/core/css/bootstrap.min.js"
                var="bootstrapJs" />

    <script src="${bootstrapJs}"></script>
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</body>
</html>