<%

int rows = Integer.parseInt(request.getParameter("rows"));
int columns = Integer.parseInt(request.getParameter("columns"));
int num = 1;

if (rows > 0 && columns > 0 && rows % 2 != 0 && columns % 2 != 0) {
    out.write("<table height=\"100%\" width=\"100%\">");
    for (int i = 1; i <= rows; i++) {
        out.write("<tr>");
        for (int j = 1; j <= columns; j++) {
        if (i == 1 || j == 1 || i == rows || j == columns) {
            out.write("<td bgcolor=\"red\"><center>" + num + "</td>");
        } else if
        ((rows * columns + 1) / 2 == num) {
            out.write("<td bgcolor=\"white\"><center>" + num + "</td>");
        } else {
            out.write("<td bgcolor=\"g28CA35\"><center>" + num + "</td>");
        }
        num++;
    }
    out.write("</tr>");
}

} else {
    out.write("<center><h1><font color=red>CRITICAL ERROR</font></h1><br>try writing odd numbers in the rows and columns fields<br>");
    out.write("<a href=http://localhost:8080/iteajw/hw1/table.jsp> LEMME TRY AGAIN </a>");
}       

%>