<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Registration</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(45deg, #2C1810, #41150d, #D2691E);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            padding: 20px;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .registration-container {
            background: rgba(243, 173, 140, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            width: 460px;
            backdrop-filter: blur(20px);
            transform: translateY(0);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .registration-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 45px rgba(0, 0, 0, 0.3);
        }

        .registration-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 3px;
            background: linear-gradient(90deg, transparent, #D2691E, transparent);
            animation: borderLine 2s linear infinite;
        }

        @keyframes borderLine {
            0% { left: -100%; }
            100% { left: 100%; }
        }

        h2 {
            text-align: center;
            color: #2C1810;
            margin-bottom: 30px;
            font-size: 32px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 2px;
            position: relative;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background: #D2691E;
            border-radius: 2px;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .form-group i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #61280e;
            font-size: 18px;
        }

        .form-group input {
            width: 100%;
            padding: 15px 15px 15px 45px;
            border: 2px solid #DEB887;
            border-radius: 12px;
            background-color: rgba(255, 255, 255, 0.9);
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            border-color: #8B4513;
            outline: none;
            box-shadow: 0 0 15px rgba(139, 69, 19, 0.2);
            transform: translateX(5px);
        }

        .form-group input::placeholder {
            color: #BC8F8F;
            transition: all 0.3s ease;
        }

        .form-group input:focus::placeholder {
            opacity: 0.7;
            transform: translateX(10px);
        }

        .submit-btn {
            width: 100%;
            padding: 16px;
            background: linear-gradient(45deg, #3d210d, #5a2703);
            color: white;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            font-size: 18px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 2px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(139, 69, 19, 0.3);
        }

        .submit-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: 0.5s;
        }

        .submit-btn:hover::before {
            left: 100%;
        }

        .options-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 20px 0;
        }

        .remember-me {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #5D4037;
        }

        .remember-me input[type="checkbox"] {
            accent-color: #8B4513;
        }

        .forgot-password {
            color: #8B4513;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .forgot-password:hover {
            color: #D2691E;
            text-decoration: underline;
        }

        .social-login {
            text-align: center;
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid #DEB887;
        }

        .social-login p {
            color: #5D4037;
            margin-bottom: 15px;
        }

        .social-icons {
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .social-icons a {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #8B4513;
            color: white;
            transition: all 0.3s ease;
        }

        .form-group select {
            width: 100%;
            padding: 15px 15px 15px 45px;
            border: 2px solid #DEB887;
            border-radius: 12px;
            background-color: rgba(255, 255, 255, 0.9);
            font-size: 16px;
            transition: all 0.3s ease;
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            cursor: pointer;
        }

        .form-group select:focus {
            border-color: #8B4513;
            outline: none;
            box-shadow: 0 0 15px rgba(139, 69, 19, 0.2);
            transform: translateX(5px);
        }

        .form-group select option {
            padding: 10px;
        }

        /* Add a custom arrow for the select element */
        .form-group:has(select)::after {
            content: '\f107';
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #61280e;
            pointer-events: none;
        }

        .form-group select optgroup {
            font-weight: bold;
            color: #3d210d;
            background-color: #f5e6d3;
        }

        .form-group select option {
            font-weight: normal;
            padding: 10px;
            color: #61280e;
        }

    </style>
</head>
<body>
    <div class="registration-container">
        <h2>Sign Up</h2>
        <form id="registrationForm" name="registrationForm">
            <div class="form-group">
                <i class="fas fa-user"></i>
                <input type="text" id="customerName" name="customerName" placeholder="Full Name" required>
            </div>
            <div class="form-group">
                <i class="fas fa-phone"></i>
                <input type="tel" id="customerPhone" name="customerPhone" placeholder="Phone Number" pattern="[0-9]{10}" required>
            </div>
            <div class="form-group">
                <i class="fas fa-envelope"></i>
                <input type="email" id="customerEmail" name="customerEmail" placeholder="Email Address" required>
            </div>
            <div class="form-group">
                <i class="fas fa-map-marker-alt"></i>
                <input type="text" id="customerAddressLine1" name="customerAddressLine1" placeholder="Address Line 1 (Society/Locality)" required>
            </div>
            <div class="form-group">
                <i class="fas fa-building"></i>
                <input type="text" id="customerAddressLine2" name="customerAddressLine2" placeholder="Address Line 2 (Town/Area)" required>
            </div>
            <div class="form-group">
                <i class="fas fa-city"></i>
                <input type="text" id="customerCity" name="customerCity" placeholder="City" required>
            </div>
            <div class="form-group">
                <i class="fas fa-map-pin"></i>
                <input type="text" id="customerPincode" name="customerPincode" placeholder="Pincode" pattern="[0-9]{6}" maxlength="6" required>
            </div>
            <div class="form-group">
                <i class="fas fa-flag"></i>
                <select id="customerState" name="customerState" required>
                    <option value="" disabled selected>Select State/Union Territory</option>
                    <optgroup label="States">
                        <option value="Andhra Pradesh">Andhra Pradesh</option>
                        <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                        <option value="Assam">Assam</option>
                        <option value="Bihar">Bihar</option>
                        <option value="Chhattisgarh">Chhattisgarh</option>
                        <option value="Goa">Goa</option>
                        <option value="Gujarat">Gujarat</option>
                        <option value="Haryana">Haryana</option>
                        <option value="Himachal Pradesh">Himachal Pradesh</option>
                        <option value="Jharkhand">Jharkhand</option>
                        <option value="Karnataka">Karnataka</option>
                        <option value="Kerala">Kerala</option>
                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                        <option value="Maharashtra">Maharashtra</option>
                        <option value="Manipur">Manipur</option>
                        <option value="Meghalaya">Meghalaya</option>
                        <option value="Mizoram">Mizoram</option>
                        <option value="Nagaland">Nagaland</option>
                        <option value="Odisha">Odisha</option>
                        <option value="Punjab">Punjab</option>
                        <option value="Rajasthan">Rajasthan</option>
                        <option value="Sikkim">Sikkim</option>
                        <option value="Tamil Nadu">Tamil Nadu</option>
                        <option value="Telangana">Telangana</option>
                        <option value="Tripura">Tripura</option>
                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                        <option value="Uttarakhand">Uttarakhand</option>
                        <option value="West Bengal">West Bengal</option>
                    </optgroup>
                    <optgroup label="Union Territories">
                        <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                        <option value="Chandigarh">Chandigarh</option>
                        <option value="Dadra and Nagar Haveli and Daman and Diu">Dadra and Nagar Haveli and Daman and Diu</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                        <option value="Ladakh">Ladakh</option>
                        <option value="Lakshadweep">Lakshadweep</option>
                        <option value="Puducherry">Puducherry</option>
                    </optgroup>
                </select>
            </div>
            <div class="form-group">
                <i class="fas fa-lock"></i>
                <input type="password" id="customerPassword" name="customerPassword" placeholder="Create Password" required>
            </div>
            <div class="form-group">
                <i class="fas fa-key"></i>
                <input type="password" id="customerConfirmPassword" name="customerConfirmPassword" placeholder="Confirm Password" required>
            </div>
           

            <button type="submit" class="submit-btn">Create Account</button>

            
        </form>
    </div>

    <script>
        document.getElementById('customerPincode').addEventListener('input', function(e) {
            this.value = this.value.replace(/[^0-9]/g, '').slice(0, 6);
        });

        // Field validation patterns and messages
        const validationRules = {
            customerName: {
                pattern: /^[a-zA-Z\s]{2,50}$/,
                message: 'Name should contain only letters and be 2-50 characters long'
            },
            customerPhone: {
                pattern: /^[0-9]\d{9}$/,
                message: 'Please enter a valid 10-digit mobile number starting with 0-9'
            },
            customerEmail: {
                pattern: /^[^\s@]+@[^\s@]+\.[^\s@]+$/,
                message: 'Please enter a valid email address'
            },
            customerAddressLine1: {
                pattern: /^[a-zA-Z0-9\s,.-]{5,100}$/,
                message: 'Address should be 5-100 characters long'
            },
            customerAddressLine2: {
                pattern: /^[a-zA-Z0-9\s,.-]{5,100}$/,
                message: 'Address should be 5-100 characters long'
            },
            customerCity: {
                pattern: /^[a-zA-Z\s]{2,50}$/,
                message: 'City should contain only letters and be 2-50 characters long'
            },
            customerPincode: {
                pattern: /^[0-9][0-9]{5}$/,
                message: 'Please enter a valid 6-digit pincode'
            },
            customerPassword: {
                pattern: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/,
                message: 'Password must contain at least 8 characters, including uppercase, lowercase, number and special character'
            }
        };

        // Add validation to all input fields
        Object.keys(validationRules).forEach(fieldId => {
            const element = document.getElementById(fieldId);
            if (element) {
                element.addEventListener('input', function() {
                    validateField(this);
                });
            }
        });

        function validateField(field) {
            const rule = validationRules[field.id];
            const errorDiv = getOrCreateErrorDiv(field);
            
            if (rule && field.value) {
                if (!rule.pattern.test(field.value)) {
                    field.style.borderColor = '#ff0000';
                    errorDiv.textContent = rule.message;
                    errorDiv.style.display = 'block';
                    return false;
                } else {
                    field.style.borderColor = '#4CAF50';
                    errorDiv.style.display = 'none';
                    return true;
                }
            }
            return true;
        }

        function getOrCreateErrorDiv(field) {
            let errorDiv = field.parentElement.querySelector('.error-message');
            if (!errorDiv) {
                errorDiv = document.createElement('div');
                errorDiv.className = 'error-message';
                errorDiv.style.color = '#ff0000';
                errorDiv.style.fontSize = '12px';
                errorDiv.style.marginTop = '5px';
                errorDiv.style.display = 'none';
                field.parentElement.appendChild(errorDiv);
            }
            return errorDiv;
        }

        // Real-time password validation
        document.getElementById('customerPassword').addEventListener('input', function() {
            validatePassword();
            validateField(this);
        });

        document.getElementById('customerConfirmPassword').addEventListener('input', validatePassword);

        function validatePassword() {
            const password = document.getElementById('customerPassword');
            const confirmPassword = document.getElementById('customerConfirmPassword');
            const errorDiv = getOrCreateErrorDiv(confirmPassword);
            const submitBtn = document.querySelector('.submit-btn');

            if(confirmPassword.value) {
                if(password.value !== confirmPassword.value) {
                    confirmPassword.style.borderColor = '#ff0000';
                    errorDiv.textContent = 'Passwords do not match!';
                    errorDiv.style.display = 'block';
                    submitBtn.disabled = true;
                    submitBtn.style.opacity = '0.7';
                    return false;
                } else {
                    confirmPassword.style.borderColor = '#4CAF50';
                    errorDiv.style.display = 'none';
                    submitBtn.disabled = false;
                    submitBtn.style.opacity = '1';
                    return true;
                }
            }
            return true;
        }

        document.getElementById('registrationForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Validate all fields
            let isValid = true;
            const formFields = this.querySelectorAll('input, select');
            
            formFields.forEach(field => {
                if (!field.value.trim()) {
                    isValid = false;
                    field.style.borderColor = '#ff0000';
                    const errorDiv = getOrCreateErrorDiv(field);
                    errorDiv.textContent = 'This field is required';
                    errorDiv.style.display = 'block';
                } else if (field.id in validationRules) {
                    isValid = validateField(field) && isValid;
                }
            });

            // Validate password match
            isValid = validatePassword() && isValid;

            if (!isValid) {
                return;
            }

            // Add success animation
            const btn = document.querySelector('.submit-btn');
            btn.innerHTML = '<i class="fas fa-check"></i> Success!';
            btn.style.background = '#4CAF50';
            
            // Create form data object
            const formData = new FormData(this);
            const formDataObject = {};
            formData.forEach((value, key) => {
                formDataObject[key] = value;
            });
            
            console.log('Form Data:', formDataObject);
            
            setTimeout(() => {
                alert('Registration Successful!');
                this.reset();
                btn.innerHTML = 'Create Account';
                btn.style.background = 'linear-gradient(45deg, #3d210d, #5a2703)';
                // Reset all error messages and borders
                formFields.forEach(field => {
                    field.style.borderColor = '#DEB887';
                    const errorDiv = field.parentElement.querySelector('.error-message');
                    if (errorDiv) {
                        errorDiv.style.display = 'none';
                    }
                });
            }, 2000);
        });
    </script>
</body>
</html>