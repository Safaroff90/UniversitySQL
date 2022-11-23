CREATE DATABASE University
USE University

CREATE TABLE Student
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR (30)  NOT NULL,
	Surname NVARCHAR (30)  NOT NULL,
	
)

INSERT INTO Student 
VALUES
('Sakhavat','Safarov'),
('Yusif','Huseyinzade'),
('Tahir','Tahirli'),
('Semender','Rzayev'),
('Seymur','Farhadov'),
('Eli','Pahayev'),
('Sabrina','Shukurova')
	
SELECT *FROM Student 

CREATE TABLE Groups
(
	Id INT PRIMARY KEY IDENTITY,
	No NVARCHAR(10)
)

INSERT INTO Groups
VALUES
('P132'),
('P124'),
('D155')

SELECT CONCAT(Student.Name,' ',Surname)AS 'Fullname',
GroupId,Groups.No AS 'GroupNo'
FROM Student
JOIN Groups
ON Student.GroupId=Groups.Id

ALTER TABLE Student
ADD GroupId INT CONSTRAINT FK_Students_GroupsId FOREIGN KEY REFERENCES Groups(Id)

CREATE TABLE Subjects
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(20)
)

INSERT INTO Subjects
VALUES
('Programming'),
('Design'),
('Architecture')

CREATE TABLE Exams
(
	Id INT PRIMARY KEY IDENTITY,
	Date DATETIME2
)
SELECT *FROM Exams

INSERT INTO Exams 
VALUES 
('2022-11-20 14:00',1),
('2022-11-19 14:00',2),
('2022-11-21 16:00',3)

ALTER TABLE Exams
ADD SubjectId INT CONSTRAINT FK_Exams_SubjectsId FOREIGN KEY REFERENCES Subjects(Id)



CREATE TABLE StudentExams
(
	Id INT PRIMARY KEY IDENTITY,
	Resault TINYINT
)


ALTER TABLE StudentExams
ADD StudentId INT CONSTRAINT FK_StudentExams_StudentId FOREIGN KEY REFERENCES Student(Id)

SELECT *FROM StudentExams

ALTER TABLE StudentExams
ADD ExamId INT CONSTRAINT FK_StudentExams_ExamId FOREIGN KEY REFERENCES Exams(Id)

INSERT INTO StudentExams
VALUES
(90,1,2),
(80,2,1),
(70,3,3),
(65,4,2),
(60,5,1),
(75,6,3),
(85,7,1)





SELECT Name,Surname,(SELECT COUNT(Id) FROM StudentExams WHERE StudentId=S.Id)AS 'ExamCount' FROM Student AS S


SELECT * FROM Subjects WHERE 0= (SELECT COUNT(Id) FROM Exams WHERE SubjectId=Subjects.Id)
 
 SELECT *, (SELECT AVG(Resault)FROM StudentExams WHERE StudentId=Student.Id)FROM Student

SELECT SE.id,SE.Resault, CONCAT(S.Name, ' ', S.Surname) AS 'FullName',G.No FROM StudentExams AS SE
JOIN Student AS S
ON S.Id = StudentId
	JOIN Groups AS G
	ON GroupId = G.Id
 