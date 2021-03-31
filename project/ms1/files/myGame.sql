/* ========================= DDL ========================= */
CREATE TABLE player(
   playerID     INTEGER  NOT NULL PRIMARY KEY AUTO_INCREMENT
  ,userName     VARCHAR(14) NOT NULL
  ,userPassword VARCHAR(12) NOT NULL
  ,email        VARCHAR(25) NOT NULL
  ,adminUser    BOOLEAN NOT NULL
  ,userOnline   BOOLEAN NOT NULL
  ,hitTotal     INTEGER  NOT NULL
  ,highScore    INTEGER  NOT NULL
);

CREATE TABLE session(
   gameID     INTEGER  NOT NULL PRIMARY KEY AUTO_INCREMENT
  ,playerID   INTEGER  NOT NULL
  ,hitTotal   INTEGER  NOT NULL
  ,totalScore INTEGER  NOT NULL
  ,FOREIGN KEY (`playerID`) REFERENCES `player` (`playerID`)
);

CREATE TABLE game(
   gameID     INTEGER  NOT NULL
  ,gameType   INTEGER  NOT NULL
  ,gameStatus INTEGER  NOT NULL
  ,FOREIGN KEY (`gameID`) REFERENCES `session` (`gameID`)
);

CREATE TABLE gameBoard(
   boardID     INTEGER  NOT NULL PRIMARY KEY AUTO_INCREMENT
  ,gameID      INTEGER  NOT NULL
  ,boardNumber INTEGER  NOT NULL
);

CREATE TABLE boardDisplay(
   boardID      INTEGER  NOT NULL
  ,boardType    INTEGER  NOT NULL
  ,boardRows    INTEGER  NOT NULL
  ,boardCols    INTEGER  NOT NULL
  ,boardContent INTEGER  NOT NULL
  ,FOREIGN KEY (`boardID`) REFERENCES `gameBoard` (`boardID`)
);

CREATE TABLE snakeDisplay(
   snakeID       INTEGER  NOT NULL PRIMARY KEY AUTO_INCREMENT
  ,snakeLocation INTEGER  NOT NULL
  ,snakeLength   INTEGER  NOT NULL
);

/* =================== DML ====================== */
INSERT INTO player(playerID,userName,userPassword,email,adminUser,userOnline,hitTotal,highScore) VALUES (1,'gmorefield0','AASf7O7ARKg','kahrens0@java.com','false','false',803,399);
INSERT INTO player(playerID,userName,userPassword,email,adminUser,userOnline,hitTotal,highScore) VALUES (2,'aabson1','u9tYZv9','ldeddum1@domainmarket.com','true','true',439,402);
INSERT INTO player(playerID,userName,userPassword,email,adminUser,userOnline,hitTotal,highScore) VALUES (3,'dbernakiewicz2','kqg8FbR3xKbH','lpurveys2@bing.com','false','true',791,728);


INSERT INTO session(gameID,playerID,hitTotal,totalScore) VALUES (812,686,941,787);
INSERT INTO session(gameID,playerID,hitTotal,totalScore) VALUES (174,871,134,718);
INSERT INTO session(gameID,playerID,hitTotal,totalScore) VALUES (762,619,36,466);

INSERT INTO game(gameID,gameType,gameStatus) VALUES (276,5,7);
INSERT INTO game(gameID,gameType,gameStatus) VALUES (291,4,9);
INSERT INTO game(gameID,gameType,gameStatus) VALUES (300,4,2);

INSERT INTO gameBoard(boardID,gameID,boardNumber) VALUES (1,640,47);
INSERT INTO gameBoard(boardID,gameID,boardNumber) VALUES (2,106,70);
INSERT INTO gameBoard(boardID,gameID,boardNumber) VALUES (3,830,49);

INSERT INTO boardDisplay(boardID,boardType,boardRows,boardCols,boardContent) VALUES (1,3,67,23,5);
INSERT INTO boardDisplay(boardID,boardType,boardRows,boardCols,boardContent) VALUES (2,3,46,64,4);
INSERT INTO boardDisplay(boardID,boardType,boardRows,boardCols,boardContent) VALUES (3,11,55,98,2);

INSERT INTO snakeDisplay(snakeID,boardID,snakeLocation,snakeLength) VALUES (1,7,81,19);
INSERT INTO snakeDisplay(snakeID,boardID,snakeLocation,snakeLength) VALUES (2,7,80,5);
INSERT INTO snakeDisplay(snakeID,boardID,snakeLocation,snakeLength) VALUES (3,5,13,13);