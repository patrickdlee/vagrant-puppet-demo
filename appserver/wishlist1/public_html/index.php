<?php
$pdo = new PDO('mysql:host=localhost;dbname=wishlist', 'webuser', 'vagrantrocks');

$result = $pdo->query("SELECT id, name, description FROM WishListItem ORDER BY id");
$items = $result->fetchAll();
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
	<h1>Wish List v1</h1>
	<table>
		<tr>
			<th></th>
			<th>Name</th>
			<th>Description</th>
		</tr>
<?php foreach ($items as $item): ?>
		<tr>
			<td><a href="/edit.php?id=<?=$item['id'] ?>">edit</a></td>
			<td><?=$item['name'] ?></td>
			<td><?=$item['description'] ?></td>
		</tr>
<?php endforeach; ?>
	</table>
	<p><a href="/add.php">add new item</a></p>
</div>
</body>
</html>
