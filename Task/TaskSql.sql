--CREATE DATABASE AzMB101_MelekAzizova
--USE AzMB101_MelekAzizova

CREATE TABLE Position
(
	Id int identity primary key,
	Name nvarchar(50)
)
SELECT*FROM Position
INSERT INTO Position VALUES('Manager')
INSERT INTO Position VALUES('Security')
INSERT INTO Position VALUES('Seller')



CREATE TABLE Branch
(
	Id int identity primary key,
	Name nvarchar(50)
)
SELECT*FROM Branch
INSERT INTO Branch VALUES('Yasamal')
INSERT INTO Branch VALUES(N'Xırdalan')
INSERT INTO Branch VALUES(N'Sumqayıt')
INSERT INTO Branch VALUES('Ramana')
INSERT INTO Branch VALUES(N'Binə')



CREATE TABLE Product
(
	Id int identity primary key,
	Name nvarchar(30),
	PurchasePrice decimal ,
	SalePrice decimal
)
SELECT*FROM Product
INSERT INTO Product VALUES(N'Çay',2,5)
INSERT INTO Product VALUES(N'Ət',8,11)
INSERT INTO Product VALUES(N'Yağ',7,15)
INSERT INTO Product VALUES(N'Düyü',9,12)




CREATE TABLE Employee
(
	Id int identity primary key,
	Name nvarchar(30),
	Surname nvarchar(30),
	DadName nvarchar(30),
	Salary int, 
	PositionId int REFERENCES Position(Id) 
)
SELECT*FROM Employee
INSERT INTO Employee VALUES(N'Süleyman','Abdullayev',N'Səlim',680,2)
INSERT INTO Employee VALUES('Zakir',N'Ağayev',N'Rüstəm',2500,1)
INSERT INTO Employee VALUES(N'Rəna','Orucova','Yusif',540,3)
INSERT INTO Employee VALUES('Tofiq',N'Həsənov',N'Yalçın',540,3)
INSERT INTO Employee VALUES(N'Lalə',N'Əliyeva',N'Rövşən',680,2)
INSERT INTO Employee VALUES('Nihat',N'Mirzəzadə','Nahid',540,3)
INSERT INTO Employee VALUES(N'Şamil',N'Feyzullayev',N'İqbal',540,3)

CREATE TABLE Sale
(
	Id int identity primary key,
	SaleDate date,
	ProductId int REFERENCES Product(Id),
	EmployeeId int REFERENCES Employee(Id)
)


INSERT INTO Sale VALUES ('2022-12-15', 1, 3);
INSERT INTO Sale VALUES ('2023-11-15', 5, 3);
INSERT INTO Sale VALUES ('2023-09-16', 4, 3);
INSERT INTO Sale VALUES ('2022-07-23', 3, 4);
INSERT INTO Sale VALUES ('2023-11-28', 3, 7);
INSERT INTO Sale VALUES ('2023-09-29', 1, 6);
INSERT INTO Sale VALUES ('2023-06-18', 4, 4);

SELECT*FROM Employee
SELECT*FROM Product
SELECT*FROM Sale
SELECT*FROM Branch
SELECT*FROM Position


----------------------------------------------



SELECT
    Sale.Id,
    Sale.SaleDate,
    Employee.Name,
    Product.Name,
    Product.PurchasePrice,
    Product.SalePrice
	
FROM
    Sale
JOIN
    Employee ON Sale.EmployeeId = Employee.Id
JOIN
    Product ON Sale.ProductId = Product.Id

---------------------------------------------
SELECT SUM(SalePrice) AS SumPrice
FROM Product

----------------------------------------------
--errorlu kod
--SELECT SUM(SalePrice) AS SumPrice
--FROM Sale
--JOIN Product ON  Sale.ProductId=Product.Id
--SELECT EXTRACT(MONTH FROM  '2022-12-15');









