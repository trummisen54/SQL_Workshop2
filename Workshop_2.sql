
Drop table Animal
Drop table Owner



--Select * from Animal
--Select * from Owner



--1.1
CREATE TABLE Owner
(
id		INT IDENTITY(1001,1) NOT NULL ,
firstname		varchar(50) NULL ,
lastname		varchar(50) NULL ,
phone			varchar(50) NULL ,
);
ALTER TABLE Owner WITH NOCHECK
ADD CONSTRAINT PK_Owner
PRIMARY KEY CLUSTERED (id)

CREATE TABLE Animal
(
id				INT IDENTITY(1001,1) NOT NULL ,
name			varchar(50) NULL ,
age				varchar(50) NULL ,
owner_id		int NULL ,
);

ALTER TABLE Animal
ADD CONSTRAINT FK_Animal
FOREIGN KEY (owner_id) REFERENCES [Owner] (id)


--1.2
ALTER TABLE Owner ADD email varchar(50) NULL

--2.1	
INSERT INTO Owner(firstname, lastname, phone, email) VALUES ('Kalle', 'Karlsson', '045321546', 'Kalle@hotmail.com')
INSERT INTO Owner(firstname, lastname, phone, email) VALUES ('Sven', 'Knutsson', '415665456', 'Svenne@Gmail.com')
INSERT INTO Animal(name, age, owner_id) VALUES ('Kissemiss', '2', '1001')
INSERT INTO Animal(name, age, owner_id) VALUES ('Sigge', '7', '1002')

--2.2
Select * from Owner
Select * from Animal
--2.2.1
SELECT name, firstname
FROM Owner INNER JOIN Animal
ON Owner.id=Animal.owner_id;

--2.2.2
SELECT SUM (id*age) AS totalt
FROM Animal
WHERE id = 1001;
SELECT AVG (id) AS Genomsnittspris, MIN(id) AS minid, MAX(id) AS maxid
FROM Animal;

SELECT COUNT(*) AS [antal produkter]
FROM Animal;

--2.2.3

--go
--CREATE VIEW testvy AS
--SELECT age, id
--FROM Animal;


--select age from testvy


--2.3

UPDATE Animal
SET name='Siggeligge'
WHERE name=(SELECT name WHERE name='Sigge');

--2.4

Insert into Animal (name, age, owner_id) VALUES ('Siggeligge', '4', 1001);

Delete from Animal
where name='Siggeligge'


--3.1
------------------------------------------------------------------------------

drop table [Order]
drop table Customer



Create table Customer
(
CustomerID			INT IDENTITY(1001,1)	NOT NULL,
[Company name]		varchar(50)				NULL,
City				varchar(50)				NULL,
telephone			varchar(50)				NULL,
[Contact person]	varchar(50)				NULL

PRIMARY KEY (CustomerID)


);

CREATE TABLE [Order]
(
OrderID			INT											NOT NULL,
[Date]			varchar(50)									NULL,
Delivery		varchar(50)									NULL,
CustomerID		INT	references Customer(CustomerID)			NULL,
SellerID		varchar(50)									NULL

PRIMARY KEY (OrderID)


);

INSERT INTO Customer([Company name], City, telephone, [Contact person]) VALUES ('Music Portal Inc', 'Stockholm', '08-163241', 'Nils Larsson')
INSERT INTO Customer([Company name], City, telephone, [Contact person]) VALUES ('Musicality', 'Halmstad', '035-121243', 'Eva Larsson')
INSERT INTO Customer([Company name], City, telephone, [Contact person]) VALUES ('Music Portal Inc', 'Gothenburg', '031-785411', 'Nanna Anka')


INSERT INTO [Order](OrderId, [Date], Delivery, CustomerID, SellerID) VALUES (110032, '2011-03-20', 'Cash on Delivery', 1001, 'BK1')
INSERT INTO [Order](OrderId, [Date], Delivery, CustomerID, SellerID) VALUES (110038, '2011-03-20', 'Cost Delivery', 1002, 'AK3')
INSERT INTO [Order](OrderId, [Date], Delivery, CustomerID, SellerID) VALUES (110211, '2011-05-29', 'Customer Pick-up', 1003, 'CK1')
INSERT INTO [Order](OrderId, [Date], Delivery, CustomerID, SellerID) VALUES (101935, '2010-12-18', 'Customer Pick-up', 1001, 'BK1')



select [company name], city, telephone from Customer order by [company name];
--yes, sorted by company name

select * from Customer where [company name] like '%Inc' order by [company name];
--shows the customers with company name that includes Inc

select [date], orderID, Delivery from [order] where customerID = (select distinct 
CustomerID from Customer where telephone = '031-785411');
--get the customerID from customer with telephone 031-785411

select [company name], city, telephone, [contact person], [date] from [order], Customer
where [order].customerID = Customer.CustomerID and SellerID = 'AK3';
--show the information which is connected to SellerID AK3

update Customer set CustomerID = 1004 where CustomerID='1001';
--do not work because you can't update an int with a char





--Autor Emil Andersson