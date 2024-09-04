<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ceylon";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $product_id = $_POST['product_id'];

  // Fetch product details
  $sql = "SELECT id, name, price FROM products WHERE id = ?";
  $stmt = $conn->prepare($sql);
  $stmt->bind_param("i", $product_id);
  $stmt->execute();
  $result = $stmt->get_result();

  if ($result->num_rows > 0) {
    $product = $result->fetch_assoc();

    // Initialize cart if not exists
    if (!isset($_SESSION['cart'])) {
      $_SESSION['cart'] = array();
    }

    // Add product to cart
    if (isset($_SESSION['cart'][$product_id])) {
      $_SESSION['cart'][$product_id]['quantity'] += 1;
    } else {
      $_SESSION['cart'][$product_id] = array(
        'name' => $product['name'],
        'price' => $product['price'],
        'quantity' => 1
      );
    }

    
    header("Location: ../cart.php");
    exit();
  } else {
    echo "Product not found.";
  }

  $stmt->close();
}

$conn->close();
?>
