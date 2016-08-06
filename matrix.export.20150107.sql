-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.0.13-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  8.3.0.4834
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 matrix 的数据库结构
-- CREATE DATABASE IF NOT EXISTS `wmatrix` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `wmatrix`;


-- 导出  表 matrix.t_comment 结构
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
  `F_ReplyDepth` int(11) NOT NULL,
  `F_ReplyedDepth` int(11) NOT NULL,
  PRIMARY KEY (`F_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 导出  表 matrix.t_login 结构
DROP TABLE IF EXISTS `t_login`;
CREATE TABLE IF NOT EXISTS `t_login` (
  `F_Id` int(11) NOT NULL AUTO_INCREMENT,
  `F_Ticket` varchar(100) NOT NULL,
  `F_UserName` varchar(20) NOT NULL,
  `F_LoginIp` varchar(50) NOT NULL,
  `F_LoginTime` datetime NOT NULL,
  `F_Status` varchar(10) NOT NULL,
  PRIMARY KEY (`F_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 导出  表 matrix.t_message 结构
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE IF NOT EXISTS `t_message` (
  `F_Id` int(11) NOT NULL ,
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
  `F_ReplyDepth` int(11) NOT NULL,
  `F_ReplyedDepth` int(11) NOT NULL,
  PRIMARY KEY (`F_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  matrix.t_message 的数据：~90 rows (大约)
/*!40000 ALTER TABLE `t_message` DISABLE KEYS */;
INSERT IGNORE INTO `t_message` (`F_Id`, `F_Contents`, `F_isHtml`, `F_PostTime`, `F_LastReplyTime`, `F_Composer`, `F_PostIp`, `F_Support`, `F_Oppose`, `F_Report`, `F_ReplyNum`, `F_ReactLastIp`, `F_MainMsgId`, `F_ReplyMsgId`, `F_ReplyDepth`, `F_ReplyedDepth`) VALUES
	(3, 'nod32 激活页面：http://www.zolsky.com/killsoftware/sdsoft%5CNOD32/nod32_id_2.htm', b'0', '2014-03-08 10:37:06', '2014-03-08 10:37:06', 1, '172.19.128.74', 0, 0, 0, 0, '0', 37, 0, 0, 0),
	(4, '写论文最重要的是写Introduction。写Introduction就和写童话一样。\r\n1. 有一条巨龙抓走了公主 (介绍你的问题为什么值得研究)\r\n2. 巨龙是多么多么多么难打（强调你的研究的重要性）\r\n3. 王子提着一把金光闪闪的剑而不是破斧子烂长矛登场（你的方法好在哪里，别人sui在哪里）\r\n4. 王子是如何打败巨龙（你的方法简介）\r\n5. 从此王子和公主幸福的生活在一起。（解决了问题）', b'0', '2014-03-12 08:42:35', '2014-03-12 08:42:35', NULL, '172.19.128.74', 0, 0, 0, 0, '0', 41, 0, 0, 0),
	(5, '和搞研究不同，写paper的目的就是单纯地向别人推销你的idea，希望别人能接纳。\r\n既然是是卖东西，那么你自然要先给别人画个圈，然后再有声有色引人入深的介绍。别人判断你的paper有没有价值，也就是：第一，先看introduction，看看你做了件什么事；第二，看conclusion，看看你方法的缺陷在什么地方，至于具体实现，感兴趣的才会去翻着看。', b'0', '2014-03-12 09:34:58', '2014-03-12 09:34:58', NULL, '172.19.128.74', 0, 0, 0, 0, '0', 42, 0, 0, 0),
	(6, '国内论文三大定律：\r\n1，论文通常比想象的难。写作时间是预计的2~3倍。你觉得2个月搞定，其实需要半年。\r\n2，指导老师通常比你懒，你有空可以指导一下他们。\r\n3，答辩老师通常比你笨。 他们通常不关心你的论文，更在意如何保住面子。', b'0', '2014-03-12 09:35:54', '2014-03-12 09:35:54', NULL, '172.19.128.74', 0, 0, 0, 0, '0', 43, 0, 0, 0),
	(7, '一，要阅读大量的文献，尤其是英文文献。什么叫做大量呢——按照我们导师的话就是100-300篇。没开始研究的时候觉得这真是一个惊人的数字啊，而且英文文献怎么说也是20+页的~但是着手研究之后，才发现确实要阅读这么多，才能对所研究的领域有个大概了解，并且神奇的是，在这个过程中会自然而然地提炼出自己想要研究的方向以及与前人研究的不同（即自己研究的创新点）。真是量变引', b'0', '2014-03-12 09:37:48', '2014-03-12 09:37:48', NULL, '172.19.128.74', 0, 0, 0, 0, '0', 44, 0, 0, 0),
	(8, 'linux下部署mono：  http://beginor.github.io/2013/05/16/trying-to-run-mvc4-with-mono3.html  http://www.mono-project.com/Compatibility\r\n对.NET 的思考：http://robbinfan.com/blog/43/rid-off-dotnet-experience', b'0', '2014-03-13 08:53:12', '2014-03-13 08:53:12', NULL, '172.19.128.74', 12, 0, 0, 0, '172.19.128.74', 47, 0, 0, 0),
	(9, '你只是个凡人\r\n\r\n我是来卖萌的\r\n\r\n文艺青年\r\n\r\n暴发户\r\n\r\nG病毒携带者\r\n\r\n位列仙班\r\n\r\n我真的不是ZSMJ\r\n\r\n这辈子值了\r\n\r\n注定孤独一生\r\n\r\n泉水已经不能阻止我了\r\n\r\n不死的圣人\r\n\r\n走向人生巅峰  送你离开的', b'0', '2014-03-13 14:41:58', '2014-03-13 14:41:58', NULL, '172.19.128.74', 0, 0, 0, 0, '0', 49, 0, 0, 0),
	(10, 'Chromium 支持 mp3 等：http://blog.csdn.net/yujiankk/article/details/9166307 \r\nhttp://blog.sina.com.cn/s/blog_69a04cf40100zvjx.html\r\nhttp://productforums.google.com/forum/#!topic/chrome-zh-cn/ri-f6zO_A98\r\nhttp://blog.sina.com.cn/s/blog_5390348a0101bjyt.html\r\nhttp://jueshizhanhun.blog.51cto.com/4372226/1368768', b'0', '2014-03-15 18:52:57', '2014-03-15 18:52:57', NULL, '172.19.128.74', 0, 0, 0, 0, '0', 51, 0, 0, 0),
	(11, 'mysql分页：\r\nhttp://blog.csdn.net/sarahcla/article/details/10521775\r\nhttp://blog.csdn.net/sarahcla/article/details/10539991\r\nhttp://xue.uplook.cn/database/mysqlsjk/872806.html\r\nhttp://www.111cn.net/database/mysql/51004.htm\r\nhttp://db.riaos.com/?p=1009932', b'0', '2014-03-15 19:30:04', '2014-03-15 19:30:04', NULL, '202.115.139.158', 0, 0, 0, 0, '0', 52, 0, 0, 0),
	(12, 'html5 视频支持： http://www.cnblogs.com/sink_cup/archive/2011/04/21/html5_video_ipad_firefox_chrome_ie9876_flash.html', b'0', '2014-03-15 19:39:59', '2014-03-15 19:39:59', NULL, '172.19.128.74', 0, 0, 0, 0, '0', 53, 0, 0, 0),
	(13, 'OCR思路：识别十字交叉以及横撇的个数，这两个一般保证是闭合连接的，然后进行图形比对', b'0', '2014-03-16 08:26:03', '2014-03-16 08:26:03', NULL, '172.19.128.74', 0, 0, 0, 0, '0', 54, 0, 0, 0),
	(17, 'C# 微博 SDK 调用：\r\nhttp://weibosdk.codeplex.com/downloads/get/557114\r\nhttp://www.cnblogs.com/cmt/archive/2010/05/13/1733904.html\r\nhttp://blog.csdn.net/ihandler/article/details/6038586\r\nhttp://my.oschina.net/u/929434/blog/98649', b'0', '2014-03-18 13:50:37', '2014-03-18 13:50:37', 1, '172.19.128.74', 0, 0, 0, 0, '0', 63, 0, 0, 0),
	(18, 'http://www.cnblogs.com/liuxianan/archive/2012/11/11/2765123.html 徒手API 开发新浪微博应用', b'0', '2014-03-18 14:02:35', '2014-03-18 14:02:35', 1, '172.19.128.74', 0, 0, 0, 0, '0', 64, 0, 0, 0),
	(19, '微博SSO登录分析：http://denger.iteye.com/blog/1039052', b'0', '2014-03-18 19:07:43', '2014-03-18 19:07:43', 1, '172.19.128.74', 10, 1, 0, 0, '172.19.128.74', 68, 0, 0, 0),
	(20, '三层架构实践 http://developer.51cto.com/art/201209/358527_all.htm', b'0', '2014-03-21 09:09:14', '2014-03-21 09:09:14', NULL, '172.19.128.74', 0, 0, 0, 0, '0', 69, 0, 0, 0),
	(21, '用户验证资料保留：\r\nhttp://www.cnblogs.com/yanyangtian/category/186446.html\r\nhttp://www.cnblogs.com/AndersLiu/archive/2008/01/01/forms-authentication-part-1.html\r\nhttp://www.cnblogs.com/AndersLiu/archive/2008/01/01/1022420.html\r\nhttp://www.cnblogs.com/fish-li/archive/2012/04/15/2450571.html\r\nhttp://www.cnblogs.com/yao/archive/2006/06/24/434783.html', b'0', '2014-03-21 09:16:25', '2014-03-21 09:16:25', NULL, '172.19.128.74', 0, 0, 0, 0, '0', 70, 0, 0, 0),
	(22, 'PHP 安装微软教程：http://technet.microsoft.com/zh-cn/library/hh994592.aspx', b'0', '2014-03-22 16:51:44', '2014-03-22 16:51:44', NULL, '172.19.128.74', 0, 0, 0, 0, '0', 74, 0, 0, 0),
	(23, 'Word 2010中为表格和插图自动编号 http://www.xzbu.com/8/view-4093054.htm\r\nWord中，删除一个题注后，如何批量更新编号？:http://xiaoyu1985ban.iteye.com/blog/1458746', b'0', '2014-03-22 19:43:08', '2014-03-22 19:43:08', 1, '172.19.128.74', 0, 0, 0, 0, '0', 75, 0, 0, 0),
	(24, '女朋友礼物 http://carfieldloverita.sinaapp.com/\r\nhttp://liumeijun.com/\r\nhttp://love.hackerzhou.me/\r\nhttp://www.cnblogs.com/eyong/p/3562502.html\r\nhttp://yuncode.net/love2014.html\r\nhttp://www.kuqin.com/itlife/20120213/318149.html\r\nhttp://www.v2ex.com/t/31405?p=2', b'0', '2014-04-18 08:08:00', '2014-04-18 08:08:00', 1, '202.115.139.158', 0, 0, 0, 0, '0', 100, 0, 0, 0),
	(25, '隐私保护\r\nXposted: http://forum.xda-developers.com/xposed/framework-xposed-rom-modding-modifying-t1574401', b'0', '2014-04-29 09:55:25', '2014-04-29 09:55:25', NULL, '202.115.139.158', 0, 0, 0, 0, '0', 105, 0, 0, 0),
	(26, '关于词典\r\nhttp://www.tydf.cn/read.php?tid=266742\r\nhttp://www.douban.com/note/278501822/\r\nhttp://www.ed2kers.com/%E5%9B%BE%E4%B9%A6/%E6%95%99%E8%82%B2%E7%A7%91%E6%8A%80/281865.html\r\nhttp://www.ed2000.com/ShowFile.asp?FileID=232113', b'0', '2014-05-02 09:35:12', '2014-05-02 09:35:12', NULL, '172.19.128.74', 0, 0, 0, 0, '0', 106, 0, 0, 0),
	(27, 'OCR 参考资料：http://blog.csdn.net/zhymax/article/details/8435303\r\nhttp://blog.sina.com.cn/s/blog_6cf921f30101b649.html\r\nhttp://blog.csdn.net/bluelikemilk/article/details/8988843\r\nhttp://newsletter.ascc.sinica.edu.tw/news/read_news.php?nid=1878\r\nhttps://code.google.com/p/tesseract-ocr/downloads/list\r\nhttp://www.pixel-technology.com/freeware/tessnet2/\r\nhttp://www.qwolf.com/?p=680\r\nhttp://www.cnblogs.com/expectszc/archive/2012/03/17/2404005.html\r\nhttp://zhangyuefeng1983.blog.163.com/blog/static/1083372520126445523806/', b'0', '2014-05-02 16:15:45', '2014-05-02 16:15:45', NULL, '202.115.139.158', 0, 0, 0, 0, '0', 107, 0, 0, 0),
	(28, '灰度化资料：http://blog.csdn.net/likezhaobin/article/details/6915754\r\nhttp://www.cnblogs.com/Thinknet/archive/2009/01/13/1375106.html\r\nhttp://blog.csdn.net/chenamo9651/article/details/886699', b'0', '2014-05-23 13:01:57', '2014-05-23 13:01:57', NULL, '202.115.139.158', 0, 0, 0, 0, '0', 112, 0, 0, 0),
	(29, '车牌识别及验证码识别的一般思路 http://www.cnblogs.com/xiaotie/archive/2009/01/15/1376677.html', b'0', '2014-05-23 14:53:48', '2014-05-23 14:53:48', NULL, '202.115.139.158', 0, 0, 0, 0, '0', 113, 0, 0, 0),
	(30, '二值化：http://blog.csdn.net/u012244950/article/details/25132457\r\nhttp://www.firstsolver.com/wordpress/?p=1014', b'0', '2014-05-24 15:43:11', '2014-05-24 15:43:11', NULL, '202.115.139.158', 0, 0, 0, 0, '0', 115, 0, 0, 0),
	(31, 'VS 2013 设置选中的引用高亮 颜色，选项->字体和颜色->突出显示的引用', b'0', '2014-09-01 19:25:03', '2014-09-01 19:25:03', NULL, '::1', 0, 0, 0, 0, '0', 164, 0, 0, 0),
	(32, 'tar 批量解压\r\nls *.tar.gz | xargs -n1 tar vxzf', b'0', '2014-09-01 19:27:06', '2014-09-01 19:27:06', NULL, '::1', 0, 0, 0, 0, '0', 165, 0, 0, 0),
	(33, '阅读CLS代码辅助：\r\nhttp://10.10.5.46/MDN_Doc/产品/CDN/CDN_V300R005/开发库/1.配置项/1.1 TR1_TR2/设计/NGOD/CDN概要设计说明书.doc', b'0', '2014-09-04 10:14:29', '2014-09-04 10:14:29', NULL, '::1', 0, 0, 0, 0, '0', 166, 0, 0, 0),
	(34, 'Wiki离线工具开源： http://kiwix.org/wiki/Main_Page/zh-cn；\r\nPancake 私有云同步 Dropbox：https://pancake.io/；\r\n小工具网站介绍：http://www.egouz.com/tools/2.html', b'0', '2014-09-04 20:30:28', '2014-09-04 20:30:28', NULL, '::1', 0, 0, 0, 0, '0', 167, 0, 0, 0),
	(35, '再见 	「じゃ」（ja,男性多用）/「じゃね～！」（ja ne~，女性多用）', b'0', '2014-02-12 16:05:35', '2014-02-14 17:23:30', NULL, '::1', 28, 2, 0, 4, '172.19.128.74', 4021, 0, 0, 1),
	(36, 'http://cmmntr.com/ 好漂亮的一个技术站，里面提到的很多网站的效果都很酷，我在自己的小站里 All in matrix', b'0', '2014-04-22 21:32:55', '2014-04-22 21:32:55', 1, '::1', 0, 0, 0, 0, '0', 7119, 0, 0, 0),
	(37, '说那么多，我一句话：人像大光圈,风景要广角。', b'0', '2014-04-27 22:51:41', '2014-04-27 22:51:41', 1, '::1', 0, 0, 0, 0, '0', 8119, 0, 0, 0),
	(38, '一般来说，人像摄影师所使用的镜头一般为大光圈+中长焦，使用定焦镜头较多，诸如50mm f1.4、85mm f1.2、135mm f2。中长焦配合大光圈带来较浅的景深，可使背景虚化，使人物更加立体。当然，也有使用广角镜头拍摄的人像作品。', b'0', '2014-04-27 22:52:19', '2014-04-27 22:52:19', 1, '::1', 0, 0, 0, 0, '0', 8120, 0, 0, 0),
	(39, '风景照方面，为了能表现大自然的广阔与自然奇观带来的视觉冲击，一般使用广角镜头较多，焦距16mm-35mm使用较多，当然也有使用长焦镜头所拍摄的，也需要看题材来决定。', b'0', '2014-04-27 22:52:39', '2014-04-27 22:52:39', 1, '::1', 0, 0, 0, 0, '0', 8121, 0, 0, 0),
	(40, '饼干头实际是网友对近年来对超薄镜头的统称，诸如佳能EF 40mm F2.8，宾得 DA 40mm F2.8等。40mm-60mm（宾得没有全幅机身，40mm f2.8在APS-C画幅机身上焦距为60mm）的焦距也可以拍人像，扫街、静物等许多题材。由于受限制于体积，所以光圈并没有像一般定焦镜头一样大。', b'0', '2014-04-27 22:53:12', '2014-04-27 22:53:12', 1, '::1', 0, 0, 0, 0, '0', 8122, 0, 0, 0),
	(41, '.NET获取文件的MIME类型(Content Type)  http://blog.useasp.net/archive/2013/08/23/the-method-to-retrieve-file-content-type-or-mime-type-information-string.aspx', b'0', '2014-03-03 21:41:41', '2014-03-03 21:41:41', NULL, '202.115.139.158', 0, 0, 0, 0, '0', 2, 0, 0, 0),
	(42, '设置IIS7文件上传的最大大小 maxAllowedContentLength，maxRequestLength   http://www.cnblogs.com/henryhappier/archive/2010/09/20/1832098.html', b'0', '2014-03-03 21:42:00', '2014-03-03 21:42:00', NULL, '202.115.139.158', 0, 0, 0, 0, '0', 3, 0, 0, 0),
	(43, '通过 File API 使用 JavaScript 读取文件  http://www.html5rocks.com/zh/tutorials/file/dndfiles/', b'0', '2014-03-03 21:42:19', '2014-03-03 21:42:19', NULL, '202.115.139.158', 0, 0, 0, 0, '0', 4, 0, 0, 0),
	(44, 'IBM 使用 JavaScript File API 实现文件上传: http://www.ibm.com/developerworks/cn/web/1101_hanbf_fileupload/index.html?ca', b'0', '2014-03-02 18:49:02', '2014-03-02 18:49:02', NULL, '202.115.139.158', 0, 0, 0, 0, '0', 16, 0, 0, 0),
	(45, 'jQuery异步上传文件   http://blog.okbase.net/jquery2000/archive/774.html', b'0', '2014-03-02 18:49:21', '2014-03-02 18:49:21', NULL, '202.115.139.158', 0, 0, 0, 0, '0', 17, 0, 0, 0),
	(46, 'HTML5应用之文件上传  http://newhtml.net/html5-files-uploads/', b'0', '2014-03-02 18:49:50', '2014-03-02 18:49:50', NULL, '202.115.139.158', 0, 0, 0, 0, '0', 18, 0, 0, 0),
	(47, 'html5 文件拖拽上传及跨域处理  http://coderbee.net/index.php/web/20130703/266', b'0', '2014-03-02 18:50:13', '2014-03-02 18:50:13', NULL, '202.115.139.158', 0, 0, 0, 0, '0', 19, 0, 0, 0),
	(48, '提升用户体验：HTML5 拖放文件上传  http://sofish.de/1545', b'0', '2014-03-02 18:50:25', '2014-03-02 18:50:25', NULL, '202.115.139.158', 0, 0, 0, 0, '0', 20, 0, 0, 0),
	(49, 'jquery插件1：jquery-drag之HTML5拖拽(draggable)API及其兼容解决方案  http://qianduanblog.com/2560.html   	              JS学习32：html5拖拽图片批量ajax无刷新进度上传    http://qianduanblog.com/2700.html', b'0', '2014-03-02 18:51:05', '2014-03-02 18:51:05', NULL, '202.115.139.158', 0, 0, 0, 0, '0', 21, 0, 0, 0),
	(50, 'ASP.NET中采用HTML控件File进行多文件上传   http://www.cnblogs.com/msql/archive/2012/12/06/2805191.html', b'0', '2014-03-02 18:51:26', '2014-03-02 18:51:26', NULL, '202.115.139.158', 0, 0, 0, 0, '0', 22, 0, 0, 0),
	(51, '文件上传的渐进式增强  http://www.ruanyifeng.com/blog/2012/08/file_upload.html', b'0', '2014-03-02 18:51:38', '2014-03-02 18:51:38', NULL, '202.115.139.158', 0, 0, 0, 0, '0', 23, 0, 0, 0),
	(52, '如何把SQLServer数据库从高版本降级到低版本？ http://blog.csdn.net/dba_huangzj/article/details/7952403', b'0', '2014-03-04 09:23:16', '2014-03-04 09:23:16', 1, '172.19.128.74', 0, 0, 0, 0, '0', 26, 0, 0, 0),
	(53, '.Net如何统计在线人数\r\n http://blog.csdn.net/ithomer/article/details/5434823', b'0', '2014-03-04 10:16:08', '2014-03-04 10:16:08', 1, '172.19.128.74', 0, 0, 0, 0, '0', 28, 0, 0, 0),
	(54, 'SQL向Mysql迁移小结：1.“[]符号修改 2.MySql不支持varchar的max长 3.MySql对;的检验很严格 4.IF和WHILE语法差异 5.不支持+字符串连接，需使用Concat函数 6.存储过程参数不需要@符号 7.存储过程不支持Return，可改为Leave+Lable 8.dbo名字修改 9.不支持inserted表，使用last_insert_id替代，删除应类似', b'0', '2014-09-12 12:07:56', '2014-09-12 12:07:56', NULL, '::1', 0, 0, 0, 0, '0', 54, 0, 0, 0),
	(55, '提供各种数据库连接字符串 http://www.connectionstrings.com/', b'0', '2014-09-12 12:08:23', '2014-09-12 12:08:23', NULL, '::1', 0, 0, 0, 0, '0', 55, 0, 0, 0),
	(56, 'MySQL 安装指南 1.修改配置文件my.cnf中的bind-address 2.打开3306端口 3.更新数据库，赋予用户远程访问权限', b'0', '2014-09-12 12:08:58', '2014-09-12 12:08:58', NULL, '::1', 0, 0, 0, 0, '0', 56, 0, 0, 0),
	(57, 'linux下前端高亮和vim 高亮  http://blog.csdn.net/hekejun19861107/article/details/6565279', b'0', '2014-09-12 12:09:14', '2014-09-12 12:09:14', NULL, '::1', 0, 0, 0, 0, '0', 57, 0, 0, 0),
	(61, 'Google的用C实现的HTML5解析库Gumbo库', b'0', '2014-09-18 11:36:09', '2014-09-18 11:36:09', 1, '::1', 0, 0, 0, 0, '0', 61, 0, 0, 0),
	(62, '开源图书', b'0', '2014-09-18 11:37:28', '2014-09-18 11:37:28', 1, '::1', 0, 0, 0, 0, '0', 62, 0, 0, 0),
	(63, 'C++编译 llvm', b'0', '2014-09-18 12:07:25', '2014-09-18 12:07:25', 1, '::1', 0, 0, 0, 0, '0', 63, 0, 0, 0),
	(64, '关注 bleep 与 WinJS，Typescript', b'0', '2014-09-18 12:47:34', '2014-09-18 12:47:34', 1, '::1', 0, 0, 0, 0, '0', 64, 0, 0, 0),
	(65, 'Win32 编程笔记：\n1.C++所有实现需要放在cpp文件中，并且，每个cpp文件都要引用stdafx.h \n2.所有引用Windows库需要放在stdafx.h文件中 \n3.WinMain中注册窗口函数指定WndProc', b'0', '2014-09-19 10:38:55', '2014-09-19 10:38:55', 1, '::1', 0, 0, 0, 0, '0', 65, 0, 0, 0),
	(67, 'C语言 函数手册： http://see.xidian.edu.cn/cpp/html/253.html', b'0', '2014-09-25 11:32:59', '2014-09-25 11:32:59', NULL, '::1', 0, 0, 0, 0, '0', 67, 0, 0, 0),
	(68, 'vim 显示行号     :set nu/number    ； ruler    ；   numberwidth    ；', b'0', '2014-09-25 14:32:45', '2014-09-25 14:32:45', NULL, '::1', 0, 0, 0, 0, '0', 68, 0, 0, 0),
	(69, '编码转换： Windows=>MultiByteToWideChar() 和WideCharToMultiByte() 函数，Linux=> iconv 族函数，通用 mbstowcs()和wcstombs()函数', b'0', '2014-10-11 15:07:26', '2014-10-11 15:07:26', NULL, '::1', 0, 0, 0, 0, '0', 69, 0, 0, 0),
	(70, 'Socket：在Linux用epoll，BSD用kqueue，Windows用IOCP，或者用libevent封装的统一接口（对于不同平台libevent实现时采用各个平台特有的API）', b'0', '2014-10-11 15:59:35', '2014-10-11 15:59:35', NULL, '::1', 0, 0, 0, 0, '0', 70, 0, 0, 0),
	(71, 'Linux 开发，event loop + thread pool处理模型，event loop用epoll来做比较好', b'0', '2014-10-11 16:01:43', '2014-10-11 16:01:43', NULL, '::1', 0, 0, 0, 0, '0', 71, 0, 0, 0),
	(72, '如何实现Linux登陆欢迎提示信息：修改 文件一：/etc/motd& 文件二：/etc/issue', b'0', '2014-10-17 22:10:37', '2014-10-17 22:10:37', NULL, '::1', 0, 0, 0, 0, '0', 72, 0, 0, 0),
	(73, '下载整站：wget -r -p -np -k -P ~/tmp/ http://java-er.com\n解释一下参数\n\n-P 表示下载到哪个目录\n-r 表示递归下载\n-np 表示不下载旁站连接.\n-k 表示将下载的网页里的链接修改为本地链接.\n-p 获得所有显示网页所需的元素\n\n额外的\n-c 断点续传\n-nd 递归下载时不创建一层一层的目录，把所有的文件下载到当前目录\n-L 递归时不进入其它主机，如wget -c -r www.xxx.org/\n-A 指定要下载的文件样式列表，多个样式用逗号分隔\n-i 后面跟一个文件，文件内指明要下载的URL\n\nfrom http://java-er.com/blog/wget-useage-x/', b'0', '2014-10-24 15:37:08', '2014-10-24 15:37:08', NULL, '::1', 0, 0, 0, 0, '0', 73, 0, 0, 0),
	(74, 'unresolved external symbol _WinMain@16的解决方法\n\n1.菜单中选择 Project->Properties, 弹出Property Pages窗口\n2.在左边栏中依次选择：Configuration Properties->C/C++->Preprocessor,然后在右边栏的Preprocessor Definitions对应的项中删除_CONSOLE, 添加_WINDOWS.\n3.在左边栏中依次选择：Configuration Properties->Linker->System,然后在右边栏的SubSystem对应的项改为Windows(/SUBSYSTEM:WINDOWS)\n4.Rebuild All. Ok ?', b'0', '2014-10-24 15:38:36', '2014-10-24 15:38:36', 1, '::1', 0, 0, 0, 0, '0', 74, 0, 0, 0),
	(75, '特殊符号：\n\n箭头符号  ←↑→↓↖↙↗↘↕', b'0', '2014-10-24 15:39:22', '2014-10-24 15:39:22', 1, '::1', 0, 0, 0, 0, '0', 75, 0, 0, 0),
	(76, 'MySQL的API接口：\n\nmysql_affected_rows() 返回被最新的UPDATE, DELETE或INSERT查询影响的行数。  \nmysql_close() 关闭一个服务器连接。  \nmysql_connect() 连接一个MySQL服务器。该函数不推荐；使用mysql_real_connect()代替。  \nmysql_change_user() 改变在一个打开的连接上的用户和数据库。  \nmysql_create_db() 创建一个数据库。该函数不推荐；而使用SQL命令CREATE DATABASE。  \nmysql_data_seek() 在一个查询结果集合中搜寻一任意行。  \nmysql_debug() 用给定字符串做一个DBUG_PUSH。  \nmysql_drop_db() 抛弃一个数据库。该函数不推荐；而使用SQL命令DROP DATABASE。  \nmysql_dump_debug_info() 让服务器将调试信息写入日志文件。  \nmysql_eof() 确定是否已经读到一个结果集合的最后一行。这功能被反对; mysql_errno()或mysql_error()可以相反被使用。  \nmysql_errno() 返回最近被调用的MySQL函数的出错编号。  \nmysql_error() 返回最近被调用的MySQL函数的出错消息。  \nmysql_escape_string() 用在SQL语句中的字符串的转义特殊字符。  \nmysql_fetch_field() 返回下一个表字段的类型。  \nmysql_fetch_field_direct () 返回一个表字段的类型，给出一个字段编号。  \nmysql_fetch_fields() 返回一个所有字段结构的数组。  \nmysql_fetch_lengths() 返回当前行中所有列的长度。  \nmysql_fetch_row() 从结果集合中取得下一行。  \nmysql_field_seek() 把列光标放在一个指定的列上。  \nmysql_field_count() 返回最近查询的结果列的数量。  \nmysql_field_tell() 返回用于最后一个mysql_fetch_field()的字段光标的位置。  \nmysql_free_result() 释放一个结果集合使用的内存。  \nmysql_get_client_info() 返回客户版本信息。  \nmysql_get_host_info() 返回一个描述连接的字符串。  \nmysql_get_proto_info() 返回连接使用的协议版本。  \nmysql_get_server_info() 返回服务器版本号。  \nmysql_info() 返回关于最近执行得查询的信息。  \nmysql_init() 获得或初始化一个MYSQL结构。  \nmysql_insert_id() 返回有前一个查询为一个AUTO_INCREMENT列生成的ID。  \nmysql_kill() 杀死一个给定的线程。  \nmysql_list_dbs() 返回匹配一个简单的正则表达式的数据库名。  \nmysql_list_fields() 返回匹配一个简单的正则表达式的列名。  \nmysql_list_processes() 返回当前服务器线程的一张表。  \nmysql_list_tables() 返回匹配一个简单的正则表达式的表名。  \nmysql_num_fields() 返回一个结果集合重的列的数量。  \nmysql_num_rows() 返回一个结果集合中的行的数量。  \nmysql_options() 设置对mysql_connect()的连接选项。  \nmysql_ping() 检查对服务器的连接是否正在工作，必要时重新连接。  \nmysql_query() 执行指定为一个空结尾的字符串的SQL查询。  \nmysql_real_connect() 连接一个MySQL服务器。  \nmysql_real_query() 执行指定为带计数的字符串的SQL查询。  \nmysql_reload() 告诉服务器重装授权表。  \nmysql_row_seek() 搜索在结果集合中的行，使用从mysql_row_tell()返回的值。  \nmysql_row_tell() 返回行光标位置。  \nmysql_select_db() 连接一个数据库。  \nmysql_shutdown() 关掉数据库服务器。  \nmysql_stat() 返回作为字符串的服务器状态。  \nmysql_store_result() 检索一个完整的结果集合给客户。  \nmysql_thread_id() 返回当前线程的ID。  \nmysql_use_result() 初始化一个一行一行地结果集合的检索。', b'0', '2014-10-24 19:38:37', '2014-10-24 19:38:37', 1, '::1', 0, 0, 0, 0, '0', 76, 0, 0, 0),
	(77, '方法: \n\n    git reset --hard  commit_id\n\n    git push origin HEAD --force\n\n\n\n其他:\n\n    根据–soft –mixed –hard，会对working tree和index和HEAD进行重置:\n    git reset –mixed：此为默认方式，不带任何参数的git reset，即时这种方式，它回退到某个版本，只保留源码，回退commit和index信息\n    git reset –soft：回退到某个版本，只回退了commit的信息，不会恢复到index file一级。如果还要提交，直接commit即可\n    git reset –hard：彻底回退到某个版本，本地的源码也会变为上一个版本的内容\n\n\n    HEAD 最近一个提交\n    HEAD^ 上一次\n    commit_id  每次commit的SHA1值. 可以用git log 看到,也可以在页面上commit标签页里找到.', b'0', '2014-10-24 20:50:52', '2014-10-24 20:50:52', 1, '::1', 0, 0, 0, 0, '0', 77, 0, 0, 0),
	(78, '如何打出圈1，圈2 ①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⑯⑰⑱⑲⑳\n方法：键入“2469”(不含引号)，然后按“Alt+x”组合健，“2469”立即转换成了⑩，非常方便。', b'0', '2014-10-25 15:12:19', '2014-10-25 15:12:19', 1, '::1', 0, 0, 0, 0, '0', 78, 0, 0, 0),
	(79, 'Scintilla插件主要参考： http://t.cn/zH2COmd http://t.cn/zl7xGwM http://t.cn/R7iFmgW   \n目前仍存在打开大文件占用内存过高，切换文件后内存不能释放的问题，可通过分页显示的办法解决，考虑到此工具的定位、用途以及现有成熟工具，所以不予解决', b'0', '2014-10-27 09:02:00', '2014-10-27 09:02:00', 1, '::1', 0, 0, 0, 0, '0', 79, 0, 0, 0),
	(80, 'int GetScrollPos(\n  _In_  HWND hWnd,\n  _In_  int nBar\n); 获取滚动条位置，Win32 Windows API', b'0', '2014-10-30 16:47:53', '2014-10-30 16:47:53', 1, '::1', 0, 0, 0, 0, '0', 80, 0, 0, 0),
	(82, 'Windows.h 与 std::min，max冲突解决：1.#define NOMINMAX  2.#undef min  3. (std::min)', b'0', '2014-11-04 13:45:49', '2014-11-04 13:45:49', 1, '::1', 0, 0, 0, 0, '0', 82, 0, 0, 0),
	(83, 'C++ STL 的实现：\n1.vector  底层数据结构为数组 ，支持快速随机访问\n2.list    底层数据结构为双向链表，支持快速增删\n3.deque   底层数据结构为一个中央控制器和多个缓冲区，详细见STL源码剖析P146，支持首尾（中间不能）快速增删，也支持随机访问\n4.stack   底层一般用23实现，封闭头部即可，不用vector的原因应该是容量大小有限制，扩容耗时\n5.queue   底层一般用23实现，封闭头部即可，不用vector的原因应该是容量大小有限制，扩容耗时\n6.45是适配器,而不叫容器，因为是对容器的再封装\n7.priority_queue 的底层数据结构一般为vector为底层容器，堆heap为处理规则来管理底层容器实现\n8.set       底层数据结构为红黑树，有序，不重复\n9.multiset  底层数据结构为红黑树，有序，可重复 \n10.map      ﻿﻿﻿﻿底层数据结构为红黑树，有序，不重复\n11.multimap 底层数据结构为红黑树，有序，可重复\n12.hash_set ﻿﻿﻿﻿底层数据结构为hash表，无序，不重复\n13.hash_multiset 底层数据结构为hash表，无序，可重复 \n14.hash_map      ﻿﻿﻿﻿底层数据结构为hash表，无序，不重复\n15.hash_multimap 底层数据结构为hash表，无序，可重复', b'0', '2014-11-04 13:48:34', '2014-11-04 13:48:34', 1, '::1', 0, 0, 0, 0, '0', 83, 0, 0, 0),
	(84, 'truncate table; 用于清理mysql表空间，降低水位，收缩段空间', b'0', '2014-11-13 19:37:06', '2014-11-13 19:37:06', 1, '::1', 0, 0, 0, 0, '0', 84, 0, 0, 0),
	(85, '含有指针的对象不要放入容器中，因为从容器中取用对象时会返回一个经浅复制的对象，然后释放原对象，析构时释放了对象中指针指向的空间，而返回的对象在析构时会重复释放指针指向的空间，导致错误。解决方案： ①自定义复制构造函数，复制指针指向的空间内容 ②动态生成对象，然后把指针存入容器', b'0', '2014-11-13 19:50:35', '2014-11-13 19:50:35', 1, '::1', 0, 0, 0, 0, '0', 85, 0, 0, 0),
	(86, 'linux中vim查看UTF8文件乱码的解决方法：\nvim ~/.vimrc\nset fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936\nset termencoding=utf-8\nset encoding=utf-8', b'0', '2014-12-10 10:04:15', '2014-12-10 10:04:15', NULL, '::1', 0, 0, 0, 0, '0', 86, 0, 0, 0),
	(88, 'CDN.R007.CLS调度逻辑\n1. 查Redis是否有匹配请求文件名的文件及其分布的节点集合\n2. 如无，则向上层CDN请求（如果配置了上层CDN的地址），否则返回404；\n3. 检查请求范围\n4. 优先调度正在传输相同文件块的节点\n5. 如果手动路由调度开启（默认为关），则优先调度优先级高，可用带宽多的区域码匹配的节点\n6. 优先调度优先级高，可用带宽多的匹配主备节点区域码的节点\n7. 本层CG上都没有文件，则根据文件名的哈希值分配一个CG向上一层CLS请求\n8. 选取一个任务最轻的CG？\n9. 都没有找到，说明Redis中有此文件记录，但没找到CG提供服务，可能是CG区域码配置错误或者可用的CG在VSS的排除IP列表中（也可能带宽不够？）', b'0', '2014-12-23 11:53:01', '2014-12-23 11:53:01', NULL, '10.10.88.5', 0, 0, 0, 0, '0', 88, 0, 0, 0),
	(89, '# cd /usr/bin\n# ln -s /usr/local/bin/lrz rz\n# ln -s /usr/local/bin/lsz sz', b'0', '2014-12-24 16:00:38', '2014-12-24 16:00:38', NULL, '10.10.88.5', 0, 0, 0, 0, '0', 89, 0, 0, 0),
	(90, '1 永久方法 – 需要重启服务器\n\n修改/etc/selinux/config文件中设置SELINUX=disabled ，然后重启服务器。\n\n2 临时方法 – 设置系统参数\n\n使用命令setenforce 0\n\n附：\nsetenforce 1 设置SELinux 成为enforcing模式\nsetenforce 0 设置SELinux 成为permissive模式', b'0', '2014-12-24 19:50:25', '2014-12-24 19:50:25', NULL, '10.10.88.5', 0, 0, 0, 0, '0', 90, 0, 0, 0),
	(91, 'vmware 11 序列号：1F04Z-6D111-7Z029-AV0Q4-3AEH8', b'0', '2014-12-25 09:10:22', '2014-12-25 09:10:22', NULL, '10.10.88.5', 0, 0, 0, 0, '0', 91, 0, 0, 0),
	(92, 'mysql报错，无法登陆解决方案：PID类型的错误出出现在日志中，位置/var/lib/mysql/vasms.err，\n如果锁存在，报\nmysql is not running but lock exists\n则删除日志 /var/lock/subsys/mysql \n如果提示 [ERROR] Fatal error: Can\'t open and lock privilege tables: Table \'mysql.host\' doesn\'t exist\n则执行 mysql_install_db，重新安装Mysql表\n如果提示Can\'t open and lock privilege tables: Can\'t find file: \'./mysql/host.frm\'\n则对/var/lib/mysql/mysql目录下文件赋予权限\n等等等等\n大部分的错误可以在日志里查看到，日志文件/var/lib/mysql/主机头名称xxx.err', b'0', '2014-12-25 17:26:42', '2014-12-25 17:26:42', NULL, '10.10.88.5', 0, 0, 0, 0, '0', 92, 0, 0, 0),
	(93, 'watch -n 1 "ls -lh /mpeg/ci/test_TWSX1419566217084997"', b'0', '2014-12-26 17:08:47', '2014-12-26 17:08:47', NULL, '10.10.88.5', 0, 0, 0, 0, '0', 93, 0, 0, 0),
	(94, 'http://zentao.coship.com:82/news.asp?newsid=7 and 1=0 union select * from admin', b'0', '2014-12-28 10:29:13', '2014-12-28 10:29:13', NULL, '10.10.88.1', 0, 0, 0, 0, '0', 94, 0, 0, 0),
	(95, 'VS缩进编排\n1. 全选\n2. Ctrl+ K + F', b'0', '2014-12-29 11:20:13', '2014-12-29 11:20:13', NULL, '::1', 0, 0, 0, 0, '0', 95, 0, 0, 0),
	(96, 'awk输出单引号：将\\\'用两个\'括起来，即：  \'\\\'\'', b'0', '2014-12-30 11:03:57', '2014-12-30 11:03:57', NULL, '::1', 0, 0, 0, 0, '0', 96, 0, 0, 0),
	(97, 'Vim缩进设置\n\nset sw=4\nset ts=4\n \nfiletype indent on\nautocmd FileType python setlocal et sta sw=4 sts=4\n\n前面两行将shiftwidth和tabstop都设为4。第三行开启自动的缩进检测。最后一行则根据Python语言的建议（将tab展成四个空格）进行了专门设置。', b'0', '2014-12-30 11:23:53', '2014-12-30 11:23:53', NULL, '::1', 0, 0, 0, 0, '0', 97, 0, 0, 0),
	(98, 'Linux.168服务器：172.21.11.168 账户：root 密码：coshipzxj\nLinux.169服务器：172.21.11.169 账户：root 密码：coshipzxj\n新的位置：二楼机房 28/29机柜，39号位\n\nLinux.36服务器：172.21.10.36  root   coship\nLinux.183服务器：172.21.13.183 root   coshipb06\nLinux.199服务器：172.21.11.199  root  coship908278\n\nLinux.Auto服务器：172.21.11.37   root   jccoship123\nLinux.Wei服务器：172.21.11.71  root  qwe123$', b'0', '2015-01-04 11:21:38', '2015-01-04 11:21:38', NULL, '10.10.88.5', 0, 0, 0, 0, '0', 98, 0, 0, 0),
	(100, 'Microsoft Visual Studio Ultimate 2013有效序列号：\nBWG7X-J98B3-W34RT-33B3R-JVYW9', b'0', '2015-01-13 14:06:38', '2015-01-13 14:06:38', 1, '::1', 0, 0, 0, 0, '0', 100, 0, 0, 0),
	(101, 'xmanager enterprise 4注册码，测试可用。\nUser Name: 贵岩\nCompany Name: Microsoft\nProduct Key: 101210-450789-147200', b'0', '2015-01-20 16:32:29', '2015-01-20 16:32:29', 1, '::1', 0, 0, 0, 0, '0', 101, 0, 0, 0),
	(102, 'Beyond Compare 4注册码：\nH1bJTd2SauPv5Garuaq0Ig43uqq5NJOEw94wxdZTpU-pFB9GmyPk677gJ\nvC1Ro6sbAvKR4pVwtxdCfuoZDb6hJ5bVQKqlfihJfSYZt-xVrVU27+0Ja\nhFbqTmYskatMTgPyjvv99CF2Te8ec+Ys2SPxyZAF0YwOCNOWmsyqN5y9t\nq2Kw2pjoiDs5gIH-uw5U49JzOB6otS7kThBJE-H9A76u4uUvR8DKb+VcB\nrWu5qSJGEnbsXNfJdq5L2D8QgRdV-sXHp2A-7j1X2n4WIISvU1V9koIyS\nNisHFBTcWJS0sC5BTFwrtfLEE9lEwz2bxHQpWJiu12ZeKpi+7oUSqebX+', b'0', '2015-01-21 20:07:11', '2015-01-21 20:07:11', NULL, '10.10.88.5', 0, 0, 0, 0, '0', 102, 0, 0, 0);
/*!40000 ALTER TABLE `t_message` ENABLE KEYS */;


-- 导出  表 matrix.t_replyrelation 结构
DROP TABLE IF EXISTS `t_replyrelation`;
CREATE TABLE IF NOT EXISTS `t_replyrelation` (
  `F_Id` int(11) NOT NULL AUTO_INCREMENT,
  `F_TopMsgId` int(11) NOT NULL,
  `F_BottomMsgId` int(11) NOT NULL,
  `F_MainMsgId` int(11) NOT NULL,
  PRIMARY KEY (`F_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- 导出  表 matrix.t_resource 结构
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



-- 导出  表 matrix.t_resourcerelation 结构
DROP TABLE IF EXISTS `t_resourcerelation`;
CREATE TABLE IF NOT EXISTS `t_resourcerelation` (
  `F_Id` int(11) NOT NULL AUTO_INCREMENT,
  `F_MainId` int(11) NOT NULL,
  `F_ResourceId` int(11) NOT NULL,
  `F_Illustration` varchar(200) NOT NULL,
  PRIMARY KEY (`F_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 导出  表 matrix.t_user 结构
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  matrix.t_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT IGNORE INTO `t_user` (`F_UserName`, `F_Salt`, `F_UserNameHash`, `F_PasswordHash`, `F_UserRole`, `F_Status`, `F_Email`, `F_RegisterTime`, `F_RealName`, `F_Gender`, `F_PhoneNumber`) VALUES
	('sanwave', 'f361e157-1929-48a5-b986-331086b9c31d', 'Wc7AjP9xRFJSEB7KQrrHTL1ozsjse5DDhmOrLNtuEiA=', 'bvZEeRRnnjrzUDpBdU85cOU8VQFSKqTQhIYktzU2EU8=', 'manager', 'inActived', 'sxwangbo@live.com', '2014-09-16 14:29:30', NULL, NULL, NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;


-- 导出  过程 matrix.AddResource 结构
DROP PROCEDURE IF EXISTS `AddResource`;
DELIMITER //
CREATE PROCEDURE `AddResource`(
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


-- 导出  过程 matrix.GetCommentById 结构
DROP PROCEDURE IF EXISTS `GetCommentById`;
DELIMITER //
CREATE PROCEDURE `GetCommentById`(Id int)
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
		a.F_ReplyDepth AS ReplyDepth, 
		a.F_ReplyedDepth AS ReplyedDepth,
		a.F_ResourceID AS ResourceId
	FROM t_comment a LEFT JOIN t_user b ON (a.F_Composer = b.F_ID) 
	WHERE a.F_ID = Id 
	ORDER BY PostTime;
END//
DELIMITER ;


-- 导出  过程 matrix.GetCommentsByResourceId 结构
DROP PROCEDURE IF EXISTS `GetCommentsByResourceId`;
DELIMITER //
CREATE PROCEDURE `GetCommentsByResourceId`(ResourceID int)
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


-- 导出  过程 matrix.GetCommentsCount 结构
DROP PROCEDURE IF EXISTS `GetCommentsCount`;
DELIMITER //
CREATE PROCEDURE `GetCommentsCount`()
BEGIN
	SELECT Count(*) FROM t_comment;
END//
DELIMITER ;


-- 导出  过程 matrix.GetMessageById 结构
DROP PROCEDURE IF EXISTS `GetMessageById`;
DELIMITER //
CREATE PROCEDURE `GetMessageById`(Id int)
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
		a.F_ReplyMsgID AS ReplyMsgID,
		a.F_ReplyDepth AS ReplyDepth,
		a.F_ReplyedDepth AS ReplyedDepth 
	FROM t_message a 
		LEFT JOIN t_user b ON (a.F_Composer = b.F_ID) 
	WHERE a.F_ID = Id
	ORDER BY PostTime;
END//
DELIMITER ;


-- 导出  过程 matrix.GetMessageIDsByPage 结构
DROP PROCEDURE IF EXISTS `GetMessageIDsByPage`;
DELIMITER //
CREATE PROCEDURE `GetMessageIDsByPage`()
BEGIN
	SELECT F_Id AS Id FROM t_message ORDER BY F_PostTime DESC;
END//
DELIMITER ;


-- 导出  过程 matrix.GetMessagesCount 结构
DROP PROCEDURE IF EXISTS `GetMessagesCount`;
DELIMITER //
CREATE PROCEDURE `GetMessagesCount`()
BEGIN
	SELECT Count(*) FROM t_message;
END//
DELIMITER ;


-- 导出  过程 matrix.GetResourceById 结构
DROP PROCEDURE IF EXISTS `GetResourceById`;
DELIMITER //
CREATE PROCEDURE `GetResourceById`(id int)
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


-- 导出  过程 matrix.GetResourceChildren 结构
DROP PROCEDURE IF EXISTS `GetResourceChildren`;
DELIMITER //
CREATE PROCEDURE `GetResourceChildren`(id int)
BEGIN
	IF id = 0 THEN
		SELECT id = F_Id FROM t_resource WHERE F_ParentFolder = 0;
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


-- 导出  过程 matrix.GetUserByUsername 结构
DROP PROCEDURE IF EXISTS `GetUserByUsername`;
DELIMITER //
CREATE PROCEDURE `GetUserByUsername`(UserName nvarchar(50))
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


-- 导出  过程 matrix.LoginUser 结构
DROP PROCEDURE IF EXISTS `LoginUser`;
DELIMITER //
CREATE PROCEDURE `LoginUser`(
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


-- 导出  过程 matrix.PostComment 结构
DROP PROCEDURE IF EXISTS `PostComment`;
DELIMITER //
CREATE PROCEDURE `PostComment`(
	ResourceID int,
	Content nvarchar(4000),
	PostTime datetime,
	Composer nvarchar(50),
	PostIP nvarchar(50)
)
BEGIN
	INSERT INTO t_comment 
		(F_ResourceID, F_Contents, F_isHtml, F_PostTime, F_LastReplyTime,
		F_Composer, F_PostIP,
		F_Support, F_Oppose, F_Report, F_ReplyNum, F_ReactLastIP, 
		F_MainMsgID, F_ReplyMsgID, F_ReplyDepth, F_ReplyedDepth)
	VALUES
		(ResourceID, Content, '0', PostTime, PostTime, 
		(SELECT F_Id FROM t_user WHERE F_UserName = Composer), PostIP,
		'0', '0', 0, '0', '0',
		'0', '0', '0', '0');
		
	SELECT last_insert_id();

	UPDATE t_comment SET
		F_MainMsgID = F_Id
	WHERE F_MainMsgID = 0;
END//
DELIMITER ;


-- 导出  过程 matrix.PostMessage 结构
DROP PROCEDURE IF EXISTS `PostMessage`;
DELIMITER //
CREATE PROCEDURE `PostMessage`(
	Content nvarchar(4000),
	PostTime datetime,
	Composer nvarchar(50),
	PostIP nvarchar(50)
)
BEGIN
	INSERT INTO t_message
		(F_Contents, F_isHtml, F_PostTime, F_LastReplyTime,
		F_Composer, F_PostIP,
		F_Support, F_Oppose, F_Report, F_ReplyNum, F_ReactLastIP, 
		F_MainMsgID, F_ReplyMsgID, F_ReplyDepth, F_ReplyedDepth)
	SELECT
		Content, 0, PostTime, PostTime, 
		(SELECT F_Id FROM t_user WHERE F_UserName = Composer), PostIP, 
		'0', '0', '0', '0', '0', 
		'0', '0', '0', '0';
		
		SELECT last_insert_id();

	UPDATE t_message SET
		F_MainMsgID = F_Id
	WHERE F_MainMsgID = 0;
END//
DELIMITER ;


-- 导出  过程 matrix.RegisterUser 结构
DROP PROCEDURE IF EXISTS `RegisterUser`;
DELIMITER //
CREATE PROCEDURE `RegisterUser`(
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


-- 导出  过程 matrix.RemoveMessage 结构
DROP PROCEDURE IF EXISTS `RemoveMessage`;
DELIMITER //
CREATE PROCEDURE `RemoveMessage`(Id int)
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


-- 导出  过程 matrix.RemoveResource 结构
DROP PROCEDURE IF EXISTS `RemoveResource`;
DELIMITER //
CREATE PROCEDURE `RemoveResource`(ResourceId int)
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


-- 导出  过程 matrix.ReplyCommentById 结构
DROP PROCEDURE IF EXISTS `ReplyCommentById`;
DELIMITER //
CREATE PROCEDURE `ReplyCommentById`(
	SourceId int,
	Now datetime,
	Content nvarchar(4000),
	Composer nvarchar(50),
	PostIP nvarchar(50)
)
BEGIN
	DECLARE	ResourceId int;
	DECLARE	ReplyDepth int;
	DECLARE	MainMsgId int;
	DECLARE	BottomMsgId int;

	IF EXISTS ( SELECT * FROM t_comment WHERE F_Id = SourceId) THEN
		UPDATE t_comment SET 
				F_LastReplyTime = Now, 
				F_ReplyNum = F_ReplyNum + 1,
				F_ReplyedDepth = (CASE WHEN F_ReplyedDepth = '0' THEN '1' ELSE F_ReplyedDepth END)
		WHERE F_Id = SourceId;

		SELECT 
			ResourceId = F_ResourceID,
			MainMsgId = F_MainMsgID, 
			ReplyDepth = F_ReplyDepth 
		FROM t_comment 
		WHERE F_Id = SourceId;
			
		INSERT INTO t_comment 
			(F_ResourceID, F_Contents, F_isHtml, F_PostTime, F_LastReplyTime,
			F_Composer, F_PostIP,
			F_Support, F_Oppose, F_Report, F_ReplyNum, F_ReactLastIP, 
			F_MainMsgID, F_ReplyMsgID, F_ReplyDepth, F_ReplyedDepth)
		VALUES
			(ResourceID, Content, 0, Now, Now, 
			(SELECT F_Id FROM t_user WHERE F_UserName = Composer), PostIP,
			'0', '0', '0', '0', '0',
			(SELECT F_MainMsgId FROM t_comment WHERE F_Id = SourceId), SourceId, '0', '0');
		
		SELECT last_insert_id();
	END IF;
END//
DELIMITER ;


-- 导出  过程 matrix.ReplyMessageById 结构
DROP PROCEDURE IF EXISTS `ReplyMessageById`;
DELIMITER //
CREATE PROCEDURE `ReplyMessageById`(
	SourceId int,
	Now datetime,
	Content nvarchar(4000),
	Composer nvarchar(50),
	PostIP nvarchar(50)
)
BEGIN
	DECLARE	ReplyDepth int;
	DECLARE	MainMsgId int;
	DECLARE	BottomMsgId int;

	IF EXISTS ( SELECT * FROM t_message WHERE F_Id = SourceId) THEN
		UPDATE t_message SET 
				F_LastReplyTime = Now, 
				F_ReplyNum = F_ReplyNum + 1,
				F_ReplyedDepth = (CASE WHEN F_ReplyedDepth = '0' THEN '1' ELSE F_ReplyedDepth END)
		WHERE F_Id = SourceId;

		SELECT 
			MainMsgId = F_MainMsgID, 
			ReplyDepth = F_ReplyDepth 
		FROM t_message 
		WHERE F_Id = SourceId;
			
		INSERT INTO t_message
			(F_Contents, F_isHtml, F_PostTime, F_LastReplyTime,
			F_Composer, F_PostIP,
			F_Support, F_Oppose, F_Report, F_ReplyNum, F_ReactLastIP, 
			F_MainMsgId, F_ReplyMsgId, F_ReplyDepth, F_ReplyedDepth)
		SELECT
			Content, 0, Now, Now, 
			(SELECT F_Id FROM t_user WHERE F_UserName = Composer), PostIP, 
			'0', '0', '0', '0', '0', 
			(SELECT F_MainMsgId FROM t_message WHERE F_Id = SourceId), SourceId, '0', '0';
		
		SELECT last_insert_id();
	END IF;
END//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
