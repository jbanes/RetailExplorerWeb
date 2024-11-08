<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../WEB-INF/includes/header.jsp" />
<style>
    .layout {
        display: flex;
    }
    
    .sidebar {
        background-color: rgb(248, 249, 250);
        border-right: 1px solid rgb(222, 226, 230);
        padding: 1rem;
        min-height: calc(var(--page-content-height) - 2rem);
    }
    
    .sidebar > a > div {
        margin: 0.5rem 0.25rem;
        min-width: 12rem;
        font-weight: 500;
        padding: 4px 20px 4px 12px;
        user-select: none;
        -webkit-user-select: none;
    }
    
    .sidebar > a > div:hover, .sidebar > a > div.selected {
        color: white;
        border-radius: 8px;
        cursor: pointer;
    }
    
    .sidebar > a > div.disabled {
        background-color: transparent !important;
        color: rgb(178, 187, 195) !important;
        cursor: default !important;
    }
    
    .sidebar > a > div.selected {
        background-color: #2494fc;
    }
    
    .sidebar > a > div:hover {
        background-color: #0474dc;
    }
    
    .sidebar > a > div.level1 {
        padding: 4px 4px 4px 28px;
    }
    
    .sidebar > a > div.level2 {
        padding: 4px 4px 4px 56px;
        min-width: 10rem;
    }
    
    .sidebar > a {
        color: inherit;
        text-decoration: none;
    }
    
    .sidebar > a > div svg {
        width: 1rem;
        height: 1rem;
        margin-right: 0.25rem;
        margin-bottom: -0.1rem;
    }
    
    .main {
        flex-grow: 1;
        padding: 0 1rem 0 1rem;
    }
    
    .main h1 {
        margin-block-end: 0;
    }
</style>
<div class="layout">
    <div class="sidebar">
        <a href="index.jsp">
            <div>
                <svg><use xlink:href="${root}/images/symbols.svg#house-fill"></use></svg>
                Home
            </div>
        </a>
        <a href="architecture.jsp">
            <div class="selected">
                <svg><use xlink:href="${root}/images/symbols.svg#compass"></use></svg>
                Architecture
            </div>
        </a>
        <a href="source.jsp">
            <div>
                <svg><use xlink:href="${root}/images/symbols.svg#github"></use></svg>
                Source Code
            </div>
        </a>
    </div>
    <div class="main">
        <h1>Architecture</h1>
        <h2>Overview</h2>
        <p>Designed as a more classic "multi-page application", Retail Explorer
        seeks to demonstrate an alternate approach to today's heavyweight SPA
        solutions built on "react flow" patterns backed by code-intense ORM
        systems.</p>
        <p>The application relies heavily on configuration of common components
        to accomplish the necessary heavy lifting. This drastically shrinks code
        sizes on both the server and on the client side while returning fine-grained
        control to the application developer.</p>
        <p>With an architecture like this, a small team of full-stack engineers
        can create a highly competitive application in under 3 months. More importantly,
        they can rapidly enhance and maintain the application, responding to customer
        feedback within one sprint cycle or less.
        <p>For comparison, the current investment as of this writing is 1 developer
        over two months. Most of the time has been spent building the foundational
        libraries, meaning the investment in development of the application itself
        has been drastically less.</p>
        <div style="text-align: center;">
            <img src="../images/Architectural Diagram.svg" alt="Architectural Diagram" style="max-height: 60vh">
            <span style="font-weight: bold; font-style: italic; font-size: 90%; line-height: 3;">Figure 1: Architecture block diagram</span>
        </div>
        <h2>Data Generator</h2>
        <p>The data generation component is designed to output approximately 1 
        terabyte of data per year of analysis, across 20 simulated franchises.</p>
        <p>However, the data is only minimally "simulated" in its current state. 
        What this means is that the results are far too evenly distributed, 
        lacking in "hot spots" and key points of interest.</p>
        <p>This will make the analysis of the data less interesting until bell 
        curves, logarithmic growths, "popular" regions, holiday seasons,
        and other more advanced simulation techniques are added to the data 
        generation.</p>
        <h2>Oracle Database</h2>
        <p>The Star Schema is stored, accessed, and queried in an Oracle 21C
        Community Edition databases. Oracle was chosen for its exceptional performance
        when working with OLAP queries. Not only is it faster out of the box than
        most other databases, it can be tuned significantly with compression,
        Bitmap joins, and other features that put it in the top spot for a SQL
        database.</p>
        <p>Unfortunately, the free Community Edition version is quite limiting with
        a maximum data storage size of 12GB. This limits the current dataset in the
        application to a single day of data across all 20 franchises.</p>
        <p>One solution to this limitation is to upgrade to Oracle Enterprise
        Edition. While expensive, this would make far better use of the available
        hardware.</p>
        <p>The primary reason for not upgrading is that Oracle will be replaced
        in the near future with a brand new database system called 
        <b>Divirgance</b>. The Divirgance database system will use many of the 
        same scaling techniques for OLAP as Oracle, but will further bake a
        "state machine"-based approach to ETL that will drastically simplify the
        ingestion and update of large data sets.</p>
        <p>Watch this space for more info.</p>
        <h2>Application Server</h2>
        <p>The application has minimal needs for a server system. It only needs
        a templating engine for basic "server side rendering", ability to deliver
        supporting files like CSS/JS/images, and ability to run a basic Servlet
        pattern for web services.</p>
        <p>Glassfish is an excellent choice here. It's easy to setup, easy to 
        configure, extremely high performance thanks to the underlying Grizzly I/O
        subsystem, open source, and free to use for both personal and commercial 
        purposes.</p>
        <h2>Convirgance</h2>
        <p>Convirgance is a brand new approach to application database access. Rather
        than attempting to map the database into a collection of Java objects 
        using the ORM pattern, it instead exposes a direct SQL interface. The 
        results of the SQL query are transformed into an Iterator of Maps.</p>
        <p>This stream of Map objects can be easily manipulated with common filters
        and transformations, similar to the operations available in most DBMS
        systems.</p>
        <p>Most importantly, the stream of Maps can then be passed to various
        output options to create delimited files, json files, or inserted back into
        a database. Transformations, inputs, and outputs are all pluggable, making
        this an excellent basis for the types of queries and data movements most
        applications need to perform.</p>
        <h2>Convirgance Web Services</h2>
        <p>Building on the base provided by Convirgance, the Web Services library
        provides configurable services that can be easily wired together with an
        IoC container like Spring.</p>
        <p>This allows rapid creation of web services with no custom code. In 
        fact, you can see that all the <a href="https://github.com/jbanes/RetailExplorerServices/tree/main/src/main/webapp/dimensions">dimension services</a> 
        are just XML configs with no custom Java code. An example of the simplest
        is the <a href="https://github.com/jbanes/RetailExplorerServices/blob/main/src/main/webapp/dimensions/franchises.xml">franchises</a> 
        service with no input parameters to manage. The most complex example is
        the <a href="https://github.com/jbanes/RetailExplorerServices/blob/main/src/main/webapp/dimensions/products.xml">products</a> 
        service which deals with a number of request parameters that can be used
        as potential filters.</p>
        <p>The OLAP engine interface uses a custom plugin to list available Dimensions &amp;
        Measures and another custom plugin to generate results based on selected
        Dimensions &amp;  Measures. The resulting <a href="https://github.com/jbanes/RetailExplorerServices/tree/main/src/main/webapp/analytics">xml files</a> 
        for the OLAP services are very simple and easy to understand.</p>
        <h2>Convirgance OLAP Engine</h2>
        <p>Engine for exposing the Dimensions and Measures in a Star Schema, then
        automatically generating SQL based upon the requested Dimension / Measure
        combination. The SQL is then fed to the underlying Convirgance system, produced
        as a stream of Maps, then transformed to JSON for delivery to the web
        browser.</p>
        <p>The Retail Explorer keeps the configuration in a <a href="https://github.com/jbanes/RetailExplorerServices/blob/main/src/main/resources/stars/sales.xml">Spring file</a>. 
        However, the engine is capable of programmatic configuration, allowing for
        a model designer to be created if the application needs it.</p>
        <h2>Java Server Pages (JSP)</h2>
        <p>The application is designed as a modern "horizontal architecture", separating
        HTML delivery of the interface from delivery of data. While the applicaiton
        could use a pure HTML approach, a templating engine simplifies the application
        by allowing common includes like header and footer.</p>
        <p>The application is further simplified by allowing decisions like the
        currently selected page to make in the templating engine. This prevents 
        the need for SPA/Router functionality on the client.</p>
        <h2>Emirgance Web Components</h2>
        <p>Given the <a href="https://github.com/jbanes/versus-js/blob/main/Original/README.md">tight code</a>
        <a href="https://jbanes.github.io/versus-js/documents/analysis.html">productivity</a> offered
        by jQuery, a classic web development approach was considered for critical 
        components of the system. However, the decision was made to use even more
        portable Web Components as a solution. <a href="https://jbanes.github.io/WebComponentStylesheets/article.html">Styling issues</a>
        were resolved and a commitment was made to use Web Components for common
        application components.</p>
        <p>This work is being consolidated into a library called Emirgance so that
        other web developers will be able to reuse these components once the library
        is mature and the programming model is fully sorted.</p>
        <p>While this is risky due to the immaturity of Web Components as an 
        approach, we believe that this provides the best long-term method of creating
        and distributing reusable components.</p>
        <h2>CSS</h2>
        <p>The CSS has been carefully built and tuned for the Retail Explorer
        application. Advanced features like animations and transitions have been
        judiciously used to improve the user experience.</p>
        <h2>SVG</h2>
        <p>Retail Explorer follows the current trend of using SVG symbols as icons
        in the application. This allows for smaller downloads and faster rendering
        over the classic solution of loading custom fonts and/or the even older solution
        of using sprite sheets.</p>
    </div>
</div>
<jsp:include page="../WEB-INF/includes/footer.jsp" />