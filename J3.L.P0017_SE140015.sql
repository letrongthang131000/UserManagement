USE [J3.L.P0017_SE140015]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 06/21/2021 21:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [int] NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (2, N'Sub')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (3, N'Guest')
/****** Object:  Table [dbo].[tblUsers]    Script Date: 06/21/2021 21:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](20) NOT NULL,
	[password] [varchar](max) NULL,
	[userName] [nvarchar](50) NULL,
	[email] [varchar](30) NULL,
	[phone] [varchar](11) NULL,
	[photo] [nvarchar](250) NULL,
	[roleID] [int] NULL,
	[status] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblUsers] ([userID], [password], [userName], [email], [phone], [photo], [roleID], [status]) VALUES (N'dai', N'35235756903090820358381313735176478364682515638162639286890698973364481708458', N'dai08', N'trongdai22@gmail.com', N'0987462343', N'.\IMG\chan-dung-nam2.jpg', 3, N'Active')
INSERT [dbo].[tblUsers] ([userID], [password], [userName], [email], [phone], [photo], [roleID], [status]) VALUES (N'hoaihao', N'6852157769782635103321899911319509891364277913592693703602985066999394234673', N'hoaihao', N'hoaihao@gmail.com', N'0987473432', N'.\IMG\cropping-photos-portrait-asian-woman-garden.jpg', 3, N'Active')
INSERT [dbo].[tblUsers] ([userID], [password], [userName], [email], [phone], [photo], [roleID], [status]) VALUES (N'minh', N'86205411067975453259663931744774032977986827568068939445940041430274715198990', N'tuyetminh', N'tuyetminh20006@gmail.com', N'0283748252', N'.\IMG\timestudio.vn-headshot-cv.jpg', 2, N'Active')
INSERT [dbo].[tblUsers] ([userID], [password], [userName], [email], [phone], [photo], [roleID], [status]) VALUES (N'thang', N'2260572608399948979075825803502899616071727338481652981644894407373171873573', N'trongthang', N'trongthang@gmail.com', N'0414818512', N'.\IMG\chan-dung-nam2.jpg', 1, N'Active')
INSERT [dbo].[tblUsers] ([userID], [password], [userName], [email], [phone], [photo], [roleID], [status]) VALUES (N'thang2', N'75263518707598184987916378021939673586055614731957507592904438851787542395619', N'trongthang', N'trongthangle@gmail.com', N'0148347481', N'.\IMG\chup-anh-phong-cach-cho-nam-gioi-trong-studio-nghe-thuat-o-ha-noi-03.jpg', 2, N'Active')
INSERT [dbo].[tblUsers] ([userID], [password], [userName], [email], [phone], [photo], [roleID], [status]) VALUES (N'thang3', N'79876331111297311090464486055194237242869549910989733937426277034952136444468', N'thang33', N'trongthang3@gmail.com', N'0428578724', N'.\IMG\chup-anh-xin-visa43062503-2116011435318283-3476143098256424960-o-a5a5006a-8524-4442-b201-e1a96abd515a.jpg', 3, N'Active')
/****** Object:  Table [dbo].[tblPromotions]    Script Date: 06/21/2021 21:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPromotions](
	[promotionID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](20) NULL,
	[userRank] [float] NULL,
	[createDate] [date] NULL,
 CONSTRAINT [PK_tblPromotions] PRIMARY KEY CLUSTERED 
(
	[promotionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblPromotions] ON
INSERT [dbo].[tblPromotions] ([promotionID], [userID], [userRank], [createDate]) VALUES (7, N'thang2', 2, CAST(0xA9420B00 AS Date))
SET IDENTITY_INSERT [dbo].[tblPromotions] OFF
/****** Object:  ForeignKey [FK_tblPromotions_tblUsers]    Script Date: 06/21/2021 21:48:25 ******/
ALTER TABLE [dbo].[tblPromotions]  WITH CHECK ADD  CONSTRAINT [FK_tblPromotions_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblPromotions] CHECK CONSTRAINT [FK_tblPromotions_tblUsers]
GO
/****** Object:  ForeignKey [FK_tblUsers_tblRoles]    Script Date: 06/21/2021 21:48:25 ******/
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
