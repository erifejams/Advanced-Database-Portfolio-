drop table Apps_NOT_Normalized;
Create Table Apps_NOT_Normalized(
  App_No integer,
  StudentID integer,
  StudentName varchar(50),
  Street varchar(100),
  State varchar(30),
  ZipCode varchar(7),
  App_Year integer,
  ReferenceName varchar(100),
  RefInstitution  varchar(100),
  ReferenceStatement varchar(500),
  PriorSchoolId integer,
  PriorSchoolAddr varchar(100),
  GPA Integer -- 2
);

insert into Apps_NOT_Normalized values(1,1,'Mark','Grafton Street','New York','NY234',2013,'Dr. Jones','University of Dublin - Trinity College','Good guy',1,'Castleknock',65);
insert into Apps_NOT_Normalized values(1,1,'Mark','Grafton Street','New York','NY234',2014,'Dr. Jones','University of Dublin - Trinity College','Good guy',1,'Castleknock',65);
insert into Apps_NOT_Normalized values(2,1,'Mark','White Street','Florida','Flo435',2017,'Dr. Jones','University of Dublin - Trinity College','Good guy',1,'Castleknock',65);
insert into Apps_NOT_Normalized values(2,1,'Mark','White Street','Florida','Flo435',2017,'Dr. Jones','University of Dublin - Trinity College','Good guy',2,'Loreto College',87);
insert into Apps_NOT_Normalized values(3,1,'Mark','White Street','Florida','Flo435',2021,'Dr. Jones','University of Limerick','Very Good guy',1,'Castleknock',65);
insert into Apps_NOT_Normalized values(3,1,'Mark','White Street','Florida','Flo435',2021,'Dr. Jones','University of Limerick','Very Good guy',2,'Loreto College',87);
insert into Apps_NOT_Normalized values(2,2,'Sarah','Green Road','California','Cal123',2020,'Dr. Byrne','TU Dublin (formerly DIT)','Perfect',1,'Castleknock',90);
insert into Apps_NOT_Normalized values(2,2,'Sarah','Green Road','California','Cal123',2020,'Dr. Byrne','TU Dublin (formerly DIT)','Perfect',3,'St. Patrick',76);
insert into Apps_NOT_Normalized values(2,2,'Sarah','Green Road','California','Cal123',2019,'Dr. Byrne','TU Dublin (formerly DIT)','Perfect',1,'Castleknock',90);
insert into Apps_NOT_Normalized values(2,2,'Sarah','Green Road','California','Cal123',2019,'Dr. Byrne','TU Dublin (formerly DIT)','Perfect',3,'St. Patrick',76);
insert into Apps_NOT_Normalized values(2,2,'Sarah','Green Road','California','Cal123',2021,'Dr. Byrne','University College Dublin','Average',1,'Castleknock',90);
insert into Apps_NOT_Normalized values(2,2,'Sarah','Green Road','California','Cal123',2021,'Dr. Byrne','University College Dublin','Average',3,'St. Patrick',76);
insert into Apps_NOT_Normalized values(2,2,'Sarah','Green Road','California','Cal123',2021,'Dr. Byrne','University College Dublin','Average',4,'DBS',66);
insert into Apps_NOT_Normalized values(2,2,'Sarah','Green Road','California','Cal123',2021,'Dr. Byrne','University College Dublin','Average',5,'Harvard',45);
insert into Apps_NOT_Normalized values(1,3,'Paul','Red Crescent','Carolina','Ca455',2021,'Dr. Jones','University of Dublin - Trinity College','Poor',1,'Castleknock',45);
insert into Apps_NOT_Normalized values(1,3,'Paul','Red Crescent','Carolina','Ca455',2021,'Dr. Jones','University of Dublin - Trinity College','Poor',3,'St. Patrick',67);
insert into Apps_NOT_Normalized values(1,3,'Paul','Red Crescent','Carolina','Ca455',2021,'Dr. Jones','University of Dublin - Trinity College','Poor',4,'DBS',23);
insert into Apps_NOT_Normalized values(1,3,'Paul','Red Crescent','Carolina','Ca455',2021,'Dr. Jones','University of Dublin - Trinity College','Poor',5,'Harvard',67);
insert into Apps_NOT_Normalized values(3,3,'Paul','Yellow Park','Mexico','Mex1',2018,'Prof. Cahill','University College Cork','Excellent',1,'Castleknock',45);
insert into Apps_NOT_Normalized values(3,3,'Paul','Yellow Park','Mexico','Mex1',2018,'Prof. Cahill','University College Cork','Excellent',3,'St. Patrick',67);
insert into Apps_NOT_Normalized values(3,3,'Paul','Yellow Park','Mexico','Mex1',2018,'Prof. Cahill','University College Cork','Excellent',4,'DBS',23);
insert into Apps_NOT_Normalized values(3,3,'Paul','Yellow Park','Mexico','Mex1',2018,'Prof. Cahill','University College Cork','Excellent',5,'Harvard',67);
insert into Apps_NOT_Normalized values(1,4,'Jack','Dartry Road','Ohio','Oh34',2016,'Prof. Lillis','TU Dublin (formerly DIT)','Fair',3,'St. Patrick',29);
insert into Apps_NOT_Normalized values(1,4,'Jack','Dartry Road','Ohio','Oh34',2016,'Prof. Lillis','TU Dublin (formerly DIT)','Fair',4,'DBS',88);
insert into Apps_NOT_Normalized values(1,4,'Jack','Dartry Road','Ohio','Oh34',2016,'Prof. Lillis','TU Dublin (formerly DIT)','Fair',5,'Harvard',66);
insert into Apps_NOT_Normalized values(2,5,'Mary','Malahide Road','Ireland','IRE',2016,'Prof. Lillis','TU Dublin (formerly DIT)','Good girl',3,'St. Patrick',44);
insert into Apps_NOT_Normalized values(2,5,'Mary','Malahide Road','Ireland','IRE',2016,'Prof. Lillis','TU Dublin (formerly DIT)','Good girl',4,'DBS',55);
insert into Apps_NOT_Normalized values(2,5,'Mary','Malahide Road','Ireland','IRE',2016,'Prof. Lillis','TU Dublin (formerly DIT)','Good girl',5,'Harvard',66);
insert into Apps_NOT_Normalized values(2,5,'Mary','Malahide Road','Ireland','IRE',2016,'Prof. Lillis','TU Dublin (formerly DIT)','Good girl',1,'Castleknock',74);
insert into Apps_NOT_Normalized values(1,5,'Mary','Black Bay','Kansas','Kan45',2015,'Dr. Byrne','TU Dublin (formerly DIT)','Perfect',3,'St. Patrick',44);
insert into Apps_NOT_Normalized values(1,5,'Mary','Black Bay','Kansas','Kan45',2015,'Dr. Byrne','TU Dublin (formerly DIT)','Perfect',4,'DBS',55);
insert into Apps_NOT_Normalized values(1,5,'Mary','Black Bay','Kansas','Kan45',2015,'Dr. Byrne','TU Dublin (formerly DIT)','Perfect',5,'Harvard',66);
insert into Apps_NOT_Normalized values(3,6,'Susan','River Road','Kansas','Kan45',2019,'Prof. Cahill','University College Cork','Messy',1,'Castleknock',88);
insert into Apps_NOT_Normalized values(3,6,'Susan','River Road','Kansas','Kan45',2019,'Prof. Cahill','University College Cork','Messy',3,'St. Patrick',77);
insert into Apps_NOT_Normalized values(3,6,'Susan','River Road','Kansas','Kan45',2019,'Prof. Cahill','University College Cork','Messy',4,'DBS',56);
insert into Apps_NOT_Normalized values(3,6,'Susan','River Road','Kansas','Kan45',2019,'Prof. Cahill','University College Cork','Messy',2,'Loreto College',45);
commit;

select * from Apps_NOT_Normalized;


insert into School values(1,1, 2013, 1,'Castleknock',65);
insert into School values(1,1, 2014, 1,'Castleknock',65);
insert into School values(2,1, 2017, 1,'Castleknock',65);
insert into School values(2,1, 2017, 2,'Loreto College',87);
insert into School values(3,1, 2021, 1,'Castleknock',65);
insert into School values(3,1, 2021, 2,'Loreto College',87);
insert into School values(2,2, 2020, 1,'Castleknock',90);
insert into School values(2,2, 2020, 3,'St. Patrick',76);
insert into School values(2,2, 2019, 1,'Castleknock',90);
insert into School values(2,2, 2019, 3,'St. Patrick',76);
insert into School values(2,2, 2021, 1,'Castleknock',90);
insert into School values(2,2, 2021, 3,'St. Patrick',76);
insert into School values(2,2, 2021, 4,'DBS',66);
insert into School values(2,2, 2021, 5,'Harvard',45);
insert into School values(1,3, 2021, 1,'Castleknock',45);
insert into School values(1,3, 2021, 3,'St. Patrick',67);
insert into School values(1,3, 2021, 4,'DBS',23);
insert into School values(1,3, 2021, 5,'Harvard',67);
insert into School values(3,3, 2018, 1,'Castleknock',45);
insert into School values(3,3, 2018, 3,'St. Patrick',67);
insert into School values(3,3, 2018, 4,'DBS',23);
insert into School values(3,3, 2018, 5,'Harvard',67);
insert into School values(1,4, 2016, 3,'St. Patrick',29);
insert into School values(1,4, 2016, 4,'DBS',88);
insert into School values(1,4, 2016, 5,'Harvard',66);
insert into School values(2,5, 2016, 3,'St. Patrick',44);
insert into School values(2,5, 2016, 4,'DBS',55);
insert into School values(2,5, 2016, 5,'Harvard',66);
insert into School values(2,5, 2016, 1,'Castleknock',74);
insert into School values(1,5, 2015, 3,'St. Patrick',44);
insert into School values(1,5, 2015, 4,'DBS',55);
insert into School values(1,5, 2015, 5,'Harvard',66);
insert into School values(3,6, 2019, 1,'Castleknock',88);
insert into School values(3,6, 2019, 3,'St. Patrick',77);
insert into School values(3,6, 2019, 4,'DBS',56);
insert into School values(3,6, 2019,2,'Loreto College',45);
