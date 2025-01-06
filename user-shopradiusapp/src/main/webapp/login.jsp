<html lang="en"></html>
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Member Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #49a716; /* Fallback color */
            color: #ffffff;
            margin: 0;
            padding: 0;
        }

        /* Background Image */
        .background-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }

        /* Overlay */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(49, 17, 4, 0.5); /* Dark overlay for better contrast */
            z-index: 0;
        }

        /* Login Container */
        .login-container {
            background: rgba(225, 219, 216, 0.338);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.8);
            width: 100%;
            max-width: 400px;
            text-align: center;
            z-index: 10;
            position: relative;
        }

        /* Icon Styling */
        .login-icon i {
            font-size: 3rem;
            color: #231717;
            margin-bottom: 20px;
        }

        /* Title Styling */
        .login-title {
            font-size: 10%;
            font-weight: bold;
            margin-bottom: 20px;
            color: #452d2d;
            font-family:Georgia, 'Times New Roman', Times, serif;
        }

        /* Input Group */
        .input-group {
            display: flex;
            align-items: center;
            background: rgba(54, 24, 6, 0.363);
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .input-group i {
            color: #241705;
            margin-right: 10px;
            font-size: 1.2rem;
        }

        .input-group input {
            background: transparent;
            border: none;
            outline: none;
            color: #ffffff;
            width: 100%;
            font-size: 1rem;
            padding: 5px;
        }

        .input-group input::placeholder {
            color: #aaa;
        }

        /* Button Styling */
        .login-button {
            background-color: #231717;
            color: #ffffff;
            font-size: 0.9rem;
            font-weight: bold;
            padding: 8px 16px;
            width: 45%;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-button:hover {
            background-color: #4a1b1b;
            transform: translateY(-2px);
        }

        .login-button i {
            margin-right: 8px;
        }

        /* Links */
        .login-links {
            margin-top: 15px;
            font-size: 0.9rem;
        }

        .login-links a {
            color: #351313;
            text-decoration: none;
            margin: top;
            transition: color 0.3s ease;
        }

        .login-links a:hover {
            color: #ff5757;
        }
    </style>
</head>

<body class="flex items-center justify-center min-h-screen relative">

                <a href="templates/homepage.html" class="absolute top-4 left-4">
                    <img src="images/logo.png" alt="Logo" />
                </a>
                
                

    <!-- <div class="login-links absolute top-4 right-4">
        <a href="homepage.html"class="login-links" <i class="fas fa-store"></i>Homepage</a>
    </div>
     -->

        
    <!-- Background Image -->
    <img src="images/loginbg.jpg" alt="Background image" class="background-image" />
    <div class="overlay"></div>

    <!-- Login Form -->
    <div class="login-container">
                    <!-- Additional Links -->
                 
        <div class="login-icon">
            <i class="fas fa-users",class="login-title"></i>
        </div>
        <!-- <h2 class="login-title">MEMBER LOGIN</h2> -->
        <form action="/validate-login" method="POST">
            <!-- Username Field -->
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" name="username" placeholder="Username" required />
            </div>
            <!-- Password Field -->
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" placeholder="Password" required />
            </div>
            <!-- Login Buttons -->
            <div class="flex justify-between px-4 mb-4">
                <button type="submit" name="role" value="customer" class="login-button">
                    <i class="fas fa-user mr-2"></i>Customer Login
                </button>
                <button type="submit" name="role" value="owner" class="login-button">
                    <i class="fas fa-store mr-2"></i>Owner Login
                </button>
            </div>
        </form>
    </div>
</body>
</html>