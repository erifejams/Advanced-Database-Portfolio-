-- Dropping tables
DROP TABLE Student;
DROP TABLE Application;
DROP TABLE Referee;
DROP TABLE School;
DROP TABLE StudentAddress;
DROP TABLE AppReference;
DROP TABLE schoolStudent;

-- Creating Tables
CREATE TABLE Student(
	StudentID integer,
	StudentName varchar(50)
);

ALTER TABLE Student ADD CONSTRAINT Student_pk PRIMARY KEY(StudentID, StudentName);

CREATE TABLE Application(
	StudentID integer,
	App_No integer,
	App_Year integer
);

ALTER TABLE Application ADD CONSTRAINT Application_pk PRIMARY KEY(StudentID, App_No, App_Year); 

CREATE TABLE Referee(
	App_No integer,
    StudentID integer,
	ReferenceName varchar(100),
	RefInstitution  varchar(100),
	ReferenceStatement varchar(500) 
);

ALTER TABLE Referee ADD CONSTRAINT Referee_pk PRIMARY KEY(StudentID, App_No, ReferenceStatement); 

CREATE TABLE School(
	PriorSchoolId integer,
	PriorSchoolAddr varchar(100),
	GPA Integer -- 2
);

ALTER TABLE School ADD CONSTRAINT School_pk PRIMARY KEY(PriorSchoolId, PriorSchoolAddr, GPA); 

CREATE TABLE StudentAddress(
	StudentID integer,
	Street varchar(100) PRIMARY KEY,
	State varchar(30),
	ZipCode varchar(7)
);

-- CREATE TABLE AppReference
-- linkk to the app
-- lik to the referee
-- an application can have more than one references
CREATE TABLE AppReference(
	App_No integer,
	StudentID integer,
	ReferenceStatement varchar(500) 
);

ALTER TABLE AppReference ADD CONSTRAINT AppReference_pk PRIMARY KEY(StudentID, App_No, ReferenceStatement);
    
-- another schoolStudentStudent table
-- that should sort out the interlinking problem and repeating
CREATE TABLE schoolStudent(
	App_No integer,
	StudentID integer,
	App_Year integer,
	PriorSchoolId integer,
    GPA Integer -- 2
	-- foreign key contrainst on this table usign this attribute
	-- primary key is a combination of all three
	-- compound primary key
	-- constraint & reference look up on the internet
	--  e.g constraint whatever you want to name it PRIMARY KEY(StudentID, App_No integer, PriorschoolStudentAddr )

);

ALTER TABLE schoolStudent ADD CONSTRAINT schoolStudent_pk PRIMARY KEY(StudentID, App_No, App_Year, PriorSchoolId);


-- Inserting into tables
insert into Student values(1,'Mark');
insert into Student values(2,'Sarah');
insert into Student values(3,'Paul');
insert into Student values(4,'Jack');
insert into Student values(5,'Mary');
insert into Student values(6,'Susan');


insert into Application values(1,1, 2013);
insert into Application values(1,1, 2014);
insert into Application values(2,1, 2017);
insert into Application values(3,1, 2021);
insert into Application values(2,2, 2020);
insert into Application values(2,2, 2019);
insert into Application values(2,2, 2021);
insert into Application values(1,3, 2021);
insert into Application values(3,3, 2018);
insert into Application values(1,4, 2016);
insert into Application values(2,5, 2016);
insert into Application values(1,5, 2015);
insert into Application values(3,6, 2019);

insert into Referee values(1,1, 'Dr. Jones','University of Dublin - Trinity College','Good guy');
insert into Referee values(2,1, 'Dr. Jones','University of Dublin - Trinity College','Good guy');
insert into Referee values(3,1, 'Dr. Jones','University of Limerick','Very Good guy');
insert into Referee values(2,2, 'Dr. Byrne','TU Dublin (formerly DIT)','Perfect');
insert into Referee values(2,2, 'Dr. Byrne','University College Dublin','Average');
insert into Referee values(1,3, 'Dr. Jones','University of Dublin - Trinity College','Poor');
insert into Referee values(3,3, 'Prof. Cahill','University College Cork','Excellent');
insert into Referee values(1,4, 'Prof. Lillis','TU Dublin (formerly DIT)','Fair');
insert into Referee values(2,5, 'Prof. Lillis','TU Dublin (formerly DIT)','Good girl');
insert into Referee values(1,5, 'Dr. Byrne','TU Dublin (formerly DIT)','Perfect');
insert into Referee values(3,6, 'Prof. Cahill','University College Cork','Messy');

insert into School values(1,'Castleknock',65);
insert into School values(2,'Loreto College',87);
insert into School values(1,'Castleknock',90);
insert into School values(3,'St. Patrick',76);
insert into School values(4,'DBS',66);
insert into School values(5,'Harvard',45);
insert into School values(1,'Castleknock',45);
insert into School values(3,'St. Patrick',67);
insert into School values(4,'DBS',23);
insert into School values(5,'Harvard',67);
insert into School values(3,'St. Patrick',67);
insert into School values(3,'St. Patrick',29);
insert into School values(4,'DBS',88);
insert into School values(5,'Harvard',66);
insert into School values(3,'St. Patrick',44);
insert into School values(4,'DBS',55);
insert into School values(1,'Castleknock',74);
insert into School values(1,'Castleknock',88);
insert into School values(3,'St. Patrick',77);
insert into School values(4,'DBS',56);
insert into School values(2,'Loreto College',45);
 
 
insert into StudentAddress values(1, 'Grafton Street','New York','NY234');
insert into StudentAddress values(1, 'White Street','Florida','Flo435');
insert into StudentAddress values(2, 'Green Road','California','Cal123');
insert into StudentAddress values(3, 'Red Crescent','Carolina','Ca455');
insert into StudentAddress values(3, 'Yellow Park','Mexico','Mex1');
insert into StudentAddress values(4, 'Dartry Road','Ohio','Oh34');
insert into StudentAddress values(5, 'Malahide Road','Ireland','IRE');
insert into StudentAddress values(5, 'Black Bay','Kansas','Kan45');
insert into StudentAddress values(6, 'River Road','Kansas','Kan45');
 
insert into schoolStudent values(1,1, 2013, 1, 65);
insert into schoolStudent values(1,1, 2014, 1, 65);
insert into schoolStudent values(2,1, 2017, 1, 65);
insert into schoolStudent values(2,1, 2017, 2, 87);
insert into schoolStudent values(3,1, 2021, 1, 65);
insert into schoolStudent values(3,1, 2021, 2, 87);
insert into schoolStudent values(2,2, 2020, 1, 90);
insert into schoolStudent values(2,2, 2020, 3, 76);
insert into schoolStudent values(2,2, 2019, 1, 90);
insert into schoolStudent values(2,2, 2019, 3, 76);
insert into schoolStudent values(2,2, 2021, 1, 90);
insert into schoolStudent values(2,2, 2021, 3, 76);
insert into schoolStudent values(2,2, 2021, 4, 66);
insert into schoolStudent values(2,2, 2021, 5, 45);
insert into schoolStudent values(1,3, 2021, 1, 45);
insert into schoolStudent values(1,3, 2021, 3, 67);
insert into schoolStudent values(1,3, 2021, 4, 23);
insert into schoolStudent values(1,3, 2021, 5, 67);
insert into schoolStudent values(3,3, 2018, 1, 45);
insert into schoolStudent values(3,3, 2018, 3, 67);
insert into schoolStudent values(3,3, 2018, 4, 23);
insert into schoolStudent values(3,3, 2018, 5, 67);
insert into schoolStudent values(1,4, 2016, 3, 29);
insert into schoolStudent values(1,4, 2016, 4, 88);
insert into schoolStudent values(1,4, 2016, 5, 66);
insert into schoolStudent values(2,5, 2016, 3, 44);
insert into schoolStudent values(2,5, 2016, 4, 55);
insert into schoolStudent values(2,5, 2016, 5, 66);
insert into schoolStudent values(2,5, 2016, 1, 74);
insert into schoolStudent values(1,5, 2015, 3, 44);
insert into schoolStudent values(1,5, 2015, 4, 55);
insert into schoolStudent values(1,5, 2015, 5, 66);
insert into schoolStudent values(3,6, 2019, 1, 88);
insert into schoolStudent values(3,6, 2019, 3, 77);
insert into schoolStudent values(3,6, 2019, 4, 56);
insert into schoolStudent values(3,6, 2019, 2, 45);

insert into AppReference values(1,1, 'Good guy');
insert into AppReference values(2,1, 'Good guy');
insert into AppReference values(3,1, 'Very Good guy');
insert into AppReference values(2,2, 'Perfect');
insert into AppReference values(2,2, 'Average');
insert into AppReference values(1,3, 'Poor');
insert into AppReference values(3,3, 'Excellent');
insert into AppReference values(1,4, 'Fair');
insert into AppReference values(2,5, 'Good girl');
insert into AppReference values(1,5, 'Perfect');
insert into AppReference values(3,6, 'Messy');

commit;


-- printing out tables
SELECT * FROM Student;
SELECT * FROM Application;
SELECT * FROM Referee;
SELECT * FROM School;
SELECT * FROM StudentAddress;
SELECT * FROM AppReference;
SELECT * FROM schoolStudent;