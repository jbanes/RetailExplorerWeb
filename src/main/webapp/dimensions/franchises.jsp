<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="includes/header.jsp" />
<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js"></script>
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
<style>
    .layout {
        display: flex;
    }
    
    .sidebar {
        background-color: rgb(248, 249, 250);
        border-right: 1px solid rgb(222, 226, 230);
        padding: 1rem;
        margin-right: 2rem;
        height: calc(var(--page-content-height) - 2rem);
    }
    
    .dimension {
        flex-grow: 1;
    }
</style>
<div class="layout">
    <div class="sidebar">
        <div>Home</div>
        <div>Franchises</div>
        <div>Brands</div>
        <div>Categories</div>
    </div>
    <div class="dimension">
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
    </div>
</div>
<jsp:include page="includes/footer.jsp" />