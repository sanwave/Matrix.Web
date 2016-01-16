-- --------------------------------------------------------
-- 主机:                           qdm16944532.my3w.com
-- 服务器版本:                        5.1.48-log - Source distribution
-- 服务器操作系统:                      unknown-linux-gnu
-- HeidiSQL 版本:                  9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 qdm16944532_db 的数据库结构
DROP DATABASE IF EXISTS `qdm16944532_db`;
CREATE DATABASE IF NOT EXISTS `qdm16944532_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `qdm16944532_db`;


-- 导出  表 qdm16944532_db.t_comment 结构
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE IF NOT EXISTS `t_comment` (
  `F_Id` int(11) NOT NULL AUTO_INCREMENT,
  `F_ResourceId` int(11) NOT NULL,
  `F_Contents` varchar(4000) NOT NULL,
  `F_isHtml` bit(1) NOT NULL,
  `F_PostTime` datetime NOT NULL,
  `F_LastReplyTime` datetime NOT NULL,
  `F_Composer` int(11) DEFAULT NULL,
  `F_PostIp` varchar(50) NOT NULL,
  `F_Support` int(11) NOT NULL,
  `F_Oppose` int(11) NOT NULL,
  `F_Report` int(11) NOT NULL,
  `F_ReplyNum` int(11) NOT NULL,
  `F_ReactLastIp` varchar(50) NOT NULL,
  `F_MainMsgId` int(11) NOT NULL,
  `F_ReplyMsgId` int(11) NOT NULL,
  PRIMARY KEY (`F_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 qdm16944532_db.t_login 结构
DROP TABLE IF EXISTS `t_login`;
CREATE TABLE IF NOT EXISTS `t_login` (
  `F_Id` int(11) NOT NULL AUTO_INCREMENT,
  `F_Ticket` varchar(100) NOT NULL,
  `F_UserName` varchar(20) NOT NULL,
  `F_LoginIp` varchar(50) NOT NULL,
  `F_LoginTime` datetime NOT NULL,
  `F_Status` varchar(10) NOT NULL,
  PRIMARY KEY (`F_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 qdm16944532_db.t_message 结构
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE IF NOT EXISTS `t_message` (
  `F_Id` int(11) NOT NULL AUTO_INCREMENT,
  `F_Contents` varchar(4000) NOT NULL,
  `F_isHtml` bit(1) NOT NULL,
  `F_PostTime` datetime NOT NULL,
  `F_LastReplyTime` datetime NOT NULL,
  `F_Composer` int(11) DEFAULT NULL,
  `F_PostIp` varchar(16) NOT NULL,
  `F_Support` int(11) NOT NULL,
  `F_Oppose` int(11) NOT NULL,
  `F_Report` int(11) NOT NULL,
  `F_ReplyNum` int(11) NOT NULL,
  `F_ReactLastIp` varchar(16) NOT NULL,
  `F_MainMsgId` int(11) NOT NULL,
  `F_ReplyMsgId` int(11) NOT NULL,
  PRIMARY KEY (`F_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 qdm16944532_db.t_replyrelation 结构
DROP TABLE IF EXISTS `t_replyrelation`;
CREATE TABLE IF NOT EXISTS `t_replyrelation` (
  `F_Id` int(11) NOT NULL AUTO_INCREMENT,
  `F_TopMsgId` int(11) NOT NULL,
  `F_BottomMsgId` int(11) NOT NULL,
  `F_MainMsgId` int(11) NOT NULL,
  PRIMARY KEY (`F_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 qdm16944532_db.t_resource 结构
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE IF NOT EXISTS `t_resource` (
  `F_Id` int(11) NOT NULL AUTO_INCREMENT,
  `F_Name` varchar(50) NOT NULL,
  `F_Uri` varchar(200) NOT NULL,
  `F_Type` varchar(50) NOT NULL,
  `F_Format` varchar(50) NOT NULL,
  `F_ParentFolder` int(11) NOT NULL,
  `F_Composer` varchar(50) DEFAULT NULL,
  `F_Description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`F_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 qdm16944532_db.t_resourcerelation 结构
DROP TABLE IF EXISTS `t_resourcerelation`;
CREATE TABLE IF NOT EXISTS `t_resourcerelation` (
  `F_Id` int(11) NOT NULL AUTO_INCREMENT,
  `F_MainId` int(11) NOT NULL,
  `F_ResourceId` int(11) NOT NULL,
  `F_Illustration` varchar(200) NOT NULL,
  PRIMARY KEY (`F_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 qdm16944532_db.t_user 结构
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE IF NOT EXISTS `t_user` (
  `F_Id` int(11) NOT NULL AUTO_INCREMENT,
  `F_UserName` varchar(50) NOT NULL,
  `F_Salt` varchar(50) NOT NULL,
  `F_UserNameHash` varchar(50) NOT NULL,
  `F_PasswordHash` varchar(50) NOT NULL,
  `F_UserRole` varchar(50) NOT NULL,
  `F_Status` varchar(50) NOT NULL,
  `F_Email` varchar(30) NOT NULL,
  `F_RegisterTime` datetime NOT NULL,
  `F_RealName` varchar(20) DEFAULT NULL,
  `F_Gender` varchar(10) DEFAULT NULL,
  `F_PhoneNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`F_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `t_zentaodiary`;
CREATE TABLE `t_zentaodiary` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(50) NOT NULL,
	`password` VARCHAR(50) NOT NULL,
	`department` VARCHAR(50) NOT NULL,
	`worktype` VARCHAR(50) NOT NULL,
    `project` VARCHAR(50) NOT NULL,
    `startdate` DATE NOT NULL,
	`workhours` INT(11) NOT NULL DEFAULT 8,
	`content` VARCHAR(200) NOT NULL DEFAULT "",
	`frequency` VARCHAR(200) NOT NULL,
	`updatetime` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=0
;



-- 数据导出被取消选择。


-- 导出  过程 qdm16944532_db.AddResource 结构
DROP PROCEDURE IF EXISTS `AddResource`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `AddResource`(
	Parent int,
	Name nvarchar(50),
	Type nvarchar(50),
	Format nvarchar(50),
	Composer nvarchar(50), 
	Description nvarchar(50)
)
AddResource:BEGIN

	DECLARE	Uri nvarchar(200);

	IF Parent<=0 THEN
		SET Parent = (SELECT F_Id FROM t_resource WHERE F_ParentFolder = '0');
		SET Uri = Concat('/' , Name);
	ELSE
		SET Uri = CONCAT((SELECT F_Uri FROM t_resource WHERE F_Id = Parent) , '/' , Name);
	END IF;

	IF LOWER(Type) != 'folder' THEN
		SET Uri = CONCAT(Uri, '.' , Format);
	END IF;

	IF (SELECT COUNT(*) FROM t_resource WHERE F_ParentFolder = Parent AND F_Name = Name) > 0 
		OR (SELECT COUNT(*) FROM t_resource WHERE F_Id = Parent) < 1 THEN
		LEAVE AddResource;
	END IF;


	INSERT INTO t_resource
		(F_Name, F_Uri, `F_Type`, `F_Format`, 
		`F_ParentFolder`, `F_Composer`,`F_Description`)
	SELECT
		Name, Uri, Type, Format,
		Parent, Composer, Description;
END//
DELIMITER ;


-- 导出  过程 qdm16944532_db.GetCommentById 结构
DROP PROCEDURE IF EXISTS `GetCommentById`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `GetCommentById`(IN `Id` int)
BEGIN
	SELECT 
		a.F_ID AS ID,
		b.F_UserName AS Composer,
		a.F_Contents AS Content, 
		a.F_PostTime AS PostTime,
		a.F_Support AS Support,
		a.F_Oppose AS Oppose, 
		a.F_ReplyNum AS ReplyNum,
		a.F_Report AS Report,
		a.F_ReplyMsgID AS ReplyMsgID,
		a.F_ResourceID AS ResourceId
	FROM t_comment a LEFT JOIN t_user b ON (a.F_Composer = b.F_ID) 
	WHERE a.F_ID = Id 
	ORDER BY PostTime;
END//
DELIMITER ;


-- 导出  过程 qdm16944532_db.GetCommentsByResourceId 结构
DROP PROCEDURE IF EXISTS `GetCommentsByResourceId`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `GetCommentsByResourceId`(ResourceID int)
BEGIN
	SELECT 
		a.F_ID AS ID,
		b.F_UserName AS Composer,
		a.F_Contents AS Content,
		a.F_PostTime AS PostTime,
		a.F_Support AS Support,
		a.F_Oppose AS Oppose,
		a.F_ReplyNum AS ReplyNum,
		a.F_Report AS Report
	FROM t_comment a 
		LEFT JOIN t_user b ON (a.F_Composer = b.F_ID)
	WHERE a.F_ResourceID = ResourceID
	ORDER BY PostTime;
END//
DELIMITER ;


-- 导出  过程 qdm16944532_db.GetCommentsCount 结构
DROP PROCEDURE IF EXISTS `GetCommentsCount`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `GetCommentsCount`()
BEGIN
	SELECT Count(*) FROM t_comment;
END//
DELIMITER ;


-- 导出  过程 qdm16944532_db.GetMessageById 结构
DROP PROCEDURE IF EXISTS `GetMessageById`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `GetMessageById`(IN `Id` int)
BEGIN
	SELECT
		a.F_ID AS Id,
		b.F_UserName AS Composer,
		a.F_Contents AS Content, 
		a.F_PostTime AS PostTime,
		a.F_Support AS Support,
		a.F_Oppose AS Oppose, 
		a.F_ReplyNum AS ReplyNum,
		a.F_Report AS Report,
		a.F_ReplyMsgID AS ReplyMsgID
	FROM t_message a 
		LEFT JOIN t_user b ON (a.F_Composer = b.F_ID) 
	WHERE a.F_ID = Id
	ORDER BY PostTime;
END//
DELIMITER ;


-- 导出  过程 qdm16944532_db.GetMessageByPage 结构
DROP PROCEDURE IF EXISTS `GetMessageByPage`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `GetMessageByPage`(IN `Page` INT)
BEGIN
	SELECT
		a.F_ID AS Id,
		b.F_UserName AS Composer,
		a.F_Contents AS Content, 
		a.F_PostTime AS PostTime,
		a.F_Support AS Support,
		a.F_Oppose AS Oppose, 
		a.F_ReplyNum AS ReplyNum,
		a.F_Report AS Report,
		a.F_ReplyMsgID AS ReplyMsgID
	FROM t_message a 
		LEFT JOIN t_user b ON (a.F_Composer = b.F_ID) 	
	ORDER BY PostTime;
END//
DELIMITER ;


-- 导出  过程 qdm16944532_db.GetMessageIDsByPage 结构
DROP PROCEDURE IF EXISTS `GetMessageIDsByPage`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `GetMessageIDsByPage`()
BEGIN
	SELECT F_Id AS Id FROM t_message ORDER BY F_PostTime DESC;
END//
DELIMITER ;


-- 导出  过程 qdm16944532_db.GetMessagesCount 结构
DROP PROCEDURE IF EXISTS `GetMessagesCount`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `GetMessagesCount`()
BEGIN
	SELECT Count(*) FROM t_message;
END//
DELIMITER ;


-- 导出  过程 qdm16944532_db.GetResourceById 结构
DROP PROCEDURE IF EXISTS `GetResourceById`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `GetResourceById`(id int)
BEGIN
	IF id<=0 THEN
		SET id = (SELECT F_Id FROM t_resource WHERE F_ParentFolder = '0');
	END IF;

	SELECT 
		a.F_Id AS Id,
		a.F_Name AS Name,
		a.F_ParentFolder AS ParentFolder,
		a.F_Uri AS Uri,
		a.F_Format AS `Format`,
		c.F_Uri AS Cover,
		a.F_Type AS `Type`,
		a.F_Composer AS Composer,
		a.F_Description AS `Description`
	FROM t_resource a 
		LEFT JOIN t_resourcerelation b ON (a.F_ID = b.F_MainID AND b.F_Illustration = 'Cover')
		LEFT JOIN t_resource c ON (b.F_ResourceID = c.F_ID)
	WHERE a.F_ID = id;
END//
DELIMITER ;


-- 导出  过程 qdm16944532_db.GetResourceChildren 结构
DROP PROCEDURE IF EXISTS `GetResourceChildren`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `GetResourceChildren`(IN `id` int)
BEGIN
	IF id = 0 THEN
		SET Id = (SELECT F_Id FROM t_resource WHERE F_ParentFolder = 0);
	END IF;

	SELECT 
		F_Id AS Id,
		F_Name AS Name,
		F_ParentFolder AS ParentFolder,
		F_Uri AS Uri,
		F_Format AS `Format`,
		F_Uri AS Cover,
		F_Type AS `Type`,
		F_Composer AS Composer,
		F_Description AS `Description`
	FROM t_resource
	WHERE F_ParentFolder = Id;
END//
DELIMITER ;


-- 导出  过程 qdm16944532_db.GetUserByUsername 结构
DROP PROCEDURE IF EXISTS `GetUserByUsername`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `GetUserByUsername`(UserName nvarchar(50))
BEGIN
	SELECT 
		`F_ID` AS Id,
		`F_UserName` AS UserName,
		`F_Salt` AS Salt,
		`F_UserNameHash` AS UserNameHash,
		`F_PasswordHash` AS PasswordHash,
		`F_UserRole` AS UserRole,
		`F_Status` AS `Status`,
		`F_Email` AS Email,
		`F_RegisterTime` AS RegisterTime,
		`F_RealName` AS RealName,
		`F_Gender` AS Gender,
		`F_PhoneNumber` AS PhoneNumber
	FROM t_user 
	WHERE F_UserName = UserName;
END//
DELIMITER ;


-- 导出  过程 qdm16944532_db.LoginUser 结构
DROP PROCEDURE IF EXISTS `LoginUser`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `LoginUser`(
	UserName nvarchar(50),
	Ticket varchar(100),
	LoginIP varchar(50),
	Status varchar(10),
	LoginTime datetime
)
BEGIN
	INSERT INTO t_login 
		(F_Ticket, F_UserName, F_LoginIP, F_LoginTime, F_Status)	
	VALUES
		(Ticket, UserName, LoginIP, LoginTime, Status);
	
	SELECT last_insert_id();
END//
DELIMITER ;


-- 导出  过程 qdm16944532_db.PostComment 结构
DROP PROCEDURE IF EXISTS `PostComment`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `PostComment`(IN `ResourceID` int, IN `Content` nvarchar(4000), IN `PostTime` datetime, IN `Composer` nvarchar(50), IN `PostIP` nvarchar(50)
)
BEGIN
	INSERT INTO t_comment 
		(F_ResourceID, F_Contents, F_isHtml, F_PostTime, F_LastReplyTime,
		F_Composer, F_PostIP,
		F_Support, F_Oppose, F_Report, F_ReplyNum, F_ReactLastIP, F_MainMsgID, F_ReplyMsgID)
	VALUES
		(ResourceID, Content, '0', PostTime, PostTime, 
		(SELECT F_Id FROM t_user WHERE F_UserName = Composer), PostIP,
		'0', '0', 0, '0', '0', '0', '0');
		
	SELECT last_insert_id();
	
	UPDATE t_comment SET
		F_MainMsgID = F_Id
		WHERE F_MainMsgID = 0;
END//
DELIMITER ;


-- 导出  过程 qdm16944532_db.PostMessage 结构
DROP PROCEDURE IF EXISTS `PostMessage`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `PostMessage`(IN `Content` nvarchar(4000), IN `Composer` nvarchar(50), IN `PostIP` nvarchar(50), IN `PostTime` datetime
)
BEGIN
	INSERT INTO t_message
		(F_Contents, F_isHtml, F_PostTime, F_LastReplyTime,
		F_Composer, F_PostIP,
		F_Support, F_Oppose, F_Report, F_ReplyNum, F_ReactLastIP, F_MainMsgID, F_ReplyMsgID)
	SELECT
		Content, 0, PostTime, PostTime, 
		(SELECT F_Id FROM t_user WHERE F_UserName = Composer), PostIP, 
		'0', '0', '0', '0', '0', '0', '0';
		
		SELECT last_insert_id();
		
		UPDATE t_message SET
			F_MainMsgID = F_Id
			WHERE F_MainMsgID = 0;
END//
DELIMITER ;


-- 导出  过程 qdm16944532_db.RegisterUser 结构
DROP PROCEDURE IF EXISTS `RegisterUser`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `RegisterUser`(
	UserName nvarchar(50),
	Salt varchar(50),
	UserNameHash varchar(50),
	PasswordHash varchar(50),
	UserRole nvarchar(50),
	Status nvarchar(50),
	Email nvarchar(50),
	RegisterTime datetime
)
BEGIN
	INSERT INTO t_user 
		(F_UserName, F_Salt, F_UserNameHash, F_PasswordHash, F_UserRole, F_Status, F_Email, F_RegisterTime) 
	VALUES 
		(UserName, Salt, UserNameHash, PasswordHash, UserRole, Status, Email, RegisterTime);
	
	SELECT last_insert_id();
END//
DELIMITER ;


-- 导出  过程 qdm16944532_db.RemoveMessage 结构
DROP PROCEDURE IF EXISTS `RemoveMessage`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `RemoveMessage`(Id int)
BEGIN
	DECLARE ReplyMsgId int;

	IF (SELECT COUNT(*) FROM t_message WHERE F_MainMsgId = F_Id AND F_Id = Id) > 0 THEN
		DELETE FROM t_message WHERE F_MainMsgId = Id;
	ELSEIF (SELECT COUNT(*) FROM t_message WHERE F_ReplyMsgId = Id) = 0 THEN
		DELETE FROM t_message WHERE F_Id = Id;
	ELSE
		UPDATE t_message SET F_Contents = 'This message has been removed!' WHERE F_Id = Id;
	END IF;
END//
DELIMITER ;


-- 导出  过程 qdm16944532_db.RemoveResource 结构
DROP PROCEDURE IF EXISTS `RemoveResource`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `RemoveResource`(ResourceId int)
RemoveResource:BEGIN
	IF (SELECT COUNT(*) FROM t_resource WHERE F_Id = ResourceId) < 1 THEN
		LEAVE RemoveResource;
	END IF;
	
	DELETE FROM t_resource WHERE F_Id=ResourceId;
	WHILE EXISTS 
		(
			SELECT F_Id FROM t_resource
			WHERE F_ParentFolder NOT In 
				(SELECT F_Id FROM t_resource)
				AND F_ParentFolder != 0
		) DO
		DELETE FROM t_resource
		WHERE F_ParentFolder NOT In 
			(SELECT F_Id FROM t_resource)
			AND F_ParentFolder != 0;
	END WHILE;
END//
DELIMITER ;


-- 导出  过程 qdm16944532_db.ReplyCommentById 结构
DROP PROCEDURE IF EXISTS `ReplyCommentById`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `ReplyCommentById`(IN `SourceId` int, IN `Now` datetime, IN `Content` nvarchar(4000), IN `Composer` nvarchar(50), IN `PostIP` nvarchar(50)
)
BEGIN
	DECLARE	ResourceId int;
	DECLARE	MainMsgId int;
	DECLARE	BottomMsgId int;

	IF EXISTS ( SELECT * FROM t_comment WHERE F_Id = SourceId) THEN
		UPDATE t_comment SET 
				F_LastReplyTime = Now, 
				F_ReplyNum = F_ReplyNum + 1
		WHERE F_Id = SourceId;

		SELECT 
			ResourceId = F_ResourceID,
			MainMsgId = F_MainMsgID
		FROM t_comment 
		WHERE F_Id = SourceId;
			
		INSERT INTO t_comment 
			(F_ResourceID, F_Contents, F_isHtml, F_PostTime, F_LastReplyTime,
			F_Composer, F_PostIP,
			F_Support, F_Oppose, F_Report, F_ReplyNum, F_ReactLastIP, 
			F_MainMsgID, F_ReplyMsgID)
		VALUES
			(ResourceID, Content, 0, Now, Now, 
			(SELECT F_Id FROM t_user WHERE F_UserName = Composer), PostIP,
			'0', '0', '0', '0', '0',
			(SELECT F_MainMsgId FROM t_comment WHERE F_Id = SourceId), SourceId);
		
		SELECT last_insert_id();
	END IF;
END//
DELIMITER ;


-- 导出  过程 qdm16944532_db.ReplyMessageById 结构
DROP PROCEDURE IF EXISTS `ReplyMessageById`;
DELIMITER //
CREATE DEFINER=`qdm16944532`@`%` PROCEDURE `ReplyMessageById`(IN `SourceId` int, IN `Now` datetime, IN `Content` nvarchar(4000), IN `Composer` nvarchar(50), IN `PostIP` nvarchar(50)
)
BEGIN
	DECLARE	MainMsgId int;
	DECLARE	BottomMsgId int;

	IF EXISTS ( SELECT * FROM t_message WHERE F_Id = SourceId) THEN
		UPDATE t_message SET 
				F_LastReplyTime = Now, 
				F_ReplyNum = F_ReplyNum + 1
		WHERE F_Id = SourceId;

		SELECT 
			MainMsgId = F_MainMsgID 
		FROM t_message 
		WHERE F_Id = SourceId;
			
		INSERT INTO t_message
			(F_Contents, F_isHtml, F_PostTime, F_LastReplyTime,
			F_Composer, F_PostIP,
			F_Support, F_Oppose, F_Report, F_ReplyNum, F_ReactLastIP, 
			F_MainMsgId, F_ReplyMsgId)
		SELECT
			Content, 0, Now, Now, 
			(SELECT F_Id FROM t_user WHERE F_UserName = Composer), PostIP, 
			'0', '0', '0', '0', '0', 
			(SELECT F_MainMsgId FROM t_message WHERE F_Id = SourceId), SourceId;
		
		SELECT last_insert_id();
	END IF;
END//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
