<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../WEB-INF/includes/dimensions/header.jsp" />
<script>
    document.addEventListener("DOMContentLoaded", async function() {
        var response = await fetch("/services/dimensions/brands");
        var brands = await response.json();
        
        document.getElementById("brands").data(brands);
    });
</script>
<h1>Brands</h1>
<paginated-table id="brands">
    <columns>
        <column>Name</column>
        <column href="categories.jsp?brand={id}" type="number">Categories</column>
        <column href="products.jsp?brand={id}" type="number">Products</column>
    </columns>
    <link href="${root}/emirgance/themes/base/paginated/table.css" rel="stylesheet" type="text/css">
</paginated-table>
<div class="pager-bar">
    <paginated-display table="#brands">
        <link href="${root}/emirgance/themes/base/paginated/display.css" rel="stylesheet" type="text/css">
    </paginated-display>
    <paginated-pager id="pager" table="#brands">
        <link href="${root}/emirgance/themes/base/paginated/pager.css" rel="stylesheet" type="text/css">
    </paginated-pager>
</div>
<jsp:include page="../WEB-INF/includes/dimensions/footer.jsp" />
