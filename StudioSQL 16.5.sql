CREATE TABLE book (
   book_id INT AUTO_INCREMENT PRIMARY KEY,
   author_id INT,
   title VARCHAR(255),
   isbn INT,
   available BOOL,
   genre_id INT
);

SELECT * FROM BOOK;

CREATE TABLE author (
   author_id INT AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(255),
   last_name VARCHAR(255),
   birthday DATE,
   deathday DATE
);

SELECT * FROM author;

CREATE TABLE patron (
   patron_id INT AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(255),
   last_name VARCHAR(255),
   loan_id INT
);

SELECT * FROM patron;

CREATE TABLE reference_books (
   reference_id INT AUTO_INCREMENT PRIMARY KEY,
   edition INT,
   book_id INT,
   FOREIGN KEY (book_id)
      REFERENCES book(book_id)
      ON UPDATE SET NULL
      ON DELETE SET NULL
);

INSERT INTO reference_books(edition, book_id)
VALUE (5,32);

SELECT * FROM reference_books;


CREATE TABLE genre (
   genre_id INT PRIMARY KEY,
   genres VARCHAR(100)
);

SELECT * FROM genre;

CREATE TABLE loan (
   loan_id INT AUTO_INCREMENT PRIMARY KEY,
   patron_id INT,
   date_out DATE,
   date_in DATE,
   book_id INT,
   FOREIGN KEY (book_id)
      REFERENCES book(book_id)
      ON UPDATE SET NULL
      ON DELETE SET NULL
);

########## WARM UP EXERCISE ###################

SELECT * FROM genre
where genres LIKE "mystery";


SELECT title as Book_Title ,isbn as ISBN
FROM BOOK
where genre_id =(SELECT genre_id FROM genre
where genres LIKE "mystery");


SELECT book.title as Book_Title ,author.first_name as Author_First_Name ,author.last_name as Author_Last_Name
From author
INNER JOIN book ON book.author_id=author.author_id
where author.deathday IS NULL;

############### LOAN OUT A BOOK ##################

SELECT * FROM PATRON;
SELECT * FROM LOAN;
SELECT * FROM BOOK;



### checking above query using join##UPDATE book
SET available=FALSE
where title LIKE "Organic Chemistry";

INSERT INTO loan(patron_id,date_out,book_id)
values (1,'2021-11-02',32);

UPDATE patron
SET loan_id=(select loan_id from loan where patron_id=1)
where patron_id=1;
SELECT book.title as Book_Title ,book.available,patron.first_name as Patron_First_Name,loan.date_out as Checked_Out_Date
FROM book
INNER JOIN LOAN ON book.book_id=loan.book_id
INNER JOIN patron ON loan.loan_id=patron.loan_id;




################### Check a Book Back In #####################

SELECT * FROM loan;
SELECT * FROM patron;


UPDATE book
SET available=TRUE
where title LIKE "Organic Chemistry";


UPDATE LOAN
SET date_in=CURDATE()
where loan_id=1;

UPDATE patron
SET loan_id=null
where patron_id=(SELECT loan_id from loan where book_id=13);


###################### Wrap-up Query ##########################

## Checking out some books out to finish wrap up query

UPDATE book
SET available=FALSE
where book_id=1;

INSERT INTO loan(patron_id,date_out,book_id)
values (2,CURDATE(),1);

UPDATE patron
SET loan_id=(select loan_id from loan where patron_id=2)
where patron_id=2;

####
UPDATE book
SET available=FALSE
where book_id=2;

INSERT INTO loan(patron_id,date_out,book_id)
values (3,CURDATE(),2);

UPDATE patron
SET loan_id=(select loan_id from loan where patron_id=3)
where patron_id=3;

select * from patron;
select*from genre;

select patron.first_name as Patron_First_Name,patron.last_name as Patron_Last_Name,book.title as Book_Title,genre.genres
from patron
Inner Join Loan ON patron.loan_id=loan.loan_id
Inner Join book ON loan.book_id=book.book_id
Inner Join genre on book.genre_id=genre.genre_id;

########## Bonus Mission #############


SELECT genre.genre_id,genre.genres, count(*) 
FROM book
INNER JOIN genre ON book.genre_id=genre.genre_id
group by genre.genre_id,genre.genres
Order by genre.genre_id
