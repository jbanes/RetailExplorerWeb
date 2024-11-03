<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../WEB-INF/includes/header.jsp" />
<div style="width: 90%; margin: auto;">
<h1>Home</h1>
<img src="../images/under_construction.svg" style="float: right;" alt="Under Construction" title="Under Construction">
<p>Thank you for visiting the Retail Explorer demo application! This application
   has been designed as a simplified version of many real-world applications that 
   cost upwards of hundreds of thousands to build.</p>
<p>This application serves as a technology demonstration for the upcoming 
   Convirgance suite of technologies from Invirgance. These technologies attempt 
   to challenge the norm with extraordinarily "simple" approaches that are easier 
   to reason on, faster to develop, higher performance, and better aligned with 
   the way computers work.</p>

<p>Please mind our dust as this application is under active construction. You will
   find numerous bugs and data quality issues that we're working to resolve. We
   hope you enjoy this technology demonstration and encourage you to check back
   regularly for enhancements and updates!</p>

<h2>Source Code</h2>
<p>Despite being under development, we're making all the source code of the application
   and the underlying libraries available for examination and use. Follow the links
   below if you would like to check it out. And feel free to <a href="mailto:info@invirgance.com">contact 
   us</a> if you would like to know more.</p>

<h3>Retail Explorer</h3>
<ul>
    <li><a href="https://github.com/jbanes/RetailExplorerWeb">Frontend</a></li>
    <li><a href="https://github.com/jbanes/RetailExplorerServices">Web Services</a></li>
</ul>
<h3>Libraries</h3>
<ul>
    <li><a href="https://github.com/InvirganceOpenSource/convirgance">Convirgance (Base)</a></li>
    <li><a href="https://github.com/InvirganceOpenSource/convirgance-web">Convirgance (Web Services)</a></li>
    <li><a href="https://github.com/InvirganceOpenSource/convirgance-olap">Convirgane (OLAP)</a></li>
    <li><a href="https://github.com/InvirganceOpenSource/emirgance">Emirgance (JS Web Components)</a></li>
</ul>
<h3>Artificial Data Generation</h3>
<ul>
    <li><a href="https://github.com/jbanes/datagen">Retail Data Generator</a></li>
</ul>
</div>
<script>
    document.getElementById("page_tray").classList.add("disabled");
</script>
<jsp:include page="../WEB-INF/includes/footer.jsp" />