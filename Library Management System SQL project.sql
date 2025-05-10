create database lms;
use lms;
-- 1. Author Table
CREATE TABLE Author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- 2. Category Table
CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- 3. Publisher Table
CREATE TABLE Publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100)
);

-- 4. Book Table
CREATE TABLE Book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    category_id INT,
    publisher_id INT,
    isbn VARCHAR(20) UNIQUE,
    publish_year YEAR,
    quantity INT DEFAULT 1 CHECK (quantity >= 0),
    FOREIGN KEY (author_id) REFERENCES Author(author_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id)
);

-- 5. Member Table
CREATE TABLE Member (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    join_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    status ENUM('Active', 'Inactive') DEFAULT 'Active'
);

-- 6. Staff Table
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(50),
   hire_date DATETIME DEFAULT CURRENT_TIMESTAMP

);

-- 7. Issue_Transaction Table
CREATE TABLE Issue_Transaction (
    issue_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    staff_id INT,
    issue_date DATE NOT NULL DEFAULT (CURRENT_DATE)
,
    due_date DATE,
    return_date DATE,
    fine DECIMAL(8,2) DEFAULT 0.00,
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

-- 8. Login Table (for system users - staff only)
CREATE TABLE Login (
    login_id INT AUTO_INCREMENT PRIMARY KEY,
    staff_id INT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    last_login DATETIME,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);
INSERT INTO Author (first_name, last_name) VALUES
('George', 'Orwell'), ('Jane', 'Austen'), ('Mark', 'Twain'), ('J.K.', 'Rowling'),
('Stephen', 'King'), ('Agatha', 'Christie'), ('Ernest', 'Hemingway'), ('Leo', 'Tolstoy'),
('F. Scott', 'Fitzgerald'), ('Charles', 'Dickens'), ('Dan', 'Brown'), ('Harper', 'Lee'),
('Oscar', 'Wilde'), ('John', 'Steinbeck'), ('Emily', 'Bronte'), ('Victor', 'Hugo'),
('Arthur', 'Conan Doyle'), ('Bram', 'Stoker'), ('J.R.R.', 'Tolkien'), ('Paulo', 'Coelho'),
('Khaled', 'Hosseini'), ('Roald', 'Dahl'), ('Louisa', 'May Alcott'), ('J.D.', 'Salinger'),
('George R.R.', 'Martin');
INSERT INTO Category (category_name) VALUES
('Fiction'), ('Non-Fiction'), ('Mystery'), ('Fantasy'), ('Science Fiction'),
('Biography'), ('Romance'), ('Thriller'), ('Historical'), ('Horror'),
('Poetry'), ('Adventure'), ('Drama'), ('Children'), ('Young Adult'),
('Philosophy'), ('Self Help'), ('Religion'), ('Comics'), ('Science'),
('Art'), ('Business'), ('Politics'), ('Travel'), ('Education');
INSERT INTO Publisher (publisher_name, contact_email) VALUES
('Penguin Books', 'info@penguin.com'), ('HarperCollins', 'contact@harpercollins.com'),
('Random House', 'support@randomhouse.com'), ('Simon & Schuster', 'info@simon.com'),
('Bloomsbury', 'info@bloomsbury.com'), ('Hachette Book Group', 'service@hachette.com'),
('Macmillan Publishers', 'info@macmillan.com'), ('Scholastic', 'contact@scholastic.com'),
('Oxford University Press', 'support@oup.com'), ('Cambridge University Press', 'info@cambridge.org'),
('Vintage Books', 'info@vintage.com'), ('Little, Brown and Company', 'contact@littlebrown.com'),
('Cengage', 'support@cengage.com'), ('Pearson', 'help@pearson.com'),
('Wiley', 'support@wiley.com'), ('Springer', 'service@springer.com'),
('McGraw-Hill', 'info@mcgrawhill.com'), ('SAGE Publications', 'contact@sagepub.com'),
('Taylor & Francis', 'info@tandf.com'), ('Elsevier', 'support@elsevier.com'),
('Pan Macmillan', 'contact@panmacmillan.com'), ('Hay House', 'info@hayhouse.com'),
('Zed Books', 'support@zedbooks.com'), ('DK Publishing', 'info@dk.com'),
('Chronicle Books', 'contact@chroniclebooks.com');
ALTER TABLE Book MODIFY publish_year SMALLINT;
INSERT INTO Book (title, author_id, category_id, publisher_id, isbn, publish_year, quantity) VALUES
('1984', 1, 1, 1, '9780451524935', 1949, 5),
('Pride and Prejudice', 2, 7, 2, '9780141439518', 1813, 4),
('Adventures of Huckleberry Finn', 3, 1, 3, '9780142437179', 1884, 3),
('Harry Potter and the Sorcerer''s Stone', 4, 4, 4, '9780439554930', 1997, 6),
('The Shining', 5, 10, 5, '9780385121675', 1977, 2),
('Murder on the Orient Express', 6, 3, 6, '9780062693662', 1934, 5),
('The Old Man and the Sea', 7, 1, 7, '9780684830490', 1952, 4),
('War and Peace', 8, 9, 8, '9780199232765', 1869, 3),
('The Great Gatsby', 9, 1, 9, '9780743273565', 1925, 6),
('A Tale of Two Cities', 10, 9, 10, '9780486406510', 1859, 2),
('The Da Vinci Code', 11, 8, 11, '9780307474278', 2003, 7),
('To Kill a Mockingbird', 12, 1, 12, '9780061120084', 1960, 5),
('The Picture of Dorian Gray', 13, 1, 13, '9780141439570', 1890, 4),
('Of Mice and Men', 14, 1, 14, '9780140177398', 1937, 3),
('Wuthering Heights', 15, 1, 15, '9780141439556', 1847, 5),
('Les Misérables', 16, 9, 16, '9780451419439', 1862, 3),
('Sherlock Holmes: Complete', 17, 3, 17, '9780553212419', 1892, 6),
('Dracula', 18, 10, 18, '9780486411095', 1897, 2),
('The Hobbit', 19, 4, 19, '9780547928227', 1937, 5),
('The Alchemist', 20, 17, 20, '9780062315007', 1988, 4),
('The Kite Runner', 21, 1, 21, '9781594631931', 2003, 5),
('Charlie and the Chocolate Factory', 22, 14, 22, '9780142410318', 1964, 6),
('Little Women', 23, 1, 23, '9780147514011', 1868, 3),
('The Catcher in the Rye', 24, 1, 24, '9780316769488', 1951, 4),
('A Game of Thrones', 25, 4, 25, '9780553573404', 1996, 7);
INSERT INTO Member (full_name, email, phone, join_date, status) VALUES
('Alice Johnson', 'alice.johnson@email.com', '9876543210', '2022-01-15', 'Active'),
('Bob Smith', 'bob.smith@email.com', '9123456780', '2021-12-10', 'Active'),
('Carol Lee', 'carol.lee@email.com', '9988776655', '2023-03-22', 'Inactive'),
('David Miller', 'david.miller@email.com', '9090909090', '2022-04-05', 'Active'),
('Emma Brown', 'emma.brown@email.com', '8888888888', '2023-06-11', 'Active'),
('Frank White', 'frank.white@email.com', '7777777777', '2023-07-20', 'Inactive'),
('Grace Green', 'grace.green@email.com', '9898989898', '2021-10-01', 'Active'),
('Henry Black', 'henry.black@email.com', '9669966996', '2022-11-17', 'Active'),
('Isla Adams', 'isla.adams@email.com', '9559559559', '2023-02-28', 'Inactive'),
('Jack Wilson', 'jack.wilson@email.com', '9449449444', '2022-08-08', 'Active'),
('Kara James', 'kara.james@email.com', '9339339333', '2022-09-19', 'Active'),
('Leo Davis', 'leo.davis@email.com', '9229229222', '2023-01-23', 'Inactive'),
('Mia Thomas', 'mia.thomas@email.com', '9119119111', '2022-05-05', 'Active'),
('Nina Scott', 'nina.scott@email.com', '9009009000', '2023-03-03', 'Active'),
('Oscar King', 'oscar.king@email.com', '9897989798', '2021-11-11', 'Inactive'),
('Penny Young', 'penny.young@email.com', '9887888788', '2022-10-10', 'Active'),
('Quinn Evans', 'quinn.evans@email.com', '9779779779', '2023-04-04', 'Active'),
('Rita Moore', 'rita.moore@email.com', '9668666866', '2022-06-16', 'Inactive'),
('Sam Taylor', 'sam.taylor@email.com', '9557555755', '2023-05-15', 'Active'),
('Tina Allen', 'tina.allen@email.com', '9446444644', '2022-07-07', 'Active'),
('Uma Hill', 'uma.hill@email.com', '9335333533', '2021-09-09', 'Active'),
('Victor Wright', 'victor.wright@email.com', '9224222422', '2022-03-13', 'Active'),
('Wendy Hall', 'wendy.hall@email.com', '9113111311', '2023-08-08', 'Inactive'),
('Xander Fox', 'xander.fox@email.com', '9002100210', '2022-02-02', 'Active'),
('Yara Clark', 'yara.clark@email.com', '8998998998', '2021-12-31', 'Active');
INSERT INTO Staff (name, email, role, hire_date) VALUES
('John Mathews', 'john.mathews@library.com', 'Librarian', '2021-01-10'),
('Sarah Peterson', 'sarah.peterson@library.com', 'Assistant Librarian', '2021-03-14'),
('Mike Ross', 'mike.ross@library.com', 'Catalog Manager', '2021-05-20'),
('Rachel Zane', 'rachel.zane@library.com', 'Acquisitions Manager', '2021-07-25'),
('Harvey Specter', 'harvey.specter@library.com', 'Library Director', '2021-09-01'),
('Donna Paulsen', 'donna.paulsen@library.com', 'HR Manager', '2021-11-17'),
('Louis Litt', 'louis.litt@library.com', 'Finance Officer', '2022-01-04'),
('Jessica Pearson', 'jessica.pearson@library.com', 'Executive Director', '2022-03-10'),
('Robert Zane', 'robert.zane@library.com', 'Policy Advisor', '2022-04-12'),
('Alex Williams', 'alex.williams@library.com', 'Security Officer', '2022-05-19'),
('Sheila Sazs', 'sheila.sazs@library.com', 'Circulation Clerk', '2022-06-15'),
('Harold Gunderson', 'harold.g@library.com', 'IT Support', '2022-07-22'),
('Tina Adams', 'tina.adams@library.com', 'Event Coordinator', '2022-08-30'),
('George Pike', 'george.pike@library.com', 'Legal Consultant', '2022-09-28'),
('Laura Holmes', 'laura.holmes@library.com', 'Archivist', '2022-10-25'),
('Tom Smith', 'tom.smith@library.com', 'Receptionist', '2022-11-10'),
('Anna Lee', 'anna.lee@library.com', 'Data Analyst', '2022-12-05'),
('James Bond', 'james.bond@library.com', 'Security Consultant', '2023-01-16'),
('Lara Croft', 'lara.croft@library.com', 'Adventure Archivist', '2023-02-20'),
('Peter Parker', 'peter.parker@library.com', 'Photographer', '2023-03-12'),
('Bruce Wayne', 'bruce.wayne@library.com', 'Donor Liaison', '2023-04-18'),
('Clark Kent', 'clark.kent@library.com', 'News Archivist', '2023-05-24'),
('Diana Prince', 'diana.prince@library.com', 'Program Coordinator', '2023-06-30'),
('Barry Allen', 'barry.allen@library.com', 'Tech Consultant', '2023-07-21'),
('Natasha Romanoff', 'natasha.romanoff@library.com', 'Security Manager', '2023-08-11');
INSERT INTO Issue_Transaction (book_id, member_id, staff_id, issue_date, due_date, return_date, fine) VALUES
(47, 1, 1, '2024-01-01', '2024-01-15', '2024-01-14', 0.00),
(48 ,2, 2, '2024-01-03', '2024-01-17', '2024-01-20', 5.00),
(49, 3, 3, '2024-01-05', '2024-01-19', '2024-01-19', 0.00),
(50, 4, 4, '2024-01-07', '2024-01-21', NULL, 0.00),
(26, 5, 5, '2024-01-10', '2024-01-24', '2024-01-23', 0.00),
(46, 6, 6, '2024-01-12', '2024-01-26', NULL, 0.00),
(27, 7, 7, '2024-01-15', '2024-01-29', '2024-02-02', 10.00),
(28, 8, 8, '2024-01-18', '2024-02-01', '2024-01-31', 0.00),
(29, 9, 9, '2024-01-20', '2024-02-03', NULL, 0.00),
(30, 10, 10, '2024-01-22', '2024-02-05', '2024-02-07', 4.00),
(31, 11, 11, '2024-01-24', '2024-02-07', '2024-02-07', 0.00),
(32, 12, 12, '2024-01-26', '2024-02-09', NULL, 0.00),
(33, 13, 13, '2024-01-28', '2024-02-11', '2024-02-12', 2.00),
(34, 14, 14, '2024-01-30', '2024-02-13', NULL, 0.00),
(35, 15, 15, '2024-02-01', '2024-02-15', '2024-02-14', 0.00),
(36, 16, 16, '2024-02-03', '2024-02-17', '2024-02-16', 0.00),
(37, 17, 17, '2024-02-05', '2024-02-19', NULL, 0.00),
(38, 18, 18, '2024-02-07', '2024-02-21', NULL, 0.00),
(39, 19, 19, '2024-02-09', '2024-02-23', NULL, 0.00),
(40, 20, 20, '2024-02-11', '2024-02-25', NULL, 0.00),
(41, 21, 21, '2024-02-13', '2024-02-27', '2024-03-01', 6.00),
(42, 22, 22, '2024-02-15', '2024-02-29', NULL, 0.00),
(43, 23, 23, '2024-02-17', '2024-03-02', NULL, 0.00),
(44, 24, 24, '2024-02-19', '2024-03-03', NULL, 0.00),
(45, 25, 25, '2024-02-21', '2024-03-05', NULL, 0.00);


SELECT title, publish_year
FROM Book
WHERE publish_year BETWEEN 1949 AND 2003;
SELECT member_id, full_name, join_date, status
FROM Member
WHERE status = 'Active' AND join_date > '2023-01-01';
SELECT title, author_id
FROM Book
WHERE author_id IN (1, 3, 5);
SELECT title, author_id
FROM Book
WHERE title LIKE '19%';
SELECT title, book_id
FROM Book
WHERE book_id NOT IN (SELECT book_id FROM Issue_Transaction WHERE return_date IS NOT NULL);
SELECT title, publish_year, quantity
FROM Book
WHERE publish_year < 2000 OR quantity < 3;
SELECT member_id, full_name, join_date
FROM Member
WHERE status = 'Active' AND join_date > '2023-01-01';
SELECT COUNT(*) AS members_joined_2024
FROM Member
WHERE YEAR(join_date) = 2024;
SELECT AVG(fine) AS average_fine
FROM Issue_Transaction;
SELECT SUM(quantity) AS total_books_in_stock
FROM Book;
SELECT MAX(fine) AS highest_fine
FROM Issue_Transaction;
SELECT MIN(join_date) AS earliest_member_join
FROM Member;
SELECT DISTINCT title
FROM Book;
SELECT category_id, COUNT(*) AS total_books
FROM Book
GROUP BY category_id;
SELECT 
    it.issue_id,
    b.title,
    m.full_name,
    it.issue_date
FROM Issue_Transaction it
INNER JOIN Book b ON it.book_id = b.book_id
INNER JOIN Member m ON it.member_id = m.member_id;
SELECT 
    b.book_id,
    b.title,
    it.issue_id,
    it.issue_date
FROM Book b
LEFT JOIN Issue_Transaction it ON b.book_id = it.book_id

UNION

SELECT 
    b.book_id,
    b.title,
    it.issue_id,
    it.issue_date
FROM Issue_Transaction it
RIGHT JOIN Book b ON b.book_id = it.book_id;
SELECT 
    s.name AS staff_name,
    b.title AS book_title
FROM Staff s
CROSS JOIN Book b;
SELECT 
    m1.full_name AS member1,
    m2.full_name AS member2,
    m1.join_date
FROM Member m1
JOIN Member m2 ON m1.join_date = m2.join_date
WHERE m1.member_id <> m2.member_id;
-- SINGLE ROW SUBQUERY:
SELECT member_id, fine
FROM Issue_Transaction
WHERE fine = (
    SELECT MAX(fine)
    FROM Issue_Transaction
);
SELECT *
FROM Member
WHERE YEAR(join_date) = '2023-03-22';

-- MULTI ROW SUBQUERY
SELECT title
FROM Book
WHERE book_id IN (
    SELECT book_id
    FROM Issue_Transaction
    WHERE member_id IN (
        SELECT member_id
        FROM Member
        WHERE YEAR(join_date) = '2023-03-22'
    )
);
-- INLINE VIEW 
SELECT member_id, total_fine
FROM (
    SELECT member_id, SUM(fine) AS total_fine
    FROM Issue_Transaction
    GROUP BY member_id
) AS fine_summary
WHERE total_fine > 1.00;

-- SCALAR SUBQUERY
SELECT 
    m.full_name,
    (SELECT COUNT(*) 
     FROM Issue_Transaction it 
     WHERE it.member_id = m.member_id) AS books_issued
FROM Member m;
-- HIERARCHICAL QUERY
ALTER TABLE Staff ADD COLUMN manager_id INT;

-- Self Join: List staff and their managers
SELECT 
    e.name AS employee_name,
    m.name AS manager_name
FROM Staff e
LEFT JOIN Staff m ON e.manager_id = m.staff_id;

DELIMITER $$

CREATE PROCEDURE AddNewBooks(
    IN book_title VARCHAR(255),
    IN author_id INT,
    IN category_id INT,
    IN publisher_id INT,
    IN isbn VARCHAR(20),
    IN publish_year SMALLINT,
    IN quantity INT
)
BEGIN
    -- Declare the variables for error handling
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Rollback in case of error
        ROLLBACK;
        SELECT 'Error occurred while inserting the book.' AS ErrorMessage;
    END;
    
    DECLARE EXIT HANDLER FOR SQLWARNING
    BEGIN
        -- Rollback in case of warning
        ROLLBACK;
        SELECT 'Warning occurred while inserting the book.' AS WarningMessage;
    END;

    -- Start a transaction
    START TRANSACTION;

    -- Insert the new book into the Book table
    INSERT INTO Book (title, author_id, category_id, publisher_id, isbn, publish_year, quantity)
    VALUES (book_title, author_id, category_id, publisher_id, isbn, publish_year, quantity);

    -- Commit the transaction if no errors
    COMMIT;

    -- Success message
    SELECT 'Book added successfully!' AS SuccessMessage;
END$$

DELIMITER ;
CALL AddNewBooks('The Great Gatsby', 1, 2, 3, '9780743273565', 1925, 10);
DELIMITER $$

CREATE FUNCTION GetBookCountByCategory(category_id INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE book_count INT DEFAULT 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- In case of SQL error, set the count to -1
        SET book_count = -1;
    END;

    -- Query to count the number of books in a category
    SELECT COUNT(*) INTO book_count
    FROM Book
    WHERE category_id = category_id;

    -- Return the book count
    RETURN book_count;
END$$

DELIMITER ;
SELECT GetBookCountByCategory(1);
DELIMITER $$
ALTER TABLE Book
ADD COLUMN book_status ENUM('available', 'checked out') DEFAULT 'available';


CREATE TRIGGER before_book_delete 
BEFORE DELETE ON Book 
FOR EACH ROW 
BEGIN
    IF OLD.book_status = 'checked out' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete checked out book';
    END IF;
END;

DELIMITER $$
CREATE TRIGGER after_issue_book1
AFTER INSERT ON Issue_Transaction
FOR EACH ROW
BEGIN
    -- Insert a log into the transaction_audit table when a book is issued
    INSERT INTO transaction_audit (issue_id, action, staff_id, book_id, member_id, fine)
    VALUES (NEW.issue_id, 'Issued', NEW.staff_id, NEW.book_id, NEW.member_id, NEW.fine);
END $$

DELIMITER ;
INSERT INTO Book (book_id, title, author_id, category_id, publisher_id, quantity)
VALUES (1, 'Sample Book', 1, 1, 1, 5);

-- To check the Book table (to verify quantity has decreased)
SELECT * FROM Book WHERE book_id = 1;
SELECT * FROM Publisher;
SELECT title FROM Book 
JOIN Publisher ON Book.publisher_id = Publisher.publisher_id
WHERE publisher_name = 'Penguin Books';
SELECT full_name FROM Member 
WHERE YEAR(join_date) = 2023;
select* from member;
SELECT title FROM Book 
JOIN category ON Book.category_id = category.category_id
WHERE category_name = 'Mystery';
select * from category;



-- 5.	Display all staff members working as "Librarian".
SELECT name FROM Staff 
WHERE role = 'Librarian';


-- Find books with publication years between 2015 and 2022.
SELECT title FROM Book 
WHERE publish_year BETWEEN 1967 AND 2022;
-- 7.	Retrieve members whose city is either 'Chennai', 'Bangalore', or 'Hyderabad'.
SELECT * FROM Member; 
WHERE city IN ('Chennai', 'Bangalore', 'Hyderabad');
-- 8.	List books whose titles start with 'The'.
SELECT title FROM Book 
WHERE title LIKE 'The%';
-- 9.	Show all members who have not provided an email address.
SELECT full_name FROM Member 
WHERE email IS NULL;
SELECT title, price FROM Book; 
WHERE price BETWEEN 200 AND 500;

-- 11.	Count the total number of books in the library.
SELECT COUNT(*) AS total_books FROM Book;
-- 12.	Find the average fine collected for all returned books. Assuming there is a fine_amount column in Issue_Transaction

SELECT AVG(fine) AS avg_fine FROM Issue_Transaction 
WHERE return_date IS NOT NULL;
-- 13.	Get the maximum and minimum book prices.
ALTER TABLE Book ADD COLUMN price DECIMAL(10,2);
UPDATE Book SET price = 299.00 WHERE book_id = 1;
UPDATE Book SET price = 150.50 WHERE book_id = 2;
UPDATE Book SET price = 499.99 WHERE book_id = 3;
UPDATE Book SET price = 250.00 WHERE book_id = 4;
UPDATE Book SET price = 349.75 WHERE book_id = 5;
UPDATE Book SET price = 199.99 WHERE book_id = 6;
UPDATE Book SET price = 120.00 WHERE book_id = 7;
UPDATE Book SET price = 599.00 WHERE book_id = 8;
UPDATE Book SET price = 180.75 WHERE book_id = 9;
UPDATE Book SET price = 420.00 WHERE book_id = 10;


SELECT MAX(price) AS max_price, MIN(price) AS min_price FROM Book;
-- 14.	Count how many books are available in each category.
SELECT Category.category_name, COUNT(Book.book_id) AS total_books 
FROM Book 
JOIN Category ON Book.category_id = Category.category_id 
GROUP BY Category.category_name;
-- 15.	Find the total number of members registered per year.
SELECT YEAR(join_date) AS year, COUNT(member_id) AS total_members 
FROM Member 
GROUP BY YEAR(join_date);

-- 🔹 JOIN Operations
-- 16.	List all books along with their authors and publishers.
select*from book;
SELECT title, author_name, publisher_name 
FROM Book 
JOIN Author ON Book.author_id = Author.author_id 
JOIN Publisher ON Book.publisher_id = Publisher.publisher_id;
-- 17.	Show the names of members and the books they have currently issued.
SELECT Member.member_name, Book.title 
FROM Issue_Transaction 
JOIN Member ON Issue_Transaction.member_id = Member.member_id 
JOIN Book ON Issue_Transaction.book_id = Book.book_id 
WHERE return_date IS NULL;
-- 18.	Display all transactions including member name, book title, and issue date.
SELECT Member.member_name, Book.title, issue_date 
FROM Issue_Transaction 
JOIN Member ON Issue_Transaction.member_id = Member.member_id 
JOIN Book ON Issue_Transaction.book_id = Book.book_id;
-- 19.	Get all books issued by a specific staff member (e.g., staff_id = 'S1002').
SELECT Book.title, Member.member_name, issue_date 
FROM Issue_Transaction 
JOIN Book ON Issue_Transaction.book_id = Book.book_id 
JOIN Member ON Issue_Transaction.member_id = Member.member_id 
WHERE staff_id = 'S1002';
-- 20.	Find all books that have never been issued.
SELECT title FROM Book 
WHERE book_id NOT IN (
    SELECT book_id FROM Issue_Transaction
);

-- 21.	Find members who have issued the most number of books.
SELECT member_name 
FROM Member 
WHERE member_id IN (
    SELECT member_id FROM Issue_Transaction 
    GROUP BY member_id 
    HAVING COUNT(issue_id) = (
        SELECT MAX(cnt) FROM (
            SELECT COUNT(issue_id) AS cnt 
            FROM Issue_Transaction 
            GROUP BY member_id
        ) AS counts
    )
);
-- 22.	Get the book(s) with the highest number of issues.
SELECT title FROM Book 
WHERE book_id IN (
    SELECT book_id FROM Issue_Transaction 
    GROUP BY book_id 
    HAVING COUNT(*) = (
        SELECT MAX(cnt) FROM (
            SELECT COUNT(*) AS cnt 
            FROM Issue_Transaction 
            GROUP BY book_id
        ) AS issue_counts
    )
);
-- 23.	List all members who have returned books late.
SELECT DISTINCT Member.member_name 
FROM Issue_Transaction 
JOIN Member ON Issue_Transaction.member_id = Member.member_id 
WHERE return_date > due_date;
-- 24.	Find the names of authors who have written more than 3 books.
SELECT Author.author_name 
FROM Book 
JOIN Author ON Book.author_id = Author.author_id 
GROUP BY Author.author_id, Author.author_name 
HAVING COUNT(Book.book_id) > 3;
-- 25.	Display books that belong to categories with more than 5 books.
SELECT title 
FROM Book 
WHERE category_id IN (
    SELECT category_id FROM Book 
    GROUP BY category_id 
    HAVING COUNT(book_id) > 5
);








