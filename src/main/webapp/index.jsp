<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>TomTom Map Tool Kit API</title>
		<script type="text/javascript">
function altRows(id) {
	if (document.getElementsByTagName) {

		var table = document.getElementById(id);
		var rows = table.getElementsByTagName("tr");

		for (i = 0; i < rows.length; i++) {
			if (i % 2 == 0) {
				rows[i].className = "evenrowcolor";
			} else {
				rows[i].className = "oddrowcolor";
			}
		}
	}
}
window.onload = function() {
	altRows('alternatecolor');
}
$("#form").submit(function() {
	var requiredFailed = true;
	$("#form input:text").each(function() {
		if ($.trim($(this).val()).length == 0) {
			requiredFailed = false;
			return false;
		}
	});
	return requiredFailed;
});
</script>
		<style type="text/css">
table.altrowstable {
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #333333;
	border-width: 1px;
	border-color: #a9c6c9;
	border-collapse: collapse;
}

table.altrowstable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}

table.altrowstable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}

.oddrowcolor {
	background-color: #d4e3e5;
}

.evenrowcolor {
	background-color: #c3dde0;
}
</style>
	</head>
	<body>
		<form method="post" action="/tomtomServlet">
			<center>
				<table id="alternatecolor">
					<tr>
						<td align="center" colspan="2">
							Map ToolKit API
							<img src="img/tomtom.jpg" alt="TomTom"></img>
						</td>
					</tr>
					<tr>
						<td>
							API Key
						</td>
						<td>
							<input name="profile" type="text" align="middle"
								value="zwtr58uu269nkh9gfphw5hwk" />
						</td>
					</tr>
					<tr>
						<td>
							style
						</td>
						<td>
							<select name="style">
								<option value="1" selected="selected">
									standard map tiles
								</option>
								<option value="1-labels">
									standard label overlay
								</option>
								<option value="1-hybrid">
									hybrid overlay
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							zoom
						</td>
						<td>
							<input name="zoom" type="text" align="middle" value="10"/>
						</td>
					</tr>
					<tr>
						<td>
							x
						</td>
						<td>
							<input name="x" type="text" align="middle" value="511" />
						</td>
					</tr>
					<tr>
						<td>
							y
						</td>
						<td>
							<input name="y" type="text" align="middle" value="340"/>
						</td>
					</tr>
					<tr>
						<td>
							mimeType
						</td>
						<td>
							<select name="mimeType">
								<option value=".png" selected="selected">
									png format
								</option>
								<option value=".jpg">
									JPEG format
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2">
							<input type="submit" value="Get Map Details">
						</td>
					</tr>
				</table>
			</center>
		</form>
		<%
			if (request.getAttribute("data") != null) {
		%>
		<div id="results">
			<%=request.getAttribute("data")%>
		</div>
		<%
			}
		%>
	</body>
</html>
