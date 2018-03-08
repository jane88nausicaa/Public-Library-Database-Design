<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>read author</title>
</head>
<body>
	<h1> Read Author</h1>
	<?php
	$Fname = $_GET["Fname"]; 
	$con = mysqli_connect("localhost","root","root","public library"); 
	$sql = "SELECT ID, Fname, Lname from Author";
	$result = $con -> query ($sql); 
	echo "<table border='1'> <tr> <th>Author ID</th> <th>First Name</th></tr>";
	while($row = mysqli_fetch_array($result)) {
		echo "<tr>";
		echo "<td>" . $row['ID'] . "</td>";
		echo "<td>" . $row['Fname'] . "</td>"; echo "</tr>";
	}
	echo "</table>";
	mysqli_query($con,$sql); 
	mysqli_close($con);
	?>
</body>
</html>