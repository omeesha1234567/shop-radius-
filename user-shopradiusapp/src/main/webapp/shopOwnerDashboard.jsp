<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Owner Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #2c1810 0%, #1a0f0a 100%);
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
        }

        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 280px;
            background: linear-gradient(180deg, #352214 0%, #241810 100%);
            padding: 25px;
            color: white;
            box-shadow: 5px 0 15px rgba(0, 0, 0, 0.2);
        }

        .profile-section {
            text-align: center;
            padding: 25px 0;
            border-bottom: 2px solid rgba(255, 255, 255, 0.1);
            margin-bottom: 20px;
        }

        .profile-image {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            margin-bottom: 15px;
            border: 4px solid #503d2f;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease;
        }

        .profile-image:hover {
            transform: scale(1.05);
        }

        .shop-name {
            font-size: 1.2rem;
            margin-bottom: 5px;
        }

        .owner-name {
            font-size: 0.9rem;
            color: #ccc;
        }

        .nav-menu {
            margin-top: 30px;
        }

        .nav-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 15px 20px;
            margin: 8px 0;
            border-radius: 10px;
            font-weight: 500;
            cursor: pointer;
        }

        .nav-item i {
            font-size: 1.2rem;
            width: 24px;
        }

        .nav-item:hover {
            background: linear-gradient(90deg, #503d2f 0%, #6b4c3a 100%);
            transform: translateX(5px);
        }

        .nav-item.active {
            background: linear-gradient(90deg, #503d2f 0%, #6b4c3a 100%);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            padding: 30px;
            background: rgba(255, 255, 255, 0.98);
            margin: 25px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 40px;
        }

        .header h2 {
            font-size: 2rem;
            color: #352214;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .search-bar {
            display: flex;
            gap: 15px;
            background: #fff;
            padding: 8px 15px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            width: 100%;
            max-width: 600px;
        }

        .search-bar input {
            flex: 1;
            padding: 10px;
            border: none;
            background: #f8f9fa;
            border-radius: 8px;
            font-size: 0.95rem;
        }

        .add-item-btn {
            padding: 12px 25px;
            background: linear-gradient(90deg, #503d2f 0%, #6b4c3a 100%);
            color: white;
            border: none;
            border-radius: 30px;
            font-weight: 500;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 15px rgba(80, 61, 47, 0.3);
        }

        .add-item-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(80, 61, 47, 0.4);
        }

        /* Inventory Table Styles */
        .inventory-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            border: 1px solid #eee;
        }

        .inventory-table th,
        .inventory-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .inventory-table th {
            background: #503d2f;
            color: white;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.85rem;
            padding: 15px 20px;
        }

        .inventory-table td {
            padding: 15px 20px;
            font-size: 0.95rem;
        }

        .inventory-table tr:nth-child(even) {
            background: #fafafa;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .edit-btn, .delete-btn {
            padding: 8px 16px;
            border: none;
            border-radius: 8px;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .edit-btn {
            background: #503d2f;
            color: white;
        }

        .delete-btn {
            background: #dc3545;
            color: white;
        }

        .edit-btn:hover, .delete-btn:hover {
            opacity: 0.8;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            justify-content: center;
            align-items: center;
            backdrop-filter: blur(5px);
            z-index: 1000;
        }

        .modal-content {
            background: linear-gradient(to bottom right, #fff, #f8f9fa);
            padding: 35px;
            border-radius: 20px;
            width: 600px;
            max-width: 90%;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            position: relative;
            transform: scale(0.9);
            opacity: 0;
            transition: all 0.3s ease-out;
        }

        .modal.show .modal-content {
            transform: scale(1);
            opacity: 1;
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid #eee;
        }

        .modal-header h3 {
            font-size: 1.8rem;
            color: #352214;
            font-weight: 600;
        }

        .close-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 1.5rem;
            color: #666;
            cursor: pointer;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            background: #f8f9fa;
        }

        .close-btn:hover {
            background: #503d2f;
            color: white;
            transform: rotate(90deg);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #352214;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px;
            border: 2px solid #eee;
            border-radius: 8px;
            font-size: 0.95rem;
            transition: all 0.3s ease;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #503d2f;
            box-shadow: 0 0 0 3px rgba(80, 61, 47, 0.1);
            outline: none;
        }

        /* Status Badge */
        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .status-badge::before {
            content: '';
            width: 8px;
            height: 8px;
            border-radius: 50%;
            display: inline-block;
        }

        .status-instock::before {
            background: #2e7d32;
        }

        .status-low::before {
            background: #ef6c00;
        }

        .status-outstock::before {
            background: #c62828;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* एनालिटिक्स मोडल स्टाइलिंग */
        .analytics-modal .modal-content {
            text-align: center;
            padding: 40px;
        }

        .analytics-icon {
            font-size: 4rem;
            color: #503d2f;
            margin-bottom: 20px;
        }

        .analytics-message {
            font-size: 1.5rem;
            color: #352214;
            margin-bottom: 15px;
        }

        .analytics-submessage {
            color: #666;
            font-size: 1rem;
            margin-bottom: 25px;
        }

        .coming-soon-badge {
            background: linear-gradient(45deg, #503d2f, #6b4c3a);
            color: white;
            padding: 8px 20px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 500;
            display: inline-block;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="profile-section">
                <img src="default-profile.jpg" alt="Profile" class="profile-image">
                <div class="shop-name">My Shop Name</div>
                <div class="owner-name">Owner Name</div>
            </div>
            <div class="nav-menu">
                <div class="nav-item active">
                    <i class="fas fa-box"></i>
                    <span>Inventory</span>
                </div>
                <div class="nav-item" onclick="openAnalyticsModal()">
                    <i class="fas fa-chart-bar"></i>
                    <span>Analytics</span>
                </div>
                <div class="nav-item">
                    <i class="fas fa-cog"></i>
                    <span>Settings</span>
                </div>
                <div class="nav-item" onclick="handleLogout()">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="header">
                <h2>Inventory Management</h2>
                <div class="search-bar">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Search items by name, category or status...">
                    <button class="add-item-btn" onclick="openModal()">
                        <i class="fas fa-plus"></i> Add New Item
                    </button>
                </div>
            </div>

            <!-- Inventory Table -->
            <table class="inventory-table">
                <thead>
                    <tr>
                        <th>Item Name</th>
                        <th>Category</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Sample Item 1</td>
                        <td>Electronics</td>
                        <td>50</td>
                        <td>₹999</td>
                        <td>
                            <span class="status-badge status-instock">In Stock</span>
                        </td>
                        <td class="action-buttons">
                            <button class="edit-btn">
                                <i class="fas fa-edit"></i> Edit
                            </button>
                            <button class="delete-btn">
                                <i class="fas fa-trash"></i> Delete
                            </button>
                        </td>
                    </tr>
                    <!-- Add more rows as needed -->
                </tbody>
            </table>
        </div>
    </div>

    <!-- Add/Edit Item Modal -->
    <div class="modal" id="itemModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Add New Item</h3>
                <span class="close-btn" onclick="closeModal()">&times;</span>
            </div>
            <form id="itemForm">
                <div class="form-group">
                    <label for="itemName">Item Name</label>
                    <input type="text" id="itemName" name="itemName" required>
                </div>
                <div class="form-group">
                    <label for="itemCategory">Category</label>
                    <select id="itemCategory" name="itemCategory" required>
                        <option value="">Select Category</option>
                        <option value="electronics">Electronics</option>
                        <option value="clothing">Clothing</option>
                        <option value="food">Food</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="itemQuantity">Quantity</label>
                    <input type="number" id="itemQuantity" name="itemQuantity" required min="0">
                </div>
                <div class="form-group">
                    <label for="itemPrice">Price</label>
                    <input type="number" id="itemPrice" name="itemPrice" required min="0" step="0.01">
                </div>
                <button type="submit" id="saveItemBtn" name="saveItemBtn" class="add-item-btn">Save Item</button>
            </form>
        </div>
    </div>

    <!-- एनालिटिक्स मोडल HTML -->
    <div class="modal analytics-modal" id="analyticsModal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeAnalyticsModal()">&times;</span>
            <div class="analytics-icon">
                <i class="fas fa-chart-line"></i>
            </div>
            <h3 class="analytics-message">Analytics Dashboard</h3>
            <p class="analytics-submessage">We're working on something amazing!</p>
            <span class="coming-soon-badge">Coming Soon</span>
        </div>
    </div>

    <script>
        function openModal() {
            const modal = document.getElementById('itemModal');
            modal.style.display = 'flex';
            setTimeout(() => modal.classList.add('show'), 10);
        }

        function closeModal() {
            const modal = document.getElementById('itemModal');
            modal.classList.remove('show');
            setTimeout(() => modal.style.display = 'none', 300);
        }

        // बाहर क्लिक करने पर मोडल बंद करें
        window.onclick = function(event) {
            const itemModal = document.getElementById('itemModal');
            const analyticsModal = document.getElementById('analyticsModal');
            if (event.target == itemModal || event.target == analyticsModal) {
                closeModal();
                closeAnalyticsModal();
            }
        }

        // Form submission
        document.getElementById('itemForm').addEventListener('submit', function(e) {
            e.preventDefault();
            // Add your form handling logic here
            closeModal();
        });

        // Search functionality
        document.querySelector('.search-bar input').addEventListener('input', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            const rows = document.querySelectorAll('.inventory-table tbody tr');
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(searchTerm) ? '' : 'none';
            });
        });

        // Add this function to determine status badge
        function getStatusBadge(quantity) {
            if (quantity > 20) {
                return '<span class="status-badge status-instock">In Stock</span>';
            } else if (quantity > 0) {
                return '<span class="status-badge status-low">Low Stock</span>';
            } else {
                return '<span class="status-badge status-outstock">Out of Stock</span>';
            }
        }

        // Update your table row creation to include the status badge
        function createTableRow(item) {
            return `
                <tr>
                    <td>${item.name}</td>
                    <td>${item.category}</td>
                    <td>${item.quantity}</td>
                    <td>₹${item.price}</td>
                    <td>${getStatusBadge(item.quantity)}</td>
                    <td class="action-buttons">
                        <button class="edit-btn">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                        <button class="delete-btn">
                            <i class="fas fa-trash"></i> Delete
                        </button>
                    </td>
                </tr>
            `;
        }

        function handleLogout() {
            if (confirm('Are you sure you want to logout?')) {
                window.location.href = 'homepage.html';
            }
        }

        function openAnalyticsModal() {
            const modal = document.getElementById('analyticsModal');
            modal.style.display = 'flex';
            setTimeout(() => modal.classList.add('show'), 10);
        }

        function closeAnalyticsModal() {
            const modal = document.getElementById('analyticsModal');
            modal.classList.remove('show');
            setTimeout(() => modal.style.display = 'none', 300);
        }
    </script>
</body>
</html>