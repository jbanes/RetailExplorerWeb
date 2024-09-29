<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../WEB-INF/includes/dimensions/header.jsp" />
<script>
    $(document).ready(function() {
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
    <link href="${root}/css/table.css" rel="stylesheet" type="text/css">
</paginated-table> 
<paginated-table-pager id="pager" table="#franchises">
    <link href="${root}/css/pager.css" rel="stylesheet" type="text/css">
</paginated-table-pager>
<jsp:include page="../WEB-INF/includes/dimensions/footer.jsp" />