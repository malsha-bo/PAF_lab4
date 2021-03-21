<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
	if (request.getParameter("itemCode") != null)
		 {
		 Item itemObj = new Item();
		 String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
		 request.getParameter("itemName"),
		 request.getParameter("itemPrice"),
		 request.getParameter("itemDesc"));
		 session.setAttribute("statusMsg", stsMsg);
		 }
		 
		 //Delete item----------------------------------
	if (request.getParameter("itemID") != null)
	  {
		
			Item itemObj = new Item();
			
			String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
			
			session.setAttribute("statusMsg", stsMsg);
	}
	//Update item----------------------------------
    if (request.getParameter("itemID") != null)
	{
		
		Item itemObj = new Item();
	String stsMsg2 = itemObj.updateItem(request.getParameter("itemCode"),
	request.getParameter("itemName"),
	request.getParameter("itemPrice"),
	request.getParameter("itemDesc"));
	session.setAttribute("statusMsg", stsMsg2);
	}
	%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	
<title>Insert title here</title>
</head>
<body>
<h1>Items Management</h1>
<form method="post" action="items.jsp">
 		item Code : <input name="itemCode" type="text" ><br>
		item Name : <input name="itemName" type="text" ><br>
		item Price : <input name="itemPrice" type="text" ><br>
		item description : <input name="itemDesc" type="text" ><br>
		<input name="btnSubmit" type="submit" value="save" >

</form>
<%
 out.print(session.getAttribute("statusMsg"));
%>
<br>
<%
 Item itemObj = new Item();
 out.print(itemObj.readItems());
%>



</body>
</html>
    