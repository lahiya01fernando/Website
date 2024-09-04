<?php
session_start();

if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = array();
}

$total = 0;


if (!empty($_SESSION['cart'])) {
    foreach ($_SESSION['cart'] as $item) {
        $total += $item['price'] * $item['quantity'];
    }
}
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart - Ceylon</title>
    <link rel="stylesheet" href="cart.css">
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
            <li><a href="contact.php">Contact Us</a></li>
            <li><a href="about.php">About Us</a></li>
        </ul>
        <div class="right-nav">
            
            <a href="cart.php" class="cart">
                <i class="fas fa-shopping-cart"></i>
            </a>
        </div>
    </nav>
   
    <main>
        <section class="cart">
        <h1>Shopping Cart</h1>
        <table>
        <thead>
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if (empty($_SESSION['cart'])) {
                echo '<tr><td colspan="5">Your cart is empty.</td></tr>';
            } else {
                foreach ($_SESSION['cart'] as $product_id => $item) {
                    $item_total = $item['price'] * $item['quantity'];
                    echo "<tr>";
                    echo "<td>{$item['name']}</td>";
                    echo "<td>\${$item['price']}</td>";
                    echo "<td>{$item['quantity']}</td>";
                    echo "<td>\${$item_total}</td>";
                    echo "<td><a href='./php/remove_from_cart.php?product_id={$product_id}' class='remove'>Remove</a></td>";
                    echo "</tr>";
                }
            }
            ?>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="3">Total</td>
                <td colspan="2">$<?php echo number_format($total, 2); ?></td>
            </tr>
        </tfoot>
    </table>
    <div class="cart-summary">
        
        <button class="checkout-button">Proceed to Checkout</button>
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
                    <li><a href="contact.php">Contact Us</a></li>
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
                    <li><a href="contact.php">Contact Us</a></li>
                    <li><a href="about.php">About Us</a></li>
                    <li><a href="terms.html">Terms of Use</a></li>
                    <li><a href="privacy.html">Privacy Policy</a></li>
                </ul>
            </div>
        </div>
    </footer>
  </body>
  <script>
    document.querySelectorAll('.cart-btn').forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            const form = this.closest('form');
            const formData = new FormData(form);

            fetch('cart.php', {
                method: 'POST',
                body: formData
            })
            .then(response => response.text())
            .then(data => {
                
                alert('Product added to cart!');
            });
        });
    });
</script>

</html>
