------------
-- pop-bks.sql
--
-- populate the bookstore database created by create-bks.sql
--
-- originally from: Ann Burroughs
-- modified by: Sharon Tuttle
-- last modified: 2016-01-22
------------

delete from return;
delete from order_receipt;
delete from order_line_item;
delete from order_summary;
delete from order_needed;
delete from title;
delete from publisher;

-----
-- initial publishers
-----

insert into publisher 
values 
(111, 'Addison-Wesley', 'Reading', 'MA', 250, .05);

insert into publisher
values 
(134, 'Irwin', 'Homewood', 'IL', 150, .03);

insert into publisher
values 
(147, 'Benjamin/Cummings', 'Menlo Park', 'CA', 300, .04);

insert into publisher
values 
(150, 'MacMillan', 'Riverside', 'NJ', 100, .07);

insert into publisher
values 
(189, 'PWS', 'Boston', 'MA', 500, .01);

insert into publisher
values 
(201, 'Prentice Hall', 'Eaglewood Clfs', 'NJ', 100, .04);

insert into publisher
values 
(225, 'Merrill', 'Columbus', 'OH', 200, .01);

insert into publisher
values 
(234, 'McGraw-Hill', 'New York', 'NY', 50, .03);

insert into publisher
values 
(247, 'Science Research Associates', 'Menlo Park', 'CA', 1000, .01);

-----
-- initial titles
-----

insert into title 
values
('0805322272', 147, 'Computers and Data Processing', 'Capron', 
  30.75, 34.95, 15, 12, 50, 'F');

insert into title 
values
('0805343024', 147, 'BASIC: A Structured Approach', 'Kittner', 
 26.50, 29.95, 5, 10, 10, 'T');

insert into title 
values
('0805367802', 147, 'Data Base Management', 'McFadden', 
 32.50, 37.95, 20, 5, 20, 'F');

insert into title 
values
('0805367829', 147, 'Case Book for Data Base Management', 'McFadden', 
 9.95, 14.95, 50, 40, 10, 'F');

insert into title 
values
('0201106868', 111, 'Building Expert Systems', 'Hayes-Roth', 
 32.50, 41.95, 3, 1, 2, 'F');

insert into title 
values
('0201111160', 111, 'Operating Systems: A Systems Approa', 'Davis', 
 29.95, 35.95, 5, 4, 2, 'F');

insert into title 
values
('0201144719', 111, 'An Introduction to Database Systems', 'Date', 
 29.95, 37.95, 10, 15, 12, 'T');

insert into title 
values
('0201117363', 111, 'Problem Solving and Structures', 'Koffman',
 24.95, 37.95, 12, 12, 15, 'T');

insert into title 
values
('087150331X', 189, 'Calculus with Analytic Geometry', 'Campbell', 
 26.50, 46.50, 3, 2, 5, 'F');

insert into title 
values 
('0871507870', 189, 'Intro to Biology: A Human', 'Farish', 
 32.50, 41.95, 35, 30, 150, 'F');

insert into title 
values
('025602796X', 134, 'Financial Accounting', 'Pyle', 
 26.95, 31.50, 10, 30, 15, 'T');

insert into title 
values
('0138229821', 201, 'Software Engineering', 'Lamb',
 30.00, 40.00, 10, 5, 5, 'F');

insert into title 
values
('0131892428', 201, 'Creating Effective Software', 'King',
 45.00, 55.00, 2, 3, 3, 'T');

insert into title 
values
('0024154334', 150, 'Business Data Communications', 'Stamper',
 39.50, 55.00, 3, 10, 15, 'T');

insert into title 
values
('0805346317', 147, 'Computer Science, An Overview', 'Brookshear',
 41.50, 49.50, 2,  5, 10, 'T');

insert into title 
values
('0070366955', 234, 'Simulation Modeling and Analysis', 'Law',
 60.00, 75.00, 10, 20, 100, 'T');

insert into title 
values
('0070790523', 234, 'SPSS', 'Nie', 
 23.95, 28.95, 75, 70, 10, 'F');

insert into title 
values
('0574214100', 247, 'Management Information Sy', 'McLeod', 
 25.50, 28.95, 30, 25, 12, 'F');

insert into title 
values
('0131103628', 201, 'The C Programming Language', 'Kernighan',
 25.00, 39.95, 10, 25, 100, 'T'); 

-----
-- initial order_needed rows
-----

insert into order_needed
values 
(1003, '0805343024', 10, sysdate-88, sysdate-85);

insert into order_needed
values 
(1004, '0201144719', 15, sysdate-88, sysdate-85);

insert into order_needed
values 
(1005, '0201117363', 12, sysdate-88, sysdate-85);

insert into order_needed
values 
(1006, '025602796X', 15, sysdate-88, sysdate-85);

insert into order_needed
values 
(1007, '0131892428', 3, sysdate-88, sysdate-85);

insert into order_needed
values 
(1008, '0024154334', 15, sysdate-88, sysdate-85);

insert into order_needed
values 
(1009, '0805346317', 10, sysdate-88, sysdate-85);

insert into order_needed
values 
(1010, '0070366955', 100, sysdate-68, sysdate-65);

-----
-- initial orders
-- (order_summary rows followed by their related order_line_item
--     rows)
-----

insert into order_summary
values 
(11009, 147, sysdate-85, sysdate-66);

insert into order_line_item
values 
(11009, 1, '0805343024', 10, 14);

insert into order_line_item
values 
(11009, 2, '0805346317', 10, 10);

-- next order:

insert into order_summary
values 
(11010, 111, sysdate-85, sysdate-66);

insert into order_line_item
values 
(11010, 1, '0201144719', 12, 20);

insert into order_line_item
values 
(11010, 2, '0201117363', 15, 20);

-- next order:

insert into order_summary
values 
(11011, 134, sysdate-85, sysdate-66);

insert into order_line_item
values 
(11011, 1, '025602796X', 15, 15);

-- next order:

insert into order_summary
values 
(11012, 201, sysdate-85, sysdate-63);

insert into order_line_item
values 
(11012, 1, '0131892428', 3, 3);

insert into order_line_item
values 
(11012, 2, '0131103628', 100, 100);

-- next order:

insert into order_summary
values 
(11013, 150, sysdate-85, sysdate-63);

insert into order_line_item
values 
(11013, 1, '0024154334', 15, 16);

-- next order:

insert into order_summary
values 
(11014, 234, sysdate-25, sysdate-1);

insert into order_line_item
values 
(11014, 1, '0070366955', 100, 100);

-----
-- initial order_receipt rows
-----

insert into order_receipt 
values
(20010, 11009, 2, 4, sysdate-5, sysdate-3);

insert into order_receipt 
values
(20011, 11014, 1, 25, sysdate-20, sysdate-19);

insert into order_receipt(ord_receipt_num, order_num, ord_line_num,
    qty_rcvd, date_rcvd)
values
(20012, 11013, 1, 13,  sysdate-5);

insert into order_receipt(ord_receipt_num, order_num, ord_line_num,
    qty_rcvd, date_rcvd)
values
(20013, 11010, 1, 5,  sysdate-5);

insert into order_receipt
values
(20014, 11014, 1, 25,  sysdate-4, sysdate-2);

insert into order_receipt
values
(20015, 11014, 1, 50,  sysdate-3, sysdate-1);

insert into order_receipt(ord_receipt_num, order_num, ord_line_num,
    qty_rcvd, date_rcvd) 
values
(20016, 11010, 1, 10,  sysdate-5);

insert into order_receipt(ord_receipt_num, order_num, ord_line_num,
    qty_rcvd, date_rcvd) 
values
(20017, 11009, 1, 10,  sysdate-5);

insert into order_receipt(ord_receipt_num, order_num, ord_line_num,
    qty_rcvd, date_rcvd)
values
(20018, 11010, 1, 5,  sysdate-5);

insert into order_receipt(ord_receipt_num, order_num, ord_line_num,
    qty_rcvd, date_rcvd) 
values
(20019, 11012, 1, 3,  sysdate-5);

-----
-- initial return row
-----

insert into return 
values
(311, 111, 11012, '0201106868', 10, sysdate-60);

commit;