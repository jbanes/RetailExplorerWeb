<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="root" value="${pageContext.request.contextPath}" scope="request" />
<c:set var="url" value="${pageContext.request.requestURL}" scope="page" />
<html lang="en">
<header>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Retail Explorer</title>
    <link href="${root}/css/global.css" rel="stylesheet">
    <script src="${root}/emirgance/base/base.js"></script>
    <script src="${root}/emirgance/paginated/table.js"></script>
    <script src="${root}/emirgance/paginated/pager.js"></script>
</header>
<body>
    <div id="page_header">
        <div id="page_tray">
            <svg width="24" height="24"><use xlink:href="${root}/images/symbols.svg#tray"></use></svg>
        </div>
        <div id="page_logo">Retail Explorer</div>
        <div id="page_navigation">
            <div>
                <a class="nav-link ${fn:contains(url, "/home/") ? "selected" : ""}" href="${root}/home/index.jsp">
                   <svg width="24" height="24"><use xlink:href="${root}/images/symbols.svg#home"></use></svg>
                    Home
                </a>
            </div>
            <div>
                <a class="nav-link ${fn:contains(url, "/dimensions/") ? "selected" : ""}" href="${root}/dimensions/index.jsp">
                   <svg width="24" height="24"><use xlink:href="${root}/images/symbols.svg#speedometer2"></use></svg>
                    Dimensions
                </a>
            </div>
            <div>
                <a class="nav-link ${fn:contains(url, "/dashboards/") ? "selected" : ""}">
                   <svg width="24" height="24"><use xlink:href="${root}/images/symbols.svg#table"></use></svg>
                    Dashboards
                </a>
            </div>
            <div>
                <a class="nav-link ${fn:contains(url, "/analytics/") ? "selected" : ""}">
                   <svg width="24" height="24"><use xlink:href="${root}/images/symbols.svg#grid"></use></svg>
                    Analytics
                </a>
            </div>
        </div>
    </div>
    <script>
        document.getElementById("page_tray").onclick = function() {
            var el = document.querySelector(".sidebar");
            
            if(el.style.display === 'none') 
            {   
                el.classList.add("slide-in");
                el.style.display = '';
                
                setTimeout(function() { 
                    el.classList.remove("slide-in");
                }, 300);
            }
            else 
            {
                el.classList.add("slide-out");
                
                setTimeout(function() { 
                    el.style.display = 'none'; 
                    el.classList.remove("slide-out");
                }, 300);
            }
        };
    </script>
    <div id="page_content">
