<?php
$pdo = new PDO('mysql:host=localhost;dbname=wishlist', 'webuser', 'vagrantrocks');

if (isset($_POST['add'])) {
	$query = "INSERT INTO WishListItem (name, description) VALUES (:name, :desc)";
	$params = array(':name' => $_POST['name'], ':desc' => $_POST['desc']);
	$stmt = $pdo->prepare($query);
	$stmt->execute($params);

	header('location: /');
	exit;
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Wish List</title>
	<link rel="stylesheet" href="/assets/reset.css"/>
	<link rel="stylesheet" href="/assets/wishlist.css"/>
</head>
<body>
<div id="container">
	<h1>Add New Item</h1>
	<form method="post" action="/add.php">
		<p>
			<label for="name">Name</label>
			<input type="text" id="name" name="name"/>
		</p>
		<p>
			<label for="desc">Description</label>
			<input type="text" id="desc" name="desc"/>
		</p>
		<p>
			<input type="submit" id="add" name="add" value="Add"/>
		</p>
	</form>
</div>
</body>
</html>
