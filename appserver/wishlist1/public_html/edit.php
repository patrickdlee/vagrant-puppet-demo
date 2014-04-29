<?php
$pdo = new PDO('mysql:host=localhost;dbname=wishlist', 'webuser', 'vagrantrocks');

if (isset($_POST['edit'])) {
	$query = "UPDATE WishListItem SET name = :name, description = :desc WHERE id = :id";
	$params = array(':id' => $_POST['id'], ':name' =>  $_POST['name'], ':desc' =>  $_POST['desc']);
	$stmt = $pdo->prepare($query);
	$stmt->execute($params);

	header('location: /');
	exit;
}

if (isset($_POST['delete'])) {
	$stmt = $pdo->prepare("DELETE FROM WishListItem WHERE id = :id");
	$stmt->execute(array(':id' => $_POST['id']));

	header('location: /');
	exit;
}

$stmt = $pdo->prepare("SELECT * FROM WishListItem WHERE id = :id");
$stmt->execute(array(':id' => $_GET['id']));
$result = $stmt->fetchAll();
$item = $result[0];
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
	<h1>Edit Item</h1>
	<form method="post" action="/edit.php?id=<?=$item['id'] ?>">
		<p>
			<label for="name">Name</label>
			<input type="text" id="name" name="name" value="<?=$item['name'] ?>"/>
		</p>
		<p>
			<label for="desc">Description</label>
			<input type="text" id="desc" name="desc" value="<?=$item['description'] ?>"/>
		</p>
		<p>
			<input type="hidden" name="id" value="<?=$item['id'] ?>"/>
			<input type="submit" id="edit" name="edit" value="Edit"/>
			<input type="submit" id="delete" name="delete" value="Delete"/>
		</p>
	</form>
</div>
</body>
</html>
