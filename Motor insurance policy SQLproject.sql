create database project2;
use project2;
CREATE TABLE vehicle_make (
    make_id INT AUTO_INCREMENT PRIMARY KEY,
    make_name VARCHAR(100) NOT NULL
);
desc vehicle_make;

CREATE TABLE vehicle_model (
    model_id INT AUTO_INCREMENT PRIMARY KEY,
    make_id INT,
    model_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (make_id) REFERENCES vehicle_make(make_id)
);
desc vehicle_model;
CREATE TABLE insurance_plan (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(100),
    coverage_details TEXT,
    base_premium DECIMAL(10,2)
);
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address TEXT
);

CREATE TABLE vehicle (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    model_id INT,
    registration_no VARCHAR(50),
    year_of_manufacture YEAR,
    chassis_no VARCHAR(100),
    engine_no VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (model_id) REFERENCES vehicle_model(model_id)
);
CREATE TABLE policy (
    policy_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT,
    plan_id INT,
    start_date DATE,
    end_date DATE,
    status ENUM('Active', 'Expired', 'Cancelled') DEFAULT 'Active',
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id),
    FOREIGN KEY (plan_id) REFERENCES insurance_plan(plan_id)
);
CREATE TABLE payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    policy_id INT,
    payment_date DATE,
    amount_paid DECIMAL(10,2),
    payment_mode ENUM('Online', 'Cheque', 'Cash'),
    FOREIGN KEY (policy_id) REFERENCES policy(policy_id)
);
CREATE TABLE claim (
    claim_id INT AUTO_INCREMENT PRIMARY KEY,
    policy_id INT,
    claim_date DATE,
    claim_amount DECIMAL(10,2),
    claim_reason TEXT,
    claim_status ENUM('Filed', 'Approved', 'Rejected', 'Paid') DEFAULT 'Filed',
    FOREIGN KEY (policy_id) REFERENCES policy(policy_id)
);
CREATE TABLE inspection (
    inspection_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT,
    inspection_date DATE,
    inspected_by VARCHAR(100),
    inspection_notes TEXT,
    status ENUM('Passed', 'Failed') DEFAULT 'Passed',
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id)
);
-- vehicle_make
INSERT INTO vehicle_make (make_name) VALUES 
('Toyota'), ('Honda'), ('Ford'), ('Chevrolet'), ('BMW'),
('Audi'), ('Hyundai'), ('Kia'), ('Nissan'), ('Volkswagen');
-- vehicle_model
INSERT INTO vehicle_model (make_id, model_name) VALUES 
(1, 'Corolla'), (2, 'Civic'), (3, 'F-150'), (4, 'Malibu'), (5, 'X5'),
(6, 'A4'), (7, 'Elantra'), (8, 'Sportage'), (9, 'Altima'), (10, 'Jetta');
-- insurance_plan
INSERT INTO insurance_plan (plan_name, coverage_details, base_premium) VALUES 
('Comprehensive', 'Covers all damage types including theft.', 1200.00),
('Third-Party Only', 'Only covers third-party liabilities.', 600.00),
('Collision', 'Covers damage to your car during collisions.', 900.00);
-- customer
INSERT INTO customer (customer_id, full_name, email, phone, address) VALUES
(1, 'John Doe', 'john@example.com', '1234567890', '123 Elm Street'),
(2, 'Jane Smith', 'jane@example.com', '2345678901', '456 Oak Avenue'),
(3, 'Alice Johnson', 'alice@example.com', '3456789012', '789 Pine Lane'),
(4, 'Bob Brown', 'bob@example.com', '4567890123', '321 Maple Drive'),
(5, 'Charlie Black', 'charlie@example.com', '5678901234', '654 Birch Way'),
(6, 'Emily Davis', 'emily@example.com', '6789012345', '987 Cedar Court'),
(7, 'Frank White', 'frank@example.com', '7890123456', '159 Walnut Ave'),
(8, 'Grace Green', 'grace@example.com', '8901234567', '753 Spruce Blvd'),
(9, 'Harry Stone', 'harry@example.com', '9012345678', '852 Redwood Rd'),
(10, 'Ivy Blue', 'ivy@example.com', '0123456789', '951 Aspen Dr'),
(11, 'Jack Grey', 'jack@example.com', '1122334455', '147 Palm St'),
(12, 'Kate Rose', 'kate@example.com', '2233445566', '369 Cypress Ave'),
(13, 'Leo Ray', 'leo@example.com', '3344556677', '741 Chestnut St'),
(14, 'Mona Vale', 'mona@example.com', '4455667788', '258 Hickory Rd'),
(15, 'Nina Sky', 'nina@example.com', '5566778899', '369 Sequoia Blvd'),
(16, 'Oscar Dean', 'oscar@example.com', '6677889900', '147 Fir Dr'),
(17, 'Pam Fox', 'pam@example.com', '7788990011', '321 Elm St'),
(18, 'Quinn Hawk', 'quinn@example.com', '8899001122', '654 Oak Lane'),
(19, 'Rita Bloom', 'rita@example.com', '9900112233', '987 Maple Ct'),
(20, 'Sam Lake', 'sam@example.com', '1011121314', '123 Pine Blvd'),
(21, 'Tina Mars', 'tina@example.com', '1213141516', '456 Cedar St'),
(22, 'Uma Wells', 'uma@example.com', '1314151617', '789 Walnut Rd'),
(23, 'Vic Nox', 'vic@example.com', '1415161718', '951 Redwood Ave'),
(24, 'Walt Zen', 'walt@example.com', '1516171819', '357 Birch Ct'),
(25, 'Yara Kite', 'yara@example.com', '1617181920', '258 Spruce Ln');
-- vehicle
INSERT INTO vehicle (customer_id, model_id, registration_no, year_of_manufacture, chassis_no, engine_no) VALUES
(1, 1, 'TN01AB1234', 2018, 'CHS1234567890', 'ENG9876543210'),
(2, 2, 'TN02CD2345', 2019, 'CHS2234567891', 'ENG9876543211'),
(3, 3, 'TN03EF3456', 2020, 'CHS3234567892', 'ENG9876543212'),
(4, 4, 'TN04GH4567', 2017, 'CHS4234567893', 'ENG9876543213'),
(5, 5, 'TN05IJ5678', 2021, 'CHS5234567894', 'ENG9876543214'),
(6, 6, 'TN06KL6789', 2016, 'CHS6234567895', 'ENG9876543215'),
(7, 7, 'TN07MN7890', 2015, 'CHS7234567896', 'ENG9876543216'),
(8, 8, 'TN08OP8901', 2014, 'CHS8234567897', 'ENG9876543217'),
(9, 9, 'TN09QR9012', 2022, 'CHS9234567898', 'ENG9876543218'),
(10, 10, 'TN10ST0123', 2023, 'CHS1023456789', 'ENG9876543219'),
(11, 1, 'TN11UV1234', 2019, 'CHS1123456780', 'ENG9876543220'),
(12, 2, 'TN12WX2345', 2018, 'CHS1223456781', 'ENG9876543221'),
(13, 3, 'TN13YZ3456', 2017, 'CHS1323456782', 'ENG9876543222'),
(14, 4, 'TN14AB4567', 2020, 'CHS1423456783', 'ENG9876543223'),
(15, 5, 'TN15CD5678', 2021, 'CHS1523456784', 'ENG9876543224'),
(16, 6, 'TN16EF6789', 2019, 'CHS1623456785', 'ENG9876543225'),
(17, 7, 'TN17GH7890', 2022, 'CHS1723456786', 'ENG9876543226'),
(18, 8, 'TN18IJ8901', 2015, 'CHS1823456787', 'ENG9876543227'),
(19, 9, 'TN19KL9012', 2023, 'CHS1923456788', 'ENG9876543228'),
(20, 10, 'TN20MN0123', 2016, 'CHS2023456789', 'ENG9876543229');
-- Sample policy records
INSERT INTO policy (vehicle_id, plan_id, start_date, end_date, status) VALUES
(1, 1, '2024-01-01', '2025-01-01', 'Active'),
(2, 2, '2023-02-15', '2024-02-15', 'Expired'),
(3, 3, '2024-03-10', '2025-03-10', 'Active'),
(4, 1, '2022-04-20', '2023-04-20', 'Expired'),
(5, 2, '2024-05-25', '2025-05-25', 'Active'),
(6, 3, '2023-06-30', '2024-06-30', 'Expired'),
(7, 1, '2024-07-05', '2025-07-05', 'Active'),
(8, 2, '2022-08-10', '2023-08-10', 'Expired'),
(9, 3, '2023-09-15', '2024-09-15', 'Active'),
(10, 1, '2024-10-01', '2025-10-01', 'Active'),
(11, 2, '2022-11-12', '2023-11-12', 'Cancelled'),
(12, 3, '2023-12-20', '2024-12-20', 'Active'),
(13, 1, '2024-01-05', '2025-01-05', 'Active'),
(14, 2, '2023-02-18', '2024-02-18', 'Active'),
(15, 3, '2024-03-22', '2025-03-22', 'Active'),
(16, 1, '2022-04-25', '2023-04-25', 'Cancelled'),
(17, 2, '2024-05-30', '2025-05-30', 'Active'),
(18, 3, '2023-06-05', '2024-06-05', 'Expired'),
(19, 1, '2024-07-10', '2025-07-10', 'Active'),
(20, 2, '2022-08-15', '2023-08-15', 'Cancelled');

-- Sample payment records
INSERT INTO payment (policy_id, payment_date, amount_paid, payment_mode) VALUES
(1, '2024-01-01', 5000.00, 'Online'),
(2, '2023-02-15', 4500.00, 'Cheque'),
(3, '2024-03-10', 5200.00, 'Cash'),
(4, '2022-04-20', 4800.00, 'Online'),
(5, '2024-05-25', 5100.00, 'Cash'),
(6, '2023-06-30', 4700.00, 'Cheque'),
(7, '2024-07-05', 5300.00, 'Online'),
(8, '2022-08-10', 4400.00, 'Cash'),
(9, '2023-09-15', 4950.00, 'Cheque'),
(10, '2024-10-01', 5050.00, 'Online'),
(11, '2022-11-12', 4100.00, 'Cash'),
(12, '2023-12-20', 5500.00, 'Cheque'),
(13, '2024-01-05', 5000.00, 'Online'),
(14, '2023-02-18', 4700.00, 'Cash'),
(15, '2024-03-22', 5200.00, 'Cheque'),
(16, '2022-04-25', 4600.00, 'Online'),
(17, '2024-05-30', 5100.00, 'Cash'),
(18, '2023-06-05', 4900.00, 'Cheque'),
(19, '2024-07-10', 5050.00, 'Online'),
(20, '2022-08-15', 4300.00, 'Cash');
-- Sample claim records
INSERT INTO claim (policy_id, claim_date, claim_amount, claim_reason, claim_status) VALUES
(1, '2024-06-01', 2000.00, 'Accident - minor collision', 'Approved'),
(2, '2023-07-10', 1800.00, 'Windshield damage', 'Paid'),
(3, '2024-04-12', 2500.00, 'Engine failure', 'Filed'),
(4, '2022-09-25', 3000.00, 'Fire damage', 'Rejected'),
(5, '2024-06-05', 1500.00, 'Theft attempt', 'Approved'),
(6, '2023-07-30', 1200.00, 'Scratches and dents', 'Paid'),
(7, '2024-08-15', 1800.00, 'Tire damage', 'Approved'),
(8, '2022-10-10', 1600.00, 'Flood damage', 'Rejected'),
(9, '2023-11-20', 2100.00, 'Broken side mirror', 'Paid'),
(10, '2024-11-01', 3000.00, 'Rear-end collision', 'Approved');
-- Sample inspection records
INSERT INTO inspection (vehicle_id, inspection_date, inspected_by, inspection_notes, status) VALUES
(1, '2024-01-10', 'Inspector A', 'No issues found', 'Passed'),
(2, '2023-02-18', 'Inspector B', 'Minor scratches noted', 'Passed'),
(3, '2024-03-15', 'Inspector C', 'Engine inspection needed', 'Failed'),
(4, '2022-04-22', 'Inspector D', 'Good condition overall', 'Passed'),
(5, '2024-05-28', 'Inspector E', 'Brake wear detected', 'Failed'),
(6, '2023-07-01', 'Inspector F', 'Passed all checks', 'Passed'),
(7, '2024-07-08', 'Inspector G', 'Slight dent on door', 'Passed'),
(8, '2022-08-14', 'Inspector H', 'Old tires, recommend replacement', 'Passed'),
(9, '2023-09-20', 'Inspector I', 'Battery weak', 'Failed'),
(10, '2024-10-03', 'Inspector J', 'Inspection successful', 'Passed'),
(11, '2022-11-15', 'Inspector K', 'Body damage noted', 'Failed'),
(12, '2023-12-23', 'Inspector L', 'Re-inspection required', 'Failed'),
(13, '2024-01-08', 'Inspector M', 'Windscreen crack', 'Passed'),
(14, '2023-02-20', 'Inspector N', 'No issues', 'Passed'),
(15, '2024-03-25', 'Inspector O', 'Coolant low', 'Passed'),
(16, '2022-04-28', 'Inspector P', 'Lights faulty', 'Failed'),
(17, '2024-06-01', 'Inspector Q', 'Overall good', 'Passed'),
(18, '2023-06-07', 'Inspector R', 'Engine noise observed', 'Failed'),
(19, '2024-07-12', 'Inspector S', 'Tire alignment needed', 'Passed'),
(20, '2022-08-18', 'Inspector T', 'Steering issue', 'Failed');
ALTER TABLE customer ADD COLUMN dob DATE;
ALTER TABLE inspection DROP COLUMN inspection_notes;
ALTER TABLE claim MODIFY COLUMN claim_status VARCHAR(30);
ALTER TABLE vehicle_model RENAME COLUMN model_name TO vehicle_model_name;




INSERT INTO vehicle_make (make_name) VALUES ('Toyota');
UPDATE customer SET phone = '9998887776'WHERE customer_id = 5;
UPDATE policy SET status = 'Cancelled'WHERE policy_id = 3;
UPDATE vehicle SET registration_no = 'TN99ZZ9999' WHERE vehicle_id = 10;
UPDATE claim SET claim_status = 'Paid'WHERE claim_id = 3;
DELETE FROM claim WHERE claim_id = 10;
DELETE FROM customer WHERE customer_id = 25;
DELETE FROM inspection WHERE inspection_id = 15;
SELECT * FROM policy WHERE status = 'Active';
SELECT * FROM payment WHERE policy_id = 1;
SELECT * FROM vehicle WHERE customer_id = 3;
SELECT policy_id, amount_paid, (amount_paid + 100) * 0.9 AS discounted_amount
FROM payment
LIMIT 5;
SELECT payment_id, amount_paid, amount_paid / 2 AS half_paid
FROM payment
WHERE payment_mode = 'Cash';
SELECT policy_id, amount_paid, amount_paid - 500 AS after_deduction
FROM payment
WHERE amount_paid > 5000;
SELECT NULL != 0 AS result1, NULL != NULL AS result2;
SELECT customer_id, full_name AS Name, email AS Email_Address
FROM customer
LIMIT 5;
-- Customers whose name is exactly 'John Doe'
SELECT * FROM customer WHERE full_name = 'John Doe';

SELECT * FROM policy WHERE status <> 'Active';  
-- Vehicles manufactured after 2020
SELECT registration_no, year_of_manufacture FROM vehicle WHERE year_of_manufacture > 2020;
-- Payments between 4500 and 5100
SELECT payment_id, amount_paid FROM payment WHERE amount_paid BETWEEN 4500 AND 5100;

-- Vehicles NOT manufactured between 2017 and 2020
SELECT registration_no, year_of_manufacture FROM vehicle WHERE year_of_manufacture NOT BETWEEN 2017 AND 2020;
-- Vehicles with model_id 1, 2, or 3
SELECT registration_no, model_id FROM vehicle WHERE model_id IN (1, 2, 3);

-- Claims that are NOT approved or paid
SELECT claim_id, claim_status FROM claim WHERE claim_status NOT IN ('Approved', 'Paid');
-- Customers whose email ends with '@example.com'
SELECT customer_id, full_name FROM customer WHERE email LIKE '%@example.com';


SELECT registration_no FROM vehicle WHERE registration_no not LIKE 'TN0_%';

-- Customers where email is NOT null
SELECT customer_id, email FROM customer WHERE email IS NOT NULL;

-- Let's assume some inspection notes are NULL (you can test this)
ALTER TABLE inspection ADD COLUMN inspection_notes VARCHAR(255);
INSERT INTO inspection (policy_id, inspection_date, inspector_name, inspection_status, inspection_notes)
VALUES
(101, '2024-06-15', 'Ravi Kumar', 'Completed', 'Minor scratches on rear bumper'),
(102, '2024-06-20', 'Anjali Sharma', 'Pending', NULL),
(103, '2024-07-01', 'Manoj Singh', 'Completed', 'Good condition, no visible damage'),
(104, '2024-07-03', 'Priya Das', 'Failed', 'Broken tail light'),
(105, '2024-07-05', 'Amit Rao', 'Completed', 'Rust on left side door');

SELECT inspection_id FROM inspection WHERE inspection_notes IS NULL;

select * from inspection;


-- Policies that are not active
SELECT policy_id, status FROM policy WHERE status != 'Active';

-- Payments where amount is greater than or equal to 5000
SELECT payment_id, amount_paid FROM payment WHERE amount_paid >= 5000;

SELECT * 
FROM policy
WHERE status = 'Active' AND start_date >= '2024-01-01';
SELECT * 
FROM customer
WHERE address LIKE '%Maple Drive%' OR address LIKE '%Pine Lane%';
SELECT * 
FROM policy
ORDER BY end_date DESC;
SELECT * 
FROM inspection
ORDER BY inspection_date DESC
LIMIT 5;
SELECT COUNT(*) AS total_customers
FROM customer;
SELECT SUM(amount_paid) AS total_payments
FROM payment;
SELECT AVG(claim_amount) AS avg_claim_amount
FROM claim;
SELECT 
    MIN(base_premium) AS min_premium,
    MAX(base_premium) AS max_premium
FROM insurance_plan;
SELECT payment_mode, SUM(amount_paid) AS total_collected
FROM payment
GROUP BY payment_mode;
SELECT payment_mode, SUM(amount_paid) AS total_paid
FROM payment
GROUP BY payment_mode
HAVING total_paid > 15000;
SELECT status, COUNT(*) AS policy_count
FROM policy
GROUP BY status;
SELECT full_name
FROM customer
WHERE customer_id IN (
    SELECT v.customer_id
    FROM vehicle v
    JOIN policy p ON v.vehicle_id = p.vehicle_id
    WHERE p.status = 'Active'
);
SELECT 
    policy_id,
    (SELECT SUM(amount_paid) 
     FROM payment 
     WHERE payment.policy_id = policy.policy_id) AS total_paid
FROM policy;
SELECT AVG(total_paid) AS avg_payment_per_policy
FROM (
    SELECT policy_id, SUM(amount_paid) AS total_paid
    FROM payment
    GROUP BY policy_id
) AS payment_summary;
SELECT full_name
FROM customer c
WHERE EXISTS (
    SELECT 1
    FROM vehicle v
    JOIN inspection i ON v.vehicle_id = i.vehicle_id
    WHERE v.customer_id = c.customer_id
    AND i.inspection_date = (
        SELECT MAX(inspection_date)
        FROM inspection
    )
);
SELECT registration_no
FROM vehicle
WHERE vehicle_id NOT IN (
    SELECT v.vehicle_id
    FROM vehicle v
    JOIN policy p ON v.vehicle_id = p.vehicle_id
    JOIN claim c ON p.policy_id = c.policy_id
);
SELECT c.full_name, v.registration_no
FROM customer c
INNER JOIN vehicle v ON c.customer_id = v.customer_id;
SELECT c.full_name, v.registration_no
FROM customer c
LEFT JOIN vehicle v ON c.customer_id = v.customer_id;

SELECT c.full_name, v.registration_no, p.start_date, p.end_date
FROM customer c
JOIN vehicle v ON c.customer_id = v.customer_id
JOIN policy p ON v.vehicle_id = p.vehicle_id;
DELIMITER //

CREATE PROCEDURE GetCustomerPolicies(IN cust_id INT)
BEGIN
    SELECT c.full_name, v.registration_no, p.policy_id, p.start_date, p.end_date, p.status
    FROM customer c
    JOIN vehicle v ON c.customer_id = v.customer_id
    JOIN policy p ON v.vehicle_id = p.vehicle_id
    WHERE c.customer_id = cust_id;
END //

DELIMITER ;
CALL GetCustomerPolicies(1);
DELIMITER //

CREATE PROCEDURE CountActivePolicies(OUT active_count INT)
BEGIN
    SELECT COUNT(*) INTO active_count
    FROM policy
    WHERE status = 'Active';
END //

DELIMITER ;
CALL CountActivePolicies(@count);
SELECT @count;
DELIMITER //

CREATE FUNCTION GetPolicyDuration(start_date DATE, end_date DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE duration INT;
    SET duration = DATEDIFF(end_date, start_date);
    RETURN duration;
END //

DELIMITER ;
SELECT policy_id, GetPolicyDuration(start_date, end_date) AS duration_days
FROM policy;
DELIMITER //

CREATE FUNCTION GetVehicleDescription(vehicleId INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE description VARCHAR(255);
    SELECT CONCAT(vm.model_name, ' - ', vmk.make_name)
    INTO description
    FROM vehicle v
    JOIN vehicle_model vm ON v.model_id = vm.model_id
    JOIN vehicle_make vmk ON vm.make_id = vmk.make_id
    WHERE v.vehicle_id = vehicleId;

    RETURN description;
END //
DELIMITER //

CREATE FUNCTION GetVehicleDescription1(v_id INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE description VARCHAR(255);

    SELECT 
        CONCAT(mvm.model_name, ' ', mvm.model_variant, ' - ', mvmk.make_name)
    INTO description
    FROM 
        motor_vehicle_model mvm
    JOIN 
        vehicle v ON v.vehicle_model_id = mvm.vehicle_model_id
    JOIN 
        motor_vehicle_make mvmk ON mvm.make_id = mvmk.make_id
    WHERE 
        v.vehicle_id = v_id;

    RETURN description;
END //

DELIMITER ;

SELECT vehicle_id, GetVehicleDescription1(vehicle_id) AS description
FROM vehicle;
CREATE TRIGGER trigger_name
{BEFORE | AFTER} {INSERT | UPDATE | DELETE}
ON table_name
FOR EACH ROW
BEGIN
   -- trigger logic here
END;
________________________________________
Triggers:
Syntax:
DELIMITER //

CREATE TRIGGER after_policy_insert
AFTER INSERT ON policy
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (action_time, action_type, table_name, record_info)
    VALUES (NOW(), 'INSERT', 'policy',
            CONCAT('Policy ID: ', NEW.policy_id, ', Vechicle ID: ', NEW.vehicle_id));
END //
INSERT INTO policy (
    policy_id,
    vehicle_id,
    customer_id,
    plan_id,
    policy_start_date,
    policy_end_date,
    premium_amount
) VALUES (
    156,
    556,
    356,
    201,
    '2025-04-01',
    '2026-04-01',
    7540.00
);
CREATE TRIGGER after_policy_insert_v2
AFTER INSERT ON policy
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (action_time, action_type, table_name, record_info)
    VALUES (
        NOW(), 
        'INSERT', 
        'policy',
        CONCAT('Policy ID: ', NEW.policy_id, ', Vehicle ID: ', NEW.vehicle_id)
    );
END;



DELIMITER ;
DELIMITER //

CREATE TRIGGER after_policy_insert_v2
AFTER INSERT ON policy
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (action_time, action_type, table_name, record_info)
    VALUES (
        NOW(), 
        'INSERT', 
        'policy',
        CONCAT('Policy ID: ', NEW.policy_id, ', Vehicle ID: ', NEW.vehicle_id)
    );
END //

DELIMITER ;
select * from policy;
INSERT INTO policy (policy_id, vehicle_id, start_date, end_date,Status)
VALUES (301, 501, '2025-04-01', '2026-03-31', 'Cancelled');
SELECT * FROM vehicle WHERE vehicle_id = 501;

DELIMITER $$

CREATE TRIGGER trg_auto_fail_old_vehicle
BEFORE INSERT ON inspection
FOR EACH ROW
BEGIN
    DECLARE vehicle_year YEAR;

    -- Get year of manufacture of the vehicle being inspected
    SELECT year_of_manufacture INTO vehicle_year
    FROM vehicle
    WHERE vehicle_id = NEW.vehicle_id;

    -- Check if the vehicle is older than 10 years at the time of inspection
    IF YEAR(NEW.inspection_date) - vehicle_year > 10 THEN
        SET NEW.status = 'Failed';
    END IF;
END$$

DELIMITER ;
-- Insert inspection for an old vehicle (e.g., manufactured in 2010)
INSERT INTO inspection (vehicle_id, inspection_date, inspected_by, inspection_notes)
VALUES (1, '2025-04-09', 'Inspector X', 'Test old car');
-- If vehicle_id 1 was manufactured in 2010 or earlier, it should get status 'Failed'

SELECT * FROM inspection
WHERE vehicle_id = 1
ORDER BY inspection_id DESC
LIMIT 1;
















































