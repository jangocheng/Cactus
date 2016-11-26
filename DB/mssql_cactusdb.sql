USE [master]
GO
/****** Object:  Database [cactusdb]    Script Date: 11/24/2016 10:41:33 ******/
CREATE DATABASE [cactusdb] ON  PRIMARY 
( NAME = N'cactusdb', FILENAME = N'G:\Microsoft SQL Serve DB\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\cactusdb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'cactusdb_log', FILENAME = N'G:\Microsoft SQL Serve DB\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\cactusdb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [cactusdb] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cactusdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cactusdb] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [cactusdb] SET ANSI_NULLS OFF
GO
ALTER DATABASE [cactusdb] SET ANSI_PADDING OFF
GO
ALTER DATABASE [cactusdb] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [cactusdb] SET ARITHABORT OFF
GO
ALTER DATABASE [cactusdb] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [cactusdb] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [cactusdb] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [cactusdb] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [cactusdb] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [cactusdb] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [cactusdb] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [cactusdb] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [cactusdb] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [cactusdb] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [cactusdb] SET  DISABLE_BROKER
GO
ALTER DATABASE [cactusdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [cactusdb] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [cactusdb] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [cactusdb] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [cactusdb] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [cactusdb] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [cactusdb] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [cactusdb] SET  READ_WRITE
GO
ALTER DATABASE [cactusdb] SET RECOVERY FULL
GO
ALTER DATABASE [cactusdb] SET  MULTI_USER
GO
ALTER DATABASE [cactusdb] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [cactusdb] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'cactusdb', N'ON'
GO
USE [cactusdb]
GO
/****** Object:  Table [dbo].[sys_user]    Script Date: 11/24/2016 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_user](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[Name] [varchar](255) NULL,
	[Password] [varchar](255) NULL,
	[NickName] [varchar](255) NULL,
	[Avatar] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Qq] [varchar](255) NULL,
	[AddTime] [datetime] NULL,
	[LastLoginTime] [datetime] NULL,
	[LastLoginIp] [varchar](255) NULL,
	[IsSuperUser] [int] NULL,
 CONSTRAINT [PK_sys_user] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[sys_user] ON
INSERT [dbo].[sys_user] ([User_Id], [RoleId], [Name], [Password], [NickName], [Avatar], [Email], [Phone], [Qq], [AddTime], [LastLoginTime], [LastLoginIp], [IsSuperUser]) VALUES (1, 1, N'702295399@qq.com', N'cebfd1559b68d67688884d7a3d3e8c', N'漫漫洒洒', N'/Upload/Avatar/Avatar_1.jpg', N'702295399@qq.com', N'1888888889', N'702295399', CAST(0x0000A5A500A0A49C AS DateTime), CAST(0x0000A68F0182C73C AS DateTime), N'127.0.0.1', 1)
INSERT [dbo].[sys_user] ([User_Id], [RoleId], [Name], [Password], [NickName], [Avatar], [Email], [Phone], [Qq], [AddTime], [LastLoginTime], [LastLoginIp], [IsSuperUser]) VALUES (3190, 3, N'测试账户', N'cebfd1559b68d67688884d7a3d3e8c', N'测试小二', N'/Upload/Avatar/Avatar_3190.jpg', N'7022953991@qq.com', N'1234567891', N'1234567891', CAST(0x0000A5B100ABFEDC AS DateTime), CAST(0x0000A61B01503A38 AS DateTime), N'127.0.0.1', 0)
SET IDENTITY_INSERT [dbo].[sys_user] OFF
/****** Object:  Table [dbo].[sys_role]    Script Date: 11/24/2016 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_role](
	[Role_Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](255) NOT NULL,
	[ActionIds] [varchar](2000) NOT NULL,
 CONSTRAINT [PK_sys_role] PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[sys_role] ON
INSERT [dbo].[sys_role] ([Role_Id], [RoleName], [ActionIds]) VALUES (1, N'超级管理员组', N'Blog_A101,Blog_A102,Blog_A103,Blog_A104,Blog_A105,Blog_A106,Blog_A107,Blog_A108,Blog_A109,Blog_A110,Blog_B101,Blog_C101,Blog_C102,Blog_C103,Blog_C104,Blog_C105,Blog_D101,Blog_D102,Blog_D103,Blog_D104,Blog_D105,Blog_D106,Blog_D107,Blog_D108,Blog_D109,Blog_D110,Blog_E101,Blog_E102,Blog_E103,Blog_E104,Blog_F101,Blog_F102,Root_A101,Root_B101,Root_B102,Root_B103,Root_B104,Store_A101,Sys_A101,Sys_B101,Sys_B102,Sys_B103,Sys_B104,Sys_B105,Sys_C101,Sys_C102,Sys_C103,Sys_C104,Sys_D101,Sys_D102,Sys_D103,Sys_D104,Sys_D105,Sys_D106,Sys_E101,Sys_E102,Sys_E103,Sys_E104')
INSERT [dbo].[sys_role] ([Role_Id], [RoleName], [ActionIds]) VALUES (3, N'测试管理员', N'')
SET IDENTITY_INSERT [dbo].[sys_role] OFF
/****** Object:  Table [dbo].[store_staff]    Script Date: 11/24/2016 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[store_staff](
	[Staff_Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[UserName] [varchar](255) NOT NULL,
	[UserPwd] [varchar](255) NOT NULL,
	[NickName] [varchar](255) NOT NULL,
	[Phone] [varchar](255) NOT NULL,
	[Sex] [int] NOT NULL,
	[AvatarPath] [varchar](255) NOT NULL,
	[IsUsable] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[TargetIp] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store_orderDetail]    Script Date: 11/24/2016 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[store_orderDetail](
	[Od_Id] [int] NOT NULL,
	[OId] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Num] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Od_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store_order]    Script Date: 11/24/2016 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[store_order](
	[Order_Id] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
	[UId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Des] [varchar](255) NOT NULL,
	[State] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store_info]    Script Date: 11/24/2016 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[store_info](
	[Store_Id] [int] NOT NULL,
	[StoreName] [varchar](255) NOT NULL,
	[StoreLogoPath] [varchar](255) NOT NULL,
	[StoreDes] [varchar](255) NOT NULL,
	[StoreSwitch] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[LastTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Store_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store_customer]    Script Date: 11/24/2016 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[store_customer](
	[U_Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](255) NOT NULL,
	[UserPwd] [varchar](255) NOT NULL,
	[NickName] [varchar](255) NOT NULL,
	[Phone] [varchar](255) NOT NULL,
	[Sex] [int] NOT NULL,
	[AvatarPath] [varchar](255) NOT NULL,
	[IsUsable] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[LastTime] [datetime] NOT NULL,
	[TargetIp] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store_commodity]    Script Date: 11/24/2016 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[store_commodity](
	[C_Id] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
	[C_Name] [varchar](255) NOT NULL,
	[C_Price] [int] NOT NULL,
	[C_PicPath] [varchar](255) NOT NULL,
	[C_Stock] [int] NOT NULL,
	[C_ProName] [varchar](255) NULL,
	[C_ProDetail] [varchar](255) NULL,
	[C_Des] [varchar](255) NOT NULL,
	[CatId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[LastTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[C_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store_category]    Script Date: 11/24/2016 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[store_category](
	[Cat_Id] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
	[Cat_Name] [varchar](255) NOT NULL,
	[Cat_Des] [varchar](255) NULL,
	[PId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[LastTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cat_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cms_temppage]    Script Date: 11/24/2016 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_temppage](
	[TempPage_Id] [int] IDENTITY(1,1) NOT NULL,
	[TempName] [varchar](255) NOT NULL,
	[TempByname] [varchar](255) NULL,
	[TempParameter] [varchar](2000) NOT NULL,
	[TempPath] [varchar](255) NULL,
	[TempContent] [varchar](4000) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[LastTime] [datetime] NOT NULL,
 CONSTRAINT [PK_cms_temppage] PRIMARY KEY CLUSTERED 
(
	[TempPage_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[cms_temppage] ON
INSERT [dbo].[cms_temppage] ([TempPage_Id], [TempName], [TempByname], [TempParameter], [TempPath], [TempContent], [CreateTime], [LastTime]) VALUES (2, N'Default', N'默认模板', N'[{ "key": "title", "value": "标题", "label": "标题", "tiplabel": "标题", "type": "1" },{ "key": "siteDescr", "value": "描述", "label": "描述", "tiplabel": "描述", "type": "1" },{ "key": "siteKeywords", "value": "关键字", "label": "关键字", "tiplabel": "关键字", "type": "1" }, { "key": "content", "value": "内容", "label": "内容", "type": "2" }]', N'/Template/Default.cshtml', N'@{ 
    Layout = "~/Themes/Default/Views/Shared/_BlogLayout.cshtml";
    var obj = ViewData["Data"] as Newtonsoft.Json.Linq.JObject;
    ViewBag.Title = obj["title"].ToString();
    ViewBag.SiteDescr = obj["siteDescr"].ToString();
    ViewBag.SiteKeywords = obj["siteKeywords"].ToString();
}


<form class="pure-form pure-search pure-g" action="@Url.Action("Search", "Blog")" method="get">
    <input type="text" placeholder="输入你的关键字">
    <button type="submit" class="pure-button pure-button-primary">搜索</button>
</form>
<div class="posts">

    <section class="post">
        <header class="post-header">
            <h2 class="post-title">@(obj["title"].ToString())</h2>
            <p class="post-meta">
                发表于 @(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
                

            </p>
        </header>

        <div class="post-description-detail">
            @Html.Raw(obj["content"].ToString())
        </div>
    </section>
</div>', CAST(0x0000A6150126E688 AS DateTime), CAST(0x0000A6530180D530 AS DateTime))
INSERT [dbo].[cms_temppage] ([TempPage_Id], [TempName], [TempByname], [TempParameter], [TempPath], [TempContent], [CreateTime], [LastTime]) VALUES (3, N'Default2', N'默认模板2', N'[{ "key": "title", "value": "标题", "label": "标题", "tiplabel": "标题", "type": "1" }, { "key": "content", "value": "内容", "label": "内容", "type": "2" }]', N'/Template/Default2.cshtml', N'@{
     Layout = "~/Themes/Default/Views/Shared/_BlogLayout.cshtml";
    var obj = ViewData["Data"] as Newtonsoft.Json.Linq.JObject;
}
<form class="pure-form pure-search pure-g" action="@Url.Action("Search", "Blog")" method="get">
    <input type="text" placeholder="输入你的关键字">
    <button type="submit" class="pure-button pure-button-primary">搜索</button>
</form>
<div class="posts">

    <section class="post">
        <header class="post-header">
            <h2 class="post-title">@(obj["title"].ToString())</h2>
            <p class="post-meta">
                发表于 @(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
            </p>
        </header>

        <div class="post-description-detail">
            @Html.Raw(obj["content"].ToString())
        </div>
    </section>
</div>', CAST(0x0000A61501642638 AS DateTime), CAST(0x0000A63F01752B40 AS DateTime))
SET IDENTITY_INSERT [dbo].[cms_temppage] OFF
/****** Object:  Table [dbo].[cms_tagmap]    Script Date: 11/24/2016 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cms_tagmap](
	[m_TagId] [int] NOT NULL,
	[m_ArticleId] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[cms_tagmap] ([m_TagId], [m_ArticleId]) VALUES (11, 3)
INSERT [dbo].[cms_tagmap] ([m_TagId], [m_ArticleId]) VALUES (11, 4)
INSERT [dbo].[cms_tagmap] ([m_TagId], [m_ArticleId]) VALUES (11, 9)
INSERT [dbo].[cms_tagmap] ([m_TagId], [m_ArticleId]) VALUES (1, 11)
INSERT [dbo].[cms_tagmap] ([m_TagId], [m_ArticleId]) VALUES (3, 11)
INSERT [dbo].[cms_tagmap] ([m_TagId], [m_ArticleId]) VALUES (9, 11)
/****** Object:  Table [dbo].[cms_tag]    Script Date: 11/24/2016 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_tag](
	[Tag_Id] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [varchar](255) NOT NULL,
	[TagDes] [varchar](255) NULL,
	[LastTime] [datetime] NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_cms_tag] PRIMARY KEY CLUSTERED 
(
	[Tag_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[cms_tag] ON
INSERT [dbo].[cms_tag] ([Tag_Id], [TagName], [TagDes], [LastTime], [CreateTime]) VALUES (1, N'Test', NULL, CAST(0x0000A63E0172E27C AS DateTime), CAST(0x0000A63E017040A8 AS DateTime))
INSERT [dbo].[cms_tag] ([Tag_Id], [TagName], [TagDes], [LastTime], [CreateTime]) VALUES (3, N'test', NULL, CAST(0x0000A64200047310 AS DateTime), CAST(0x0000A64200047310 AS DateTime))
INSERT [dbo].[cms_tag] ([Tag_Id], [TagName], [TagDes], [LastTime], [CreateTime]) VALUES (4, N'test1', NULL, CAST(0x0000A64200058B24 AS DateTime), CAST(0x0000A64200058B24 AS DateTime))
INSERT [dbo].[cms_tag] ([Tag_Id], [TagName], [TagDes], [LastTime], [CreateTime]) VALUES (5, N'test2', N'test1', CAST(0x0000A64200059484 AS DateTime), CAST(0x0000A64200059484 AS DateTime))
INSERT [dbo].[cms_tag] ([Tag_Id], [TagName], [TagDes], [LastTime], [CreateTime]) VALUES (6, N'test3', N'test3', CAST(0x0000A6420005A03C AS DateTime), CAST(0x0000A6420005A03C AS DateTime))
INSERT [dbo].[cms_tag] ([Tag_Id], [TagName], [TagDes], [LastTime], [CreateTime]) VALUES (7, N'test4', N'test4', CAST(0x0000A6420005AAC8 AS DateTime), CAST(0x0000A6420005AAC8 AS DateTime))
INSERT [dbo].[cms_tag] ([Tag_Id], [TagName], [TagDes], [LastTime], [CreateTime]) VALUES (8, N'test5', N'test5', CAST(0x0000A6420005B2FC AS DateTime), CAST(0x0000A6420005B2FC AS DateTime))
INSERT [dbo].[cms_tag] ([Tag_Id], [TagName], [TagDes], [LastTime], [CreateTime]) VALUES (9, N'test6', N'test6', CAST(0x0000A6420005BC5C AS DateTime), CAST(0x0000A6420005BC5C AS DateTime))
INSERT [dbo].[cms_tag] ([Tag_Id], [TagName], [TagDes], [LastTime], [CreateTime]) VALUES (10, N'test7', N'test7', CAST(0x0000A6420005CF1C AS DateTime), CAST(0x0000A6420005CF1C AS DateTime))
INSERT [dbo].[cms_tag] ([Tag_Id], [TagName], [TagDes], [LastTime], [CreateTime]) VALUES (11, N'Test8', N'Test8', CAST(0x0000A6420005D87C AS DateTime), CAST(0x0000A6420005D87C AS DateTime))
INSERT [dbo].[cms_tag] ([Tag_Id], [TagName], [TagDes], [LastTime], [CreateTime]) VALUES (12, N'Test9', N'Test9', CAST(0x0000A6420005E1DC AS DateTime), CAST(0x0000A6420005E1DC AS DateTime))
INSERT [dbo].[cms_tag] ([Tag_Id], [TagName], [TagDes], [LastTime], [CreateTime]) VALUES (13, N'赵玉开5', N'', CAST(0x0000A64400FCE8EC AS DateTime), CAST(0x0000A64400FCE8EC AS DateTime))
INSERT [dbo].[cms_tag] ([Tag_Id], [TagName], [TagDes], [LastTime], [CreateTime]) VALUES (14, N'赵玉开5', N'', CAST(0x0000A64400FD0E6C AS DateTime), CAST(0x0000A64400FD0E6C AS DateTime))
SET IDENTITY_INSERT [dbo].[cms_tag] OFF
/****** Object:  Table [dbo].[cms_staticpage]    Script Date: 11/24/2016 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_staticpage](
	[Page_Id] [int] IDENTITY(1,1) NOT NULL,
	[PagePath] [varchar](255) NULL,
	[PageName] [varchar](255) NOT NULL,
	[TempPageId] [int] NOT NULL,
	[PageParameter] [varchar](2000) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[LastTime] [datetime] NOT NULL,
 CONSTRAINT [PK_cms_staticpage] PRIMARY KEY CLUSTERED 
(
	[Page_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[cms_staticpage] ON
INSERT [dbo].[cms_staticpage] ([Page_Id], [PagePath], [PageName], [TempPageId], [PageParameter], [CreateTime], [LastTime]) VALUES (2, N'/html/test.html', N'test', 3, N'[{"key":"title","value":"标题","label":"标题","tiplabel":"标题","type":"1"},{"key":"content","value":"内容<p>1111</p>","label":"内容","type":"2"}]', CAST(0x0000A6150183BD54 AS DateTime), CAST(0x0000A6150188E98C AS DateTime))
INSERT [dbo].[cms_staticpage] ([Page_Id], [PagePath], [PageName], [TempPageId], [PageParameter], [CreateTime], [LastTime]) VALUES (3, N'/html/test1.html', N'test1', 2, N'[{"key":"title","value":"标题","label":"标题","tiplabel":"标题","type":"1"},{"key":"siteDescr","value":"描述","label":"描述","tiplabel":"描述","type":"1"},{"key":"siteKeywords","value":"关键字","label":"关键字","tiplabel":"关键字","type":"1"},{"key":"content","value":"内容<p><br></p>","label":"内容","type":"2"}]', CAST(0x0000A65301743C30 AS DateTime), CAST(0x0000A65301743C30 AS DateTime))
SET IDENTITY_INSERT [dbo].[cms_staticpage] OFF
/****** Object:  Table [dbo].[cms_commentmap]    Script Date: 11/24/2016 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_commentmap](
	[Ip] [varchar](50) NOT NULL,
	[CreateTs] [bigint] NOT NULL,
	[CommentId] [bigint] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cms_comment]    Script Date: 11/24/2016 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_comment](
	[Comment_Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NOT NULL,
	[Content] [varchar](255) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Nickname] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[VoteFavour] [int] NULL,
	[VoteOppose] [int] NULL,
 CONSTRAINT [PK_cms_comment] PRIMARY KEY CLUSTERED 
(
	[Comment_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[cms_comment] ON
INSERT [dbo].[cms_comment] ([Comment_Id], [ArticleId], [Content], [CreateTime], [Nickname], [Email], [VoteFavour], [VoteOppose]) VALUES (6, 11, N'3333', CAST(0x0000A64E018979B0 AS DateTime), N'2222', N'123@qq.com', NULL, NULL)
SET IDENTITY_INSERT [dbo].[cms_comment] OFF
/****** Object:  Table [dbo].[cms_column]    Script Date: 11/24/2016 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_column](
	[Column_Id] [int] IDENTITY(1,1) NOT NULL,
	[Sort] [int] NULL,
	[ColumnName] [varchar](255) NOT NULL,
	[Pid] [int] NOT NULL,
	[Lv] [int] NULL,
 CONSTRAINT [PK_cms_column] PRIMARY KEY CLUSTERED 
(
	[Column_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[cms_column] ON
INSERT [dbo].[cms_column] ([Column_Id], [Sort], [ColumnName], [Pid], [Lv]) VALUES (1, 1, N'传闻爆料', 8, 2)
INSERT [dbo].[cms_column] ([Column_Id], [Sort], [ColumnName], [Pid], [Lv]) VALUES (2, 2, N'科技财经', 0, 1)
INSERT [dbo].[cms_column] ([Column_Id], [Sort], [ColumnName], [Pid], [Lv]) VALUES (3, 3, N'电子商务', 8, 2)
INSERT [dbo].[cms_column] ([Column_Id], [Sort], [ColumnName], [Pid], [Lv]) VALUES (4, 2, N'人物动态', 8, 2)
INSERT [dbo].[cms_column] ([Column_Id], [Sort], [ColumnName], [Pid], [Lv]) VALUES (8, 1, N'互联网媒体', 0, 1)
INSERT [dbo].[cms_column] ([Column_Id], [Sort], [ColumnName], [Pid], [Lv]) VALUES (13, 1, N'汽车房产', 0, 1)
INSERT [dbo].[cms_column] ([Column_Id], [Sort], [ColumnName], [Pid], [Lv]) VALUES (15, 1, N'IT业界', 2, 2)
INSERT [dbo].[cms_column] ([Column_Id], [Sort], [ColumnName], [Pid], [Lv]) VALUES (16, 1, N'经济民生', 2, 2)
INSERT [dbo].[cms_column] ([Column_Id], [Sort], [ColumnName], [Pid], [Lv]) VALUES (17, 1, N'新车行情', 13, 2)
INSERT [dbo].[cms_column] ([Column_Id], [Sort], [ColumnName], [Pid], [Lv]) VALUES (18, 1, N'房产动态', 13, 2)
SET IDENTITY_INSERT [dbo].[cms_column] OFF
/****** Object:  Table [dbo].[cms_articlemap]    Script Date: 11/24/2016 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_articlemap](
	[Ip] [varchar](50) NOT NULL,
	[CreateTs] [bigint] NOT NULL,
	[ArticleId] [bigint] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cms_article]    Script Date: 11/24/2016 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_article](
	[Article_Id] [int] IDENTITY(1,1) NOT NULL,
	[ColumnId] [int] NOT NULL,
	[Tagids] [varchar](255) NULL,
	[Tags] [varchar](255) NULL,
	[ArticleContent] [varchar](4000) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[LastTime] [datetime] NOT NULL,
	[Browse] [int] NOT NULL,
	[ImgUrl] [varchar](255) NULL,
	[Digest] [varchar](255) NULL,
	[SEO_Title] [varchar](255) NULL,
	[SEO_Keywords] [varchar](255) NULL,
	[SEO_DES] [varchar](255) NULL,
	[Author] [varchar](255) NULL,
	[IsTop] [int] NOT NULL,
	[IsShow] [int] NOT NULL,
	[Source] [varchar](255) NULL,
	[SourceLink] [varchar](255) NULL,
	[Praise] [int] NULL,
 CONSTRAINT [PK_cms_article] PRIMARY KEY CLUSTERED 
(
	[Article_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[cms_article] ON
INSERT [dbo].[cms_article] ([Article_Id], [ColumnId], [Tagids], [Tags], [ArticleContent], [Title], [CreateTime], [LastTime], [Browse], [ImgUrl], [Digest], [SEO_Title], [SEO_Keywords], [SEO_DES], [Author], [IsTop], [IsShow], [Source], [SourceLink], [Praise]) VALUES (1, 1, NULL, NULL, N'ArticleContent&lt;p&gt;&lt;br&gt;&lt;/p&gt;', N'测试标题', CAST(0x0000A5C801035D44 AS DateTime), CAST(0x0000A5C801035D44 AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, N'测试作者', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[cms_article] ([Article_Id], [ColumnId], [Tagids], [Tags], [ArticleContent], [Title], [CreateTime], [LastTime], [Browse], [ImgUrl], [Digest], [SEO_Title], [SEO_Keywords], [SEO_DES], [Author], [IsTop], [IsShow], [Source], [SourceLink], [Praise]) VALUES (2, 4, NULL, NULL, N'&lt;p&gt;&lt;b&gt;求大神&lt;/b&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', N'测试标题1111', CAST(0x0000A5C80103A394 AS DateTime), CAST(0x0000A5C80103A394 AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, N'测试作者2222', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[cms_article] ([Article_Id], [ColumnId], [Tagids], [Tags], [ArticleContent], [Title], [CreateTime], [LastTime], [Browse], [ImgUrl], [Digest], [SEO_Title], [SEO_Keywords], [SEO_DES], [Author], [IsTop], [IsShow], [Source], [SourceLink], [Praise]) VALUES (3, 1, NULL, NULL, N'&lt;p&gt;测试内容&lt;/p&gt;', N'测试标题2', CAST(0x0000A5C8010566C0 AS DateTime), CAST(0x0000A5C8010566C0 AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, N'测试作者2', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[cms_article] ([Article_Id], [ColumnId], [Tagids], [Tags], [ArticleContent], [Title], [CreateTime], [LastTime], [Browse], [ImgUrl], [Digest], [SEO_Title], [SEO_Keywords], [SEO_DES], [Author], [IsTop], [IsShow], [Source], [SourceLink], [Praise]) VALUES (4, 2, NULL, NULL, N'&lt;p&gt;测试内容&lt;/p&gt;', N'测试标题3', CAST(0x0000A5C80105840C AS DateTime), CAST(0x0000A5C80105840C AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, N'测试作者3', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[cms_article] ([Article_Id], [ColumnId], [Tagids], [Tags], [ArticleContent], [Title], [CreateTime], [LastTime], [Browse], [ImgUrl], [Digest], [SEO_Title], [SEO_Keywords], [SEO_DES], [Author], [IsTop], [IsShow], [Source], [SourceLink], [Praise]) VALUES (5, 1, NULL, NULL, N'&lt;p&gt;测试内容&lt;/p&gt;', N'测试标题4', CAST(0x0000A5C80105E1CC AS DateTime), CAST(0x0000A5C80105E1CC AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, N'测试作者4', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[cms_article] ([Article_Id], [ColumnId], [Tagids], [Tags], [ArticleContent], [Title], [CreateTime], [LastTime], [Browse], [ImgUrl], [Digest], [SEO_Title], [SEO_Keywords], [SEO_DES], [Author], [IsTop], [IsShow], [Source], [SourceLink], [Praise]) VALUES (7, 2, NULL, NULL, N'&lt;p&gt;&lt;i&gt;测试内容&lt;/i&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', N'测试标题6', CAST(0x0000A5C801061B38 AS DateTime), CAST(0x0000A5C801061B38 AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, N'测试作者6', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[cms_article] ([Article_Id], [ColumnId], [Tagids], [Tags], [ArticleContent], [Title], [CreateTime], [LastTime], [Browse], [ImgUrl], [Digest], [SEO_Title], [SEO_Keywords], [SEO_DES], [Author], [IsTop], [IsShow], [Source], [SourceLink], [Praise]) VALUES (8, 1, NULL, NULL, N'&lt;p&gt;测试内容&lt;/p&gt;', N'测试标题7', CAST(0x0000A5C8010632A8 AS DateTime), CAST(0x0000A5C8010632A8 AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, N'测试作者7', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[cms_article] ([Article_Id], [ColumnId], [Tagids], [Tags], [ArticleContent], [Title], [CreateTime], [LastTime], [Browse], [ImgUrl], [Digest], [SEO_Title], [SEO_Keywords], [SEO_DES], [Author], [IsTop], [IsShow], [Source], [SourceLink], [Praise]) VALUES (9, 2, NULL, NULL, N'
                        &lt;p&gt;测试内容&lt;img src="/Upload/UploadFile/1457864405.jpeg" style="letter-spacing: 0.01em; word-spacing: normal; max-width: 100%;"&gt;&lt;/p&gt;
                    &lt;p&gt;&lt;br&gt;&lt;/p&gt;', N'测试标题8', CAST(0x000081D500000000 AS DateTime), CAST(0x0000A5C8012E27F4 AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, N'测试作者8', 0, 0, NULL, NULL, NULL)
INSERT [dbo].[cms_article] ([Article_Id], [ColumnId], [Tagids], [Tags], [ArticleContent], [Title], [CreateTime], [LastTime], [Browse], [ImgUrl], [Digest], [SEO_Title], [SEO_Keywords], [SEO_DES], [Author], [IsTop], [IsShow], [Source], [SourceLink], [Praise]) VALUES (10, 3, NULL, NULL, N'
                        &lt;p&gt;测试内容&lt;img src="/Upload/UploadFile/1457864442.jpeg" style="letter-spacing: 0.01em; word-spacing: normal; max-width: 100%;"&gt;&lt;/p&gt;
                    &lt;p&gt;&lt;br&gt;&lt;/p&gt;', N'测试标题9', CAST(0x000081D500000000 AS DateTime), CAST(0x0000A5C8012E5A58 AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, N'测试作者9', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[cms_article] ([Article_Id], [ColumnId], [Tagids], [Tags], [ArticleContent], [Title], [CreateTime], [LastTime], [Browse], [ImgUrl], [Digest], [SEO_Title], [SEO_Keywords], [SEO_DES], [Author], [IsTop], [IsShow], [Source], [SourceLink], [Praise]) VALUES (11, 1, N'1,3,9', N'Test,test,test6', N'
                        &lt;p&gt;该样板房位于中科院花桥创新服务园3号楼内，面积为41平米，层高5.9米。&lt;/p&gt;&lt;p&gt;由于室内空间受到大小的限制，设计师想把该房打造成一个三居两厅两卫的生活起居空间。设计凭借高度优势，对空间进行块面的切割。&lt;/p&gt;&lt;p&gt;&amp;nbsp;一层规划了厨房，卫生间，餐厅，客厅，卧室与茶室，二层有儿童房，主卧房，卫生间。其中每个卧室都配备了各自的书写区，包括各自的衣服存放等功能。&lt;/p&gt;&lt;p&gt;&lt;img src="file:///C:/users/administrator/appdata/roaming/360se6/User%20Data/temp/6fbdaedbb62dee1c7ef68031e3196cb7.jpg_w660"&gt;&lt;img src="file:///C:/users/administrator/appdata/roaming/360se6/User%20Data/temp/6fbdaedbb62dee1c7ef68031e3196cb7.jpg_w660"&gt;&lt;img src="file:///C:/users/administrator/appdata/roaming/360se6/User%20Data/temp/6fbdaedbb62dee1c7ef68031e3196cb7.jpg_w660"&gt;&lt;img src="file:///C:/users/administrator/appdata/roaming/360se6/User%20Data/temp/6fbdaedbb62dee1c7ef68031e3196cb7.jpg_w660"&gt;&lt;img src="file:///C:/users/administrator/appdata/roaming/360se6/User%20Data/temp/6fbdaedbb62dee1c7ef68031e3196cb7.jpg_w660"&gt;&lt;img src="file:///C:/users/administrator/appdata/roaming/360se6/User%20Data/temp/6fbdaedbb62dee1c7ef68031e3196cb7.jpg_w660"&gt;&lt;img src="http://douxiubar.com/Upload/UploadFile/1461750086.png" class="clicked"&gt;&lt;/p&gt;&lt;p&gt;&lt;img src="http://douxiubar.com/Upload/UploadFile/1461750132.jpeg"&gt;&lt;/p&gt;&lt;p&gt;&lt;img src="http://douxiubar.com/Upload/UploadFile/1461750203.jpeg"&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; 一层茶室区具备了多种功能性，白天可将电动桌升起，为家庭生活提供了休闲品茶区，并且利用了地台的高度，在茶室周边范围设计了地柜，用作起居被褥等物件的收纳。一层茶室区具备了多种功能性，白天可将电动桌升起，为家庭生活提供了休闲品茶区，并且利用了地台的高度，在茶室周边范围设计了地柜，用作起居被褥等物件的收纳。&lt;/p&gt;&lt;p&gt;&lt;img src="http://douxiubar.com/Upload/UploadFile/1461750278.jpeg"&gt;&lt;/p&gt;&lt;p&gt;&lt;img src="http://douxiubar.com/Upload/UploadFile/1461750306.jpeg"&gt;&lt;/p&gt;&lt;p&gt;该样板房位于中科院花桥创新服务园3号楼内，面积为41平米，层高5.9米。&lt;/p&gt;&lt;p&gt;由于室内空间受到大小的限制，设计师想把该房打造成一个三居两厅两卫的生活起居空间。设计凭借高度优势，对空间进行块面的切割。&lt;/p&gt;&lt;p&gt;&amp;nbsp;一层规划了厨房，卫生间，餐厅，客厅，卧室与茶室，二层有儿童房，主卧房，卫生间。其中每个卧室都配备了各自的书写区，包括各自的衣服存放等功能。&lt;/p&gt;&lt;p&gt;&lt;img src="file:///C:/users/administrator/appdata/roaming/360se6/User%20Data/temp/6fbdaedbb62dee1c7ef68031e3196cb7.jpg_w660"&gt;&lt;img src="file:///C:/users/administrator/appdata/roaming/360se6/User%20Data/temp/6fbdaedbb62dee1c7ef68031e3196cb7.jpg_w660"&gt;&lt;img src="file:///C:/users/administrator/appdata/roaming/360se6/User%20Data/temp/6fbdaedbb62dee1c7ef68031e3196cb7.jpg_w660"&gt;&lt;img src="file:///C:/users/administrator/appdata/roaming/360se6/User%20Data/temp/6fbdaedbb62dee1c7ef68031e3196cb7.jpg_w660"&gt;&lt;img src="file:///C:/users/administrator/appdata/roaming/360se6/User%20Data/temp/6fbdaedbb62dee1c7ef68031e3196cb7.jpg_w660"&gt;&lt;img src="file:///C:/users/administrator/appdata/roaming/360se6/User%20Data/temp/6fbdaedbb62dee1c7ef68031e3196cb7.jpg_w660"&gt;&lt;img src="http://douxiubar.com/Upload/UploadFile/1461750086.png"&gt;&lt;/p&gt;&lt;p&gt;&lt;img src="http://douxiubar.com/Upload/UploadFile/1461750132.jpeg"&gt;&lt;/p&gt;&lt;p&gt;&lt;img src="http://douxiubar.com/Upload/UploadFile/1461750203.jpeg"&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; 一层茶室区具备了多种功能性，白天可将电动桌升起，为家庭生活提供了休闲品茶区，并且利用了地台的高度，在茶室周边范围设计了地柜，用作起居被褥等物件的收纳。一层茶室区具备了多种功能性，白天可将电动桌升起，为家庭生活提供了休闲品茶区，并且利用了地台的高度，在茶室周边范围设计了地柜，用作起居被褥等物件的收纳。&lt;/p&gt;&lt;p&gt;&lt;img src="http://douxiubar.com/Upload/UploadFile/1461750278.jpeg"&gt;&lt;/p&gt;&lt;p&gt;&lt;img src="http://douxiubar.com/Upload/UploadFile/1461750306.jpeg"&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;
                 ', N'测试标题10', CAST(0x0000A5C801068960 AS DateTime), CAST(0x0000A64500022CA4 AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, N'测试作者10', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[cms_article] ([Article_Id], [ColumnId], [Tagids], [Tags], [ArticleContent], [Title], [CreateTime], [LastTime], [Browse], [ImgUrl], [Digest], [SEO_Title], [SEO_Keywords], [SEO_DES], [Author], [IsTop], [IsShow], [Source], [SourceLink], [Praise]) VALUES (15, 1, N'3,4,11', N'test,test1,Test8', N'
                        
                        &lt;p&gt;测试标题11&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;
                    
                    ', N'测试标题11', CAST(0x0000A64401892550 AS DateTime), CAST(0x0000A64500021660 AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, N'漫漫洒洒', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[cms_article] ([Article_Id], [ColumnId], [Tagids], [Tags], [ArticleContent], [Title], [CreateTime], [LastTime], [Browse], [ImgUrl], [Digest], [SEO_Title], [SEO_Keywords], [SEO_DES], [Author], [IsTop], [IsShow], [Source], [SourceLink], [Praise]) VALUES (17, 1, NULL, NULL, N'&lt;p&gt;&lt;br&gt;&lt;/p&gt;', N'1神是唯一的真神', CAST(0x0000A6870181A118 AS DateTime), CAST(0x0000A6870181A118 AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, N'漫漫洒洒', 0, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[cms_article] OFF
/****** Object:  Default [DF_cms_comment_VoteFavour]    Script Date: 11/24/2016 10:41:34 ******/
ALTER TABLE [dbo].[cms_comment] ADD  CONSTRAINT [DF_cms_comment_VoteFavour]  DEFAULT ((0)) FOR [VoteFavour]
GO
/****** Object:  Default [DF_cms_comment_VoteOppose]    Script Date: 11/24/2016 10:41:34 ******/
ALTER TABLE [dbo].[cms_comment] ADD  CONSTRAINT [DF_cms_comment_VoteOppose]  DEFAULT ((0)) FOR [VoteOppose]
GO
