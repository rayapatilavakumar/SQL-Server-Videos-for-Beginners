CREATE TABLE [dbo].[events] (
ID int,
event varchar(255),
YEAR INt,
GOLD varchar(255),
SILVER varchar(255),
BRONZE varchar(255)
);

--delete from [dbo].[events];

INSERT INTO [dbo].[events] VALUES (1,'100m',2016, 'Amthhew Mcgarray','donald','barbara');
INSERT INTO [dbo].[events] VALUES (2,'200m',2016, 'Nichole','Alvaro Eaton','janet Smith');
INSERT INTO [dbo].[events] VALUES (3,'500m',2016, 'Charles','Nichole','Susana');
INSERT INTO [dbo].[events] VALUES (4,'100m',2016, 'Ronald','maria','paula');
INSERT INTO [dbo].[events] VALUES (5,'200m',2016, 'Alfred','carol','Steven');
INSERT INTO [dbo].[events] VALUES (6,'500m',2016, 'Nichole','Alfred','Brandon');
INSERT INTO [dbo].[events] VALUES (7,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO [dbo].[events] VALUES (8,'200m',2016, 'Thomas','Dawn','catherine');
INSERT INTO [dbo].[events] VALUES (9,'500m',2016, 'Thomas','Dennis','paula');
INSERT INTO [dbo].[events] VALUES (10,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO [dbo].[events] VALUES (11,'200m',2016, 'jessica','Donald','Stefeney');
INSERT INTO [dbo].[events] VALUES (12,'500m',2016,'Thomas','Steven','Catherine');

select 
E.Gold as Player, 
Count(E.Gold) as TotalMedals 
FROM [dbo].[events] E

INNER JOIN 
(
	SELECT  Gold as Player from [dbo].[events]
	group by gold
	EXCEPT 
	(
		SELECT DISTINCT  Silver as Player from [dbo].[events]
		UNION ALL 
		SELECT DISTINCT  Bronze as Player from [dbo].[events]
	)
)T on E.Gold = T.Player
GROUP BY E.Gold

