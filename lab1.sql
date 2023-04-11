CREATE TABLE Event
(
Event_ID CHAR(4) NOT NULL PRIMARY KEY,
Description VARCHAR(40),
Event_Type VARCHAR(8) NOT NULL
	DEFAULT 'Indoor'
	CHECK(Event_Type IN ('Indoor', 'Outdoor')),
Target_Audience VARCHAR(30)
);
CREATE TABLE Client
(
Client_ID CHAR(5) NOT NULL PRIMARY KEY,
Client_Name VARCHAR(25),
Contact_Person VARCHAR(25),
Client_Phone VARCHAR(12),
Client_Email VARCHAR(25)
);
CREATE TABLE EventManager
(
Staff_ID CHAR(7) NOT NULL PRIMARY KEY,
Staff_Name VARCHAR(25),
Staff_Phone VARCHAR(12),
Staff_Email VARCHAR(20),
Staff_Gender CHAR(1)
	CHECK(Staff_Gender IN ('M', 'F'))
);
CREATE TABLE Equipment
(
Equipment_No CHAR(5) NOT NULL PRIMARY KEY,
Equipment_Desc VARCHAR(40),
Charge_Per_Day DECIMAL(7,2)
);
CREATE TABLE Engagement
(
Engagement_ID CHAR(5) NOT NULL PRIMARY KEY,
Engagement_Date DATE,
Event_Time TIME,
Event_Date DATE,
Duration DECIMAL(7,2),
Capacity INT,
Location VARCHAR(30),
Staff_ID CHAR(7) NOT NULL,
Event_ID CHAR(4) NOT NULL,
Client_ID CHAR(5) NOT NULL
);

ALTER TABLE Engagement ADD CONSTRAINT Staff_ID
FOREIGN KEY (Staff_ID)
REFERENCES EventManager(Staff_ID);
ALTER TABLE Engagement ADD CONSTRAINT Event_ID
FOREIGN KEY (Event_ID)
REFERENCES Event(Event_ID);
ALTER TABLE Engagement ADD CONSTRAINT Client_ID
FOREIGN KEY (Client_ID)
REFERENCES Client(Client_ID);
CREATE TABLE Equipment_Use
(
Engagement_ID CHAR(5) NOT NULL,
Equipment_No CHAR(5) NOT NULL,
PRIMARY KEY(Engagement_ID, Equipment_No)
);

ALTER TABLE Equipment_Use ADD CONSTRAINT Engagement_ID
FOREIGN KEY (Engagement_ID)
REFERENCES Engagement(Engagement_ID);
ALTER TABLE Equipment_Use ADD CONSTRAINT Equipment_No
FOREIGN KEY (Equipment_No)
REFERENCES Equipment(Equipment_No);
ALTER TABLE Engagement
ADD COLUMN Fee DECIMAL(7,2)
ADD COLUMN Discount DECIMAL(7,2);
CREATE VIEW Event_Out
AS SELECT * FROM Event
WHERE Event_Type = 'Outdoor'
WITH CHECK OPTION;

select * from sysibm.systables
where CREATOR = 'DB2ADMIN';

SELECT tbName, PKColNames, FkColNames
FROM SYSIBM.sysRels;
