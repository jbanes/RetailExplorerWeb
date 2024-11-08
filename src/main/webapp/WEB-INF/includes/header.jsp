<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="root" value="${pageContext.request.contextPath}" scope="request" />
<c:set var="url" value="${pageContext.request.requestURL}" scope="page" />
<html lang="en">
<header>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- HTML Meta Tags -->
    <title>Retail Explorer</title>
    <meta name="description" content="This application serves as a technology demonstration for the upcoming Convirgance suite of technologies from Invirgance. These technologies attempt to challenge the norm with extraordinarily simple approaches that are easier to reason on, faster to develop, higher performance, and better aligned with the way computers work.">

    <!-- Facebook Meta Tags -->
    <meta property="og:url" content="https://retailexplorer.invirgance.org">
    <meta property="og:type" content="website">
    <meta property="og:title" content="Retail Explorer">
    <meta property="og:description" content="This application serves as a technology demonstration for the upcoming Convirgance suite of technologies from Invirgance. These technologies attempt to challenge the norm with extraordinarily simple approaches that are easier to reason on, faster to develop, higher performance, and better aligned with the way computers work.">
    <meta property="og:image" content="https://opengraph.b-cdn.net/production/images/ac61399f-e29a-4923-9419-0d1ad0fa9387.jpg?token=0ZK4CTXDMAMUomLS8EJFOD6KibwTqu9xtmU8aHpD-L4&height=698&width=1200&expires=33267108503">

    <!-- Twitter Meta Tags -->
    <meta name="twitter:card" content="summary_large_image">
    <meta property="twitter:domain" content="retailexplorer.invirgance.org">
    <meta property="twitter:url" content="https://retailexplorer.invirgance.org">
    <meta name="twitter:title" content="Retail Explorer">
    <meta name="twitter:description" content="This application serves as a technology demonstration for the upcoming Convirgance suite of technologies from Invirgance. These technologies attempt to challenge the norm with extraordinarily simple approaches that are easier to reason on, faster to develop, higher performance, and better aligned with the way computers work.">
    <meta name="twitter:image" content="https://opengraph.b-cdn.net/production/images/ac61399f-e29a-4923-9419-0d1ad0fa9387.jpg?token=0ZK4CTXDMAMUomLS8EJFOD6KibwTqu9xtmU8aHpD-L4&height=698&width=1200&expires=33267108503">

    <link href="${root}/css/global.css" rel="stylesheet">
    <script src="${root}/emirgance/base/base.js"></script>
    <script src="${root}/emirgance/paginated/table.js"></script>
    <script src="${root}/emirgance/paginated/pager.js"></script>
    <script src="${root}/emirgance/paginated/display.js"></script>
    <script src="${root}/emirgance/paginated/search.js" defer></script>
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
                <a class="nav-link ${fn:contains(url, "/dashboards/") ? "selected" : ""}" href="${root}/dashboards/index.jsp">
                   <svg width="24" height="24"><use xlink:href="${root}/images/symbols.svg#table"></use></svg>
                    Dashboards
                </a>
            </div>
            <div>
                <a class="nav-link ${fn:contains(url, "/analytics/") ? "selected" : ""}" href="${root}/analytics/index.jsp">
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
