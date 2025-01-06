<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Item</title>
    <link rel="stylesheet" href="styles.css">
</head>
<style>
	* {
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	}
	
	body {
	    font-family: Arial, sans-serif;
	    background-color: #f4f4f4;
	    color: #333;
	}
	
	.container {
	    width: 80%;
	    max-width: 900px;
	    margin: 30px auto;
	    background-color: #fff;
	    border-radius: 10px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    padding: 20px;
	}
	
	header {
	    text-align: center;
	    margin-bottom: 20px;
	}
	
	h1 {
	    color: #3a2d1f;  /* Brown color */
	    font-size: 2.5em;
	}
	
	.form-container {
	    display: flex;
	    flex-direction: column;
	}
	
	.input-group {
	    margin-bottom: 15px;
	}
	
	label {
	    font-size: 1.1em;
	    color: #3a2d1f;
	    margin-bottom: 5px;
	    display: block;
	}
	
	input, textarea {
	    width: 100%;
	    padding: 10px;
	    font-size: 1em;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	}
	
	input:focus, textarea:focus {
	    border-color: #3a2d1f;
	    outline: none;
	}
	
	textarea {
	    resize: vertical;
	    height: 150px;
	}
	
	button {
	    background-color: #3a2d1f;  /* Brown color */
	    color: #fff;
	    padding: 12px;
	    font-size: 1.1em;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	    transition: background-color 0.3s ease;
	}
	
	button:hover {
	    background-color: #6f4f1f;  /* Darker brown */
	}
	
	footer {
	    text-align: center;
	    margin-top: 30px;
	    font-size: 0.9em;
	    color: #888;
	}
	
</style>
<body>
    <div class="container">
        <header>
            <h1>Add Item</h1>
        </header>
        <form action="Items" method="POST" class="form-container">
            <input name="action" value="add">
            
            <div class="input-group">
                <label for="itemName">Item Name:</label>
                <input type="text" id="itemName" name="itemName" required placeholder="Enter item name">
            </div>

            <div class="input-group">
                <label for="itemImage">Item Image (URL):</label>
                <input type="text" id="itemImage" name="itemImage" required placeholder="Enter image URL">
            </div>

            <div class="input-group">
                <label for="itemDescription">Item Description:</label>
                <textarea id="itemDescription" name="itemDescription" required placeholder="Enter item description"></textarea>
            </div>

            <div class="input-group">
                <label for="itemPrice">Item Price:</label>
                <input type="number" id="itemPrice" name="itemPrice" required placeholder="Enter item price" step="0.01">
            </div>

            <div class="input-group">
                <label for="itemQuantity">Item Quantity:</label>
                <input type="number" id="itemQuantity" name="itemQuantity" required placeholder="Enter item quantity">
            </div>

            <button type="submit" class="submit-btn">Add Item</button>
        </form>
    </div>

    <footer>
        <p>&copy; 2025 YourShop. All rights reserved.</p>
    </footer>
</body>
</html>
