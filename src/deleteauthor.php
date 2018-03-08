<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>delete author</title>
</head>
<body>
	<h1> Delete Author</h1>
	<?php
	$ID = $_POST["ID"];
	$Fname = $_POST["Fname"]; 
	$con = mysqli_connect("localhost","root","root","public library"); 
	$sql = "DELETE from Author WHERE ID='{$ID}' AND Fname='{$Fname}'"; 
	echo "Delete a Author ID='{$ID}' Fname='{$Fname}'"; 
	mysqli_query($con,$sql);
	mysqli_close($con);
	?>
	<?
	$con1 = mysqli_connect("localhost","root","root","public library"); 
	$result = mysqli_query($con1, "SELECT * FROM AUTHOR");
	echo "<table border='1'> <tr> <th>Author ID</th> <th>First Name</th> </tr>";
	while($row = mysqli_fetch_array($result)) {
		echo "<tr>";
		echo "<td>" . $row['ID'] . "</td>";
		echo "<td>" . $row['Fname'] . "</td>"; echo "</tr>";
	}
	echo "</table>"; 
	mysqli_query($con1,$sql); 
	mysqli_close($con1);
	?>
</body>