
-- Insert Sample Users
INSERT INTO User (username, email, passwordHash, address)
VALUES 
('alice', 'alice@example.com', 'hashed_pass1', 'Hyderabad'),
('bob', 'bob@example.com', 'hashed_pass2', 'Chennai');

-- Insert Categories
INSERT INTO Category (name, description)
VALUES ('Electronics', 'Electronic devices and gadgets'),
       ('Clothing', 'Men and Women Clothing');

-- Insert Products
INSERT INTO Product (name, description, price, stock, categoryId)
VALUES
('Laptop', '14-inch i5 Laptop', 55000.00, 10, 1),
('T-Shirt', 'Cotton T-shirt', 500.00, 50, 2);

-- Create Cart and Add Items
INSERT INTO Cart (userId, createdDate) VALUES (1, CURDATE());

INSERT INTO CartItem (cartId, productId, quantity)
VALUES (1, 1, 1);

-- Place Order and Add Items
INSERT INTO `Order` (userId, orderDate, status, totalAmount)
VALUES (1, CURDATE(), 'Confirmed', 55000.00);

INSERT INTO OrderItem (orderId, productId, quantity, price)
VALUES (1, 1, 1, 55000.00);

-- Payment for the Order
INSERT INTO Payment (orderId, paymentDate, amount, paymentMethod)
VALUES (1, CURDATE(), 55000.00, 'Credit Card');
