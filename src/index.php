<!DOCTYPE html>
<html lang="en">
<head>
	<title>author operation</title>
</head>
<body>
	<form action="createauthor.php" method="POST"> 
		<h2> Create a new author </h2>
		AuthorID<input type="text" name="ID">
		First Name<input type="text" name="Fname"> <input type="submit">
	</form>
	<form action="deleteauthor.php" method="POST"> 
		<h2> Delete an author </h2>
		AuthorID<input type="text" name="ID">
		First Name<input type="text" name="Fname"> <input type="submit">
	</form>
	<form action="updateauthor.php" method="POST"> 
		<h2> Update an author </h2>
		AuthorID<input type="text" name="ID">
		First Name<input type="text" name="Fname"> <input type="submit">
	</form>
	<form action="readauthor.php" method="GET">
		<h2> Show all authors name </h2>
		<button name= "Fname" type="submit">Show</button> 
	</form>
</body>
</html>