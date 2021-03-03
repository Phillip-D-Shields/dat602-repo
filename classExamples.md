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
