<%@page import= "java.util.ArrayList"%>
<%@page import= "com.Engine.HistoryResults"%>
<html>
<head>
    <link rel="stylesheet"  type="text/css" href="styles.css">
</head>
<body>
<h1 class="text-d">QUEST</h1>
<div class="form-div">
    <div class="button-container1"></div>
    <form action="Search">
        <input type="text" style="font-size: 1.1rem;" placeholder="search you favourite topic" name="keyword">
        <button type="submit" class="search-one">Search</button>
    </form>
</div>

<div class = "showTable">
    <table border=2  class="table-result">
        <tr>
            <th>Title</th>
            <th>Link</th>
        </tr>
        <%
            ArrayList<HistoryResults> results= (ArrayList<HistoryResults>)request.getAttribute("results");
            for(HistoryResults result:results){
        %>
        <tr>
            <td><%out.println(result.getKeyword());%></td>
            <td><a href="<%out.println(result.getLink());%>"><%out.println(result.getLink());%></a></td>
        </tr>
        <%
            }
        %>
    </table>
</div>
</body>
</html>