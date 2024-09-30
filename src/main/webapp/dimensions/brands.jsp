<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../WEB-INF/includes/dimensions/header.jsp" />
<script>
    document.addEventListener("DOMContentLoaded", function() {
        fetch("/services/dimensions/brands")
            .then(response => response.json())
            .then(function(brands) {
                document.getElementById("brands").data(brands);
            });
    });
</script>
<h1>Brands</h1>
<paginated-table id="brands">
    <columns>
        <column>Name</column>
        <column href="categories.jsp?brand={id}" type="number">Categories</column>
        <column href="products.jsp?brand={id}" type="number">Products</column>
    </columns>
    <link href="${root}/css/table.css" rel="stylesheet" type="text/css">
</paginated-table> 
<paginated-table-pager id="pager" table="#brands">
    <link href="${root}/css/pager.css" rel="stylesheet" type="text/css">
</paginated-table-pager>
<jsp:include page="../WEB-INF/includes/dimensions/footer.jsp" />
