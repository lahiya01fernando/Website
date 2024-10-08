<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <div class="fade-in">
    <title> CEYLON </title>
    <link rel="stylesheet" href="contact.css">
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
            <li><a href="home.html" class="active">Home</a></li>
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


    <div class="container">
      <div class="content">
        <div class="left-side">
          <div class="address details">
            <i class="fas fa-map-marker-alt"></i>
            <div class="topic">Address</div>
            <div class="text-one">10 Colombo Road, Suite </div>
            <div class="text-two">Colombo</div>
          </div>
          <div class="phone details">
            <i class="fas fa-phone-alt"></i>
            <div class="topic">Phone</div>
            <div class="text-one">+94 1234 5678</div>
            <div class="text-two">+94 3432 5678</div>
          </div>
          <div class="email details">
            <i class="fas fa-envelope"></i>
            <div class="topic">Email</div>
            <div class="text-two">info@hansahotels.lk</div>
            <div class="text-two">info@hansahotels.com</div>
          </div>
        </div>
        <div class="right-side">
          <div class="topic-text">Send us a message</div>
          <p>If you have any work from me or any types of quries related to my tutorial, you can send me message from here. It's my pleasure to help you.</p>
          <form action="./php/contact.php" method="POST">
            <div class="input-box">
                <input type="text" name="name" placeholder="Enter your name" required>
            </div>
            <div class="input-box">
                <input type="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="input-box message-box">
                <input type="text" name="message" placeholder="Enter your message" required>
            </div>
            <div class="button">
                <input type="submit" value="Send Now">
            </div>
        </form>
        
      </div>
      </div>
    </div>

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