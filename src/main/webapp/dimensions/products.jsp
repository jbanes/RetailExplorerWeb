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
                document.getElementById("products").data(products);
            });
    });
</script>
<h1>Products</h1>
<paginated-table id="products">
    <columns>
        <column>Name</column>
        <column key="BrandName">Brand</column>
        <column key="CategoryName">Category</column>
        <column>Type</column>
        <column>SubType</column>
        <column type="number">Price</column>
    </columns>
    <link href="${root}/css/table.css" rel="stylesheet" type="text/css">
</paginated-table> 
<paginated-table-pager id="pager" table="#products">
    <link href="${root}/css/pager.css" rel="stylesheet" type="text/css">
</paginated-table-pager>
<jsp:include page="../WEB-INF/includes/dimensions/footer.jsp" />