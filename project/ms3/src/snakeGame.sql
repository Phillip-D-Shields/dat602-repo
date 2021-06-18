DROP DATABASE if exists SNAKE;

create database SNAKE;

USE SNAKE;

drop procedure if exists createTables;
delimiter // 
create procedure createTables()
begin
	create table tblBoard (
		ID int auto_increment primary key,
        GRID_SIZE int
    );
    
    create table tblSnake (
		ID int auto_increment primary key,
        HeadID int,
        TailID int,
		BoardId int,
			foreign key(BoardID)
			references tblBoard(ID)
    );
    
    create table tblSnakeSegment (
		ID int auto_increment primary key,
        X int,
        Y int,
        SnakeID int,
			foreign key(SnakeID)
			references tblSnake(ID)
    );
    
    create table tblPlayer (
		ID int auto_increment primary key,
        PlayerName varchar(15),
        PlayerEmail varchar(35),
        PlayerPassword varchar(30),
        -- other attributes
        SnakeID int,
			foreign key(SnakeID)
			references tblSnake(ID)
    );
    
    -- add additional fk references by altering tables (DML)
    alter table tblSnake
    add foreign key(TailID)
    references tblSnakeSegment(ID);
    
    alter table tblSnake
    add foreign key(HeadID)
    references tblSnakeSegment(ID);
    
end//

delimiter ;

call createTables();

drop procedure if exists insertTestData;
delimiter // 
create procedure insertTestData()
begin

    -- 1st series -------------------------------------------------
	
    -- insert board data
    insert into tblBoard(GRID_SIZE)
    values (50);
    
    set @BoardID = last_insert_id();
    
    -- insert snake data
    insert into tblSnake(BoardID)
    values (@BoardID);
    
    set @SnakeID = last_insert_id();
    
    -- insert head segment data
    insert into tblSnakeSegment(SnakeID, X, Y)
    values (@SnakeID, 2, 2);
    
    set @SnakeHeadID = last_insert_id();
    
    -- insert body segment data
    insert into tblSnakeSegment(SnakeID, X, Y)
    values (@SnakeID, 2, 3);
    
    -- insert tail segment data
    insert into tblSnakeSegment(SnakeID, X, Y)
    values (@SnakeID, 2, 4);
    
	set @SnakeTailID = last_insert_id();
    
     -- update snake head and tail data
	update tblSnake
		set HeadID = @SnakeHeadID,
			TailID = @SnakeTailID
	where 
		ID = @SnakeID;
        
	-- insert player data
    insert into tblPlayer(PlayerName, SnakeID)
    values ('Phill', @SnakeID);
    
    -- 2nd series -------------------------------------------------
    
    -- insert board data
    insert into tblBoard(GRID_SIZE)
    values (50);
    
    set @BoardID = last_insert_id();
    
    -- insert snake data
    insert into tblSnake(BoardID)
    values (@BoardID);
    
    set @SnakeID = last_insert_id();
    
    -- insert head segment data
    insert into tblSnakeSegment(SnakeID, X, Y)
    values (@SnakeID, 6, 6);
    
    set @SnakeHeadID = last_insert_id();
    
    -- insert body segment data
    insert into tblSnakeSegment(SnakeID, X, Y)
    values (@SnakeID, 7, 6);
    
    -- insert tail segment data
    insert into tblSnakeSegment(SnakeID, X, Y)
    values (@SnakeID, 8, 6);
    
	set @SnakeTailID = last_insert_id();
    
     -- update snake head and tail data
	update tblSnake
		set HeadID = @SnakeHeadID,
			TailID = @SnakeTailID
	where 
		ID = @SnakeID;
        
	-- insert player data
    insert into tblPlayer(PlayerName, SnakeID)
    values ('Mark', @SnakeID);
        
        
	-- 3rd series -------------------------------------------------
    
    -- insert board data
    insert into tblBoard(GRID_SIZE)
    values (50);
    
    set @BoardID = last_insert_id();
    
    -- insert snake data
    insert into tblSnake(BoardID)
    values (@BoardID);
    
    set @SnakeID = last_insert_id();
    
    -- insert head segment data
    insert into tblSnakeSegment(SnakeID, X, Y)
    values (@SnakeID, 20, 11);
    
    set @SnakeHeadID = last_insert_id();
    
    -- insert body segment data
    insert into tblSnakeSegment(SnakeID, X, Y)
    values (@SnakeID, 20, 12);
    
    -- insert tail segment data
    insert into tblSnakeSegment(SnakeID, X, Y)
    values (@SnakeID, 20, 13);
    
	set @SnakeTailID = last_insert_id();
    
     -- update snake head and tail data
	update tblSnake
		set HeadID = @SnakeHeadID,
			TailID = @SnakeTailID
	where 
		ID = @SnakeID;
        
	-- insert player data
    insert into tblPlayer(PlayerName, SnakeID)
    values ('Chrissy', @SnakeID);
    
end//
delimiter ;

call insertTestData();

drop procedure if exists manipulateTestData;
delimiter // 
create procedure manipulateTestData()
begin

update tblPlayer 
set PlayerName = 'Morrigan'
where ID = 2;
 


end//
delimiter ;

call manipulateTestData();