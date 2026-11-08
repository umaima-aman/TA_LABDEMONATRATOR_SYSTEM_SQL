DROP SCHEMA IF EXISTS  taandldsystem ;
CREATE SCHEMA  taandldsystem ;
USE taandldsystem;
CREATE TABLE user (
  User_ID INT NOT NULL,
  password VARCHAR(45) NOT NULL UNIQUE ,
  PRIMARY KEY (User_ID)
  );
  -- CREATE ADMINISTRATOR TABLE 
CREATE TABLE administrator (
  Admin_ID INT NOT NULL,
  Ranks VARCHAR(45) NOT NULL,
  Contact VARCHAR(45) ,
  Fname VARCHAR(45) NOT NULL,
  Minit VARCHAR(45) ,
  Lname VARCHAR(45) NOT NULL,
  UserID INT NOT NULL,
  Adm_password VARCHAR(45) NOT NULL,
  UNIQUE INDEX Admin_ID_UNIQUE (Admin_ID ASC) VISIBLE,
  PRIMARY KEY (Admin_ID),
  UNIQUE INDEX UserID_UNIQUE (UserID ASC) VISIBLE,
  CONSTRAINT UseID
    FOREIGN KEY (UserID)
    REFERENCES user (User_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    -- create table faculty 
    CREATE TABLE faculty (
  Fac_ID INT NOT NULL,
  Fname VARCHAR(45) NOT NULL,
  Minit VARCHAR(45) ,
  Lname VARCHAR(45) ,
  dept VARCHAR(45) ,
  Office_location VARCHAR(45) ,
  contact VARCHAR(45) NULL,
  Academic_Rank VARCHAR(45) ,
  Fac_password VARCHAR(45) ,
  UserID INT NOT NULL UNIQUE ,
  UNIQUE INDEX Fac_ID_UNIQUE (Fac_ID ASC) VISIBLE,
  PRIMARY KEY (Fac_ID),
  INDEX UserID_idx (UserID ASC) VISIBLE,
  CONSTRAINT UserID
    FOREIGN KEY (UserID)
REFERENCES user (User_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    -- create table taandld
    CREATE TABLE taandld (
  ID INT NOT NULL,
  course VARCHAR(45) ,
  Fname VARCHAR(45) NOT NULL,
  Minit VARCHAR(45) ,
  Lname VARCHAR(45) ,
  credits INT NOT NULL,
  TAandLD_password VARCHAR(45) NULL,
  TaUserID INT NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE INDEX ID_UNIQUE (ID ASC) VISIBLE,
  UNIQUE INDEX UserID_UNIQUE (TaUserID ASC) VISIBLE,
  CONSTRAINT TaUserID
    FOREIGN KEY (TaUserID)
    REFERENCES user(User_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    -- create table feedback
    CREATE TABLE feedback (
  Feed_id INT NOT NULL,
  Text VARCHAR(45) ,
  Stars INT ,
  Date DATE ,
  TAandLD_ID INT NOT NULL,
  F_ID INT NOT NULL,
  UNIQUE INDEX Feed_id_UNIQUE (Feed_id ASC) VISIBLE,
  PRIMARY KEY (Feed_id),
  UNIQUE INDEX TAandLD_ID_UNIQUE (TAandLD_ID ASC) VISIBLE,
  CONSTRAINT TAandLD_ID
    FOREIGN KEY (TAandLD_ID)
    REFERENCES taandld (ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT F_ID
    FOREIGN KEY (F_ID)
    REFERENCES faculty (Fac_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    -- create table task 
CREATE TABLE task (
  Task_ID INT NOT NULL,
  Name VARCHAR(45) NOT NULL,
  Start_date DATE NOT NULL,
 End_date   DATE NOT NULL,
  FacID INT ,
  AdminID INT ,
  PRIMARY KEY (Task_ID),
  UNIQUE INDEX Task_ID_UNIQUE (Task_ID ASC) VISIBLE,
  INDEX Facid_idx (FacID ASC) VISIBLE,
  INDEX AdminID_idx (AdminID ASC) VISIBLE,
  CONSTRAINT Facid
    FOREIGN KEY (FacID)
    REFERENCES faculty (Fac_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT AdminID
    FOREIGN KEY (AdminID)
    REFERENCES administrator (Admin_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    -- Create table submissions
CREATE TABLE submissions (
  Sub_ID INT NOT NULL,
  Date DATE NULL,
  Feedback VARCHAR(45) ,
  Status VARCHAR(45) ,
  TaskID INT ,
  PRIMARY KEY (Sub_ID),
  UNIQUE INDEX Sub_ID_UNIQUE(Sub_ID ASC) VISIBLE,
  INDEX TaskID_idx (TaskID ASC) VISIBLE,
  CONSTRAINT TaskID
    FOREIGN KEY (TaskID)
    REFERENCES task (Task_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    -- create table assigned_to
    CREATE TABLE assigned_to (
  TALD_ID INT NOT NULL,
  TasksID INT NOT NULL,
  UNIQUE INDEX TALD_ID_UNIQUE (TALD_ID ASC) VISIBLE,
  PRIMARY KEY (TALD_ID, TasksID),
  UNIQUE INDEX TasksID_UNIQUE (TasksID ASC) VISIBLE,
  CONSTRAINT TALD_ID
    FOREIGN KEY (TALD_ID)
    REFERENCES taandld (ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT TasksID
    FOREIGN KEY (TasksID)
    REFERENCES task (Task_ID )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    -- create table availability 
CREATE TABLE availability (
  Availability VARCHAR(45) NOT NULL,
  TAandLDID INT NOT NULL,
  PRIMARY KEY (Availability, TAandLDID),
  UNIQUE INDEX TAandLDID_UNIQUE (TAandLDID ASC) VISIBLE,
  CONSTRAINT TAandLDID
    FOREIGN KEY (TAandLDID)
    REFERENCES taandld (ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    -- create table attachemnts 
CREATE TABLE attachments (
  Attachments VARCHAR(45) NOT NULL,
  SubID INT ,
  UNIQUE INDEX Attachments_UNIQUE (Attachments ASC) VISIBLE,
  PRIMARY KEY (Attachments),
  INDEX SubID_idx (SubID ASC) VISIBLE,
  CONSTRAINT SubID
    FOREIGN KEY (SubID)
    REFERENCES submissions (Sub_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    -- user table
    INSERT INTO USER (User_ID, Password) VALUES
(6, 'user_password_4'),
(7, 'user_password_5'),
(8, 'user_password_6'),
(9, 'user_password_7'),
(10, 'user_password_8');
    
    
    -- ADMINISTRATOR table
INSERT INTO ADMINISTRATOR (Admin_ID,ranks,Contact, Fname, Minit, Lname, UserID, Adm_password) VALUES
(1, 'Rank4','admin_contact_4','Admin4','M4', 'L4',  6, 'admin_password_4'),
(2, 'Rank5','admin_contact_5','Admin5', 'M5', 'L5',   7, 'admin_password_5'),
(3, 'Rank6','admin_contact_6','Admin6', 'M6', 'L6', 8, 'admin_password_6'),
(4, 'Rank7','admin_contact_7','Admin7', 'M7', 'L7', 9, 'admin_password_7'),
(5, 'Rank8','admin_contact_8','Admin8', 'M8', 'L8',  10, 'admin_password_8');



-- FACULTY table
INSERT INTO FACULTY (Fac_ID, Fname, Minit, Lname, dept, Office_Location,contact, Academic_Rank, Fac_password,UserID) VALUES
(11, 'Faculty4', 'M4', 'L4', 'Dept4',  'office_location_4','faculty_contact_4', 'Academic_rank_4','faculty_password_4',6),
(12, 'Faculty5', 'M5', 'L5', 'Dept5',  'office_location_5','faculty_contact_5', 'Academic_rank_5', 'faculty_password_5',7),
(13, 'Faculty6', 'M6', 'L6', 'Dept6',  'office_location_6', 'faculty_contact_6','Academic_rank_6', 'faculty_password_6',8),
(14, 'Faculty7', 'M7', 'L7', 'Dept7',  'office_location_7','faculty_contact_7', 'Academic_rank_7', 'faculty_password_7',9),
(15, 'Faculty8', 'M8', 'L8', 'Dept8',  'office_location_8', 'faculty_contact_8','Academic_rank_8',  'faculty_password_8',10);



-- TA_LAB table
INSERT INTO taandld (ID, course, Fname, Minit, Lname, credits, TAandLD_password,TaUserID) VALUES
(16, 'Course4', 'TA4', 'M4', 'L4', 3,'ta_lab_password_4', 6),
(17, 'Course5', 'TA5', 'M5', 'L5', 4,'ta_lab_password_5', 7),
(18, 'Course6', 'TA6', 'M6', 'L6', 3, 'ta_lab_password_6',8),
(19, 'Course7', 'TA7', 'M7', 'L7', 4, 'ta_lab_password_7',9),
(20, 'Course8', 'TA8', 'M8', 'L8', 3,'ta_lab_password_8', 10);



-- FEEDBACK table
INSERT INTO FEEDBACK (Feed_id, Text, Stars, Date, TAandLD_ID, F_ID) VALUES
(21, 'Average feedback', 3, '2023-04-01', 16, 11),
(22, 'Good feedback', 4, '2023-05-01', 17, 12),
(23, 'Excellent feedback', 5, '2023-06-01', 18, 13),
(24, 'Good feedback', 4, '2023-07-01', 19, 14),
(25, 'Excellent feedback', 5, '2023-08-01', 20, 15);



-- TASK table
INSERT INTO TASK (Task_ID, Name, Start_date, End_date, FacID, AdminID) VALUES
(26, 'Task4', '2023-04-01', '2023-04-10', 11, 1),
(27, 'Task5', '2023-05-01', '2023-05-10', 12, 2),
(28, 'Task6', '2023-06-01', '2023-06-10', 13, 3),
(29, 'Task7', '2023-07-01', '2023-07-10', 14, 4),
(30, 'Task8', '2023-08-01', '2023-08-10', 15, 5);



-- SUBMISSIONS table
INSERT INTO SUBMISSIONS (Sub_ID, Date, Feedback, Status, TaskID) VALUES
(31, '2023-04-05', 'Average submission', 'Completed', 26),
(32, '2023-05-05', 'Good submission', 'Pending', 27),
(33, '2023-06-05', 'Excellent submission', 'Completed', 28),
(34, '2023-07-05', 'Good submission', 'Pending', 29),
(35, '2023-08-05', 'Excellent submission', 'Completed', 30);


-- ASSIGNED_TO table
INSERT INTO ASSIGNED_TO (TALD_ID, TasksID) VALUES
(16, 26),
(17, 27),
(18, 28),
(19, 29),
(20, 30);

-- AVAILABILITY table
INSERT INTO Availability (Availability, TAandLDID) VALUES
('Available', 16),
('Not Available', 17),
('Available', 18),
('Not Available', 19),
('Available', 20);

-- Attachments table
INSERT INTO Attachments (Attachments, SubID) VALUES
('attachment_4', 31),
('attachment_5', 32),
('attachment_6', 33),
('attachment_7', 34),
('attachment_8', 35);
 
    -- DISPLAY TABLES
    select * from User;
    select * from administrator;
    select * from faculty;
    select * from taandld;
    select * from feedback;
    select* from  task;
    select * from submissions;
    select * from assigned_to;
    select * from availability;
    select * from attachments;
-- Find TA's and LD's with more than the average number of credits in the TAandLD table.

SELECT Fname, credits
FROM taandld
WHERE credits > (SELECT AVG(credits) FROM taandld);


-- Retrieve administrators who have not assigned tasks 

SELECT *
FROM administrator
WHERE Admin_ID NOT IN (SELECT DISTINCT AdminID FROM task);
 
-- Retrieve tasks assigned to faculty members in the 'Dept4' department.

SELECT *
FROM task
WHERE FacID IN (SELECT Fac_ID FROM faculty WHERE dept = 'Dept4');

-- Retrieve administrators who have assigned tasks to faculty members in the 'Dept6' department.


SELECT *
FROM administrator
WHERE Admin_ID IN (SELECT DISTINCT AdminID FROM task WHERE FacID IN (SELECT Fac_ID FROM faculty WHERE dept = 'Dept6'));

-- Retrieve faculty members with at least one feedback:

SELECT Fname,Minit, Lname
FROM faculty
WHERE Fac_ID IN (SELECT DISTINCT F_ID FROM feedback);

-- Retrieve administrators who have assigned more than 3 tasks:

SELECT Admin_ID, Fname, Lname, COUNT(*) AS TaskCount
FROM administrator
JOIN task ON administrator.Admin_ID = task.AdminID
GROUP BY Admin_ID
HAVING TaskCount > 3;

-- ount the number of submissions for each task and display only those with more than 2 submissions:

SELECT TaskID, COUNT(*) AS SubmissionCount
FROM submissions
GROUP BY TaskID
HAVING SubmissionCount > 2;

-- Count the number of attachments for each submission and display only those with more than 1 attachment:

SELECT SubID, COUNT(*) AS AttachmentCount
FROM attachments
GROUP BY SubID
HAVING AttachmentCount > 1;

-- Find the TAandLDs with more than 2 credits

SELECT TaUserID
FROM taandld
GROUP BY TaUserID
HAVING MIN(credits) > 2;

-- Calculate the total number of submissions for each task, excluding tasks with less than 2 submissions:

SELECT TaskID, COUNT(*) AS SubmissionCount
FROM submissions
GROUP BY TaskID
HAVING SubmissionCount >= 2;


-- DISLAY ATTACHEMENTS WITH ASSOCIATED SUBMISSIONS 
Select attachments.Attachments, submissions.Sub_ID, submissions.Date, submissions.Feedback, submissions.Status
From attachments 
Join submissions ON attachments.SubID=submissions.Sub_ID;


 -- List TA/ld availability with feedback 
 Select taandld.Fname as TA_LD_Firstname,
   taandld.Lname as TA_LD_Firstname,
  availability.Availability,
  feedback.Text as textinfeedback
  from taandld
  Join availability on taandld.ID= availability.TAandLDID
 left join feedback on taandld.ID =feedback.TAandLD_ID;
 
 -- admin with unassigned tasks 
 select administrator.Admin_ID,
 administrator.Ranks,
 administrator.Contact,
 administrator.Fname,
 administrator.Minit,
 administrator.Lname
 from administrator 
 left join task ON administrator.Admin_ID = task.AdminID
where task.Task_ID IS NULL;

 
-- List task with submission details 
SELECT task.Name as TASKNAME,
submissions.Sub_ID,
submissions.SUB_ID,
submissions.Date as submissiondate,
    submissions.Feedback,
    submissions.Status
from task 
join submissions on task.Task_ID = submissions.TaskId;

-- ta with feedback 
select  taandld.Fname as ta_ld_firstname,
taandld.Lname as ta_ld_lastname,
    availability.Availability,
    feedback.Text as text 
from taandld
join availability on taandld.ID = availability.TAandLDID
left join feedback on taandld.ID =feedback.TAandLD_ID;
  
  
  -- faculty names with department assigned 
  select faculty.Fname as faculty_firstname,
   faculty.Fname as faculty_lasttname,
    task.Name AS Task_Name
from faculty 
join assigned_to on faculty.Fac_ID =assigned_to.TALD_ID
join task on assigned_to.TasksID =task.Task_ID
where faculty.dept ='Dept 5';

--
select task.Name AS Task_Name,
    submissions.Sub_ID,
    submissions.Status
from task join
    submissions ON task.Task_ID = submissions.TaskID;

-- additioanl info about assigned faculty  
select task.Task_ID,
    task.Name as TaskName,
    assigned_to.TALD_ID,
    faculty.Fac_ID,
    faculty.Fname as Faculty_First_name,
    faculty.Lname as Faculty_Last_name
from task
   join  assigned_to ON task.Task_ID = assigned_to.TasksID
join faculty ON assigned_to.TALD_ID = faculty.Fac_ID;

-- Display ta/ld , administrator and task details 
select administrator.Ranks as Admin_Rank,
taandld.Fname as ta_LD_FirstName,
taandld.Lname as ta_LD_LastName,
task.Name as Task_Name
From administrator 
join taandld on administrator.UserID = taandld.TaUserID
join assigned_to on taandld.ID= assigned_to.TALD_ID
join task on assigned_to.TasksID =task.Task_ID;


-- List task details with administratot ,TA_LD
select task.Name as Task_Name,
taandld.Fname as TA_LD_Firstname,
taandld.Lname as TA_LD_Lastname,
administrator.Ranks as Admin_Rank
from task 
join assigned_to on Task_ID=assigned_to.TasksID
join taandld on assigned_to.TALD_ID =taandld.ID
join administrator on task.AdminID = administrator.Admin_ID;





-- for A task display administrator,ta and faculty details 
select task.name as Task_Name,
administrator.Ranks as Admin_Rank,
taandld.Fname AS TA_LD_FirstNmame,
    taandld.Lname AS TA_LD_LastName,
    faculty.Fname AS Faculty_FirstName,
    faculty.Lname AS Faculty_LastName
FROM  task
join administrator on task.AdminID =administrator.Admin_ID
join assigned_to on task.Task_ID =assigned_to.TasksID
join taandld ON assigned_to.TALD_ID = taandld.ID
left join faculty on assigned_to.TALD_ID=faculty.Fac_ID
where task.Task_ID= 28;
   

-- Retreive submissions information with TA/LD ,attachment and TASK

SELECT
    s.Sub_ID,
    s.Date AS Submission_Date,
    s.Feedback,
    s.Status,
    t.Task_ID,
    t.Name AS Task_Name,
    a.Attachments AS Attachment_Details,
    ta.Fname AS TA_LD_FirstName,
    ta.Lname AS TA_LD_LastName
from submissions s
join task t ON s.TaskID = t.Task_ID
join assigned_to at ON t.Task_ID = at.TasksID
JOIN taandld ta ON at.TALD_ID = ta.ID
LEFT join attachments a ON s.Sub_ID = a.SubID;



-- information about faculty members, their associated user details, and tasks they may be assigned to.
 SELECT
    f.Fac_ID,
    f.Fname,
    f.Minit,
    f.Lname,
    f.dept,
    f.Office_location,
    f.contact,
    f.Academic_Rank,
    u.password AS User_Password,
    t.Task_ID,
    t.Name AS Task_Name,
    t.Start_date AS Task_Start_date,
    t.End_date AS Task_End_date
FROM
    faculty f
JOIN
    user u ON f.UserID = u.User_ID
LEFT JOIN
    task t ON f.Fac_ID = t.FacID;


    -



    

