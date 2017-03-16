------------
-- create-bks.sql
--
-- create the tables for a simple bookstore database
--
-- originally from: Ann Burroughs
-- modified by: Sharon Tuttle
-- last modified: 2016-01-22
------------

----------
-- publisher table contains information about
--     publishers of titles potentially carried by this bookstore
--
-- note: order_min is this publisher's minimum order total to
--       receive a discount, given in order_min_disc 
----------

drop table publisher cascade constraints;

create table publisher 
(pub_id         number(3)    not null, 
 pub_name       varchar2(30) not null, 
 pub_city       varchar2(15) not null, 
 pub_state      char(2)      not null, 
 order_min      number(7,2)  not null, 
 over_min_disc  number(3,2)  not null check(over_min_disc between .0 and .99), 
 constraint publisher_pk primary key (pub_id)
);

----------
-- title table contains information about the different
--     titles carried by this bookstore (one title row represents
--     all of the copies of that title)
--
-- note: author is the last name of what is considered to be
--       the primary/first author of this work
-- note: order_point is the number of copies at which an order
--       is considered to be needed for restocking this title
-- note: auto_order_qty is quantity to normally/automatically
--       order when the quantity on hand reaches the order
--       point 
-- note: on_order is 'T', true, if title is currently on order,
--       and it is 'F', false, if it is not
----------

drop table title cascade constraints;

create table title 
(isbn              varchar2(10) not null, 
 pub_id            number(3)    not null, 
 title_name        varchar2(35) not null, 
 author            varchar2(30) not null,
 title_cost        number(7,2)  not null, 
 title_price       number(7,2)  not null, 
 qty_on_hand       number(3)    not null, 
 order_point       number(3)    not null, 
 auto_order_qty    number(3)    not null, 
 on_order          char(1)      not null check(on_order in ('T', 'F')), 
 constraint title_pk primary key (isbn), 
 constraint title_fk_pub_id foreign key (pub_id) references publisher
);

----------
-- a row is added to order_needed when an order is needed
--     for a title (typically because its qty_on_hand has gone
--     below its order_point, meaning it is time to order more);
--     the date_placed column should be null until an order is
--     actually placed
----------

drop table order_needed cascade constraints;

create table order_needed 
(ord_needed_id number       not null, 
 isbn          varchar2(10) not null, 
 order_qty     number(3)    not null, 
 date_created  date         not null, 
 date_placed   date, 
 constraint order_needed_pk primary key (ord_needed_id),
 constraint order_needed_fk_isbn foreign key (isbn) references title
);

----------
-- order_summary represents an order of titles from a
--     publisher; the details of each title being
--     ordered are given in a related row in order_line_item
----------

drop table order_summary cascade constraints;

create table order_summary
(order_num      number(6) not null, 
 pub_id         number(3) not null, 
 date_placed    date      not null, 
 date_complete  date,
 constraint order_pk primary key (order_num), 
 constraint order_fk_pub_id foreign key (pub_id) references publisher
);

----------
-- order_line_item has the order details for one
--     of the titles in an order
----------

drop table order_line_item cascade constraints;

create table order_line_item
(order_num      number(6)    not null, 
 ord_line_num   number(2)    not null, 
 isbn           varchar2(10) not null, 
 order_qty      number(3)    not null, 
 qty_rcvd_todt  number(3), 
 constraint order_line_item_pk primary key (order_num, ord_line_num),
 constraint order_line_item_fk_order_num foreign key (order_num) 
     references order_summary,
 constraint order_line_item_fk_isbn foreign key (isbn) references title
);

----------
-- order_receipt represents a shipment received of
--    one of the titles in an order -- note that
--    it may only be partial, with more copies of
--    that title still to be received later
----------

drop table order_receipt cascade constraints;

create table order_receipt 
(ord_receipt_num  number(7) not null, 
 order_num        number(6) not null, 
 ord_line_num     number(5) not null, 
 qty_rcvd         number(3) not null,  
 date_rcvd        date      not null, 
 date_posted      date,
 constraint order_receipt_pk primary key (ord_receipt_num),
 constraint order_receipt_fk_order_detail 
     foreign key (order_num, ord_line_num) references order_line_item
);

----------
-- a return represents when some quantity of a particular
--     title in an order is returned to the publisher
----------

drop table return cascade constraints;

create table return
(return_num     number(6)       not null,
 pub_id         number(3)       not null,
 order_num      number(6)       not null,
 isbn           varchar2(10)    not null,
 return_qty     number(3)       not null,
 date_returned  date            not null,
 constraint return_pk primary key (return_num),
 constraint return_fk_pub_id foreign key (pub_id) references publisher,
 constraint return_fk_order_num foreign key (order_num) 
     references order_summary,
 constraint return_fk_isbn foreign key(isbn) references title
);

commit;