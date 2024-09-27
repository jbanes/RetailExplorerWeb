<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../WEB-INF/includes/dimensions/header.jsp" />
<script>
    $(document).ready(function() {

        var params = [];

        <c:if test="${not empty param.franchise}">
        params.push("franchise=<c:out value="${param.franchise}" />");
        </c:if>

        <c:if test="${not empty param.brand}">
        params.push("brand=<c:out value="${param.brand}" />");
        </c:if>

        <c:if test="${not empty param.category}">
        params.push("category=<c:out value="${param.category}" />");
        </c:if>

        <c:if test="${not empty param.type}">
        params.push("type=<c:out value="${param.type}" />");
        </c:if>

        <c:if test="${not empty param.subtype}">
        params.push("subtype=<c:out value="${param.subtype}" />");
        </c:if>

        fetch("/services/dimensions/products?" + params.join('&'))
            .then(response => response.json())
            .then(function(products) {

                var tbody = $("#products tbody");

                products.forEach(function(product) {
                    var tr = $("<tr>");

                    tr.append($("<td>").text(product.Name));
                    tr.append($("<td>").text(product.Price));
                    tr.append($("<td>").text(product.BrandName));
                    tr.append($("<td>").text(product.CategoryName));
                    tr.append($("<td>").text(product.Type));
                    tr.append($("<td>").text(product.SubType));

                    tbody.append(tr);
                });
            });
    });
</script>
<h1>Products</h1>
<table id="products">
    <thead>
        <tr>
            <th>Name</th>
            <th>Price</th>
            <th>Brand</th>
            <th>Category</th>
            <th>Type</th>
            <th>SubType</th>
        </tr>
    </thead>
    <tbody></tbody>
</table>
<jsp:include page="../WEB-INF/includes/dimensions/footer.jsp" />