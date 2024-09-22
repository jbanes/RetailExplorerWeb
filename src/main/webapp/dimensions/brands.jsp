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
                fetch("/services/dimensions/brands")
                    .then(response => response.json())
                    .then(function(brands) {
                        
                        var tbody = $("#brands tbody");
                        
                        brands.forEach(function(brand) {
                            var tr = $("<tr>");
                            var cagtegoriesLink = $("<a>")
                                    .attr("href", "categories.jsp?brand=" + brand.id)
                                    .text(brand.Categories);
                            var productsLink = $("<a>")
                                    .attr("href", "products.jsp?brand=" + brand.id)
                                    .text(brand.Products);

                            tr.append($("<td>").text(brand.Name));
                            tr.append($("<td>").append(cagtegoriesLink));
                            tr.append($("<td>").append(productsLink));
                            
                            tbody.append(tr);
                        });
                    });
            });
        </script>
    </head>
    <body>
        <h1>Brands</h1>
        <table id="brands">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Categories</th>
                    <th>Products</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </body>
</html>
