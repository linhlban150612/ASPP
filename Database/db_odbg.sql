CREATE DATABASE DB_ODBG

USE DB_ODBG

CREATE TABLE USERS (
	ID INT PRIMARY KEY IDENTITY,
	ADDRESS CHAR(255),
	EMAIL CHAR(100) UNIQUE,
	NAME CHAR(100),
	PASSWORD CHAR(30),
	PHONE CHAR(14),
	ROLE CHAR(10),
	STATUS BIT
)

CREATE TABLE PROMOTION (
	ID INT PRIMARY KEY IDENTITY,
	COUPON_CODE CHAR(10) UNIQUE,
	IS_ACTIVE BIT,
	EXPIRED_AT DATETIME,
	DISCOUNT_VALUE FLOAT,
	NAME CHAR(255),
)

CREATE TABLE ORDERS (
	ID INT PRIMARY KEY IDENTITY,
	AMOUNT INT,
	CREATED_AT DATETIME,
	CREATED_BY INT,
	PROMOTION_ID INT,

	FOREIGN KEY (CREATED_BY) REFERENCES USERS(ID),
	FOREIGN KEY (PROMOTION_ID) REFERENCES PROMOTION(ID)
)

CREATE TABLE BRAND (
	ID INT PRIMARY KEY IDENTITY,
	NAME CHAR(100)
)

CREATE TABLE CATEGORY (
	ID INT PRIMARY KEY IDENTITY,
	NAME CHAR(100)
)

CREATE TABLE PRODUCT (
	ID INT PRIMARY KEY IDENTITY,
	DESCRIPTION VARCHAR(MAX),
	IS_AVAILABLE BIT,
	NAME CHAR(100),
	PRODUCT_IMAGE VARCHAR(MAX),
	PRICE INT,
	BRAND_ID INT,
	CATEGORY_ID INT,

	FOREIGN KEY (BRAND_ID) REFERENCES BRAND(ID),
	FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY(ID)
)

CREATE TABLE PRODUCT_SIZE (
	PRODUCT_ID INT,
	SIZE INT,
	QUANTITY INT,

	FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(ID)
)

CREATE TABLE ORDER_ITEMS (
	ID INT PRIMARY KEY IDENTITY,
	PRODUCT_ID INT,
	ORDER_ID INT,
	CREATED_AT DATETIME,
	RECEIVER_ADDRESS CHAR(255),
	RECEIVER_PHONE CHAR(14),
	TOTAL_PRICE INT,
	QUANTITY INT,

	FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(ID),
	FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ID)
)

INSERT INTO USERS VALUES ('1','1','1','1','1','ADMIN',1)
