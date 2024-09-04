<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ceylon";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


if (isset($_POST['create'])) {
    $name = $_POST['name'];
    $price = $_POST['price'];
    $hotdeals = $_POST['hotdeals'];
    $category = $_POST['category'];
    $image = uploadProductImage($_FILES['image']);


    $sql = "INSERT INTO products (name, price, image, category, hotdeals) 
            VALUES ('$name', '$price', '$image', '$category', '$hotdeals')";
    if ($conn->query($sql) === TRUE) {
       
        header("Location: products.php");
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}


function uploadProductImage($file) {
    $target_dir = "C:\\xampp\\htdocs\\Team_Web_Project\\images";
    $target_file = $target_dir . basename($file['name']);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));


    $check = getimagesize($file["tmp_name"]);
    if($check !== false) {
        $uploadOk = 1;
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }

 
    if (file_exists($target_file)) {
        echo "Sorry, file already exists.";
        $uploadOk = 0;
    }


    if ($file["size"] > 500000) {
        echo "Sorry, your file is too large.";
        $uploadOk = 0;
    }

  
    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
    && $imageFileType != "gif" ) {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
    }

   
    if ($uploadOk == 0) {
        echo "Sorry, your file was not uploaded.";
    
    } else {
        if (move_uploaded_file($file["tmp_name"], $target_file)) {
            return $target_file; 
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    }

    return ""; 
}


$sql = "SELECT * FROM products";
$products = $conn->query($sql);


if (isset($_GET['delete'])) {
    $delete_id = $_GET['delete'];
    $delete_sql = "DELETE FROM products WHERE id=$delete_id";
    if ($conn->query($delete_sql) === TRUE) {

        header("Location: products.php");
        exit();
    } else {
        echo "Error deleting record: " . $conn->error;
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Manage Products</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="images/fav-icon.png">
    <style>
     
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}

.sidebar {
    width: 250px;
    height: 100vh;
    background-image:url("../img/Hero.jpg");
    color: #fff;
    padding: 20px;
    box-sizing: border-box;
    float: left;
}

.sidebar img {
    width: 60%;
    margin-bottom: 20px;
}

.sidebar a {
    display: block;
    color: #fff;
    text-decoration: none;
    padding: 10px 0;
}

.sidebar a:hover {
    background-color: #555;
}

.content {
    margin-left: 250px;
    padding: 20px;
}

.header {
    color: black;
    padding-top: 2rem;
    text-align: left;
}

.form-container {
    background-color: #fff;
    color: #333;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.form-container form {
    display: flex;
    flex-direction: column;
}

.form-container form input, .form-container form textarea, .form-container form button, .form-container form select {
    margin-bottom: 10px;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

.form-container form button {
    background-color: #007bff;
    color: #fff;
    border: none;
    cursor: pointer;
}

.form-container form button:hover {
    background-color: #0056b3;
}

.table-container {
    background-color: #fff;
    color: #333;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

table {
    width: 100%;
    border-collapse: collapse;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 10px;
    text-align: left;
}

.actions {
    display: flex;
    gap: 10px;
}

.actions button {
    padding: 5px 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.actions .edit {
    background-color: #ffc107;
    color: #fff;
}

.actions .delete {
    background-color: #dc3545;
    color: #fff;
}

    </style>
</head>
<body>

<div class="sidebar">
<a href="#" class="logo"><i class='bx bxs-bowl-hot '></i>Ceylon</a> 
    <a href="./products.php">Products</a>
    <a href="./contact.php">Contact Us</a>
    <a href="./users.php">Users</a>
</div>

<div class="content">
    <div class="header">
        <h5>Manage Products</h5>
    </div>

    
    <div class="form-container">
        <form action="products.php" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="id" id="product_id">
            <input type="text" name="name" id="product_name" placeholder="Product Name" required>
            <input type="number" step="0.01" name="price" id="product_price" placeholder="Product Price" required>
            <input type="text" name="category" id="product_category" placeholder="Product catgory" required>
            <input type="file" name="image" id="product_image" required>
            <select name="hotdeals" id="product_hotdeals" required>
                <option value="0">No</option>
                <option value="1">Yes</option>
            </select>

            <button type="submit" name="create" id="create_button">Create Product</button>
            <button type="submit" name="update" id="update_button" style="display: none;">Update Product</button>
        </form>
    </div>

   
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>category</th>
                    <th>Image</th>
                    <th>Hot Deals</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $products->fetch_assoc()): ?>
                    <tr>
                        <td><?= $row['id'] ?></td>
                        <td><?= $row['name'] ?></td>
                        <td><?= $row['price'] ?></td>
                        <td><?= $row['category'] ?></td>
                        <td><img src="<?= $row['image'] ?>" alt="Product Image" style="width: 100px;"></td>
                        <td><?= ($row['hotdeals'] == 1) ? 'Yes' : 'No' ?></td>
                        <td class="actions">
                            <button class="edit" onclick="editProduct(<?= $row['id'] ?>, '<?= $row['name'] ?>', <?= $row['price'] ?>, <?= $row['hotdeals'] ?>)">Edit</button>
                            <a href="products.php?delete=<?= $row['id'] ?>" class="delete">Delete</a>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </div>
</div>

<script>
    function editProduct(id, name, price, hotdeals) {
        document.getElementById('product_id').value = id;
        document.getElementById('product_name').value = name;
        document.getElementById('product_price').value = price;
        document.getElementById('product_hotdeals').value = hotdeals;
        document.getElementById('create_button').style.display = 'none';
        document.getElementById('update_button').style.display = 'block';
 
        document.getElementById('product_image').required = false;
    }
</script>

</body>
</html>
