<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <title>Retail Explorer</title>
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
    </head>
    <body>
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
    </body>
</html>
