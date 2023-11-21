--CREATE DATABASE AzMB101
--USE AzMB101
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
	EmployeeId int REFERENCES Employee(Id),
	BranchId int REFERENCES Branch(Id)
)


INSERT INTO Sale VALUES ('2022-12-15', 1, 3,5);
INSERT INTO Sale VALUES ('2023-11-15', 4, 3,2);
INSERT INTO Sale VALUES ('2023-09-16', 4, 3,1);
INSERT INTO Sale VALUES ('2022-07-23', 3, 4,2);
INSERT INTO Sale VALUES ('2023-11-28', 3, 7,4);
INSERT INTO Sale VALUES ('2023-09-29', 1, 6,3);
INSERT INTO Sale VALUES ('2023-06-18', 4, 4,5);
INSERT INTO Sale VALUES ('2023-11-21', 4, 3,5);

SELECT*FROM Employee 
SELECT*FROM Product
SELECT*FROM Sale
SELECT*FROM Branch
SELECT*FROM Position


----------------------------------------------



SELECT
    Sale.Id,
    Employee.Name,
    Product.Name,
	Branch.Name,
    Product.PurchasePrice,
    Product.SalePrice,
    Sale.SaleDate
	
	
FROM
    Sale
JOIN
    Employee ON Sale.EmployeeId = Employee.Id
JOIN
    Product ON Sale.ProductId = Product.Id
JOIN
    Branch ON Sale.BranchId = Branch.Id

---------------------------------------------
SELECT SUM(Product.SalePrice) AS SumPrice
FROM Sale
JOIN Product ON Sale.ProductId=Product.Id

----------------------------------------------
CREATE VIEW vw_CountProductsSold AS
(SELECT e.Id,e.Name,e.Surname,COUNT(p.Id) AS ProductCOUNT  FROM Employee AS e
JOIN Sale AS s
ON s.EmployeeId=e.Id
JOIN Product AS p
ON p.Id=s.ProductId
GROUP BY e.Id,e.Name,e.Surname)

SELECT * FROM vw_CountProductsSold

---------------------------------------------ELE BELE
--SELECT MAX(ProductCOUNT) AS Products FROM
--(SELECT e.Id,e.Name,e.Surname,COUNT(p.Id) AS ProductCOUNT  FROM Employee AS e
--JOIN Sale AS s
--ON s.EmployeeId=e.Id
--JOIN Product AS p
--ON p.Id=s.ProductId
--GROUP BY e.Id,e.Name,e.Surname) AS Table1 

------------------------------------------------------------

CREATE VIEW vw_BranchSell AS
(SELECT b.Id,b.Name ,SUM(p.SalePrice) AS TotalPrice
FROM Sale AS s
JOIN  Branch AS b
ON s.BranchId=b.Id
JOIN Product AS p
ON s.ProductId=p.Id
WHERE S.SaleDate=CONVERT(date,GETDATE())
GROUP BY b.Id,b.Name
)

SELECT*FROM vw_BranchSell



--WHERE
--    Sale.SaleDate = CONVERT(date, GETDATE())  -- Filter by the current date
--GROUP BY
--    Branch.Id, Branch.Name
--ORDER BY
--    TotalSales DESC









