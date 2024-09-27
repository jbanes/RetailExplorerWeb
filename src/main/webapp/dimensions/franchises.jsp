<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../WEB-INF/includes/dimensions/header.jsp" />
<script>
    $(document).ready(function() {
        fetch("/services/dimensions/franchises")
            .then(response => response.json())
            .then(function(franchises) {

                var tbody = $("#franchises tbody");

                franchises.forEach(function(franchise) {
                    var tr = $("<tr>");
                    var productsLink = $("<a>")
                            .attr("href", "products.jsp?franchise=" + franchise.id)
                            .text(franchise.Products);
                    var storesLink = $("<a>")
                            .attr("href", "stores.jsp?franchise=" + franchise.id)
                            .text(franchise.Stores);
                    var employeesLink = $("<a>")
                            .attr("href", "employees.jsp?franchise=" + franchise.id)
                            .text(franchise.Products);

                    tr.append($("<td>").text(franchise.Name));
                    tr.append($("<td>").text(franchise.International));
                    tr.append($("<td>").append(productsLink));
                    tr.append($("<td>").append(storesLink));
                    tr.append($("<td>").append(employeesLink));

                    tbody.append(tr);
                });
            });
    });
</script>
<h1>Franchises</h1>
<table id="franchises">
    <thead>
        <tr>
            <th>Name</th>
            <th>International</th>
            <th>Products</th>
            <th>Stores</th>
            <th>Employees</th>
        </tr>
    </thead>
    <tbody></tbody>
</table>
<jsp:include page="../WEB-INF/includes/dimensions/footer.jsp" />