# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.


# Section 1
# Drops all tables.  This section should be amended as new tables are added.
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;
# ... 
#SET FOREIGN_KEY_CHECKS=1;


# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!
CREATE TABLE skills (
    id int not null,
    skills_name varchar(255) not null,
    skills_description varchar(255) not null,
    skills_tag varchar(255) not null,
    skills_url varchar(255),
    skills_time_commitment int,
    PRIMARY KEY(id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!
INSERT INTO skills (id, skills_name, skills_description, skills_tag, skills_url, skills_time_commitment) values
    (1, "Coding Java", "Coding in Java Language", "Skill 1", "java.com", 10),
    (2, "Coding C++", "Coding in C++ Language", "Skill 2", "C++.com", 10),
    (3, "Database Management", "Managing databases using SQL", "Skill 3", "database.com", 8),
    (4, "Web Development", "Building websites and web applications", "Skill 4", "webdev.com", 12),
    (5, "Data Analysis", "Analyzing and interpreting data", "Skill 5", "dataanalysis.com", 15),
    (6, "Graphic Design", "Creating visual content and graphics", "Skill 6", "graphicdesign.com", 10),
    (7, "Project Management", "Managing projects and teams", "Skill 7", "projectmanagement.com", 20),
    (8, "Mobile App Development", "Developing applications for mobile devices", "Skill 8", "mobileapp.com", 15);


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.
CREATE TABLE people (
    id int,
    people_last_name varchar(255) not null,
    people_email varchar(255),
    linkedin_url varchar(255),
    headshot_url varchar(255), 
    discord_handle varchar(255),
    brief_bio varchar(255),
    date_joined date not null,
    PRIMARY KEY (id)
);


# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.
INSERT INTO people (id, people_last_name, people_email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) values 
    (1,'Person 1', 'JohnSnow@gmail.com', 'linkedin@JS.com', 'JohnSnowheadhot.com', 'John_Snow', 'I am John Snow', '2023-10-17'),
    (2,'Person 2', 'AryaStark@gmail.com', 'linkedin@AS.com', 'AryaStarkheadshot.com', 'Arya_Stark', 'I am Arya Stark', '2023-10-18'),
    (3,'Person 3', 'TyrionLannister@gmail.com', 'linkedin@TL.com', 'TyrionLannisterheadshot.com', 'Tyrion_Lannister', 'I am Tyrion Lannister', '2023-10-19'),
    (4,'Person 4', 'DaenerysTargaryen@gmail.com', 'linkedin@DT.com', 'DaenerysTargaryenheadshot.com', 'Daenerys_Targaryen', 'I am Daenerys Targaryen', '2023-10-20'),
    (5,'Person 5', 'TheonGreyjoy@gmail.com', 'linkedin@TG.com', 'TheonGreyjoyheadshot.com', 'Theon_Greyjoy', 'I am Theon Greyjoy', '2023-10-21'),
    (6,'Person 6', 'MargaeryTyrell@gmail.com', 'linkedin@MT.com', 'MargaeryTyrellheadshot.com', 'Margaery_Tyrell', 'I am Margaery Tyrell', '2023-10-22'),
    (7,'Person 7', 'OberynMartell@gmail.com', 'linkedin@OM.com', 'OberynMartellheadshot.com', 'Oberyn_Martell', 'I am Oberyn Martell', '2023-10-23'),
    (8,'Person 8', 'RobertBaratheon@gmail.com', 'linkedin@RB.com', 'RobertBaratheonheadshot.com', 'Robert_Baratheon', 'I am Robert Baratheon', '2023-10-24'),
    (9,'Person 9', 'SandorClegane@gmail.com', 'linkedin@SC.com', 'SandorCleganeheadshot.com', 'Sandor_Clegane', 'I am Sandor Clegane', '2023-10-25'),
    (10,'Person 10', 'CatelynTully@gmail.com', 'linkedin@CT.com', 'CatelynTullyheadshot.com', 'Catelyn_Tully', 'I am Catelyn Tully', '2023-10-26');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.
CREATE TABLE peopleskills (
    peopleskills_id int not null auto_increment,
    people_id int,
    skills_id int,
    date_acquired date,
    PRIMARY KEY(peopleskills_id),
    FOREIGN KEY(skills_id) references skills (id),
    FOREIGN KEY(people_id) references people (id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
INSERT INTO peopleskills(people_id, skills_id, date_acquired) values
    (1,1,'2023-11-10'),
    (1,3,'2023-11-10'),
    (1,6,'2023-11-10'),
    (2,3,'2023-11-10'),
    (2,4,'2023-11-10'),
    (2,5,'2023-11-10'),
    (3,1,'2023-11-10'),
    (3,5,'2023-11-10'),
    (5,3,'2023-11-10'),
    (5,6,'2023-11-10'),
    (6,2,'2023-11-10'),
    (6,3,'2023-11-10'),
    (6,4,'2023-11-10'),
    (7,3,'2023-11-10'),
    (7,5,'2023-11-10'),
    (7,6,'2023-11-10'),
    (8,1,'2023-11-10'),
    (8,3,'2023-11-10'),
    (8,5,'2023-11-10'),
    (8,6,'2023-11-10'),
    (9,2,'2023-11-10'),
    (9,5,'2023-11-10'),
    (9,6,'2023-11-10'),
    (10,1,'2023-11-10'),
    (10,4,'2023-11-10'),
    (10,5,'2023-11-10');


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles
CREATE TABLE roles (
    roles_id int not null,
    roles_name varchar(255) not null,
    sort_priority int not null,
    PRIMARY KEY (roles_id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)
INSERT INTO roles(roles_id, roles_name, sort_priority) values
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment
CREATE TABLE peopleroles (
    peopleroles_id int not null auto_increment,
    people_id int not null,
    role_id int not null,
    date_assigned date not null,
    PRIMARY KEY(peopleroles_id),
    FOREIGN KEY(people_id) references people(id),
    FOREIGN KEY(role_id) references roles(roles_id)
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer
INSERT INTO peopleroles(people_id, role_id, date_assigned) values 
    (1,2,'2023-11-11'),
    (2,5,'2023-11-11'),
    (2,6,'2023-11-11'),
    (3,1,'2023-11-11'),
    (3,4,'2023-11-11'),
    (4,3,'2023-11-11'),
    (5,3,'2023-11-11'),
    (6,2,'2023-11-11'),
    (6,1,'2023-11-11'),
    (7,1,'2023-11-11'),
    (8,1,'2023-11-11'),
    (8,4,'2023-11-11'),
    (9,2,'2023-11-11'),
    (10,2,'2023-11-11'),
    (10,1,'2023-11-11');
