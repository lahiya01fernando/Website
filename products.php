<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <div class="fade-in">
    <title> CEYLON </title>
    <link rel="stylesheet" href="products.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="images/fav-icon.png">
    <script src="home.js"></script>
</head>
<body>

    

    <nav class="navigation">
        <a href="#" class="logo"><i class='bx bxs-bowl-hot '></i>Ceylon</a>
     
        <ul class="menu">
            <li><a href="home.php" class="active">Home</a></li>
            <li><a href="products.php">Products</a></li>
            <li><a href="contact1.php">Contact Us</a></li>
            <li><a href="about.php">About Us</a></li>
            
        </ul>
        <div class="right-nav">
        
            <a href="cart.php" class="cart">
                <i class="fas fa-shopping-cart"></i>
              
            </a>
        </div>
    </nav>
   


  

  <section class="section product">
  <div class="container">

    <h2 class="h2 section-title">Products</h2>

    <ul class="product-list">

    <?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ceylon";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT id, name, category, price, image FROM products";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
?>
<li>
  <div class="product-box">
    <img alt="<?= $row['name'] ?>" src="<?= $row['image'] ?>" class="w-100">
    <strong style="text-align:center;"><?= $row['name'] ?></strong>
    <span class="quantity"><?= $row['price'] ?></span>

    <form action="./php/add_to_cart.php" method="post" class="cart-form">
      <input type="hidden" name="product_id" value="<?= $row['id'] ?>">
      <button type="submit" class="cart-btn">
        <i class="fas fa-shopping-bag"></i> Add Cart
      </button>
    </form>
  </div>
</li>
<?php
  }
} else {
  echo "No products found.";
}
$conn->close();
?>


    </ul>

  </div>





  </main>
  <footer>
        <div class="footer-container">
            <div class="footer-logo">
                <a href="#" class="logo"><i class='bx bxs-bowl-hot'></i>Ceylon</a>
                
                <div class="footer-social">
                    <a href="https://www.facebook.com" class="facebook"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://www.twitter.com" class="twitter"><i class="fab fa-twitter"></i></a>
                    <a href="https://www.instagram.com" class="instagram"><i class="fab fa-instagram"></i></a>
                    <a href="https://www.youtube.com" class="youtube"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
            
            <div class="footer-links">
                <strong>Quick Link</strong>
                <ul>
                    <li><a href="index.php">Home</a></li>
                    <li><a href="products.php">Products</a></li>
                    <li><a href="contact1.php">Contact Us</a></li>
                    <li><a href="about.php">About Us</a></li>
                </ul>
            </div>
            
            <div class="footer-links">
                <strong>Categories</strong>
                <ul>
                    <li><a href="products.php">Tea Blends</a></li>
                    <li><a href="products.php">Green Tea</a></li>
                    <li><a href="products.php">Black Tea</a></li>
                    <li><a href="products.php">Herbal Tea</a></li>
                </ul>
            </div>
            
            <div class="footer-links">
                <strong>Customer Support</strong>
                <ul>
                    <li><a href="contact1.php">Contact Us</a></li>
                    <li><a href="about.php">About Us</a></li>
                    <li><a href="terms.html">Terms of Use</a></li>
                    <li><a href="privacy.html">Privacy Policy</a></li>
                </ul>
            </div>
        </div>
    </footer>

</body>
</html>
