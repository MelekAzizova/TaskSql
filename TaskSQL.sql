--CREATE DATABASE AzMB101_Melek
--CREATE TABLE ROLES
--(
--	Id int identity primary key,
--	Name nvarchar(7) ,
--)
--SELECT*FROM ROLES
--INSERT INTO ROLES VALUES('Admin')
--Insert INTO ROLES VALUES('User')
--INSERT INTO ROLES VALUES('Guest')

--CREATE TABLE Users
--(
--	Id int identity primary key,
--	Username nvarchar(25) NOT NULL UNIQUE,
--	Password nvarchar(max) NOT NULL,
--	RolesId int REFERENCES ROLES(Id)
--)
--SELECT*FROM Users
--INSERT INTO Users VALUES('mrs.azizova','azizova09',2)
--INSERT INTO Users VALUES ('azizova_aytekin','azizova2003',3)
--INSERT INTO Users VALUES('azmiu_biz','AzMIU',1)
--INSERT INTO Users VALUES('gunesM','mammadli12',2)
--INSERT INTO Users VALUES('BackEnd','sqlLite',1)

--SELECT Users.Id,Users.Username,ROLESId
--FROM ROLES
--Right JOIN Users On Users.Id=Roles.Id



--------------------------------------------------------------------------

--CREATE TABLE Categories
--(
--	Id int identity primary key,
--	Name nvarchar(30),
--	ParentId int REFERENCES Categories(Id)
--)
--SELECT*FROM Categories
--INSERT INTO Categories VALUES('Çay',NULL)
--INSERT INTO Categories VALUES('Koffe',NULL)
--INSERT INTO Categories VALUES(N'Meyvə şirəsi',NULL)
--INSERT INTO Categories VALUES(N'Ət məhsulları',NULL)
--INSERT INTO Categories VALUES('Tort',NULL)
--INSERT INTO Categories VALUES('Kolbasa',NULL)
--INSERT INTO Categories VALUES(N'Yaşıl çay',1)
--INSERT INTO Categories VALUES(N'Toyuq əti',4)
--INSERT INTO Categories VALUES('Ballı tort',5)
--INSERT INTO Categories VALUES('Qazlı su',3)
--INSERT INTO Categories VALUES(N'Soyuq kofe',2)
--INSERT INTO Categories VALUES(N'Qara çay',1)
--INSERT INTO Categories VALUES(N'Şokaladlı tort',5)
--INSERT INTO Categories VALUES(N'Qazsız su',3)

--SELECT child.Id,child.Name AS ChildName,parent.ParentId ,parent.Name AS ParentName
--FROM Categories AS parent
--JOIN Categories AS child
--ON parent.ParentId=child.Id




