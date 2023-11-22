CREATE DATABASE AliNinoDB
USE AliNinoDB

CREATE TABLE Catagories
(
	Id int identity primary key,
	Title nvarchar(40) NOT NULL,
	ParentId int REFERENCES Catagories(Id),
	IsDelated bit DEFAULT 0
)

CREATE TABLE Author
(
	Id int identity primary key,
	Name nvarchar(50) NOT NULL,
	Surname nvarchar(30) NOT NULL,
	IsDelated bit DEFAULT 0
)

CREATE TABLE Genre
(
	Id int identity primary key,
	Title nvarchar(40) NOT NULL,
	IsDelated bit DEFAULT 0
)

CREATE TABLE Language
(
	Id int identity primary key,
	Title nvarchar(40),
	IsDelated bit DEFAULT 0
)

CREATE TABLE PublishingHouse
(
	Id int identity primary key,
	Title nvarchar(40),
	IsDelated bit DEFAULT 0
)

CREATE TABLE Binding
(
	Id int identity primary key,
	Title nvarchar(40) NOT NULL,
	IsDelated bit DEFAULT 0
)

CREATE TABLE Book
(
	Id int identity primary key,
	Title nvarchar(50) NOT NULL,
	Description nvarchar(250) NOT NULL,
	ActualPrice int NOT NULL,
	DiscountPrice int,
	StockCount int,
	ArticleCode varchar(30) NOT NULL,
	Pages int NOT NULL,
	BindingId int REFERENCES Binding(Id),
	CatagoryId int REFERENCES Catagories(Id),
	IsDeleted bit DEFAULT 0 

)

CREATE TABLE Commet
(
	Id int identity primary key,
	Name nvarchar(25) not null,
	Email nvarchar(40)  not null,
	ImageUrl nvarchar(max) NOT NULL,
	Description nvarchar(250),
	Raiting int CHECK(Raiting<=5 AND Raiting>=1),
	BookId int REFERENCES Book(Id),
	IsDeleted bit DEFAULT 0 
)

CREATE TABLE BookAouthor
(
	Id int identity primary key,
	BookId int REFERENCES Book(Id),
	AouthorId int REFERENCES Author(Id)
)

CREATE TABLE BookGenres
(
	Id int identity primary key,
	BookId int REFERENCES Book(Id),
	GenreId int REFERENCES Genre(Id)
)

CREATE TABLE BookLanguage
(
	Id int identity primary key,
	BookId int REFERENCES Book(Id),
	LanguageId int REFERENCES Language(Id)
)


-------------------------------------------------------
------------insert------------------------------------


CREATE PROCEDURE ups_AddsBooks
    @Title nvarchar(40),
    @ParentId int,
    @Name nvarchar(50),
    @Surname nvarchar(50),
    @Description nvarchar(250),
    @ActualPrice int,
    @DiscountPrice int,
    @StockCount int,
    @ArticleCode varchar(30),
    @Pages int,
    @BindingId int,
    @CatagoryId int
AS 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Catagories WHERE  Catagories.Id= @CatagoryId)
    BEGIN
        INSERT INTO Catagories (Title, ParentId)
        VALUES (@Title, @ParentId);
    END

    
    IF NOT EXISTS (SELECT 1 FROM Author WHERE Name = @Name AND Surname = @Surname)
    BEGIN
        INSERT INTO Author (Name, Surname)
        VALUES (@Name, @Surname);
    END
	IF NOT EXISTS (SELECT 1 FROM Genre WHERE Title = @Title )
    BEGIN
        INSERT INTO Genre (Title)
        VALUES (@Title);
    END
	IF NOT EXISTS (SELECT 1 FROM Language WHERE Title = @Title )
    BEGIN
        INSERT INTO Language (Title)
        VALUES (@Title);
    END
	IF NOT EXISTS (SELECT 1 FROM PublishingHouse WHERE Title = @Title )
    BEGIN
        INSERT INTO PublishingHouse (Title)
        VALUES (@Title);
    END
	IF NOT EXISTS (SELECT 1 FROM Binding WHERE Title = @Title )
    BEGIN
        INSERT INTO Binding (Title)
        VALUES (@Title);
    END

    INSERT INTO Books (
        Title,
        Description,
        ActualPrice,
        DiscountPrice,
        StockCount,
        ArticleCode,
        Pages,
        BindingId,
        CatagoryId
    )
    VALUES (
        @Title,
        @Description,
        @ActualPrice,
        @DiscountPrice,
        @StockCount,
        @ArticleCode,
        @Pages,
        @BindingId,
        @CatagoryId
    );
END;


----------------------------------------------------------
--------------------update--------------------------------

CREATE PROCEDURE ups_Update
@Id int,
@Title nvarchar(40),
@ParentId int,
@Name nvarchar(50),
@Surname nvarchar(50)
AS
BEGIN
IF NOT EXISTS (SELECT 1 FROM Catagories WHERE Title = @Title )
	UPDATE Categories
	SET Title=@Title,ParentId=@ParentId
	WHERE Id=@Id

IF NOT EXISTS (SELECT 1 FROM Author WHERE Name = @Name AND Surname = @Surname)
	UPDATE Author
	SET Name=@Name,Surname = @Surname
	WHERE Id=@Id

IF NOT EXISTS (SELECT 1 FROM Genre WHERE Title = @Title )
	UPDATE Genre
	SET Title=@Title
	WHERE Id=@Id
IF NOT EXISTS (SELECT 1 FROM Language WHERE Title = @Title )
	UPDATE Language
	SET Title=@Title
	WHERE Id=@Id
IF NOT EXISTS (SELECT 1 FROM PublishingHouse WHERE Title = @Title )
	UPDATE PublishingHouse
	SET Title=@Title
	WHERE Id=@Id
IF NOT EXISTS (SELECT 1 FROM Binding WHERE Title = @Title )
	UPDATE Binding
	SET Title=@Title
	WHERE Id=@Id

END



