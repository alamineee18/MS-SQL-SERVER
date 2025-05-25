
DECLARE @i INT = 1; -- Counter for the loop
DECLARE @random INT; -- Random number for condition checks

WHILE @i <= 1000
BEGIN
    -- Generate a random number between 1 and 100
    SET @random = ABS(CHECKSUM(NEWID())) % 100 + 1;

    -- Insert logic
    INSERT INTO Customers (Name, Email, Phone, Address)
    VALUES (
        -- Generate a random name
        'Customer ' + CAST(@i AS NVARCHAR),
        
        -- Randomly omit email for 1% of customers
        CASE 
            WHEN @random <= 1 THEN NULL -- 1% chance of no email
            ELSE 'customer' + CAST(@i AS NVARCHAR) + '@example.com'
        END,

        -- Randomly omit phone number for 1% of customers
        CASE 
            WHEN @random > 1 AND @random <= 2 THEN NULL -- 1% chance of no phone
            ELSE '123456' + RIGHT('0000' + CAST(@i AS NVARCHAR), 4)
        END,

        -- Generate an address, with 2% chance of being incomplete
        CASE 
            WHEN @random > 2 AND @random <= 4 THEN 'Address ' + CAST(@i AS NVARCHAR) -- Incomplete address
            ELSE 'Address ' + CAST(@i AS NVARCHAR) + ', City, State'
        END
    );

    -- Increment counter
    SET @i = @i + 1;
END;

SELECT * FROM Customers;

SELECT COUNT(*) AS IncompleteAddresses
FROM Customers
WHERE Address NOT LIKE '%, City, State';


-- Insert 20 meaningful categories
INSERT INTO Categories (CategoryName)
VALUES
    ('Electronics'),
    ('Fashion'),
    ('Home Appliances'),
    ('Books'),
    ('Health & Beauty'),
    ('Sports & Outdoors'),
    ('Toys & Games'),
    ('Automotive'),
    ('Groceries'),
    ('Furniture'),
    ('Stationery'),
    ('Pet Supplies'),
    ('Jewelry'),
    ('Musical Instruments'),
    ('Baby Products'),
    ('Garden & Outdoor'),
    ('Tools & Hardware'),
    ('Office Supplies'),
    ('Software'),
    ('Art & Crafts');

-- Insert meaningful products into the Products table
INSERT INTO Products (ProductName, Price, Stock, CategoryID)
VALUES
    -- Electronics (CategoryID = 1)
    ('iPhone 14', 999.99, 100, 1),
    ('Samsung Galaxy S23', 899.99, 150, 1),
    ('Sony PlayStation 5', 499.99, 200, 1),
    ('Apple AirPods Pro', 199.99, 300, 1),
    ('Dell XPS 15 Laptop', 1499.99, 50, 1),

    -- Fashion (CategoryID = 2)
    ('Levi''s Jeans', 59.99, 500, 2),
    ('Nike Air Max Shoes', 129.99, 300, 2),
    ('Adidas Sports Jacket', 89.99, 200, 2),
    ('Michael Kors Handbag', 249.99, 100, 2),
    ('Ray-Ban Aviator Sunglasses', 159.99, 150, 2),

    -- Home Appliances (CategoryID = 3)
    ('Dyson V11 Vacuum Cleaner', 599.99, 50, 3),
    ('Instant Pot Duo Plus', 129.99, 150, 3),
    ('LG Refrigerator', 1599.99, 30, 3),
    ('Philips Air Fryer', 89.99, 100, 3),
    ('KitchenAid Stand Mixer', 399.99, 80, 3),

    -- Books (CategoryID = 4)
    ('The Great Gatsby', 14.99, 1000, 4),
    ('Harry Potter and the Sorcerer''s Stone', 19.99, 800, 4),
    ('Atomic Habits', 18.99, 900, 4),
    ('The Catcher in the Rye', 12.99, 600, 4),
    ('1984 by George Orwell', 9.99, 700, 4),

    -- Health & Beauty (CategoryID = 5)
    ('L''Oreal Shampoo', 9.99, 800, 5),
    ('Maybelline Lipstick', 14.99, 600, 5),
    ('Dove Body Wash', 7.99, 1000, 5),
    ('Cetaphil Moisturizer', 12.99, 400, 5),
    ('Revlon Nail Polish', 6.99, 900, 5),

    -- Sports & Outdoors (CategoryID = 6)
    ('Adidas Soccer Ball', 29.99, 400, 6),
    ('Camping Tent', 199.99, 100, 6),
    ('Wilson Tennis Racket', 99.99, 200, 6),
    ('Nike Gym Gloves', 19.99, 300, 6),
    ('Under Armour Duffle Bag', 49.99, 250, 6),

    -- Toys & Games (CategoryID = 7)
    ('LEGO Star Wars Set', 59.99, 300, 7),
    ('Barbie Dreamhouse', 149.99, 150, 7),
    ('Nerf Elite Blaster', 39.99, 400, 7),
    ('Monopoly Board Game', 19.99, 500, 7),
    ('Hot Wheels Car Track Set', 29.99, 350, 7),

    -- Automotive (CategoryID = 8)
    ('Car Jump Starter', 89.99, 150, 8),
    ('Motor Oil - 5L', 29.99, 200, 8),
    ('Michelin Car Tyres (Set of 4)', 499.99, 50, 8),
    ('Dashboard Camera', 149.99, 100, 8),
    ('Car Vacuum Cleaner', 49.99, 250, 8),

    -- Groceries (CategoryID = 9)
    ('Organic Bananas (1kg)', 2.99, 1000, 9),
    ('Almond Milk (1L)', 3.99, 800, 9),
    ('Brown Rice (5kg)', 9.99, 600, 9),
    ('Whole Wheat Bread', 1.99, 1200, 9),
    ('Free-Range Eggs (Dozen)', 4.99, 900, 9),

    -- Furniture (CategoryID = 10)
    ('IKEA Office Chair', 129.99, 75, 10),
    ('Wooden Dining Table', 499.99, 40, 10),
    ('Queen-Size Bed Frame', 699.99, 30, 10),
    ('Bookshelf', 89.99, 100, 10),
    ('Recliner Sofa', 999.99, 20, 10),

    -- Stationery (CategoryID = 11)
    ('Pilot Gel Pens (Pack of 10)', 9.99, 1200, 11),
    ('A4 Notebooks (Set of 5)', 15.99, 800, 11),
    ('Stapler with Staples', 4.99, 1000, 11),
    ('Highlighters (Pack of 6)', 7.99, 900, 11),
    ('Desk Organizer', 19.99, 400, 11),

    -- Pet Supplies (CategoryID = 12)
    ('Pedigree Dog Food (5kg)', 29.99, 300, 12),
    ('Cat Scratching Post', 49.99, 150, 12),
    ('Bird Cage', 89.99, 50, 12),
    ('Aquarium Starter Kit', 199.99, 30, 12),
    ('Dog Collar with Leash', 19.99, 400, 12),

    -- Jewelry (CategoryID = 13)
    ('Gold Necklace', 999.99, 10, 13),
    ('Silver Bracelet', 49.99, 50, 13),
    ('Diamond Earrings', 2999.99, 5, 13),
    ('Platinum Ring', 1499.99, 15, 13),
    ('Pearl Pendant', 199.99, 25, 13),

    -- Musical Instruments (CategoryID = 14)
    ('Yamaha Acoustic Guitar', 199.99, 50, 14),
    ('Casio Digital Keyboard', 399.99, 40, 14),
    ('Drum Set', 799.99, 20, 14),
    ('Violin', 299.99, 30, 14),
    ('Flute', 99.99, 70, 14),

    -- Baby Products (CategoryID = 15)
    ('Pampers Diapers (Pack of 100)', 39.99, 500, 15),
    ('Baby Crib', 299.99, 20, 15),
    ('Baby Stroller', 199.99, 30, 15),
    ('Baby Bottle Sterilizer', 89.99, 40, 15),
    ('Baby Monitor', 149.99, 25, 15),

    -- Garden & Outdoor (CategoryID = 16)
    ('Lawn Mower', 299.99, 30, 16),
    ('Gardening Tool Set', 49.99, 100, 16),
    ('Outdoor Patio Set', 999.99, 10, 16),
    ('BBQ Grill', 199.99, 20, 16),
    ('Garden Hose (50ft)', 29.99, 200, 16),

    -- Tools & Hardware (CategoryID = 17)
    ('Cordless Drill', 89.99, 120, 17),
    ('Hammer and Nails Set', 19.99, 500, 17),
    ('Adjustable Wrench', 14.99, 400, 17),
    ('Electric Screwdriver', 49.99, 150, 17),
    ('Toolbox', 99.99, 100, 17),

    -- Office Supplies (CategoryID = 18)
    ('Office Desk', 199.99, 30, 18),
    ('Ergonomic Chair', 299.99, 25, 18),
    ('Whiteboard', 49.99, 80, 18),
    ('File Cabinet', 149.99, 40, 18),
    ('Shredder', 89.99, 60, 18),

    -- Software (CategoryID = 19)
    ('Microsoft Office Suite', 149.99, 500, 19),
    ('Adobe Photoshop', 299.99, 400, 19),
    ('Antivirus Software (1 Year)', 49.99, 800, 19),
    ('VPN Subscription (1 Year)', 79.99, 600, 19),
    ('Accounting Software', 99.99, 300, 19),

    -- Art & Crafts (CategoryID = 20)
    ('Acrylic Paint Set', 29.99, 400, 20),
    ('Canvas Boards (Set of 5)', 19.99, 300, 20),
    ('Brush Set', 14.99, 500, 20),
    ('DIY Craft Kit', 24.99, 200, 20),
    ('Sketching Pencils (Pack of 12)', 9.99, 800, 20);


--insert data to order table 

DECLARE @i INT = 1; -- Counter for the loop
DECLARE @maxCustomers INT = 1000; -- Total number of customers
DECLARE @randomCustomerID INT; -- Random CustomerID
DECLARE @randomOrderDate DATE; -- Random Order Date

WHILE @i <= 2000
BEGIN
    -- Generate a random CustomerID between 1 and 1,000
    SET @randomCustomerID = FLOOR(RAND() * @maxCustomers) + 1;

    -- Generate a random OrderDate within the past year (2022-01-01 to 2023-12-31)
    SET @randomOrderDate = DATEADD(DAY, FLOOR(RAND() * 730) - 365, GETDATE());

    -- Insert data into Orders table
    INSERT INTO Orders (CustomerID, OrderDate)
    VALUES (@randomCustomerID, @randomOrderDate);

    -- Increment counter
    SET @i = @i + 1;
END;

-- Insert 80 employees into retail.Employees table
INSERT INTO retail.Employees (FirstName, LastName, Email, Phone, HireDate, Position)
VALUES
    -- Managers
    ('John', 'Smith', 'john.smith@retailshop.com', '555-123-4561', '2015-06-15', 'Store Manager'),
    ('Emily', 'Johnson', 'emily.johnson@retailshop.com', '555-123-4562', '2016-09-01', 'Assistant Manager'),
    ('David', 'Brown', 'david.brown@retailshop.com', '555-123-4563', '2018-03-22', 'Shift Manager'),
    ('Sarah', 'Williams', 'sarah.williams@retailshop.com', '555-123-4564', '2020-01-10', 'HR Manager'),
    ('James', 'Jones', 'james.jones@retailshop.com', '555-123-4565', '2017-05-30', 'Operations Manager'),

    -- Cashiers
    ('Sophia', 'Garcia', 'sophia.garcia@retailshop.com', '555-123-4566', '2022-08-15', 'Cashier'),
    ('Liam', 'Martinez', 'liam.martinez@retailshop.com', '555-123-4567', '2021-11-05', 'Cashier'),
    ('Olivia', 'Rodriguez', 'olivia.rodriguez@retailshop.com', '555-123-4568', '2023-02-20', 'Cashier'),
    ('Noah', 'Lee', 'noah.lee@retailshop.com', '555-123-4569', '2019-07-25', 'Cashier'),
    ('Emma', 'Hernandez', 'emma.hernandez@retailshop.com', '555-123-4570', '2020-12-12', 'Cashier'),

    -- Sales Associates
    ('Isabella', 'Lopez', 'isabella.lopez@retailshop.com', '555-123-4571', '2017-04-18', 'Sales Associate'),
    ('Mason', 'Gonzalez', 'mason.gonzalez@retailshop.com', '555-123-4572', '2018-10-31', 'Sales Associate'),
    ('Mia', 'Wilson', 'mia.wilson@retailshop.com', '555-123-4573', '2019-03-14', 'Sales Associate'),
    ('Ethan', 'Anderson', 'ethan.anderson@retailshop.com', '555-123-4574', '2021-06-07', 'Sales Associate'),
    ('Ava', 'Thomas', 'ava.thomas@retailshop.com', '555-123-4575', '2022-01-28', 'Sales Associate'),

    -- IT Specialists
    ('Lucas', 'Moore', 'lucas.moore@retailshop.com', '555-123-4576', '2016-09-15', 'IT Specialist'),
    ('Charlotte', 'Taylor', 'charlotte.taylor@retailshop.com', '555-123-4577', '2017-11-03', 'IT Support'),
    ('Elijah', 'White', 'elijah.white@retailshop.com', '555-123-4578', '2019-08-21', 'IT Specialist'),
    ('Amelia', 'Martin', 'amelia.martin@retailshop.com', '555-123-4579', '2020-05-10', 'IT Administrator'),
    ('Aiden', 'Miller', 'aiden.miller@retailshop.com', '555-123-4580', '2021-03-15', 'IT Support'),

    -- Warehouse Workers
    ('Harper', 'Davis', 'harper.davis@retailshop.com', '555-123-4581', '2018-07-12', 'Warehouse Worker'),
    ('Logan', 'Clark', 'logan.clark@retailshop.com', '555-123-4582', '2019-09-05', 'Warehouse Worker'),
    ('Evelyn', 'Lewis', 'evelyn.lewis@retailshop.com', '555-123-4583', '2020-11-18', 'Warehouse Worker'),
    ('Jackson', 'Hall', 'jackson.hall@retailshop.com', '555-123-4584', '2021-02-16', 'Warehouse Worker'),
    ('Aria', 'Allen', 'aria.allen@retailshop.com', '555-123-4585', '2022-04-08', 'Warehouse Worker'),

    -- Customer Support
    ('Henry', 'Young', 'henry.young@retailshop.com', '555-123-4586', '2015-10-20', 'Customer Support'),
    ('Grace', 'King', 'grace.king@retailshop.com', '555-123-4587', '2017-03-09', 'Customer Support'),
    ('Sebastian', 'Wright', 'sebastian.wright@retailshop.com', '555-123-4588', '2018-06-13', 'Customer Support'),
    ('Ella', 'Scott', 'ella.scott@retailshop.com', '555-123-4589', '2019-01-04', 'Customer Support'),
    ('Chloe', 'Green', 'chloe.green@retailshop.com', '555-123-4590', '2021-10-29', 'Customer Support'),

    -- Security
    ('Benjamin', 'Adams', 'benjamin.adams@retailshop.com', '555-123-4591', '2016-02-11', 'Security Guard'),
    ('Scarlett', 'Baker', 'scarlett.baker@retailshop.com', '555-123-4592', '2018-05-22', 'Security Guard'),
    ('Matthew', 'Hill', 'matthew.hill@retailshop.com', '555-123-4593', '2019-09-17', 'Security Guard'),
    ('Victoria', 'Nelson', 'victoria.nelson@retailshop.com', '555-123-4594', '2020-03-30', 'Security Guard'),
    ('Isaac', 'Carter', 'isaac.carter@retailshop.com', '555-123-4595', '2021-07-14', 'Security Guard'),

    -- Cleaning Staff
    ('Eleanor', 'Mitchell', 'eleanor.mitchell@retailshop.com', '555-123-4596', '2017-08-27', 'Cleaner'),
    ('Samuel', 'Perez', 'samuel.perez@retailshop.com', '555-123-4597', '2018-04-19', 'Cleaner'),
    ('Hannah', 'Roberts', 'hannah.roberts@retailshop.com', '555-123-4598', '2019-12-11', 'Cleaner'),
    ('Levi', 'Turner', 'levi.turner@retailshop.com', '555-123-4599', '2021-01-15', 'Cleaner'),
    ('Zoey', 'Collins', 'zoey.collins@retailshop.com', '555-123-4600', '2022-09-23', 'Cleaner');