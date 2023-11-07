<%@page import= "java.util.ArrayList"%>
<%@page import= "com.Accio.SearchResults"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<h1 class="text-d">QUEST</h1>
<div class="form-div">

    <div class="button-container1"></div>
    <form action="Search">
        <input type="text" style="font-size: 1.1rem;" placeholder="search or type URL" name="keyword">
        <button type="submit" class="search">Search</button>
    </form>
</div>

<div class="button-container2">
    <form action="History">
        <button type="submit" class="history">History</button>
    </form>
</div>

<div class = "showTable">
    <table border=2  class="table-result">
        <tr>
            <th>Title</th>
            <th>Link</th>
        </tr>
        <%
            ArrayList<SearchResults> results= (ArrayList<SearchResults>)request.getAttribute("results");
            for(SearchResults result:results){
        %>
        <tr>
            <td><%out.println(result.getTitle());%></td>
            <td><a href="<%out.println(result.getLink());%>"><%out.println(result.getLink());%></a></td>
        </tr>
        <%
            }
        %>
    </table>
</div>
</body>
</html>