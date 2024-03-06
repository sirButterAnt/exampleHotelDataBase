-- Set Default Time and Date Formats
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'YYYY-MM-DD HH24:MI:SS.FF';
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

-- DROP TRIGGER 
DROP TRIGGER  hotel_name_update_trigger;
DROP TRIGGER  Dinner_Reservation_FK_dinner_reservation_bill_update_trigger;
DROP TRIGGER  Payment_Bill_FK_payment_id_update_trigger;
DROP TRIGGER  Payment_Bill_FK_bill_id_update_trigger;

-- DROP TABLE 

DROP TABLE  ROOM_STAFF CASCADE CONSTRAINTS;
DROP TABLE  SUPPLY CASCADE CONSTRAINTS;
DROP TABLE  STAFF CASCADE CONSTRAINTS;
DROP TABLE  HOTEL CASCADE CONSTRAINTS;
DROP TABLE  Payment CASCADE CONSTRAINTS;
DROP TABLE  Bill CASCADE CONSTRAINTS;
DROP TABLE  Dinner_Reservation CASCADE CONSTRAINTS;
DROP TABLE  Payment_Bill CASCADE CONSTRAINTS;
DROP TABLE  PRODUCT_ORDER CASCADE CONSTRAINTS;
DROP TABLE  ORDERS CASCADE CONSTRAINTS;
DROP TABLE  PRODUCTS CASCADE CONSTRAINTS;
DROP TABLE  DINNER_TABLE CASCADE CONSTRAINTS;
DROP TABLE BOOKING CASCADE CONSTRAINTS;
DROP TABLE  GUEST_PAYMENT CASCADE CONSTRAINTS;
DROP TABLE  CUSTOMER_PAYMENT CASCADE CONSTRAINTS;
DROP TABLE CUSTOMER_RESERVATION CASCADE CONSTRAINTS;
DROP TABLE GUEST_RESERVATION CASCADE CONSTRAINTS;
DROP TABLE GUEST CASCADE CONSTRAINTS;
DROP TABLE  RESTAURANT_CUSTOMER CASCADE CONSTRAINTS;
DROP TABLE ROOM;
DROP TABLE ROOM_TYPE;
---------------------------------------------------------------------------------------------------------------------

CREATE TABLE HOTEL (
    HOTEL_NAME VARCHAR2(50) NOT NULL,
    DISTRICT_NAME VARCHAR2(50)  NOT NULL,
    CITY_NAME VARCHAR2(50)  NOT NULL,
    ADDRESS VARCHAR2(150),
    RATING INT,
    CONSTRAINT PK_HOTEL_HOTEL_NAME PRIMARY KEY(HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
);

INSERT INTO HOTEL (HOTEL_NAME, DISTRICT_NAME, CITY_NAME, ADDRESS, RATING)
VALUES ('IYTE Hotel', 'Urla', 'İzmir', 'Gülbahçe St', 4);

CREATE TABLE STAFF (
    TC_PASSPORT_NO NUMBER NOT NULL,
    SALARY NUMBER(10, 2),
    NAME VARCHAR2(50),
    SURNAME VARCHAR2(50),
    NATIONALITY VARCHAR2(50),
    GENDER VARCHAR2(1),
    DEPARTMENT_NAME VARCHAR2(50),
    POSITION VARCHAR2(50),
    TEL_NO NUMBER(15),
    ADDRESS VARCHAR2(100),
    E_MAIL VARCHAR2(50),
    HOTEL_NAME VARCHAR2(50),
    DISTRICT_NAME VARCHAR2(50),
    CITY_NAME VARCHAR2(50),
    CONSTRAINT PK_STAFF_TC PRIMARY KEY(TC_PASSPORT_NO),
    CONSTRAINT FK_STAFF_HOTEL FOREIGN KEY (HOTEL_NAME, DISTRICT_NAME, CITY_NAME) REFERENCES HOTEL(HOTEL_NAME, DISTRICT_NAME, CITY_NAME) ON DELETE CASCADE
);

CREATE OR REPLACE TRIGGER hotel_name_update_trigger
BEFORE UPDATE OF HOTEL_NAME ON HOTEL
FOR EACH ROW
BEGIN
    UPDATE STAFF
    SET HOTEL_NAME =:NEW.HOTEL_NAME
    WHERE HOTEL_NAME =:OLD.HOTEL_NAME;
END;
/

-- 1
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (12345678901, 5000, 'John', 'Clay', 'USA', 'M', 'Front Desk', 'Receptionist', 123456789, '123 Main St', 'john.doe@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 2
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (23456789012, 5500, 'Jane', 'Smith', 'UK', 'F', 'Housekeeping', 'Housekeeper', 234567890, '456 Oak St', 'jane.smith@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 3
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (34567890123, 6000, 'Ahmet', 'Yılmaz', 'Turkey', 'M', 'Kitchen', 'Chef', 345678901, '35000 Gülbahçe St', 'ahmet.yilmaz@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 4
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (45678901234, 5200, 'Anna', 'Johnson', 'Canada', 'F', 'Housekeeping', 'Room Attendant', 456789012, '101 Elm St', 'anna.johnson@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 5
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (56789012345, 5800, 'Mehmet', 'Kaya', 'Turkey', 'M', 'Front Desk', 'Concierge', 567890123, '35001 Gülbahçe St', 'mehmet.kaya@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 6
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (67890123456, 5400, 'Emily', 'White', 'USA', 'F', 'Kitchen', 'Cook', 678901234, '303 Birch St', 'emily.white@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 7
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (78901234567, 6200, 'Mustafa', 'Öztürk', 'Turkey', 'M', 'Maintenance', 'Maintenance Technician', 789012345, '404 Cedar St', 'mustafa.ozturk@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 8
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (89012345678, 5100, 'Sophia', 'Brown', 'Canada', 'F', 'Front Desk', 'Front Desk Clerk', 890123456, '505 Oak St', 'sophia.brown@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 9
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (90123456789, 5700, 'Eren', 'Yıldırım', 'Turkey', 'M', 'Housekeeping', 'Housekeeping Supervisor', 901234567, '35002 Gülbahçe St', 'eren.yildirim@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 10
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (11223344556, 5900, 'Lily', 'Chen', 'China', 'F', 'Front Desk', 'Front Desk Manager', 112233445, '707 Elm St', 'lily.chen@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 11
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (22334455667, 6300, 'David', 'Miller', 'Australia', 'M', 'Restaurant', 'Waiter', 223344556, '808 Maple St', 'david.miller@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 12
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (33445566778, 5500, 'Emma', 'Davis', 'USA', 'F', 'Housekeeping', 'Janitor', 334455667, '909 Pine St', 'emma.davis@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 13
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (44556677889, 5800, 'Ali', 'Çelik', 'Turkey', 'M', 'Front Desk', 'Bellboy', 445566778, '35003 Gülbahçe St', 'ali.celik@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 14
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (55667788990, 6000, 'Olivia', 'Lee', 'Canada', 'F', 'Kitchen', 'Sous Chef', 556677889, '606 Cedar St', 'olivia.lee@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 15
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (66778899001, 5200, 'Jack', 'Taylor', 'UK', 'M', 'Housekeeping', 'Laundry Attendant', 667788990, '707 Walnut St', 'jack.taylor@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 16
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (77889900112, 5900, 'Ava', 'Garcia', 'Spain', 'F', 'Front Desk', 'Guest Relations Officer', 778899001, '808 Birch St', 'ava.garcia@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 17
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (88990011223, 5400, 'Noah', 'Hernandez', 'Mexico', 'M', 'Maintenance', 'Electrician', 889900112, '909 Oak St', 'noah.hernandez@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 18
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (99001122334, 6100, 'Ella', 'Martin', 'France', 'F', 'Restaurant', 'Chef de Rang', 990011223, '101 Pine St', 'ella.martin@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 19
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (10011223345, 5300, 'William', 'Cooper', 'Australia', 'M', 'Front Desk', 'Reservation Agent', 100112233, '202 Maple St', 'william.cooper@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

-- 20
INSERT INTO STAFF (TC_PASSPORT_NO, SALARY, NAME, SURNAME, NATIONALITY, GENDER, DEPARTMENT_NAME, POSITION, TEL_NO, ADDRESS, E_MAIL, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (12121212121, 5700, 'Sophie', 'Wang', 'China', 'F', 'Kitchen', 'Dishwasher', 121212121, '303 Walnut St', 'sophie.wang@email.com', 'IYTE Hotel', 'Urla', 'İzmir');

CREATE TABLE SUPPLY (
    SUPPLY_ID NUMBER NOT NULL,
    BRAND VARCHAR2(50),
    NAME VARCHAR2(50),
    EXPIRATION_DATE DATE,
    QUANTITY NUMBER,
    HOTEL_NAME VARCHAR2(50),
    DISTRICT_NAME VARCHAR2(50),
    CITY_NAME VARCHAR2(50),
    CONSTRAINT PK_SUPPLY_SUPPLY_ID PRIMARY KEY(SUPPLY_ID),
    CONSTRAINT FK_SUPPLY_HOTEL FOREIGN KEY (HOTEL_NAME, DISTRICT_NAME, CITY_NAME) REFERENCES HOTEL(HOTEL_NAME, DISTRICT_NAME, CITY_NAME) ON DELETE CASCADE
);

-- 1
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (1, 'LinenCraft', 'Luxury Bed Sheets', '2024-12-31 00:00:00', 100, 'IYTE Hotel', 'Urla', 'İzmir');

-- 2
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (2, 'SilverCuisine', 'Fine Dining Cutlery Set', '2024-11-30 00:00:00', 50, 'IYTE Hotel', 'Urla', 'İzmir');

-- 3
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (3, 'EcoFresh', 'Organic Toiletries Kit', '2023-10-15 00:00:00', 75, 'IYTE Hotel', 'Urla', 'İzmir');

-- 4
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (4, 'TechComfort', 'Smart Thermostat', '2024-09-20 00:00:00', 120, 'IYTE Hotel', 'Urla', 'İzmir');

-- 5
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (5, 'BrewMasters', 'Artisanal Coffee Beans', '2024-08-05 00:00:00', 90, 'IYTE Hotel', 'Urla', 'İzmir');

-- 6
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (6, 'FreshHarvest', 'Organic Produce', '2024-07-12 00:00:00', 60, 'IYTE Hotel', 'Urla', 'İzmir');

-- 7
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (7, 'AquaGlow', 'Spa Essentials Kit', '2023-06-25 00:00:00', 80, 'IYTE Hotel', 'Urla', 'İzmir');

-- 8
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (8, 'EliteBeddings', 'Memory Foam Pillows', '2024-05-18 00:00:00', 110, 'IYTE Hotel', 'Urla', 'İzmir');

-- 9
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (9, 'GreenElegance', 'Recyclable Bath Towels', '2024-04-02 00:00:00', 70, 'IYTE Hotel', 'Urla', 'İzmir');

-- 10
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (10, 'CulinaryCraft', 'Professional Chef Knives Set', '2024-03-15 00:00:00', 95, 'IYTE Hotel', 'Urla', 'İzmir');

-- 11
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (11, 'SmartLiving', 'Home Automation System', '2024-02-28 00:00:00', 65, 'IYTE Hotel', 'Urla', 'İzmir');

-- 12
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (12, 'ComfortBliss', 'Plush Blankets', '2024-01-10 00:00:00', 85, 'IYTE Hotel', 'Urla', 'İzmir');

-- 13
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (13, 'AromaFiesta', 'Scented Candles Set', '2024-12-24 00:00:00', 105, 'IYTE Hotel', 'Urla', 'İzmir');

-- 14
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (14, 'NatureVibe', 'Botanical Room Decor', '2024-11-17 00:00:00', 75, 'IYTE Hotel', 'Urla', 'İzmir');

-- 15
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (15, 'FitFusion', 'Fitness Equipment Set', '2023-10-30 00:00:00', 100, 'IYTE Hotel', 'Urla', 'İzmir');

-- 16
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (16, 'GourmetDelight', 'Premium Chocolate Assortment', '2024-09-05 00:00:00', 55, 'IYTE Hotel', 'Urla', 'İzmir');

-- 17
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (17, 'EssentialZen', 'Relaxation Meditation Kit', '2024-08-12 00:00:00', 90, 'IYTE Hotel', 'Urla', 'İzmir');

-- 18
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (18, 'ElegantCrockery', 'Fine China Dinner Set', '2024-07-27 00:00:00', 120, 'IYTE Hotel', 'Urla', 'İzmir');

-- 19
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (19, 'CocaCola', 'Coke', '2024-06-10 00:00:00', 400, 'IYTE Hotel', 'Urla', 'İzmir');

-- 20
INSERT INTO SUPPLY (SUPPLY_ID, BRAND, NAME, EXPIRATION_DATE, QUANTITY, HOTEL_NAME, DISTRICT_NAME, CITY_NAME)
VALUES (20, 'Nestle', 'Water', '2026-05-23 00:00:00', 600, 'IYTE Hotel', 'Urla', 'İzmir');

-- -----------------------------------------------------
-- Table Payment
-- -----------------------------------------------------
CREATE TABLE Payment (
  payment_id NUMBER NOT NULL,
  date_time TIMESTAMP NOT NULL,
  CONSTRAINT PK_payment_id PRIMARY KEY (payment_id)
);

-- Add Sample Data for Payment
INSERT INTO Payment (payment_id, date_time) VALUES (1, '2023-01-15 14:51:00');
INSERT INTO Payment (payment_id, date_time) VALUES (2, '2023-03-18 21:11:00');
INSERT INTO Payment (payment_id, date_time) VALUES (3, '2023-03-18 21:12:00');
INSERT INTO Payment (payment_id, date_time) VALUES (4, '2023-03-18 21:13:00');
INSERT INTO Payment (payment_id, date_time) VALUES (5, '2023-05-27 23:31:00');
INSERT INTO Payment (payment_id, date_time) VALUES (6, '2023-05-27 23:32:00');
INSERT INTO Payment (payment_id, date_time) VALUES (7, '2023-05-27 23:33:00');
INSERT INTO Payment (payment_id, date_time) VALUES (8, '2023-05-27 23:34:00');
INSERT INTO Payment (payment_id, date_time) VALUES (9, '2023-05-28 00:11:00');
INSERT INTO Payment (payment_id, date_time) VALUES (10, '2023-05-29 01:21:00');
INSERT INTO Payment (payment_id, date_time) VALUES (11, '2023-05-30 01:31:00');
INSERT INTO Payment (payment_id, date_time) VALUES (12, '2023-05-31 02:41:00');
INSERT INTO Payment (payment_id, date_time) VALUES (13, '2023-06-01 02:51:00');
INSERT INTO Payment (payment_id, date_time) VALUES (14, '2023-06-02 09:01:00');
INSERT INTO Payment (payment_id, date_time) VALUES (15, '2023-06-03 09:11:00');
INSERT INTO Payment (payment_id, date_time) VALUES (16, '2023-06-04 10:21:00');
INSERT INTO Payment (payment_id, date_time) VALUES (17, '2023-06-05 11:31:00');
INSERT INTO Payment (payment_id, date_time) VALUES (18, '2023-06-06 10:41:00');
INSERT INTO Payment (payment_id, date_time) VALUES (19, '2023-06-07 11:51:00');
INSERT INTO Payment (payment_id, date_time) VALUES (20, '2023-06-08 12:01:00');
INSERT INTO Payment (payment_id, date_time) VALUES (21, '2023-06-09 13:11:00');
INSERT INTO Payment (payment_id, date_time) VALUES (22, '2023-06-10 14:21:00');
INSERT INTO Payment (payment_id, date_time) VALUES (23, '2023-06-11 15:31:00');
INSERT INTO Payment (payment_id, date_time) VALUES (24, '2023-06-12 21:31:00');
INSERT INTO Payment (payment_id, date_time) VALUES (25, '2023-06-13 11:31:00');
INSERT INTO Payment (payment_id, date_time) VALUES (26, '2023-01-15 14:51:00');
INSERT INTO Payment (payment_id, date_time) VALUES (27, '2023-03-18 21:11:00');
INSERT INTO Payment (payment_id, date_time) VALUES (28, '2023-03-18 21:12:00');
INSERT INTO Payment (payment_id, date_time) VALUES (29, '2023-03-18 21:13:00');
INSERT INTO Payment (payment_id, date_time) VALUES (30, '2023-05-27 23:31:00');
INSERT INTO Payment (payment_id, date_time) VALUES (31, '2023-05-27 23:32:00');
INSERT INTO Payment (payment_id, date_time) VALUES (32, '2023-05-27 23:33:00');
INSERT INTO Payment (payment_id, date_time) VALUES (33, '2023-05-27 23:34:00');
INSERT INTO Payment (payment_id, date_time) VALUES (34, '2023-05-28 00:11:00');
INSERT INTO Payment (payment_id, date_time) VALUES (35, '2023-05-29 01:21:00');
INSERT INTO Payment (payment_id, date_time) VALUES (36, '2023-05-30 01:31:00');
INSERT INTO Payment (payment_id, date_time) VALUES (37, '2023-05-31 02:41:00');
INSERT INTO Payment (payment_id, date_time) VALUES (38, '2023-06-01 02:51:00');
INSERT INTO Payment (payment_id, date_time) VALUES (39, '2023-06-02 09:01:00');
INSERT INTO Payment (payment_id, date_time) VALUES (40, '2023-06-03 09:11:00');
INSERT INTO Payment (payment_id, date_time) VALUES (41, '2023-06-04 10:21:00');
INSERT INTO Payment (payment_id, date_time) VALUES (42, '2023-06-05 11:31:00');
INSERT INTO Payment (payment_id, date_time) VALUES (43, '2023-06-06 10:41:00');
INSERT INTO Payment (payment_id, date_time) VALUES (44, '2023-06-07 11:51:00');
INSERT INTO Payment (payment_id, date_time) VALUES (45, '2023-06-08 12:01:00');


-- -----------------------------------------------------
-- Table Bill
-- -----------------------------------------------------
CREATE TABLE Bill (
  bill_id NUMBER NOT NULL,
  price NUMBER NOT NULL,
  date_time TIMESTAMP NOT NULL,
  bill_status NUMBER(1) NOT NULL,
  CONSTRAINT PK_bill_id PRIMARY KEY (bill_id)
);

-- Add Sample Data for Bill
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (1, 998.25, '2023-01-15 14:50:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (2, 1658.75, '2023-03-18 21:10:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (3, 3564.50, '2023-05-27 23:30:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (4, 645, '2023-05-28 00:10:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (5, 541, '2023-05-29 01:20:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (6, 742, '2023-05-30 01:30:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (7, 235, '2023-05-31 02:40:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (8, 746, '2023-06-01 02:50:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (9, 453, '2023-06-02 09:00:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (10, 752, '2023-06-03 09:10:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (11, 1021, '2023-06-04 10:20:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (12, 4569, '2023-06-05 11:30:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (13, 8422, '2023-06-06 10:40:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (14, 3500, '2023-06-07 11:50:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (15, 1256.47, '2023-06-08 12:00:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (16, 4256.47, '2023-06-09 13:10:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (17, 6524.18, '2023-06-10 14:20:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (18, 2705.02, '2023-06-11 15:30:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (19, 2411.01, '2023-06-12 21:30:00', 1);
INSERT INTO Bill (bill_id, price, date_time, bill_status) VALUES (20, 1802.73, '2023-06-13 11:30:00', 1);

-- -----------------------------------------------------
-- Table Dinner_reservation
-- -----------------------------------------------------
CREATE TABLE Dinner_Reservation (
  reservation_id NUMBER NOT NULL,
  total_number_of_people NUMBER NOT NULL,
  date_time TIMESTAMP NOT NULL,
  dinner_reservation_bill NUMBER,
  CONSTRAINT PK_reservation_id PRIMARY KEY (reservation_id),
  CONSTRAINT FK_dinner_reservation_bill
    FOREIGN KEY (dinner_reservation_bill)
    REFERENCES Bill (bill_id)
    ON DELETE CASCADE
);

-- Update Trigger for Dinner_Reservation FK
CREATE OR REPLACE TRIGGER Dinner_Reservation_FK_dinner_reservation_bill_update_trigger
BEFORE UPDATE OF bill_id ON Bill
FOR EACH ROW
BEGIN
  UPDATE Dinner_Reservation
  SET dinner_reservation_bill = :NEW.bill_id
  WHERE dinner_reservation_bill = :OLD.bill_id;
END;
/

-- Add Sample Data for Dinner_Reservation
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (1, 2, '2023-01-15 14:30:00', 1);
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (2, 5, '2023-03-18 20:00:00', 2); 
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (3, 8, '2023-05-27 21:00:00', 3);  
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (4, 2, '2023-05-27 23:00:00', 4);
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (5, 4, '2023-05-29 23:00:00', 5);
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (6, 3, '2023-05-30 23:00:00', 6);
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (7, 2, '2023-05-31 23:00:00', 7);
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (8, 4, '2023-06-01 23:00:00', 8);
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (9, 3, '2023-06-02 9:00:00', 9);
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (10, 2, '2023-06-03 09:00:00', 10);
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (11, 2, '2023-06-04 09:00:00', 11);
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (12, 4, '2023-06-05 09:00:00', 12);
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (13, 2, '2023-06-06 10:20:00', 13);
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (14, 2, '2023-06-07 11:30:00', 14);
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (15, 23, '2023-06-08 11:40:00', 15);
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (16, 2, '2023-06-09 12:50:00', 16);
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (17, 4, '2023-06-10 14:00:00', 17);
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (18, 2, '2023-06-11 15:10:00', 18);
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (19, 4, '2023-06-12 21:10:00', 19);
INSERT INTO Dinner_Reservation (reservation_id, total_number_of_people, date_time, dinner_reservation_bill) VALUES (20, 2, '2023-06-13 11:10:00', 20); 

-- -----------------------------------------------------
-- Table Payment_Bill
-- -----------------------------------------------------
CREATE TABLE Payment_Bill (
  payment_id NUMBER NOT NULL,
  bill_id NUMBER NOT NULL,
  CONSTRAINT PK_payment_bill PRIMARY KEY (payment_id, bill_id),
  CONSTRAINT FK_payment_id
    FOREIGN KEY (payment_id)
    REFERENCES Payment (payment_id)
    ON DELETE CASCADE,
  CONSTRAINT FK_bill_id
    FOREIGN KEY (bill_id)
    REFERENCES Bill (bill_id)
    ON DELETE CASCADE
);

CREATE OR REPLACE TRIGGER Payment_Bill_FK_payment_id_update_trigger
BEFORE UPDATE OF payment_id ON Payment
FOR EACH ROW
BEGIN
  UPDATE Payment_Bill
  SET payment_id = :NEW.payment_id
  WHERE payment_id = :OLD.payment_id;
END;
/

CREATE OR REPLACE TRIGGER Payment_Bill_FK_bill_id_update_trigger
BEFORE UPDATE OF bill_id ON Bill
FOR EACH ROW
BEGIN
  UPDATE Payment_Bill
  SET bill_id = :NEW.bill_id
  WHERE bill_id = :OLD.bill_id;
END;
/

-- Add Sample Data for Payment_Bill
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (1, 1);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (2, 2);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (3, 2);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (4, 2);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (5, 3);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (6, 3);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (7, 3);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (8, 3);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (9, 4);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (10, 5);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (11, 6);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (12, 7);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (13, 8);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (14, 9);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (15, 10);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (16, 11);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (17, 12);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (18, 13);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (19, 14);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (20, 15);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (21, 16);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (22, 17);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (23, 18);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (24, 19);
INSERT INTO Payment_Bill (payment_id, bill_id) VALUES (25, 20);


CREATE TABLE "PRODUCTS" (
    "PRODUCT_ID"  NUMBER(5),
    "PRODUCT_NAME" VARCHAR2(75 CHAR),
    "UNIT_PRICE"  NUMBER(10,2) NOT NULL,
    CONSTRAINT "PRODUCTS_PK" PRIMARY KEY ( "PRODUCT_ID", "PRODUCT_NAME" )
);

--INSERT PRODUCTS

INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (1, 'Spaghetti Bolognese', 12.99);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (2, 'Chicken Alfredo', 15.50);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (3, 'Vegetarian Stir Fry', 10.75);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (4, 'Margherita Pizza', 14.25);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (5, 'Grilled Salmon', 18.99);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (6, 'Caesar Salad', 8.99);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (7, 'Beef Tacos', 9.50);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (8, 'Vegetable Curry', 12.99);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (9, 'Shrimp Scampi', 22.75);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (10, 'Mushroom Risotto', 17.00);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (11, 'Chicken Caesar Wrap', 8.50);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (12, 'Beef Burger', 14.99);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (13, 'Caprese Sandwich', 10.25);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (14, 'Fish and Chips', 16.75);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (15, 'Greek Salad', 9.99);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (16, 'Penne alla Vodka', 13.50);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (17, 'Beef Stir Fry', 15.25);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (18, 'Vegetable Lasagna', 11.99);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (19, 'Chicken Quesadilla', 12.25);
INSERT INTO "PRODUCTS" ("PRODUCT_ID", "PRODUCT_NAME", "UNIT_PRICE") VALUES (20, 'Sushi Platter', 29.99);

CREATE TABLE "DINNER_TABLE" (
    "TABLE_ID"    NUMBER(4) GENERATED BY DEFAULT ON NULL AS IDENTITY,
    "CAPACITY"    NUMBER(2) NOT NULL,
    "AVAILABILITY" NUMBER(1) CHECK (AVAILABILITY IN (0, 1)) NOT NULL,
    CONSTRAINT "DINNER_TABLE_PK" PRIMARY KEY ( "TABLE_ID" )
);

--INSERT DINNER TABLES

INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (4, 1);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (6, 1);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (8, 0);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (5, 1);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (10, 0);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (6, 1);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (4, 1);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (8, 0);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (12, 1);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (6, 0);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (10, 1);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (8, 1);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (4, 0);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (6, 1);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (10, 0);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (8, 1);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (12, 1);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (6, 0);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (8, 1);
INSERT INTO "DINNER_TABLE" ("CAPACITY", "AVAILABILITY") VALUES (4, 1);

CREATE TABLE "ORDERS" (
    "ORDER_NUMBER" NUMBER(5) GENERATED BY DEFAULT AS IDENTITY,
    "ORDER_DATE" TIMESTAMP NOT NULL,
    "QUANTITY" NUMBER(2) NOT NULL,
    "PRICE" NUMBER(10,2) NOT NULL,
    "TABLE_ID" NUMBER(4) NOT NULL,
    FOREIGN KEY("TABLE_ID") REFERENCES "DINNER_TABLE"("TABLE_ID"),
    CONSTRAINT "ORDER_TABLE_PK" PRIMARY KEY ("ORDER_NUMBER","ORDER_DATE") 
);

--INSERT ORDERS


INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 00:00:00', 2, 25.50, 1);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 12:35:54', 3, 30.75, 2);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 23:21:05', 1, 15.99, 3);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 16:34:45', 4, 42.00, 1);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 11:24:55', 2, 20.25, 2);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 16:17:19', 3, 31.50, 3);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 23:59:35', 1, 18.75, 4);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 14:07:34', 4, 48.99, 1);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 13:02:05', 2, 22.75, 2);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 17:06:48', 3, 35.00, 3);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 19:30:22', 1, 16.50, 4);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 17:43:00', 4, 45.25, 1);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 18:52:37', 2, 28.75, 2);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 19:54:59', 3, 38.00, 3);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 06:05:20', 1, 14.99, 4);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 07:32:45', 4, 50.50, 1);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 12:24:20', 2, 244.75, 2);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 09:06:27', 3, 36.99, 3);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 08:00:58', 1, 19.25, 4);

INSERT INTO ORDERS (ORDER_DATE, QUANTITY, PRICE, TABLE_ID) VALUES
  ('2023/10/03 06:42:40', 4, 42.00, 1); 

CREATE TABLE "PRODUCT_ORDER" (
    "ORDER_NUMBER" NUMBER(5),
    "ORDER_DATE" TIMESTAMP,
    "PRODUCT_ID" NUMBER(5),
    "PRODUCT_NAME"varchar2(75 char),
    FOREIGN KEY ("ORDER_NUMBER", "ORDER_DATE") REFERENCES "ORDERS"("ORDER_NUMBER", "ORDER_DATE"),
    FOREIGN KEY ("PRODUCT_ID", "PRODUCT_NAME") REFERENCES "PRODUCTS"("PRODUCT_ID","PRODUCT_NAME"),
    CONSTRAINT "PRODUCT_ORDER_PK" PRIMARY KEY ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID","PRODUCT_NAME") 
);

--INSERT PRODUCT ORDERS

INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (1, '2023/10/03 00:00:00', 1, 'Spaghetti Bolognese');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (1, '2023/10/03 00:00:00', 6, 'Caesar Salad');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (2, '2023/10/03 12:35:54', 2, 'Chicken Alfredo');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (2, '2023/10/03 12:35:54', 4, 'Margherita Pizza');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (3, '2023/10/03 23:21:05', 5, 'Grilled Salmon');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (3, '2023/10/03 23:21:05', 6, 'Caesar Salad');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (4, '2023/10/03 16:34:45', 7, 'Beef Tacos');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (4, '2023/10/03 16:34:45', 8, 'Vegetable Curry');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (5, '2023/10/03 11:24:55', 9, 'Shrimp Scampi');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (5, '2023/10/03 11:24:55', 10, 'Mushroom Risotto');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (6, '2023/10/03 16:17:19', 11, 'Chicken Caesar Wrap');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (6, '2023/10/03 16:17:19', 12, 'Beef Burger');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (7, '2023/10/03 23:59:35', 13, 'Caprese Sandwich');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (7, '2023/10/03 23:59:35', 14, 'Fish and Chips');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (8, '2023/10/03 14:07:34', 15, 'Greek Salad');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (8, '2023/10/03 14:07:34', 16, 'Penne alla Vodka');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (9, '2023/10/03 13:02:05', 17, 'Beef Stir Fry');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (9, '2023/10/03 13:02:05', 18, 'Vegetable Lasagna');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (10, '2023/10/03 17:06:48', 19, 'Chicken Quesadilla');
INSERT INTO "PRODUCT_ORDER" ("ORDER_NUMBER", "ORDER_DATE", "PRODUCT_ID", "PRODUCT_NAME") VALUES (10, '2023/10/03 17:06:48', 20, 'Sushi Platter');

CREATE TABLE ROOM_TYPE (
    ROOM_TYPE          VARCHAR2(50) PRIMARY KEY,
    PRICE                  FLOAT NOT NULL,
    PERSON_CAPACITY        NUMBER NOT NULL,
    SIZE_OF_ROOM                 NUMBER NOT NULL,
    BED_TYPE               VARCHAR2(50) NOT NULL,
    NUMBER_OF_TOILETS      NUMBER NOT NULL,
    BALCONY_COUNT          NUMBER NOT NULL
);



-- Örnek 1
INSERT INTO ROOM_TYPE (ROOM_TYPE, PRICE, PERSON_CAPACITY, SIZE_OF_ROOM, BED_TYPE, NUMBER_OF_TOILETS, BALCONY_COUNT)
VALUES ('SingleRoom', 100.0, 1, 20, 'SingleBed', 1, 0);

-- Örnek 2
INSERT INTO ROOM_TYPE (ROOM_TYPE, PRICE, PERSON_CAPACITY, SIZE_OF_ROOM, BED_TYPE, NUMBER_OF_TOILETS, BALCONY_COUNT)
VALUES ('DoubleRoom', 150.0, 2, 30, 'DoubleBed', 1, 1);

-- Örnek 3
INSERT INTO ROOM_TYPE (ROOM_TYPE, PRICE, PERSON_CAPACITY, SIZE_OF_ROOM, BED_TYPE, NUMBER_OF_TOILETS, BALCONY_COUNT)
VALUES ('SuiteRoom', 200.0, 3, 40, 'KingSizeBed', 2, 2);

-- Örnek 4
INSERT INTO ROOM_TYPE (ROOM_TYPE, PRICE, PERSON_CAPACITY, SIZE_OF_ROOM, BED_TYPE, NUMBER_OF_TOILETS, BALCONY_COUNT)
VALUES ('FamilyRoom', 250.0, 4, 50, 'QueenSizeBed', 2, 1);

-- Örnek 5
INSERT INTO ROOM_TYPE (ROOM_TYPE, PRICE, PERSON_CAPACITY, SIZE_OF_ROOM, BED_TYPE, NUMBER_OF_TOILETS, BALCONY_COUNT)
VALUES ('VIPRoom', 500.0, 2, 60, 'SuperKingSizeBed', 3, 3);


CREATE TABLE ROOM (
    ROOM_ID         NUMBER PRIMARY KEY,
    FLOOR           NUMBER NOT NULL,
    ROOM_TYPE       VARCHAR2(50) REFERENCES ROOM_TYPE(ROOM_TYPE) ON DELETE CASCADE,
    AVAILABILITY    NUMBER CHECK (AVAILABILITY IN (0, 1)) NOT NULL,
    ROOM_STATUS     VARCHAR2(50) CHECK (ROOM_STATUS IN ('clean', 'unclean')) NOT NULL
);


-- Örnek 1
INSERT INTO ROOM ( ROOM_ID, FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (1, 1, 'SingleRoom', 1, 'clean');

-- Örnek 2
INSERT INTO ROOM (ROOM_ID, FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (2, 2, 'DoubleRoom', 0, 'unclean');

-- Örnek 3
INSERT INTO ROOM (ROOM_ID, FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (3, 1, 'SuiteRoom', 1, 'clean');

-- Örnek 4
INSERT INTO ROOM (ROOM_ID, FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (4,  3, 'FamilyRoom', 0, 'unclean');

-- Örnek 5
INSERT INTO ROOM (ROOM_ID, FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (5, 2, 'VIPRoom', 1, 'clean');

-- Örnek 6
INSERT INTO ROOM (ROOM_ID, FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (6,  1, 'SingleRoom', 0, 'unclean');

-- Örnek 7
INSERT INTO ROOM (ROOM_ID,FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (7, 3, 'DoubleRoom', 1, 'clean');

-- Örnek 8
INSERT INTO ROOM (ROOM_ID, FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (8, 2, 'SuiteRoom', 0, 'unclean');

-- Örnek 9
INSERT INTO ROOM (ROOM_ID,FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (9, 1, 'FamilyRoom', 1, 'clean');

-- Örnek 10
INSERT INTO ROOM (ROOM_ID, FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (10, 3, 'VIPRoom', 0, 'unclean');

-- Örnek 11
INSERT INTO ROOM (ROOM_ID, FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (11, 2, 'SingleRoom', 1, 'clean');

-- Örnek 12
INSERT INTO ROOM (ROOM_ID, FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (12, 3, 'DoubleRoom', 0, 'unclean');

-- Örnek 13
INSERT INTO ROOM (ROOM_ID, FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (13, 1, 'SuiteRoom', 1, 'clean');

-- Örnek 14
INSERT INTO ROOM (ROOM_ID, FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (14, 2, 'FamilyRoom', 0, 'unclean');

-- Örnek 15
INSERT INTO ROOM (ROOM_ID, FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (15, 3, 'VIPRoom', 1, 'clean');

-- Örnek 16
INSERT INTO ROOM (ROOM_ID, FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (16, 1, 'SingleRoom', 0, 'unclean');

-- Örnek 17
INSERT INTO ROOM (ROOM_ID, FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (17, 2, 'DoubleRoom', 1, 'clean');

-- Örnek 18
INSERT INTO ROOM (ROOM_ID, FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (18, 3, 'SuiteRoom', 0, 'unclean');

-- Örnek 19
INSERT INTO ROOM (ROOM_ID, FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (19, 1, 'FamilyRoom', 1, 'clean');

-- Örnek 20
INSERT INTO ROOM (ROOM_ID, FLOOR, ROOM_TYPE, AVAILABILITY, ROOM_STATUS)
VALUES (20, 2, 'VIPRoom', 0, 'unclean');


CREATE TABLE GUEST(
    TC_PASSPORT_NO Number,
    NAME VARCHAR2(20) not null,
    SURNAME  VARCHAR2(20) not null,
    TEL_NO VARCHAR2(20) ,
    NATIONALITY VARCHAR2(20) ,
    ADDRESS VARCHAR2(50),
    E_MAİL VARCHAR2(70),
    ROOM_ID NUMBER not null, 
    CONSTRAINT PK_Guest_TC PRIMARY KEY(TC_PASSPORT_NO),
    CONSTRAINT FK_Guest_TC FOREIGN KEY(ROOM_ID) references ROOM(ROOM_ID) on delete cascade
) ;
INSERT INTO GUEST 
VALUES (11122233344, 'John', 'Doe', '123456789', 'TURKEY', '123 Main St', 'john.doe@email.com', 1);

INSERT INTO GUEST 
VALUES (22211133344, 'Jane', 'Smith', '987654321', 'TURKEY', '456 Oak St', 'jane.smith@email.com', 2);

INSERT INTO GUEST 
VALUES   (22211144433, 'Robert', 'Johnson', '555111222', 'TURKEY', '789 Elm St', 'robert.johnson@email.com', 3);

INSERT INTO GUEST 
VALUES (11222233344, 'Emily', 'Brown', '444888999', 'TURKEY', '567 Maple St', 'emily.brown@email.com', 4);


INSERT INTO GUEST 
VALUES (21122233344, 'Michael', 'Miller', '333777888', 'TURKEY', '890 Birch St', 'michael.miller@email.com', 5);



INSERT INTO GUEST 
VALUES (12122233344, 'Olivia', 'Davis', '222555666', 'Turkey', '432 Pine St', 'olivia.davis@email.com', 6);


INSERT INTO GUEST 
VALUES (11122233343, 'William', 'Clark', '111444555', 'Turkey', '678 Cedar St', 'william.clark@email.com', 7);


INSERT INTO GUEST 
VALUES (81122233344, 'Sophia', 'Moore', '999222333', 'Turkey', '876 Oak St', 'sophia.moore@email.com', 8);


INSERT INTO GUEST 
VALUES  (99988877766, 'Daniel', 'White', '888111222', 'Turkey', '543 Redwood St', 'daniel.white@email.com', 9);

INSERT INTO GUEST 
VALUES   (99988855544, 'Ava', 'Harris', '777000111', 'Turkey', '654 Cedar St', 'ava.harris@email.com', 10);
 
INSERT INTO GUEST 
VALUES    (99955522211, 'Matthew', 'Jackson', '666333444', 'Turkey', '789 Pine St', 'matthew.jackson@email.com', 11);

INSERT INTO GUEST 
VALUES     (77744411166, 'Ella', 'Allen', '555222333', 'Turkey', '321 Birch St', 'ella.allen@email.com', 12);
  
INSERT INTO GUEST 
VALUES     (89898978884, 'Christopher', 'Carter', '444111222', 'Turkey', '456 Maple St', 'christopher.carter@email.com', 13);
 
INSERT INTO GUEST 
values    (44545454511, 'Emma', 'Perez', '333000111', 'Turkey', '987 Elm St', 'emma.perez@email.com', 14);
 

INSERT INTO GUEST 
values (71717117171, 'Nicholas', 'Sanchez', '222111333', 'Turkey', '234 Redwood St', 'nicholas.sanchez@email.com', 15);
  
INSERT INTO GUEST 
VALUES     (87878787878, 'Andrew', 'Gonzalez', '999666333', 'Turkey', '876 Oak St', 'andrew.gonzalez@email.com', 16);
 
INSERT INTO GUEST 
values      (47751999267, 'Carter', 'Fisher', '777444111', 'Turkey', '234 Pine St', 'carter.fisher@email.com', 17);
 
INSERT INTO GUEST 
values      (74747175239, 'Chloe', 'Torres', '888555222', 'Turkey', '765 Redwood St', 'chloe.torres@email.com', 18);

INSERT INTO GUEST 
values      (85487815581, 'Grace', 'Ward', '666333000', 'Turkey', '987 Cedar St', 'grace.ward@email.com', 19);
  
INSERT INTO GUEST 
values      (34696595505, 'Can', 'Pipe', '5380402265', 'Turkey', 'Gülbahçe St', 'can.p@email.com', 20);


CREATE TABLE BOOKING (
    BOOKING_ID          NUMBER PRIMARY KEY,
    CHECK_IN_DATE       TIMESTAMP NOT NULL,
    CHECK_OUT_DATE      TIMESTAMP NOT NULL,
    BOOKING_METHOD      VARCHAR2(50) CHECK (BOOKING_METHOD IN ('credit', 'cash')) NOT NULL,
    BOOKING_STATUS      NUMBER CHECK (BOOKING_STATUS IN (0, 1)) NOT NULL,
    GUEST_COUNT         NUMBER NOT NULL,
    TC_PASSPORT_NO      NUMBER(11) REFERENCES GUEST(TC_PASSPORT_NO),
    ROOM_ID             NUMBER REFERENCES ROOM(ROOM_ID),
    BILL_ID             NUMBER REFERENCES BILL(BILL_ID),
    BOOKING_DATE        TIMESTAMP NOT NULL
);

-- Örnek 1
INSERT INTO BOOKING (BOOKING_ID, CHECK_IN_DATE, CHECK_OUT_DATE, BOOKING_METHOD, BOOKING_STATUS, GUEST_COUNT, TC_PASSPORT_NO, ROOM_ID, BILL_ID, BOOKING_DATE)
VALUES (
    1,
    '2023-01-01 08:30:00',
    '2023-01-05 12:45:00',
    'credit',
    1,
    1,
    '21122233344',
    1,
    1,
    '2023-01-01 10:00:00'
);

-- Örnek 2
INSERT INTO BOOKING (BOOKING_ID, CHECK_IN_DATE, CHECK_OUT_DATE, BOOKING_METHOD, BOOKING_STATUS, GUEST_COUNT, TC_PASSPORT_NO, ROOM_ID, BILL_ID, BOOKING_DATE)
VALUES (
    2,
    '2023-02-01 10:00:00',
    '2023-02-07 14:20:00',
    'cash',
    0,
    2,
    '12122233344',
    2,
    2,
    '2023-02-01 12:30:00'
);

-- Örnek 3
INSERT INTO BOOKING (BOOKING_ID, CHECK_IN_DATE, CHECK_OUT_DATE, BOOKING_METHOD, BOOKING_STATUS, GUEST_COUNT, TC_PASSPORT_NO, ROOM_ID, BILL_ID, BOOKING_DATE)
VALUES (
    3,
    '2023-03-01 09:15:00',
    '2023-03-10 11:30:00',
    'credit',
    1,
    3,
    '11122233344',
    3,
    3,
    '2023-03-01 11:45:00'
);

INSERT INTO BOOKING (BOOKING_ID, CHECK_IN_DATE, CHECK_OUT_DATE, BOOKING_METHOD, BOOKING_STATUS, GUEST_COUNT, TC_PASSPORT_NO, ROOM_ID, BILL_ID, BOOKING_DATE)
VALUES (
    4,
    '2023-10-10 09:15:00',
    '2023-10-13 11:30:00',
    'credit',
    1,
   4 ,
    '99988855544',
    10,
    15,
    '2023-03-01 11:45:00'
);



CREATE TABLE GUEST_PAYMENT(
    TC_PASSPORT_NO Number,
    PAYMENT_ID NUMBER,
    CONSTRAINT PK_GUEST_PAYMENT PRIMARY KEY(TC_PASSPORT_NO, PAYMENT_ID),
    CONSTRAINT FK_GUEST_PAYMENT_ID FOREIGN KEY(PAYMENT_ID) references PAYMENT(PAYMENT_ID) on delete cascade,
    Constraint FK_GUEST_PAYMENT_TC FOREIGN KEY(TC_PASSPORT_NO) references GUEST(TC_PASSPORT_NO) on delete cascade
    );

-- Row 1
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (11122233344, 26);

-- Row 2
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (22211133344, 27);

-- Row 3
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (22211144433, 28);

-- Row 4
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (11222233344, 29);

-- Row 5
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (21122233344, 30);

-- Row 6
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (12122233344, 31);

-- Row 7
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (11122233343, 32);

-- Row 8
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (81122233344, 33);

-- Row 9
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (99988877766, 34);

-- Row 10
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (99988855544, 35);

-- Row 11
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (99955522211, 36);

-- Row 12
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (77744411166, 37);

-- Row 13
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (89898978884, 38);

-- Row 14
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (44545454511, 39);

-- Row 15
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (71717117171, 40);

-- Row 16
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (87878787878, 41);

-- Row 17
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (47751999267, 42);

-- Row 18
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (74747175239, 43);

-- Row 19
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (85487815581, 44);

-- Row 20
INSERT INTO GUEST_PAYMENT (TC_PASSPORT_NO, PAYMENT_ID)
VALUES (34696595505, 45);


CREATE TABLE RESTAURANT_CUSTOMER(
    CUSTOMER_ID NUMBER,
    NAME VARCHAR2(20) not null,
    SURNAME VARCHAR2(20) not null,
    CONSTRAINT PK_RESTAURANT_CUSTOMER_Customer_ID PRIMARY KEY(CUSTOMER_ID)

    );

INSERT INTO RESTAURANT_CUSTOMER 
VALUES (1, 'John', 'Doe');


INSERT INTO RESTAURANT_CUSTOMER 
VALUES (2, 'Jane', 'Smith');


INSERT INTO RESTAURANT_CUSTOMER 
VALUES (3, 'Robert', 'Johnson');


INSERT INTO RESTAURANT_CUSTOMER 
VALUES (4, 'Emily', 'Brown');


INSERT INTO RESTAURANT_CUSTOMER
VALUES (5, 'Michael', 'Miller');


INSERT INTO RESTAURANT_CUSTOMER 
VALUES (6, 'Olivia', 'Davis');


INSERT INTO RESTAURANT_CUSTOMER 
VALUES (7, 'William', 'Clark');


INSERT INTO RESTAURANT_CUSTOMER 
VALUES (8, 'Sophia', 'Moore');


INSERT INTO RESTAURANT_CUSTOMER 
VALUES (9, 'Daniel', 'White');


INSERT INTO RESTAURANT_CUSTOMER 
VALUES (10, 'Ava', 'Harris');


INSERT INTO RESTAURANT_CUSTOMER 
VALUES (11, 'Matthew', 'Jackson');


INSERT INTO RESTAURANT_CUSTOMER 
VALUES (12, 'Ella', 'Allen');

INSERT INTO RESTAURANT_CUSTOMER 
VALUES (13, 'Christopher', 'Carter');


INSERT INTO RESTAURANT_CUSTOMER 
VALUES (14, 'Emma', 'Perez');


INSERT INTO RESTAURANT_CUSTOMER
VALUES (15, 'Nicholas', 'Sanchez');

INSERT INTO RESTAURANT_CUSTOMER 
VALUES (16, 'Madison', 'Lopez');


INSERT INTO RESTAURANT_CUSTOMER 
VALUES (17, 'Andrew', 'Gonzalez');

INSERT INTO RESTAURANT_CUSTOMER 
VALUES (18, 'Chloe', 'Torres');

INSERT INTO RESTAURANT_CUSTOMER 
VALUES (19, 'Carter', 'Fisher');


INSERT INTO RESTAURANT_CUSTOMER
VALUES (20, 'Grace', 'Ward');


CREATE TABLE CUSTOMER_PAYMENT(
    CUSTOMER_ID NUMBER,
    PAYMENT_ID NUMBER,
    CONSTRAINT PK_CUSTOMER_PAYMENT PRIMARY KEY(CUSTOMER_ID,PAYMENT_ID),
    CONSTRAINT FK_CUSTOMER_PAYMENT_Customer_ID FOREIGN KEY(CUSTOMER_ID) references RESTAURANT_CUSTOMER(CUSTOMER_ID) on delete cascade,
    Constraint FK_CUSTOMER_PAYMENT_Payment_ID FOREIGN KEY(PAYMENT_ID) references PAYMENT(PAYMENT_ID) on delete cascade
    );
-- Row 1
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (20, 1);

-- Row 2
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (19, 2);

-- Row 3
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (18, 3);

-- Row 4
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (17, 4);

-- Row 5
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (16, 5);

-- Row 6
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (15, 6);

-- Row 7
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (14, 7);

-- Row 8
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (13, 8);

-- Row 9
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (12, 9);

-- Row 10
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (11, 10);

-- Row 11
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (10, 11);

-- Row 12
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (9, 12);

-- Row 13
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (8, 13);

-- Row 14
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (7, 14);

-- Row 15
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (6, 15);

-- Row 16
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (5, 16);

-- Row 17
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (4, 17);

-- Row 18
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (3, 18);

-- Row 19
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (2, 19);

-- Row 20
INSERT INTO CUSTOMER_PAYMENT (CUSTOMER_ID, PAYMENT_ID)
VALUES (1, 20);


CREATE TABLE CUSTOMER_RESERVATION(
    CUSTOMER_ID NUMBER,
    RESERVATION_ID Number,
    CONSTRAINT PK_CUSTOMER_RESERVATION PRIMARY KEY(CUSTOMER_ID, RESERVATıON_ID),
    CONSTRAINT FK_CUSTOMER_RESERVATION_Customer_ID FOREIGN KEY(CUSTOMER_Id) references RESTAURANT_CUSTOMER(CUSTOMER_ID) on delete cascade,
    Constraint FK_CUSTOMER_RESERVATION_Reservation_ID FOREIGN KEY(RESERVATION_ID) references DINNER_RESERVATION(RESERVATION_ID) on delete cascade
);


-- Row 1
INSERT INTO CUSTOMER_RESERVATION 
VALUES (1, 5);

-- Row 2
INSERT INTO CUSTOMER_RESERVATION 
VALUES (2, 12);

-- Row 3
INSERT INTO CUSTOMER_RESERVATION 
VALUES (3, 3);

-- Row 4
INSERT INTO CUSTOMER_RESERVATION 
VALUES (4, 17);

-- Row 5
INSERT INTO CUSTOMER_RESERVATION 
VALUES (5, 8);

-- Row 6
INSERT INTO CUSTOMER_RESERVATION 
VALUES (6, 14);

-- Row 7
INSERT INTO CUSTOMER_RESERVATION 
VALUES (7, 20);

-- Row 8
INSERT INTO CUSTOMER_RESERVATION 
VALUES (8, 11);

-- Row 9
INSERT INTO CUSTOMER_RESERVATION 
VALUES (9, 1);

-- Row 10
INSERT INTO CUSTOMER_RESERVATION 
VALUES (10, 19);

-- Row 11
INSERT INTO CUSTOMER_RESERVATION 
VALUES (11, 6);

-- Row 12
INSERT INTO CUSTOMER_RESERVATION
VALUES (12, 9);

-- Row 13
INSERT INTO CUSTOMER_RESERVATION
VALUES (13, 16);

-- Row 14
INSERT INTO CUSTOMER_RESERVATION 
VALUES (14, 2);

-- Row 15
INSERT INTO CUSTOMER_RESERVATION 
VALUES (15, 10);

-- Row 16
INSERT INTO CUSTOMER_RESERVATION
VALUES (16, 4);

-- Row 17
INSERT INTO CUSTOMER_RESERVATION 
VALUES (17, 18);

-- Row 18
INSERT INTO CUSTOMER_RESERVATION 
VALUES (18, 15);

-- Row 19
INSERT INTO CUSTOMER_RESERVATION 
VALUES (19, 7);

-- Row 20
INSERT INTO CUSTOMER_RESERVATION 
VALUES (20, 13);


   
CREATE TABLE GUEST_RESERVATION(
    TC_PASSPORT_NO Number,
    RESERVATION_ID Number,
    CONSTRAINT PK_GUEST_RESERVATION PRIMARY KEY(TC_PASSPORT_NO, RESERVATION_ID),
    CONSTRAINT FK_GUEST_RESERVATION_TC_PASSPORT_NO FOREIGN KEY(TC_PASSPORT_NO) references GUEST(TC_PASSPORT_NO) on delete cascade,
    Constraint FK_GUEST_RESERVATION_Reservation_ID FOREIGN KEY( RESERVATION_ID) references DINNER_RESERVATION(RESERVATION_ID) on delete cascade
);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (11122233344, 1);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (22211133344, 2);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (22211144433, 3);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (11222233344, 4);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (21122233344, 5);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (12122233344, 6);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (11122233343, 7);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (81122233344, 8);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (99988877766, 9);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (99988855544, 10);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (99955522211, 11);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (77744411166, 12);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (89898978884, 13);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (44545454511, 14);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (71717117171, 15);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (87878787878, 16);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (47751999267, 17);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (74747175239, 18);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (85487815581, 19);
INSERT INTO GUEST_RESERVATION (TC_PASSPORT_NO, RESERVATION_ID) VALUES (34696595505, 20);

CREATE TABLE ROOM_STAFF (
    ROOM_ID NUMBER,
    TC_PASSPORT_NO NUMBER,
    PRIMARY KEY(ROOM_ID, TC_PASSPORT_NO),
    FOREIGN KEY(ROOM_ID) REFERENCES ROOM(ROOM_ID),
    FOREIGN KEY(TC_PASSPORT_NO) REFERENCES STAFF(TC_PASSPORT_NO)
);

--ROOM_STAF RELATION INSERTION
INSERT INTO ROOM_STAFF(ROOM_ID,TC_PASSPORT_NO)
VALUES (1,45678901234);

INSERT INTO ROOM_STAFF(ROOM_ID,TC_PASSPORT_NO)
VALUES (2,45678901234);

INSERT INTO ROOM_STAFF(ROOM_ID,TC_PASSPORT_NO)
VALUES (3,45678901234);

INSERT INTO ROOM_STAFF(ROOM_ID,TC_PASSPORT_NO)
VALUES (4,45678901234);

INSERT INTO ROOM_STAFF (ROOM_ID, TC_PASSPORT_NO)
VALUES (5, 66778899001);

INSERT INTO ROOM_STAFF (ROOM_ID, TC_PASSPORT_NO)
VALUES (6, 66778899001);

INSERT INTO ROOM_STAFF (ROOM_ID, TC_PASSPORT_NO)
VALUES (7, 66778899001);

INSERT INTO ROOM_STAFF (ROOM_ID, TC_PASSPORT_NO)
VALUES (8, 66778899001);

INSERT INTO ROOM_STAFF (ROOM_ID, TC_PASSPORT_NO)
VALUES (9, 33445566778);

INSERT INTO ROOM_STAFF (ROOM_ID, TC_PASSPORT_NO)
VALUES (10, 33445566778);

INSERT INTO ROOM_STAFF (ROOM_ID, TC_PASSPORT_NO)
VALUES (11, 33445566778);

INSERT INTO ROOM_STAFF (ROOM_ID, TC_PASSPORT_NO)
VALUES (12, 33445566778);

INSERT INTO ROOM_STAFF (ROOM_ID, TC_PASSPORT_NO)
VALUES (13, 23456789012);

INSERT INTO ROOM_STAFF (ROOM_ID, TC_PASSPORT_NO)
VALUES (14, 23456789012);

INSERT INTO ROOM_STAFF (ROOM_ID, TC_PASSPORT_NO)
VALUES (15, 23456789012);

INSERT INTO ROOM_STAFF (ROOM_ID, TC_PASSPORT_NO)
VALUES (16, 23456789012);

INSERT INTO ROOM_STAFF(ROOM_ID,TC_PASSPORT_NO)
VALUES (17,45678901234);

INSERT INTO ROOM_STAFF(ROOM_ID,TC_PASSPORT_NO)
VALUES (18,45678901234);

INSERT INTO ROOM_STAFF(ROOM_ID,TC_PASSPORT_NO)
VALUES (19,45678901234);

INSERT INTO ROOM_STAFF(ROOM_ID,TC_PASSPORT_NO)
VALUES (20,45678901234);