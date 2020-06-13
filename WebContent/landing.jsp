<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style-landing.css" rel="stylesheet" type="text/css">
    <link href="animate.css" rel="stylesheet" type="text/css">
    <link href="home.jsp" type="text/html">
    <link rel="shortcut icon" href="assets/Rooster_Browser_Tab_Icon.png">

    <title>Project management with Rooster</title>
</head>

<body>
    <div class="header">
        <div class="container">
            <img id="logowhite" src="assets/Rooster_White.png">
            <img id="slogan" src="assets/Slogan.png">
            <br>
            <button class="modal-button" id="login-button">LOGIN</button>
            <button class="modal-button" id="register-button">REGISTER</button>
        </div>
    </div>

    <!-- The Modal -->
    <div id="login-popup" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <span class="close">&times;</span>
            <br><br>
            <!--action="Registration" method="post"-->
            <form onsubmit="event.preventDefault(); return validateFormLogin()">
                <img id="logo-word" src="assets/Rooster_Main_Logo.png">
                <!--Login Title-->
                <br><br><br>
                <div class="modal-inputs">
                    <input type="text" id="lusername" name="lusername" required>
                    <label for="lusername">Username</label>
                </div>
                <br><br><br>
                <div class="modal-inputs">
                    <input type="password" id="luserpw" name="luserpw" required>
                    <label for="luserpw">Password</label>
                </div>
                <br>
                <div class="error-msg" id="error-msg"></div>
                <br>
                <input type="submit" class="popup-buttons confirm" id="confirm-login" value="Confirm">
                <input type="reset" class="popup-buttons cancel" id="confirm-cancel" value="Cancel">
            </form>
        </div>
    </div>

    <div id="register-popup" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <span class="close">&times;</span>
            <form onsubmit="event.preventDefault(); return validateFormRegistration()">
                <br><br><br>
                <img id="logo-icon" src="assets/Rooster_Icon_Logo.png">
                <br><br>
                <h1 class="modal-title">CREATE YOUR ACCOUNT TODAY!</h1>
                <br><br>
                <div class="modal-inputs">
                    <input type="text" id="rname" name="rname" pattern="[a-zA-Z]{1,15}" data-toggle="tooltip"
                        data-placement="top" title="English alphabet only, 3-15 characters" required>
                    <label for="rname">Name</label>
                </div>
                <br><br><br>
                <div class="modal-inputs" data-toggle="tooltip" data-placement="top"
                    title="English alphabet and numbers only, 6-25 characters.">
                    <input type="text" id="rusername" name="rusername" pattern="[a-zA-Z0-9]{6,25}" required>
                    <label for="rusername">Username</label>
                </div>
                <br><br><br>
                <div class="modal-inputs" data-toggle="tooltip" data-placement="top" title="8-30 characters">
                    <input type="password" id="ruserpw" name="ruserpw" pattern="[\w\W\d\D\s]{8,30}" required>
                    <label for="ruserpw">Password</label>
                </div>
                <br><br><br>
                <div class="modal-inputs">
                    <input type="password" id="rconfirmpw" name="rconfirmpw" pattern="[\w\W\d\D\s]{8,30}" required>
                    <label for="rconfirmpw">Confirm Password</label>
                </div>
                <br>
                <div class="error-msg" id="error-msg"></div>
                <br>
                <input type="submit" class="popup-buttons confirm" id="confirm-register" value="Confirm">
                <input type="reset" class="popup-buttons cancel" value="Cancel">
            </form>
        </div>
    </div>


    <div class="intro">
        <div class="intro-text">
            <h2>Why manage with Rooster?</h2>
            <p>Long-term projects aren't easy to handle. Rooster makes it easy to lay out your ideas and keep track
                of your time-sensitive tasks. All your project management is done here.</p>
        </div>

        <div class="intro-text">
            <h2>Your projects' home.</h2>
            <p>Rooster makes it possible to manage all your projects from one location. Our colorful reminder system
                will keep you on schedule and make organizing your time seamless.</p>
        </div>

        <div class="rooster-steps">
            <h1>Project Management in 3 Steps</h1>

            <div class="step">
                <img src="assets/Grey_Project_Icon.png">
                <p class="beg">Start your</p><span>project</span>
            </div>

            <div class="step">
                <img src="assets/Grey_Calendar_Icon.png">
                <p class="beg">Set your</p><span>reminders</span>
            </div>

            <div class="step">
                <img src="assets/Grey_Track_Icon.png">
                <p class="beg">Stay on</p><span>track</span>
            </div>
        </div>

        <div class="ui-intro">
            <div class="title">
                <h1>Explore Rooster's Unique Features</h1>
                <p>See what makes Rooster your best option.</p>
            </div>

            <br>

            <div>
                <img src="assets/Computer.png" class="left">
                <div>
                    <h2>An efficient and warm welcome.</h2>
                    <p>Know what's coming up with Rooster's upcoming reminder display! Your upcoming and overdue
                        reminders are visible directly from your home page!</p>
                </div>
            </div>

            <div>
                <div>
                    <h2>Overdue? We've got your back.</h2>
                    <p>Our system know when your reminders are overdue, so we mark them and keep them at the top of your
                        reminder lists so you know too!</p>
                </div>
                <img src="assets/Overdue_Picture.png" class="right">
            </div>

            <div>
                <img src="assets/Color_Wheel2.gif" class="left">
                <div>
                    <h2>Colored for your convenience.</h2>
                    <p>It can be hard to keep manage of a plethora of gray projects. Rooster's vibrant color-coordinated
                        projects makes it both easy and fun!</p>
                </div>
            </div>

            <div>
                <div>
                    <h2>Project-specific reminders.</h2>
                    <p>Your projects need to be managed over extended periods. You can attach up to 10 reminders to your
                        projects at once to manage both your short-term and long-term tasks!</p>
                </div>
                <img src="assets/Attaching_Picture.png" class="right">
            </div>
        </div>

        <div class="developers">
            <div class="title">
                <h1>The Development Team</h1>
                <p>A message from the developers!</p>
            </div>
            <div>
                <div class="dev">   
                    <img src="assets/Cac_The_Cactus.png">
                    <div>
                        <h2>Nicole Raitblat</h2>
                        <p>Text here :)</p>
                    </div>
                </div>
                
                <div class="dev">
                    <img src="assets/Sunnyboi.png">
                    <div>
                        <h2>Ronald Sun</h2>
                        <p>Text here :)</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="start">
            <span>And it's all 100% FREE!</span>
            <a href="#top">Get started</a>
        </div>
    </div>
    
    <%@ include file="loader.jsp"%>
    
</body>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="js-universal.jsp"></script>
<script type="text/javascript" src="js-landing.jsp"></script>

</html>
