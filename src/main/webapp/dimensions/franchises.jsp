<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../WEB-INF/includes/dimensions/header.jsp" />
<script>
    document.addEventListener("DOMContentLoaded", function() {
        fetch("/services/dimensions/franchises")
            .then(response => response.json())
            .then(function(franchises) {
                document.getElementById("franchises").data(franchises);
            });
    });
</script>
<h1>Franchises</h1>
<paginated-table id="franchises">
    <columns>
        <column>Name</column>
        <column>International</column>
        <column href="products.jsp?franchise={id}" type="number">Products</column>
        <column href="stores.jsp?franchise={id}" type="number">Stores</column>
        <column href="employees.jsp?franchise={id}" type="number">Employees</column>
    </columns>
    <link href="${root}/emirgance/themes/base/paginated/table.css" rel="stylesheet" type="text/css">
</paginated-table> 
<div class="pager-bar">
    <paginated-display table="#franchises">
        <link href="${root}/emirgance/themes/base/paginated/display.css" rel="stylesheet" type="text/css">
    </paginated-display>
    <paginated-pager id="pager" table="#franchises">
        <link href="${root}/emirgance/themes/base/paginated/pager.css" rel="stylesheet" type="text/css">
    </paginated-pager>
</div>
<jsp:include page="../WEB-INF/includes/dimensions/footer.jsp" />