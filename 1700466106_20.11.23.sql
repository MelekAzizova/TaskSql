--CREATE TABLE Subjects
--(
--	Id int identity primary key,
--	Name nvarchar(50)
--)
--SELECT * FROM Subjects
--CROSS JOIN	Students
--ORDER BY Students.Name

--ALTER TABLE Grades
--ADD MaxPoint tinyint
--sp_rename 'Grades.Point', 'MinPoint'
--CREATE TABLE Grades
--(
--	Id int identity primary key,
--	Name char
--)

--SELECT * FROM Students, Grades WHERE AvgGrade >= Point

--SELECT * FROM Students
--JOIN Grades
--ON AvgGrade BETWEEN MinPoint AND MaxPoint

--CREATE DATABASE Shopping
--USE Shopping

--CREATE DATABASE Spotify
--USE Spotify

--CREATE TABLE Genres
--(
--	Id int identity primary key,
--	Name varchar(32)
--)
--CREATE TABLE Artists
--(
--	Id int identity primary key,
--	Name nvarchar(64),
--	Surname nvarchar(64),
--	BirthDate date
--)

--CREATE TABLE Musics
--(
--	Id int identity primary key,
--	Name nvarchar(128),
--	GenreId int REFERENCES Genres(Id),
--	Duration int
--)

--CREATE TABLE ArtistsMusics
--(
--	Id int identity primary key,
--	ArtistId int REFERENCES Artists(Id),
--	MusicId int REFERENCES Musics(Id)
--)


--SELECT COUNT(*) FROM Artists
--JOIN ArtistsMusics
--ON Artists.Id = ArtistsMusics.ArtistId
--JOIN Musics
--ON Musics.Id = ArtistsMusics.MusicId
--JOIN Genres
--ON Genres.Id = Musics.GenreId

--SELECT Artists.Id, Artists.Name, Artists.Surname, Avg(Musics.Duration) as MusicCount FROM Artists
--JOIN ArtistsMusics
--ON Artists.Id = ArtistsMusics.ArtistId
--JOIN Musics
--ON Musics.Id = ArtistsMusics.MusicId
--JOIN Genres
--ON Genres.Id = Musics.GenreId
----WHERE Artists.Name like '%i%'
--WHERE GenreId = 2
--GROUP BY Artists.Id, Artists.Name, Artists.Surname
--HAVING COUNT(*) > 1
--HAVING Artists.Name like '%i%'

--SELECT COUNT(*) FROM Musics



-- Guya ft oxuyanlari yan yana getirdik
--SELECT a1.Name + ' ft. ' + a2.Name, Musics.Name FROM ArtistsMusics as T1
--JOIN ArtistsMusics as T2
--ON T1.MusicId = T2.MusicId
--JOIN Artists as a1
--ON a1.Id = T1.ArtistId
--JOIN Artists as a2
--ON a2.Id = T2.ArtistId
--JOIN Musics
--ON Musics.Id = T1.MusicId
--JOIN Genres
--ON Genres.Id = Musics.GenreId
--WHERE T1.ArtistId != T2.ArtistId


--SELECT * FROM 
--(SELECT Artists.Id, Artists.Name, Artists.Surname, Avg(Musics.Duration) as MusicCount FROM Artists
--JOIN ArtistsMusics
--ON Artists.Id = ArtistsMusics.ArtistId
--JOIN Musics
--ON Musics.Id = ArtistsMusics.MusicId
--JOIN Genres
--ON Genres.Id = Musics.GenreId
--GROUP BY Artists.Id, Artists.Name, Artists.Surname) as T1
--WHERE MusicCount > 200

--USE AzMB101
--CREATE TABLE Graduates
--(
--	Id int identity primary key,
--	Name nvarchar(25),
--	Surname nvarchar(30)
--)

--SELECT Name, Surname FROM Students
--INTERSECT
--SELECT Name, Surname FROM Graduates

--CREATE TABLE Test2
--(
--	Id int identity,
--	Name nvarchar(10)
--)
--CREATE CLUSTERED INDEX CLSTRD
--    ON Test2 (Id, Name)