<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ceylon";


try {
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}


function getUsers($pdo) {
    $stmt = $pdo->query("SELECT * FROM users");
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}


function deleteUser($pdo, $id) {
    $stmt = $pdo->prepare("DELETE FROM users WHERE id = :id");
    $stmt->execute(['id' => $id]);
}


function updateUser($pdo, $id, $username, $email, $role) {
    $stmt = $pdo->prepare("UPDATE users SET name = :name, email = :email, role = :role WHERE id = :id");
    $stmt->execute([
        'id' => $id,
        'name' => $username,
        'email' => $email,
        'role' => $role
    ]);
}


if (isset($_GET['delete']) && !empty($_GET['delete'])) {
    $id = $_GET['delete'];
    deleteUser($pdo, $id);
    header("Location: users.php");
    exit();
}


if (isset($_POST['edit'])) {
    $id = $_POST['id'];
    $username = $_POST['username'];
    $email = $_POST['email'];
    $role = $_POST['role'];
    updateUser($pdo, $id, $username, $email, $role);
    header("Location: users.php");
    exit();
}


$users = getUsers($pdo);

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Manage Users</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            width: 50%;
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

        .actions .delete, .actions .edit {
            background-color: #dc3545;
            color: #fff;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .actions .edit {
            background-color: #007bff;
        }

        .actions .delete:hover {
            background-color: #bd2130;
        }

        .actions .edit:hover {
            background-color: #0056b3;
        }

        .top-bar {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            text-align: center;
            position: fixed;
            width: 100%;
            top: 0;
            left: 15.6rem;
            z-index: 1000;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .top-bar input[type="text"] {
            padding: 8px;
            border: none;
            font-size: 16px;
            margin-right: 10px;
            border-radius: 5px;
        }

        .top-bar button {
            padding: 8px 15px;
            background-color: #555;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .top-bar button:hover {
            background-color: #333;
        }

        .top-bar .icons {
            display: flex;
            align-items: center;
        }

        .top-bar .icons i {
            margin-left: 20px;
            cursor: pointer;
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
        <h5>Manage Users</h5>
    </div>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($users as $user): ?>
                    <tr>
                        <td><?= $user['id'] ?></td>
                        <td><?= $user['name'] ?></td>
                        <td><?= $user['email'] ?></td>
                        <td><?= $user['role'] ?></td>
                        <td class="actions">
                            <a href="../views/users.php?delete=<?= $user['id'] ?>" class="delete">Delete</a>
                            <button class="edit" onclick="editUser(<?= $user['id'] ?>, '<?= $user['name'] ?>', '<?= $user['email'] ?>', '<?= $user['role'] ?>')">Edit</button>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>


<div id="editModal" style="display:none;">
    <form method="POST" action="../views/users.php">
        <input type="hidden" name="id" id="editId">
        <label for="username">Username:</label>
        <input type="text" name="username" id="editUsername">
        <label for="email">Email:</label>
        <input type="email" name="email" id="editEmail">
        <label for="role">Role:</label>
        <input type="text" name="role" id="editRole">
        <button type="submit" name="edit">Save Changes</button>
        <button type="button" onclick="document.getElementById('editModal').style.display='none'">Cancel</button>
    </form>
</div>

<script>
function editUser(id, username, email, role) {
    document.getElementById('editId').value = id;
    document.getElementById('editUsername').value = username;
    document.getElementById('editEmail').value = email;
    document.getElementById('editRole').value = role;
    document.getElementById('editModal').style.display = 'block';
}
</script>

</body>
</html>
