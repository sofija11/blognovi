USE [blogsad]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 26/08/2020 04:15:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 26/08/2020 04:15:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 26/08/2020 04:15:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[Text] [nvarchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
	[PostId] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 26/08/2020 04:15:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pictures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[PictureName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Pictures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 26/08/2020 04:15:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Text] [nvarchar](255) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[PictureId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 26/08/2020 04:15:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26/08/2020 04:15:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](450) NOT NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 26/08/2020 04:15:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200824201915_user, usecases and logs', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200824205302_ucecaselogs', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200825151031_category table', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200825183802_pictures', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200825234250_table post', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200826015014_table comments', N'3.1.7')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (1, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Sport')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (2, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Action')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (3, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Winter')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (4, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Friendship')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (5, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Football')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (7, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Volleyball')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (8, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Nature')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (9, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Hoby')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (10, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Lifestyle')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (11, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Make up')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (12, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Women')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (13, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Man')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (14, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Horoscope')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (15, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Time')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (16, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Love')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (17, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Tenis')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (18, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Paintball')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (19, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Summer')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (20, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), NULL, 0, NULL, N'Swimming')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (21, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), CAST(N'2020-08-25T18:13:52.8221376' AS DateTime2), 1, CAST(N'2020-08-25T18:13:52.7775210' AS DateTime2), N'Ragbi')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (22, CAST(N'2020-08-25T17:43:29.5141549' AS DateTime2), CAST(N'2020-08-25T18:23:31.6679681' AS DateTime2), 1, CAST(N'2020-08-25T18:23:31.6672054' AS DateTime2), N'Sun Update')
INSERT [dbo].[Category] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (23, CAST(N'2020-08-25T18:24:08.5164274' AS DateTime2), CAST(N'2020-08-25T23:07:24.1894022' AS DateTime2), 1, CAST(N'2020-08-25T23:07:24.1609107' AS DateTime2), N'Happiness')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (2, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Super', 2, 3)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (3, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Awesome', 1002, 9)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (6, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Great', 1009, 19)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (7, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Ok', 1005, 20)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (11, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'NOT BAD', 2, 20)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (12, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Sup', 1007, 22)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (13, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Ura for post', 1005, 24)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (19, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'is ok', 2, 27)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (20, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'not great', 1006, 12)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (21, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Bravisimo', 1002, 24)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (22, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Not Bad', 1004, 26)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (24, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Bla bla', 1010, 19)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (26, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'OK', 1011, 24)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (27, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'iT IS NOT THAT BAD', 1003, 22)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (28, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Blah', 1006, 21)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (29, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'very bad', 1013, 25)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (32, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'I am glad that i am here', 1013, 25)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (33, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Same as always', 1005, 19)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (34, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Bravo Hej', 1018, 11)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Text], [UserId], [PostId]) VALUES (35, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'BAad', 1005, 3)
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Pictures] ON 

INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [PictureName]) VALUES (1, CAST(N'2020-08-25T20:56:15.2771957' AS DateTime2), NULL, 0, NULL, N'7961edb7-08aa-4fda-8242-43cb1f4597bb.png')
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [PictureName]) VALUES (2, CAST(N'2020-08-25T20:58:49.9998478' AS DateTime2), NULL, 0, NULL, N'3c8c87ba-8dcc-476f-8223-fb616be9c974.gif')
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [PictureName]) VALUES (3, CAST(N'2020-08-25T20:59:01.8294899' AS DateTime2), NULL, 0, NULL, N'8341610c-646f-47e6-9574-24f3a9681f20.gif')
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [PictureName]) VALUES (4, CAST(N'2020-08-25T20:59:10.9397837' AS DateTime2), NULL, 0, NULL, N'da37cbde-5e2e-4b50-ae65-6e7a0d69571f.gif')
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [PictureName]) VALUES (5, CAST(N'2020-08-25T20:59:19.4330605' AS DateTime2), NULL, 0, NULL, N'b08c44ec-b55e-4ac3-b3c9-1967eaa46d09.gif')
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [PictureName]) VALUES (6, CAST(N'2020-08-25T20:59:28.1233271' AS DateTime2), NULL, 0, NULL, N'6f4deaea-a72f-4ece-8321-3a35825ca1a2.gif')
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [PictureName]) VALUES (7, CAST(N'2020-08-25T20:59:53.5771136' AS DateTime2), NULL, 0, NULL, N'ae1bee35-79fb-4040-adcb-be3548c75b75.gif')
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [PictureName]) VALUES (8, CAST(N'2020-08-25T21:00:01.4930771' AS DateTime2), NULL, 0, NULL, N'bbafe736-121b-4974-a4fb-fd802e6c0678.gif')
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [PictureName]) VALUES (9, CAST(N'2020-08-25T21:00:18.5307852' AS DateTime2), NULL, 0, NULL, N'2623027e-e361-4f66-9a68-8c514b9c882f.gif')
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [PictureName]) VALUES (10, CAST(N'2020-08-25T21:00:33.5399051' AS DateTime2), NULL, 0, NULL, N'619468b8-4e2d-4114-a3f7-212a0c779365.gif')
SET IDENTITY_INSERT [dbo].[Pictures] OFF
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (3, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Post1', N'Opis 1', 1, 1, 1)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (4, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Post2', N'Opis2', 2, 5, 2017)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (6, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Post 3', N'Opis3', 2, 7, 2)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (7, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Post4', N'Opis4', 9, 9, 1)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (9, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Post5', N'Opis posta 5', 10, 10, 1002)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (11, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Post6', N'Opis posta 6', 2, 5, 2017)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (12, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Post 7 ', N'Opis posta 7', 5, 5, 1)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (13, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Today', N'todaz iz beautiful', 2, 2, 2)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (15, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Swimming in the pol', N'Description of this', 1, 2, 1003)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (17, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Hikking in the woods', N'Opis gdis urd', 9, 10, 1004)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (19, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Post about sun', N'Sun is lighting star', 3, 3, 1006)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (20, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'post about starrs', N'ois des gyfaks', 2, 2, 1009)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (21, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'about loving', N'des ctsftgftg sg', 5, 5, 1007)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (22, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'post 21', N'desctription ', 2, 2, 2)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (23, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Post aboput jewerly', N'desccription 22', 8, 9, 1009)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (24, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Post about friendship', N'Friendship is beautiful thing', 1, 1, 1)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (25, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Sun', N'des about sun', 5, 5, 1004)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (26, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Snow', N'Description', 9, 9, 1008)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (27, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Swimming', N'beautiful thing to do ', 2, 2, 2)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (29, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Brakup', N'One thing', 3, 3, 1002)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [CategoryId], [PictureId], [UserId]) VALUES (30, CAST(N'2020-08-26T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Singing', N'Singing is perfect', 2, 2, 2)
SET IDENTITY_INSERT [dbo].[Posts] OFF
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1, CAST(N'2020-08-24T21:29:33.6505965' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Sofija","LastName":"Vitorovic","Email":null,"Password":"lalalallala776","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2, CAST(N'2020-08-24T22:21:37.2390904' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Sofija","LastName":"Vitorovic","Email":"sofija@gmail.com","Password":"lalalallala776","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (3, CAST(N'2020-08-24T22:25:34.2345743' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Sofija","LastName":"Vitorovic","Email":"sofija@gmail.com","Password":"lalalallala776","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (4, CAST(N'2020-08-24T22:38:43.4614822' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Marko","LastName":"Korugic","Email":"mareti@gmail.com","Password":"lalalallala776","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1004, CAST(N'2020-08-24T23:08:37.7313126' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Janko","LastName":"Spasic","Email":"janko09@gmail.com","Password":"lalalallala776","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1005, CAST(N'2020-08-24T23:09:05.1840823' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Janko","LastName":"Spasic","Email":"janko09@gmail.com","Password":"lalalallala776","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1006, CAST(N'2020-08-24T23:13:51.9269982' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Martina","LastName":"Lazic","Email":"marti87@gmail.com","Password":"lalalallalac776","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1007, CAST(N'2020-08-24T23:14:29.4878129' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Dragana","LastName":"Markovic","Email":"gaga9987@gmail.com","Password":"lfvalalallalac776","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1008, CAST(N'2020-08-24T23:15:05.1728521' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Zdravko","LastName":"Nikolic","Email":"ydrNiks@gmail.com","Password":"ddcdd8ac776","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1009, CAST(N'2020-08-24T23:17:08.2654116' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Petar","LastName":"Jovanovic","Email":"pekica11@gmail.com","Password":"ddcddd8ac776","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1010, CAST(N'2020-08-24T23:17:40.7665414' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Milos","LastName":"Jovanic","Email":"mare0955@gmail.com","Password":"ddcddd8dc776","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1011, CAST(N'2020-08-24T23:18:11.2067952' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Maxim","LastName":"JoLjutic","Email":"maxo990955@gmail.com","Password":"dddcddd8dc776","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1012, CAST(N'2020-08-24T23:18:37.1077866' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Ivana","LastName":"Pantic","Email":"iva87@gmail.com","Password":"dd77678dc776","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1013, CAST(N'2020-08-24T23:19:08.9569167' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Kristina","LastName":"Markovic","Email":"kile00978@gmail.com","Password":"dd77dc776","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1014, CAST(N'2020-08-24T23:19:44.6951339' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Kristina","LastName":"Markovic","Email":"kile00978@gmail.com","Password":"dd77dc7jjjhg76","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1015, CAST(N'2020-08-24T23:20:29.1637793' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Snezana","LastName":"Joksic","Email":"sneki0997@gmail.com","Password":"dd77ddc7jjjhg76","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1016, CAST(N'2020-08-24T23:21:12.5720906' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Aleksandar","LastName":"Radovanovic","Email":"alekrad3@gmail.com","Password":"dd77dc7jjjhg76","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1017, CAST(N'2020-08-24T23:22:41.2844267' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Mladen","LastName":"Peric","Email":"perimla874@gmail.com","Password":"dd77dc7jjhg76","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1018, CAST(N'2020-08-24T23:24:59.4083003' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Jelisaveta","LastName":"Milic","Email":"jela@gmail.com","Password":"dd7dc7jjhg76","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1019, CAST(N'2020-08-24T23:25:29.0785139' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Marijana","LastName":"Milicic","Email":"jmilejel@gmail.com","Password":"dd7c7jjhg76","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1020, CAST(N'2020-08-24T23:26:06.7733178' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Janko","LastName":"Ilicic","Email":"jankoili998@gmail.com","Password":"dd7c7jjkjkhg76","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1021, CAST(N'2020-08-24T23:26:34.7859342' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Milica","LastName":"Bakic","Email":"milica998@gmail.com","Password":"007c7jjkjkhg76","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1022, CAST(N'2020-08-24T23:27:37.7734823' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Zoran","LastName":"Lekic","Email":"zole998@gmail.com","Password":"07c7jjkjkhg76","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1023, CAST(N'2020-08-24T23:28:12.1828913' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Ljiljana","LastName":"Lilic","Email":"lili998@gmail.com","Password":"07c7jjjkhg76","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2018, CAST(N'2020-08-25T00:28:40.1896377' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2019, CAST(N'2020-08-25T00:29:25.5370342' AS DateTime2), N'Search Users', N'{"Name":"''Sofija''","PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2020, CAST(N'2020-08-25T00:29:40.5106836' AS DateTime2), N'Search Users', N'{"Name":"sofija","PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2021, CAST(N'2020-08-25T00:29:52.4661526' AS DateTime2), N'Get one user', N'2', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2022, CAST(N'2020-08-25T00:30:14.3467618' AS DateTime2), N'Get one user', N'1009', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2023, CAST(N'2020-08-25T00:30:30.6141679' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":3,"Page":6}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2024, CAST(N'2020-08-25T00:30:46.9180362' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2025, CAST(N'2020-08-25T00:33:51.5760676' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":3,"Page":2}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2026, CAST(N'2020-08-25T00:34:03.8749630' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":3,"Page":5}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2027, CAST(N'2020-08-25T00:34:45.2755070' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":3,"Page":5}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2028, CAST(N'2020-08-25T00:35:19.1867664' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":3,"Page":5}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2029, CAST(N'2020-08-25T00:37:12.2711228' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":4,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2030, CAST(N'2020-08-25T00:37:58.1399372' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":4,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2031, CAST(N'2020-08-25T00:38:34.7573588' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":4,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2032, CAST(N'2020-08-25T00:39:06.0389685' AS DateTime2), N'Get one user', N'95', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2033, CAST(N'2020-08-25T00:57:15.3794054' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2034, CAST(N'2020-08-25T01:00:33.8748882' AS DateTime2), N'Delete user', N'1002', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2035, CAST(N'2020-08-25T01:00:57.3742027' AS DateTime2), N'Get one user', N'1002', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2036, CAST(N'2020-08-25T01:02:27.9135081' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Masa","LastName":"Lilic","Email":"masica998@gmail.com","Password":"07c7jjjkhg76","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2037, CAST(N'2020-08-25T01:02:57.2956238' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2038, CAST(N'2020-08-25T01:03:35.0053482' AS DateTime2), N'Search Users', N'{"Name":"Masa","PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2039, CAST(N'2020-08-25T01:04:19.8537946' AS DateTime2), N'Update User', N'{"Id":0,"FirstName":" Masa UPDATE","LastName":"Lilic","Email":"masSica998@gmail.com","Password":"07c7jjjkhg76","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2040, CAST(N'2020-08-25T01:05:03.6405937' AS DateTime2), N'Get one user', N'2014', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2041, CAST(N'2020-08-25T01:05:25.9172525' AS DateTime2), N'Update User', N'{"Id":0,"FirstName":" Masa UPDATE","LastName":"Lilic","Email":"masSica998@gmail.com","Password":"07c7jjjkhg76","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2042, CAST(N'2020-08-25T01:09:00.8817202' AS DateTime2), N'Update User', N'{"Id":0,"FirstName":" Masa UPDATE","LastName":"Lilic","Email":"masSica998@gmail.com","Password":"07c7jjjkhg76","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2043, CAST(N'2020-08-25T01:11:21.8923136' AS DateTime2), N'Update User', N'{"Id":0,"FirstName":" Masa UPDATE","LastName":"Lilic","Email":"masSica998@gmail.com","Password":"07c7jjjkhg76","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2044, CAST(N'2020-08-25T01:15:14.1994447' AS DateTime2), N'Update User', N'{"Id":0,"FirstName":" Masa UPDATE","LastName":"Lilic","Email":"masSica998@gmail.com","Password":"07c7jjjkhg76","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2045, CAST(N'2020-08-25T14:59:07.6520364' AS DateTime2), N'Search logs', N'{"Actor":null,"UseCaseName":null,"DateStart":null,"DateEnd":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2046, CAST(N'2020-08-25T15:00:12.6297549' AS DateTime2), N'Search logs', N'{"Actor":null,"UseCaseName":null,"DateStart":null,"DateEnd":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2047, CAST(N'2020-08-25T15:00:28.3605654' AS DateTime2), N'Search logs', N'{"Actor":null,"UseCaseName":null,"DateStart":null,"DateEnd":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2048, CAST(N'2020-08-25T15:01:17.9293159' AS DateTime2), N'Search logs', N'{"Actor":null,"UseCaseName":null,"DateStart":null,"DateEnd":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2049, CAST(N'2020-08-25T15:01:39.2440800' AS DateTime2), N'Search logs', N'{"Actor":null,"UseCaseName":null,"DateStart":null,"DateEnd":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2050, CAST(N'2020-08-25T15:01:45.8535778' AS DateTime2), N'Search logs', N'{"Actor":null,"UseCaseName":null,"DateStart":null,"DateEnd":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2051, CAST(N'2020-08-25T15:01:57.1331291' AS DateTime2), N'Search logs', N'{"Actor":null,"UseCaseName":null,"DateStart":null,"DateEnd":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2052, CAST(N'2020-08-25T15:02:07.9465226' AS DateTime2), N'Search logs', N'{"Actor":null,"UseCaseName":null,"DateStart":null,"DateEnd":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2053, CAST(N'2020-08-25T15:36:11.1010761' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Sport"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2054, CAST(N'2020-08-25T15:39:02.4443635' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Sport"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2055, CAST(N'2020-08-25T15:43:23.2002386' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Sport"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2056, CAST(N'2020-08-25T16:13:45.9444475' AS DateTime2), N'Delete Category', N'21', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2057, CAST(N'2020-08-25T16:22:27.5998932' AS DateTime2), N'Update Category', N'{"Id":21,"Name":"Sun Update"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2058, CAST(N'2020-08-25T16:23:04.8499814' AS DateTime2), N'Update Category', N'{"Id":22,"Name":"Sun Update"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2059, CAST(N'2020-08-25T16:23:31.1514745' AS DateTime2), N'Delete Category', N'22', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2060, CAST(N'2020-08-25T16:24:08.4083016' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Happiness"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2061, CAST(N'2020-08-25T16:36:35.1890905' AS DateTime2), N'Get Categories', N'{"Name":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2062, CAST(N'2020-08-25T16:37:38.7553740' AS DateTime2), N'Get Categories', N'{"Name":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2063, CAST(N'2020-08-25T16:37:59.6993655' AS DateTime2), N'Get Categories', N'{"Name":null,"PerPage":3,"Page":2}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2064, CAST(N'2020-08-25T16:45:55.3759766' AS DateTime2), N'Get One Category', N'2', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2065, CAST(N'2020-08-25T16:58:48.6917784' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Sofija","LastName":"Vitorovic","Email":"vitorovicsofija610@gmail.com","Password":"lalalallala776","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2066, CAST(N'2020-08-25T17:00:57.2565531' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Sofija","LastName":"Vitorovic","Email":"vitorovicsofija610@gmail.com","Password":"lalalallala776","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2067, CAST(N'2020-08-25T17:02:30.3292875' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Sofija","LastName":"Vitorovic","Email":"vitorovicsofija610@gmail.com","Password":"lalalallala776","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2068, CAST(N'2020-08-25T18:56:09.6256180' AS DateTime2), N'Upload picture', N'{"Id":0,"PictureSrc":{"ContentDisposition":"form-data; name=\"PictureSrc\"; filename=\"24005-hearts.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"PictureSrc\"; filename=\"24005-hearts.png\""],"Content-Type":["image/png"]},"Length":3857,"Name":"PictureSrc","FileName":"24005-hearts.png"}}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2069, CAST(N'2020-08-25T18:58:45.0976573' AS DateTime2), N'Upload picture', N'{"Id":0,"PictureSrc":{"ContentDisposition":"form-data; name=\"PictureSrc\"; filename=\"2 - Copy.gif\"","ContentType":"image/gif","Headers":{"Content-Disposition":["form-data; name=\"PictureSrc\"; filename=\"2 - Copy.gif\""],"Content-Type":["image/gif"]},"Length":73942,"Name":"PictureSrc","FileName":"2 - Copy.gif"}}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2070, CAST(N'2020-08-25T18:59:01.7474874' AS DateTime2), N'Upload picture', N'{"Id":0,"PictureSrc":{"ContentDisposition":"form-data; name=\"PictureSrc\"; filename=\"3 - Copy.gif\"","ContentType":"image/gif","Headers":{"Content-Disposition":["form-data; name=\"PictureSrc\"; filename=\"3 - Copy.gif\""],"Content-Type":["image/gif"]},"Length":70709,"Name":"PictureSrc","FileName":"3 - Copy.gif"}}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2071, CAST(N'2020-08-25T18:59:10.8795826' AS DateTime2), N'Upload picture', N'{"Id":0,"PictureSrc":{"ContentDisposition":"form-data; name=\"PictureSrc\"; filename=\"b.gif\"","ContentType":"image/gif","Headers":{"Content-Disposition":["form-data; name=\"PictureSrc\"; filename=\"b.gif\""],"Content-Type":["image/gif"]},"Length":43003,"Name":"PictureSrc","FileName":"b.gif"}}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2072, CAST(N'2020-08-25T18:59:19.3137194' AS DateTime2), N'Upload picture', N'{"Id":0,"PictureSrc":{"ContentDisposition":"form-data; name=\"PictureSrc\"; filename=\"ceka.gif\"","ContentType":"image/gif","Headers":{"Content-Disposition":["form-data; name=\"PictureSrc\"; filename=\"ceka.gif\""],"Content-Type":["image/gif"]},"Length":64203,"Name":"PictureSrc","FileName":"ceka.gif"}}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2073, CAST(N'2020-08-25T18:59:27.6105193' AS DateTime2), N'Upload picture', N'{"Id":0,"PictureSrc":{"ContentDisposition":"form-data; name=\"PictureSrc\"; filename=\"f.gif\"","ContentType":"image/gif","Headers":{"Content-Disposition":["form-data; name=\"PictureSrc\"; filename=\"f.gif\""],"Content-Type":["image/gif"]},"Length":48478,"Name":"PictureSrc","FileName":"f.gif"}}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2074, CAST(N'2020-08-25T18:59:53.3779476' AS DateTime2), N'Upload picture', N'{"Id":0,"PictureSrc":{"ContentDisposition":"form-data; name=\"PictureSrc\"; filename=\"e.gif\"","ContentType":"image/gif","Headers":{"Content-Disposition":["form-data; name=\"PictureSrc\"; filename=\"e.gif\""],"Content-Type":["image/gif"]},"Length":51596,"Name":"PictureSrc","FileName":"e.gif"}}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2075, CAST(N'2020-08-25T19:00:01.0107324' AS DateTime2), N'Upload picture', N'{"Id":0,"PictureSrc":{"ContentDisposition":"form-data; name=\"PictureSrc\"; filename=\"r.gif\"","ContentType":"image/gif","Headers":{"Content-Disposition":["form-data; name=\"PictureSrc\"; filename=\"r.gif\""],"Content-Type":["image/gif"]},"Length":53230,"Name":"PictureSrc","FileName":"r.gif"}}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2076, CAST(N'2020-08-25T19:00:18.2897528' AS DateTime2), N'Upload picture', N'{"Id":0,"PictureSrc":{"ContentDisposition":"form-data; name=\"PictureSrc\"; filename=\"l.gif\"","ContentType":"image/gif","Headers":{"Content-Disposition":["form-data; name=\"PictureSrc\"; filename=\"l.gif\""],"Content-Type":["image/gif"]},"Length":44397,"Name":"PictureSrc","FileName":"l.gif"}}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2077, CAST(N'2020-08-25T19:00:33.4419866' AS DateTime2), N'Upload picture', N'{"Id":0,"PictureSrc":{"ContentDisposition":"form-data; name=\"PictureSrc\"; filename=\"66.gif\"","ContentType":"image/gif","Headers":{"Content-Disposition":["form-data; name=\"PictureSrc\"; filename=\"66.gif\""],"Content-Type":["image/gif"]},"Length":52954,"Name":"PictureSrc","FileName":"66.gif"}}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2078, CAST(N'2020-08-25T20:49:47.9117996' AS DateTime2), N'Get One Category', N'4', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2079, CAST(N'2020-08-25T21:01:15.9407730' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Milica","LastName":"Vitorovic","Email":"mia@gmail.com","Password":"sifrajaka1506","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2080, CAST(N'2020-08-25T21:03:27.4805627' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Mario","LastName":"Spasic","Email":"mare@gmail.com","Password":"sifrajakddwea1506","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2081, CAST(N'2020-08-25T21:07:01.3082409' AS DateTime2), N'Delete Category', N'22', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2082, CAST(N'2020-08-25T21:07:24.0385077' AS DateTime2), N'Delete Category', N'23', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2083, CAST(N'2020-08-25T21:13:52.1618699' AS DateTime2), N'Get One Category', N'4', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2084, CAST(N'2020-08-25T21:15:51.1297316' AS DateTime2), N'Get One Category', N'4', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2085, CAST(N'2020-08-25T21:16:31.4472850' AS DateTime2), N'Get One Category', N'4', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2086, CAST(N'2020-08-25T21:17:44.4860306' AS DateTime2), N'Get One Category', N'5', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2087, CAST(N'2020-08-25T21:19:26.2659045' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2088, CAST(N'2020-08-25T21:27:04.0013005' AS DateTime2), N'Get One Category', N'5', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2089, CAST(N'2020-08-25T21:28:19.1347900' AS DateTime2), N'Get One Category', N'5', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2090, CAST(N'2020-08-25T22:42:20.6088965' AS DateTime2), N'Get Categories', N'{"Name":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2091, CAST(N'2020-08-25T22:43:19.9210337' AS DateTime2), N'Get Categories', N'{"Name":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2092, CAST(N'2020-08-25T22:43:54.3849754' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2093, CAST(N'2020-08-25T22:46:22.3635502' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2094, CAST(N'2020-08-26T00:35:45.6578435' AS DateTime2), N'Create Post', N'{"Id":0,"Name":null,"Text":null,"CategoryId":0,"PictureId":0,"UserId":0}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2095, CAST(N'2020-08-26T00:55:37.0645955' AS DateTime2), N'Create Post', N'{"Id":0,"Name":null,"Text":null,"CategoryId":0,"PictureId":0,"UserId":0}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2096, CAST(N'2020-08-26T00:59:47.3095322' AS DateTime2), N'Create Post', N'{"Id":0,"Name":null,"Text":null,"CategoryId":0,"PictureId":0,"UserId":0}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2097, CAST(N'2020-08-26T01:09:12.9897169' AS DateTime2), N'Create Post', N'{"Id":0,"Name":null,"Text":null,"CategoryId":0,"PictureId":0,"UserId":0}', N'Neautorizovan korisnik')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1, CAST(N'2020-08-25T00:25:55.7359077' AS DateTime2), NULL, 0, NULL, N'Sofija', N'Vitorovic', N'sofija@gmail.com', N'2089a4a1e7c8aad222726ff0469bb7ce2dd76b45874c2f31206c2f37bd2af441')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (2, CAST(N'2020-08-25T00:39:03.7856729' AS DateTime2), NULL, 0, NULL, N'Marko', N'Korugic', N'mareti@gmail.com', N'2089a4a1e7c8aad222726ff0469bb7ce2dd76b45874c2f31206c2f37bd2af441')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1002, CAST(N'2020-08-25T01:08:49.0915732' AS DateTime2), CAST(N'2020-08-25T03:00:44.7605690' AS DateTime2), 1, CAST(N'2020-08-25T03:00:44.6560650' AS DateTime2), N'Janko', N'Spasic', N'janko09@gmail.com', N'2089a4a1e7c8aad222726ff0469bb7ce2dd76b45874c2f31206c2f37bd2af441')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1003, CAST(N'2020-08-25T01:14:02.4060733' AS DateTime2), NULL, 0, NULL, N'Martina', N'Lazic', N'marti87@gmail.com', N'8cd7f95e8e06b9ed558dcb54e32840c056c4e4f69443121302595f5212b3d1a6')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1004, CAST(N'2020-08-25T01:14:34.9808846' AS DateTime2), NULL, 0, NULL, N'Dragana', N'Markovic', N'gaga9987@gmail.com', N'2bed3c3ba7344dc53dc350dcaae73c8586d4bf665e5ffdcc6a95b17cfb60bb91')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1005, CAST(N'2020-08-25T01:15:06.2174704' AS DateTime2), NULL, 0, NULL, N'Zdravko', N'Nikolic', N'ydrNiks@gmail.com', N'e0981dfdcaad81e6b33246fec0430954e9d53f76061e250e5df711012dc26289')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1006, CAST(N'2020-08-25T01:17:09.2897368' AS DateTime2), NULL, 0, NULL, N'Petar', N'Jovanovic', N'pekica11@gmail.com', N'1802f2c5a45cee9c518ac7fd29719594a5eb441fa967eeaf455b99e2b3cf5e10')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1007, CAST(N'2020-08-25T01:17:41.6597965' AS DateTime2), NULL, 0, NULL, N'Milos', N'Jovanic', N'mare0955@gmail.com', N'65cb405fa134d3d11c9c0611581cd0e1a52e6d0ad9eebfb87834bc9bb6975af5')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1008, CAST(N'2020-08-25T01:18:11.7240392' AS DateTime2), NULL, 0, NULL, N'Maxim', N'JoLjutic', N'maxo990955@gmail.com', N'0eeee95ea6ed85575a54791cf807ad9a2298601e129694af4c11f7c5efbdec3c')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1009, CAST(N'2020-08-25T01:18:38.7154452' AS DateTime2), NULL, 0, NULL, N'Ivana', N'Pantic', N'iva87@gmail.com', N'357e1f48b4dfe10dda20856b92ad3e84f19bc61cfee281100a30771c9eff3b98')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1010, CAST(N'2020-08-25T01:19:47.8283775' AS DateTime2), NULL, 0, NULL, N'Kristina', N'Markovic', N'kile00978@gmail.com', N'273414f60edc3ded442be0aa81fa0588921c61176616bdfa2b64bbee319045e4')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1011, CAST(N'2020-08-25T01:20:30.5485969' AS DateTime2), NULL, 0, NULL, N'Snezana', N'Joksic', N'sneki0997@gmail.com', N'96edccc0f08eb6241dfe8d3759eceb83cafe8ead14a3a59ea55972c211c402ad')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1012, CAST(N'2020-08-25T01:21:27.5428266' AS DateTime2), NULL, 0, NULL, N'Aleksandar', N'Radovanovic', N'alekrad3@gmail.com', N'273414f60edc3ded442be0aa81fa0588921c61176616bdfa2b64bbee319045e4')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1013, CAST(N'2020-08-25T01:22:43.9402976' AS DateTime2), NULL, 0, NULL, N'Mladen', N'Peric', N'perimla874@gmail.com', N'1d67166402198cea33f567d334c825235c821c4ecf74dab102532f0eda125655')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1014, CAST(N'2020-08-25T01:24:59.5217613' AS DateTime2), NULL, 0, NULL, N'Jelisaveta', N'Milic', N'jela@gmail.com', N'6484c391a97cd16c40b266494962677515db1f8873dbcfdf0965b73b8833303a')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1015, CAST(N'2020-08-25T01:25:29.6173086' AS DateTime2), NULL, 0, NULL, N'Marijana', N'Milicic', N'jmilejel@gmail.com', N'69ea9d71cc9e528593fdec65f05500e2a5dc58c92039e18eae74537d2a15c90f')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1016, CAST(N'2020-08-25T01:26:06.8406033' AS DateTime2), NULL, 0, NULL, N'Janko', N'Ilicic', N'jankoili998@gmail.com', N'1b4e0300c448e9959039b6cdd21b81b6df09736ff279ca4396c5f5f095c0b4ad')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1017, CAST(N'2020-08-25T01:26:34.8963417' AS DateTime2), NULL, 0, NULL, N'Milica', N'Bakic', N'milica998@gmail.com', N'a0ffac9cc656d79d11a6414bca53245d6be10ffd453f62b0f2e2086d066617bc')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1018, CAST(N'2020-08-25T01:27:37.8445080' AS DateTime2), NULL, 0, NULL, N'Zoran', N'Lekic', N'zole998@gmail.com', N'4cbcc1808355e109bc1075b10c69a3e6a267d7d37713cac9de67fe934a6f068f')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1019, CAST(N'2020-08-25T01:28:13.8947263' AS DateTime2), NULL, 0, NULL, N'Ljiljana', N'Lilic', N'lili998@gmail.com', N'19e90133ce0480a734cc13744806f7535e95ab0d8f5eea4e99a35999782cf2f1')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (2014, CAST(N'2020-08-25T03:02:35.1398716' AS DateTime2), NULL, 0, NULL, N'Masa', N'Lilic', N'masica998@gmail.com', N'19e90133ce0480a734cc13744806f7535e95ab0d8f5eea4e99a35999782cf2f1')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (2015, CAST(N'2020-08-25T18:58:56.1951013' AS DateTime2), NULL, 0, NULL, N'Marinko', N'Janic', N'marinko@gmail.com', N'2089a4a1e7c8aad222726ff0469bb7ce2dd76b45874c2f31206c2f37bd2af441')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (2016, CAST(N'2020-08-25T19:02:30.4137358' AS DateTime2), NULL, 0, NULL, N'Sofija', N'Vitorovic', N'vitorovicsofija610@gmail.com', N'2089a4a1e7c8aad222726ff0469bb7ce2dd76b45874c2f31206c2f37bd2af441')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (2017, CAST(N'2020-08-25T23:01:21.9792766' AS DateTime2), NULL, 0, NULL, N'Milica', N'Vitorovic', N'mia@gmail.com', N'b912c2d56192ea27e374841acef081f37051b3a8d5ee00c4046a0d1892418e5c')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (2018, CAST(N'2020-08-25T23:03:33.7128564' AS DateTime2), NULL, 0, NULL, N'Mario', N'Spasic', N'mare@gmail.com', N'2559ba2b2c2fb845f0d3aa961cdf7813abb3c8b825bd489c4478c4556ffe8c44')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1, 1, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2, 1, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (3, 1, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (4, 2, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (5, 2, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (6, 2, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1004, 1002, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1005, 1002, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1006, 1002, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1007, 1003, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1008, 1003, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1009, 1003, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1010, 1004, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1011, 1004, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1012, 1004, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1013, 1005, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1014, 1005, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1015, 1005, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1016, 1006, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1017, 1006, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1018, 1006, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1019, 1007, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1020, 1007, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1021, 1007, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1022, 1008, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1023, 1008, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1024, 1008, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1025, 1009, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1026, 1009, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1027, 1009, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1028, 1010, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1029, 1010, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1030, 1010, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1031, 1011, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1032, 1011, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1033, 1011, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1034, 1012, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1035, 1012, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1036, 1012, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1037, 1013, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1038, 1013, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1039, 1013, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1040, 1014, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1041, 1014, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1042, 1014, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1043, 1015, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1044, 1015, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1045, 1015, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1046, 1016, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1047, 1016, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1048, 1016, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1049, 1017, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1050, 1017, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1051, 1017, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1052, 1018, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1053, 1018, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1054, 1018, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1055, 1019, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1056, 1019, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1057, 1019, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2040, 2014, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2041, 2014, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2042, 2014, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2043, 2015, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2044, 2015, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2045, 2015, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2046, 2016, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2047, 2016, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2048, 2016, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2049, 2017, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2050, 2017, 28)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2051, 2017, 29)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2052, 2017, 30)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2053, 2017, 31)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2054, 2017, 32)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2055, 2017, 33)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2056, 2017, 34)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2057, 2017, 35)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2058, 2017, 36)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2059, 2017, 37)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2060, 2017, 38)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2061, 2017, 39)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2062, 2017, 40)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2063, 2017, 41)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2064, 2017, 42)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2065, 2017, 43)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2066, 2017, 44)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2067, 2017, 45)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2068, 2017, 46)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2069, 2017, 47)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2070, 2017, 48)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2071, 2017, 27)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2072, 2017, 26)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2073, 2017, 25)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2074, 2017, 24)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2075, 2017, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2076, 2017, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2077, 2017, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2078, 2017, 5)
GO
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2079, 2017, 6)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2080, 2017, 7)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2081, 2017, 8)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2082, 2017, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2083, 2017, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2084, 2017, 11)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2085, 2017, 49)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2086, 2017, 12)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2087, 2017, 14)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2088, 2017, 15)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2089, 2017, 16)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2090, 2017, 17)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2091, 2017, 18)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2092, 2017, 19)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2093, 2017, 20)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2094, 2017, 21)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2095, 2017, 22)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2096, 2017, 23)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2097, 2017, 13)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2098, 2017, 50)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2099, 2018, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2100, 2018, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2101, 2018, 3)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts_PostId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Category_CategoryId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Pictures_PictureId] FOREIGN KEY([PictureId])
REFERENCES [dbo].[Pictures] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Pictures_PictureId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users_UserId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
