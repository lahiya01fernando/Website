<!DOCTYPE html>
<html>
<head>
    <title>CEYLON</title>
    <link type="text/css" rel="stylesheet" href="login2.css">
    <script src="https://kit.fontawesome.com/5471644867.js" crossorigin="anonymous"></script>
</head>
<body>
    <section class="imp">
        <section>
            <div class="login show" id="one">
                <div class="textbox slide-left2">
                    <div class="head">
                        <h1>Sign In </h1>
                        <ul>
                            <li><i class="fab fa-facebook-f" style="cursor: pointer;"></i></li>
                            <li><i class="fab fa-google-plus-g" style="cursor: pointer;"></i></li>
                            <li><i class="fab fa-linkedin-in" style="cursor: pointer;"></i></li>
                        </ul>
                        <h3 style="cursor: pointer;">or use your E-mail ID</h3>
                    </div>
                    <form action="login.php" method="POST">
                        <input type="text" name="email" placeholder="EMAIL" required>
                        <input type="password" name="password" placeholder="PASSWORD" required>
                        <button id="b">
                            <a href="#" style="cursor: pointer;">Forgot password?</a>
                        </button>
                        <button type="submit" class="sign_in_btn" style="cursor: pointer;">SIGN IN</button>
                    </form>
                </div>
            </div>
            <div class="sec show" id="two">
                <div class="textbox slide-left">
                    <h1>Sign up</h1>
                    <p>Your journey to the heart of Ceylon starts here.</p>
                    <button id="b1" style="cursor: pointer;" class="prompt_sign_up">SIGN UP</button>
                </div>
            </div>
        </section>
        <section>
            <div class="sec hide" id="three">
                <div class="textbox slide-left">
                    <h1>Login</h1>
                    <p>Your journey to the heart of Ceylon starts here.</p>
                    <button id="b2" style="cursor: pointer;" class="prompt_sign_in">SIGN IN</button>
                </div>
            </div>
            <div class="login hide" id="four">
                <div class="textbox slide-right">
                    <div class="head">
                        <h1>Create Account</h1>
                        <ul>
                            <li><i class="fab fa-facebook-f" style="cursor: pointer;"></i></li>
                            <li><i class="fab fa-google-plus-g" style="cursor: pointer;"></i></li>
                            <li><i class="fab fa-linkedin-in" style="cursor: pointer;"></i></li>
                        </ul>
                        <h3 style="cursor: pointer;">or use your E-mail ID</h3>
                    </div>
                    <form action="signup.php" method="POST">
                        <input type="text" name="name" placeholder="Name" required>
                        <br>
                        <input type="text" name="email" placeholder="Email" required>
                        <br>
                        <input type="password" name="password" placeholder="Password" required>
                        <br>
                        <input type="text" name="phone" placeholder="Phone No">
                        <br>
                        <button type="submit" style="cursor: pointer;" class="sign_up_btn">SIGN UP</button>
                    </form>
                </div>
            </div>
        </section>
    </section>
    <script src="login2.js"></script>
</body>
</html>
