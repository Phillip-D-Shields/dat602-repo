> ## 03/03/21

```sql
drop database if exists DAT602_one;
create database DAT602_one;
use DAT602_one;

SELECT round(RAND() * (3)) + 1 as TeamToPresent into @team;

select @team;

drop procedure if exists createdb;
delimiter //
create procedure createdb()
begin
	create table tblteam( 
		ID Int, 
		Name Varchar(255)
		);

	insert into tblteam(ID, Name)
	values( 1, 'TheGamblers'),(2,'The C team'), (3,'TeamName'),(4,'Teeeaaammmmm ');

	select * from tblTeam;
end //
delimiter ;

drop procedure if exists showTeamName;
delimiter //
create procedure showTeamName( IN pID INT)
begin
	select Name
	from tblTeam
	where ID = pID;
end //

delimiter ;

call createdb();
call showTeamName(@team);
```

> ## 03/08/21

```sql
DROP DATABASE IF EXISTS Toddles;
CREATE DATABASE Toddles;
USE Toddles;
DELIMITER //
DROP PROCEDURE IF EXISTS MakeTables//
CREATE PROCEDURE MakeTables()
BEGIN
    DROP TABLE IF EXISTS tblName;
	CREATE TABLE tblName(
						ID INT auto_increment PRIMARY KEY,  
						`NAME` VARCHAR(255)
	);
    
    DROP TABLE IF EXISTS tblCar;
    CREATE TABLE tblCar(
					ID INT auto_increment PRIMARY KEY, 
                    MODEL VARCHAR(255),
                    CARID INT,
                    foreign key(CARID) REFERENCES tblname(ID)
    );
END//
DELIMITER ;

call MakeTables();

INSERT INTO tblName( `NAME` ) 
VALUES ('BETSY'),('TEST 2');

INSERT INTO tblCar(Model,CARID) 
VALUES ('Morris Oxford',1),  ('Mini',1);


SELECT ID,NAME 
FROM tblName;

SELECT ID,MODEL,CARID
FROM tblCar;

SELECT tblCar.ID, NAME, MODEL
FROM tblName JOIN 
tblCar ON tblName.ID = tblCar.CARID;
```
