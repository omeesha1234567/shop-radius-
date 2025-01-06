<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopRadius </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Playfair Display', serif;
        }

        /* Header Styles */
        header {
            background-color: rgba(37, 18, 4, 0.3);
            padding: 1rem;
            box-shadow: none;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            transition: all 0.3s ease;
        }

        nav {
            display: flex;
            
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }

      
        .nav-links {
            display: flex;
            gap: 2rem;
        }

        .nav-links a {
            text-decoration: none;
            color: #fff;
            font-weight: 500;
            position: relative;
            padding-bottom: 5px;
            transition: all 0.3s ease;
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: #fff;
            transition: width 0.3s ease;
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(rgba(37, 18, 4, 0.8), rgba(0, 0, 0, 0.6)),
                url('images/images.jpeg');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
        }
        

        .hero-content {
            max-width: 800px;
            padding: 2rem;
        }

        .hero h1 {
            font-size: 4rem;
            margin-bottom: 1.5rem;
            line-height: 1.2;
        }

        .hero p {
            font-size: 1.4rem;
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        /* Buttons */
        .btn {
            padding: 1rem 2.5rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;    
            font-weight: bold;
            transition: all 0.3s ease;
            font-size: 1.1rem;
            
        }

        .btn-primary {
            background-color: rgba(37, 18, 4, 0);
            color: rgb(243, 243, 243);
            border: 2px solid rgba(51, 21, 6, 0.616);
        }

        .btn-primary:hover {
            background-color: #8d620dd8;
            transform: translateY(-2px);
        }

        /* Services Section */
        .services-container {
            background-color: #f5f4f2;
            padding: 6rem 2rem;
        }

        .services-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .service-box {
            text-align: left;
            padding: 2rem;
            display: flex;
            align-items: flex-start;
            background-color: white;
            border-radius: 8%;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .service-box:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 25px rgba(76, 36, 7, 0.2);
        }

        .service-icon {
            background-color: #ffffff;
            color: rgba(81, 8, 8, 0.886);
            width: 60px;
            height: 60px;
            border-radius: 25%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1.5rem;
            font-size: 1.5rem;
            
        }

        .service-box:hover .service-icon {
            background-color: #f1efea;
        }

        .service-box:first-child:hover .service-icon {
            transform: rotate(360deg);
        }

        .service-content h4 {
            color: #874210;
            margin-bottom: 0.8rem;
            font-size: 1.2rem;
            transition: all 0.3s ease;
        }

        .service-box:hover .service-content h4 {
            color: #130a01;
        }

        .service-content p {
            color: #584949;
            line-height: 1.6;
        }

        /* Footer */
        footer {
            box-shadow: 0 5px 15px rgba(62, 54, 54, 0.792);
            background-color: #000000e8;
            color: white;
            padding: 4rem 2rem;
            text-align: center;
            font-family:'Courier New', Courier, monospace;
            
        }

        footer h3 {
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            color: #f1f0ec;
        }

        footer .email {
           
            color: #ededed;
            text-decoration: none;
            transition: color 0.3s ease;
            display:inline-flexbox;
            position: relative;
        }

        footer .email:hover {
            color: #f5f4f2;
        }

        footer .email::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -4px;
            left: 0;
            background-color: #f5f4f2;
            transition: width 0.3s ease;
        }

        footer .email:hover::after {
            width: 100%;
        }
        table {
            border-collapse: separate;
            border-spacing: 1px 15px; /* Adds space between rows and columns */
            width: 100%;
        }
        th, td {
            padding: 14px;
            text-align: left;
             /* Optional: Adds a border for better visibility */
        }
        
        /* Responsive Design */
        @media (max-width: 1024px) {
            .services-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }

            .hero h1 {
                font-size: 2.5rem;
            }

            .services-grid {
                grid-template-columns: 1fr;
            }

            .service-box {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }

            .service-icon {
                margin-right: 0;
                margin-bottom: 1rem;
            }
        }

        /* Add About section styles */
        .about-section {
            padding: 6rem 2rem;
            background-color: #fff;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        .about-content {
            max-width: 800px;
            margin: 0 auto;
        }

        .about-content h2 {
            color: rgba(65, 8, 8, 0.886);
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
        }

        .about-content p {
            color: #666;
            font-size: 1.2rem;
            line-height: 1.8;
        }

        /* Smooth Scroll Behavior */
        html {
            scroll-behavior: smooth;
        }

        /* Add these styles */
        .off-canvas {
            position: fixed;
            right: -500px;
            top: 0;
            width: 500px;
            height: 100vh;
            background: linear-gradient(
                315deg,  /* Angle for the slant */
                rgba(33, 4, 4, 0.79),
                rgba(43, 9, 2, 0.96),
                rgb(32, 8, 10,0.96), /* Red with transparency */
                rgb(48, 13, 16,0.96)
            );
            backdrop-filter: blur(50%);
            transition: 0.5s;
            box-shadow: -12px -123px 100px rgba(0, 0, 0, 0.9);
            padding: 3rem 2rem;
            z-index: 2000;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
        }

        .off-canvas.active {
            right: 0;
        }

        .random-fact {
            color: #e0ddd7;
            font-size: 1.2rem;
            text-align: center;
            margin: auto 0;
            min-height: 80px;
            opacity: 0;
            transition: opacity 0.5s;
            padding: 2rem;
            flex-grow: 1;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .signup-options {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            margin-top: auto;
            padding-bottom: 2rem;
        }

        .signup-btn {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid #e7e3dd;
            background: transparent;
            color: #fff;
            border-radius: 15px;
            cursor: pointer;
            transition: all 0.3s;
            font-size: 1rem;
            font-weight: 500;
        }

        .signup-btn:hover {
            background: #766f64;
            transform: translateY(-2px);
        }

        .close-btn {
            position: absolute;
            top: 1.5rem;
            right: 1.5rem;
            color: #fff;
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            opacity: 0.8;
            transition: opacity 0.3s;
        }

        .close-btn:hover {
            opacity: 1;
        }

        .panel-title {
            color: #a05858;
            text-align: center;
            font-size: 1.8rem;
            margin-bottom: 2rem;
        }

        .signup-box {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 2rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
            margin-bottom: 1.5rem;
        }

        .signup-box .icon-wrapper {
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .signup-box .icon {
            font-size: 2.5rem;
            color: #e7e3dd;
            margin-bottom: 1rem;
        }

        .divider {
            display: flex;
            align-items: center;
            text-align: center;
            margin: 0.5rem 0;
            color: #e7e3dd;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            border-bottom: 0.5px solid rgba(255, 255, 255, 0.2);
        }

        .divider span {
            padding: 0 1rem;
        }

        .signup-btn {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid #e7e3dd;
            background: transparent;
            color: #fff;
            border-radius: 11px;
            cursor: pointer;
            transition: all 0.3s;
            font-size: 1.1rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.13rem;
            text-decoration: none;
        }

        .signup-btn:hover {
            background: rgba(214, 207, 207, 0.447);
            transform: translateY(-2px);
        }

        .register-link {
            text-align: center;
            color: #e7e3dd;
            margin-top: 1rem;
        }

        .register-link a {
            color: #fff;
            text-decoration: none;
            font-weight: 500;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        /* Add these styles */
        .carousel-container {
            position: relative;
            width: 100%;
            max-width: 1200px;
            margin: 0.5rem auto;
            overflow: hidden;
            padding: 2rem 0;
            height: 370px;
        }

        .carousel {
            
            display: flex;
            gap: 4rem; /* Increased gap */
            position: relative;
            transition: transform 0.5s ease;
            padding: 1rem;
        }

        .carousel-item {
            min-width: 22rem;
            transition: all 0.5s ease;
            transform: scale(0.8);
            padding: 0.5rem;
        }

        .carousel-item.active {
            transform: scale(1.1);
            opacity: 1;
            z-index: 2;
        }

        .card {
            transition: all 0.3s ease;
            height: 300px;
            background: rgb(216, 211, 211);
            border-radius: 100px; /* More curved edges */
            overflow: hidden;
            box-shadow: 
                0 10px 20px rgba(0, 0, 0, 0.4),
                0 6px 6px rgba(0, 0, 0, 0.4),
                0 0 100px rgba(0, 0, 0, 0.1); /* Enhanced shadow */
        }

        /* Hover effect */
        .card:hover {
            box-shadow: 
                0 15px 30px rgba(0, 0, 0, 0.15),
                0 10px 10px rgba(0, 0, 0, 0.12),
                0 0 120px rgba(0, 0, 0, 0.1);
            
            transform: scale(1.2); /* Makes the carousel 10% larger */
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        .card img {
            height: 230px;
            object-fit: cover;
            width: 100%;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }

        .card .content {
            padding: 1rem 1.25rem;
            background: rgb(244, 240, 240);
        }

        .card h3 {
            font-size: 1.3rem;
            font-weight: 600;
            color: #060708;
            margin-bottom: 0.5rem;
        }

        .card p {
            font-size: 0.875rem;
            color: #02409c;
            line-height: 1.4;
        }

        /* Update animation for new spacing */
        @keyframes scroll {
            0% {
                transform: translateX(0);
            }
            100% {
                transform: translateX(calc(-100% / 2 - 2rem));
            }
        }

        .carousel {
            animation: scroll 4s linear infinite;
        }

        .carousel:hover {
            animation-play-state: running;
        }

        /* Navigation buttons with updated styling */
        .nav-btn {
            position: absolute;
            top: 45%;
            transform: translateY(-50%);
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            color: #2d3748;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            z-index: 3;
            transition: all 0.3s ease;
        }

        .nav-btn:hover {
            background-color: white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            transform: translateY(-50%) scale(1.1);
        }

        .prev-btn {
            left: 2rem;
        }

        .next-btn {
            right: 2rem;
        }
    </style>
</head>
<body>
    <header>
        <nav>
            
            <img src="images/logo.png" />
            <div class="nav-links">
                <a href="#home">Home</a>
                <a href="#about">About</a>
                <a href="#services">Services</a>
                <a href="#contact">Contact</a>
            </div>
        </nav>
    </header>

    <section class="hero" id="home">
        <div class="hero-content">
   
            <h1>Your Neighborhood on your Fingertips...</h1>
            <p>Discover the best deals in your neighborhood. Compare prices and support local businesses.</p>
            <br>
            
            <button class="btn btn-primary" onclick="window.location.href='#signup'">Sign Up Now</button>
        </div>
    </section>

    <div class="off-canvas">
        <button class="close-btn">&times;</button>
        
        <div class="signup-box">
            <div class="icon-wrapper">
                <img src="images/logo.png" />
                
            </div>
            
            <div class="random-fact"></div>

            
            <div class="signup-options">
                <a href="customer-register" class="signup-btn">
                    <i class="fas fa-store"></i>
                    Signup as Shop Owner
                </a>
                <div class="divider">
                    <span>or</span>
                </div>
                <a href="customer.jsp" class="signup-btn">
                    <i class="fas fa-user"></i>
                    Signup as Customer
                </a>
                <div class="register-link">
                Already have an account? <a href="login">Login here</a></div>
            </div>
        </div>
        
    </div>
    
    <section class="carousel-container">
        <div class="carousel">
            <h1>    </h1> 
            <div class="carousel-item">
                <div class="card">
                    <img src="images/images1.jpeg" alt="Local Markets">
                    <div class="content">
                        <h3>want TOMATOES?</h3>
                        <p>Card description here...</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="card">
                    <img src="images/images2.jpeg" alt="Fresh Products">
                    <div class="content">
                        <h3>Card Title</h3>
                        <p>Card description here...</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="card">
                    <img src="images/images3.jpeg" alt="Best Deals">
                    <div class="content">
                        <h3>Electronics</h3>
                        <p>Card description here...</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="card">
                    <img src="images/images4.jpg" alt="Fast Delivery">
                    <div class="content">
                        <h3>Card Title</h3>
                        <p>Card description here...</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="card">
                    <img src="images/images5.jpg" alt="SLol">
                    <div class="content">
                        <h3>Card Title</h3>
                        <p>Card description here...</p>
                    </div>
                </div>
            </div>
            <h1>Your Neighborhood on your Fingertips...</h1>
            <div class="carousel-item">
                <div class="card">
                    <img src="images/images6.jpeg" alt="Su">
                    <div class="content">
                        <h3>Card Title</h3>
                        <p>Card description here...</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="card">
                    <img src="images/images7.jpeg" alt="Supp l">
                    <div class="content">
                        <h3>Card Title</h3>
                        <p>Card description here...</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="card">
                    <img src="images/image1.jpeg" alt="Easy Shopping">
                    <div class="content">
                        <h3>Card Title</h3>
                        <p>Card description here...</p>
                    </div>
                </div>
            </div>
        </div>
        <h1>Your Neighborhood on your Fingertips...</h1>
    </section>

    <section class="services-container" id="services">
        <div class="services-grid">
            <div class="service-box">
                <div class="service-icon">
                    <i class="fas fa-seedling"></i>
                </div>
                <div class="service-content">
                    <h4>High Quality Products</h4>
                    <p>Carefully curated selection of premium local products.</p>
                </div>
            </div>
            <div class="service-box">
                <div class="service-icon">
                    <i class="fas fa-store"></i>
                </div>
                <div class="service-content">
                    <h4>Local Stores</h4>
                    <p>Connect with trusted neighborhood retailers.</p>
                </div>
            </div>
            <div class="service-box">
                <div class="service-icon">
                    <i class="fas fa-trophy"></i>
                </div>
                <div class="service-content">
                    <h4>Excellent Services</h4>
                    <p>Top-rated customer service and support.</p>
                </div>
            </div>
            <div class="service-box">
                <div class="service-icon">
                    <i class="fas fa-truck"></i>
                </div>
                <div class="service-content">
                    <h4>Fast Delivery</h4>
                    <p>Quick and reliable local delivery service.</p>
                </div>
            </div>
            <div class="service-box">
                <div class="service-icon">
                    <i class="fas fa-tags"></i>
                </div>
                <div class="service-content">
                    <h4>Best Prices</h4>
                    <p>Compare prices to find the best deals nearby.</p>
                </div>
            </div>
            <div class="service-box">
                <div class="service-icon">
                    <i class="fas fa-clock"></i>
                </div>
                <div class="service-content">
                    <h4>24/7 Support</h4>
                    <p>Round-the-clock assistance for all your needs.</p>
                </div>
            </div>
        </div>
    </section>
    <section id="about" class="about-section">
        <div class="about-content">
            <h2>About Us</h2>
            <p>ShopRadius connects users with nearby stores, allowing them to browse available products, compare prices, and buy directly from local retailers with ease.</p>
        </div>
    </section>


    <footer id="contact">
        <div class="footer"><h3>Met some bugs on your way ? Report us on</h3>
            <table>
                <thead>
                    <tr>
                        <th>Email</th>
                        <th>Name</th>
                        <th>Phone Number</th>
                        <th>Admission Number</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><a href="mailto:omeeshadwive.edi@gmail.com" class="email">omeeshadwive.edi@gmail.com</a></td>
                        <td><a href="mailto:omeeshadwive.edi@gmail.com" class="email">Omeesha Dwivedi</a></td>
                        <td><a href="#" class="email">9711617104</a></td>
                        <td><a href="mailto:omeeshadwive.edi@gmail.com" class="email">23scse1180219</a></td>
                    </tr>
                    <tr>
                        <td><a href="mailto:john.doe@example.com" class="email">rishangupta857@gmail.com</a></td>
                        <td><a href="#" class="email">Rishan Rajesh Gupta</a></td>
                        <td><a href="#" class="email">8333953605</a></td>
                        <td><a href="#" class="email">23scse1180024</a></td>
                    </tr>
                    <tr>
                        <td><a href="mailto:jane.smith@example.com" class="email">ranjanashish2803@gmail.com</a></td>
                        <td><a href="#" class="email">Ashish Ranjan</a></td>
                        <td><a href="#" class="email">7488703573</a></td>
                        <td><a href="#" class="email">23scse1180225</a></td>
                    </tr>
                    <tr>
                        <td><a href="mailto:alex.jones@example.com" class="email">mayankdhilor2@gmail.com</a></td>
                        <td><a href="#" class="email">Mayank</a></td>
                        <td><a href="#" class="email">8851552825</a></td>
                        <td><a href="#" class="email">23scse1180232</a></td>
                    </tr>

                </tbody>
            </table>
            
    </footer>

    <script>
    // Random facts array
    const facts = [
        "search for 'tomatoes' ",
        "search for 'popcorn'",
        "search for 'Hardrive replace'",
        "search for 'Alteration'",
        "search for 'Stapler Pins'",
        "search for 'eyeshadow'",
        "search for 'coconut water'",
        "search for 'eclairs'",
        "search for 'pens' ",
        "search for 'speakers'",
        "search for 'garlic'",
        "search for 'slippers'",
        "search for 'bedsheets'",
        "search for 'cauliflower'",
        "search for 'compass'",
        "search for 'dosa batter'",
        "search for 'paracetamol' ",
        "search for 'stufftoy'",
        "search for 'pendrive'",
        "search for 'shoes'",
        "search for 'chocolate'",
        "search for 'nailpaint'",
        "search for 'Fridge'",
        
    ];

    // Toggle off-canvas
    document.querySelector('.btn-primary').addEventListener('click', function() {
        document.querySelector('.off-canvas').classList.add('active');
    });

    document.querySelector('.close-btn').addEventListener('click', function() {
        document.querySelector('.off-canvas').classList.remove('active');
    });

    // Random facts animation
    function showRandomFact() {
        const factElement = document.querySelector('.random-fact');
        factElement.style.opacity = '0';
        
        setTimeout(() => {
            factElement.textContent = facts[Math.floor(Math.random() * facts.length)];
            factElement.style.opacity = '1';
        }, 500);
    }

    // Initial fact
    showRandomFact();

    // Change fact every 5-8 seconds
    setInterval(() => {
        showRandomFact();
    }, Math.random() * (3000 - 1000) + 1000);

    // Add this script
    document.addEventListener('DOMContentLoaded', function() {
        const carousel = document.querySelector('.carousel');
        const originalCards = document.querySelectorAll('.carousel-item');
        
        // Clone cards for infinite scroll
        originalCards.forEach(card => {
            const clone = card.cloneNode(true);
            carousel.appendChild(clone);
        });
    });
    </script>
</body>
</html>