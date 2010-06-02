<html>
<head>
	<title>Example REST Consumer Application</title>
	<style>
		a.delete {
			color: blue;
			text-decoration: underline;
			cursor: pointer;
		}
		#addForm { display: none; }
	</style>
</head>
<body id="top">
	<a href="#new" id="new">Add New Artist</a><br/>
	<form action="/taffy/api/index.cfm/artists" method="post" id="addForm">
		add form here
	</form>
	<table id="artists">
		<tr>
			<th>ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Address</th>
			<th>City</th>
			<th>State</th>
			<th>Postal Code</th>
			<th>Email</th>
			<th>Phone</th>
			<th>Fax</th>
			<th>Password</th>
			<th> </th>
		</tr>
	</table>
	<script type="text/javascript" src="jquery.1.4.2.min.js"></script>
	<cfoutput>
    	<script type="text/javascript">
			$(document).ready(function(){

				//delete-link handler
				$("##artists .delete").live('click', function(){
					deleteRow($(this).parent().parent().attr('id'));
				});

				//new-record-link handler
				$("##new").click(function(){
					$("##addForm").show("slow");
				});

				//load table data
				$.ajax({
					url: "#application.wsLoc#/artists",
					type: "get",
					dataType: "json",
					success: function(data, textStatus, xhr){
						var rowNum = 0;
						for (rowNum = 0; rowNum < data.DATA.length; rowNum++){
							addRow(
								"##artists",
								data.DATA[rowNum][0],
								data.DATA[rowNum][1],
								data.DATA[rowNum][2],
								data.DATA[rowNum][3],
								data.DATA[rowNum][4],
								data.DATA[rowNum][5],
								data.DATA[rowNum][6],
								data.DATA[rowNum][7],
								data.DATA[rowNum][8],
								data.DATA[rowNum][9],
								data.DATA[rowNum][10]
							);
						}
					},
					error: function(xhr, textStatus, err){
						alert(err & "\n\n" & textStatus);
					}
				});
			});
			function deleteRow(rowId){
				//hide the row
				$("##" + rowId).hide();
				//try to delete the record
				$.ajax({
					url: "#application.wsLoc#/artist/" + rowId,
					type: "delete",

					//if delete successful, remove the row
					success: function(){
						$(rowId).remove();
						alert("row deleted!");
					},

					//if delete failed, show the row and alert a message
					error: function(){
						$("##" + rowId).show();
						alert("Unable to delete record!");
					}
				});
			}
			function addRow(tableId, a, b, c, d, e, f, g, h, i, j, k){
				var row = $("<tr id='" + a + "'>"
							+ "<td>" + a + "</td>"
							+ "<td>" + b + "</td>"
							+ "<td>" + c + "</td>"
							+ "<td>" + d + "</td>"
							+ "<td>" + e + "</td>"
							+ "<td>" + f + "</td>"
							+ "<td>" + g + "</td>"
							+ "<td>" + h + "</td>"
							+ "<td>" + i + "</td>"
							+ "<td>" + j + "</td>"
							+ "<td>" + k + "</td>"
							+ "<td><a class='delete' href='##delete'>delete</a></td>"
							+ "</tr>");
				$(tableId).append(row);
			}
		</script>
    </cfoutput>
</body>
</html>