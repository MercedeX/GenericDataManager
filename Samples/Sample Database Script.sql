/*
Created on:	October 10, 2016
Created by:	Suheyl Z
Purpose:	A Sql Server script that initializes the database on which it is executed with the two tables Employee, Department. 
			These are used as sample tables for the generic Data manager samples	   

Conditions

Pre :	1. Microsoft Sql Server version 5 or higher 
		2. If the tables are there it drops and recreates them

Post:	There will be two tables, Employee with 50 records and Department with 5 records

*/



/********************************************
	Drop the existing tables
********************************************/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
DROP TABLE [dbo].[Department]
GO



/********************************************
	Create the new tables
********************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Notes] [nvarchar](100) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] NOT NULL,
	[FullName] [varchar](50) NULL,
	[Email] [varchar](150) NULL,
	[NIC] [varchar](50) NULL,
	[Notes] [nvarchar](512) NULL,
	[DepartmentId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO




/********************************************
	Fill in the fictional data
********************************************/

SET ANSI_PADDING OFF
GO
INSERT [dbo].[Department] ([Id], [Name], [Notes]) VALUES (1, N'Finance', N'Deals with the financial data')
GO
INSERT [dbo].[Department] ([Id], [Name], [Notes]) VALUES (2, N'Support', N'Provide support for Computers and related')
GO
INSERT [dbo].[Department] ([Id], [Name], [Notes]) VALUES (3, N'Management', N'Manages the overall working of the company')
GO
INSERT [dbo].[Department] ([Id], [Name], [Notes]) VALUES (4, N'Marketing', N'Markets the products made by the company')
GO
INSERT [dbo].[Department] ([Id], [Name], [Notes]) VALUES (5, N'Developers', N'The geeks who eat pizza and sip black coffee')
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (1, N'Daria Chan', N'ante@atrisusNunc.net', NULL, N'', 4)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (2, N'Jerome Weaver', N'volutpat@volutpat.edu', NULL, N'', 4)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (3, N'Imani Johnston', N'varius.Nam@euismodenim.edu', NULL, N'', 4)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (4, N'Ciaran Murphy', N'nibh.Quisque.nonummy@ante.org', NULL, N'', 4)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (5, N'Sonya David', N'sit.amet@duiinsodales.co.uk', NULL, N'', 3)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (6, N'Vladimir Benton', N'Sed.congue.elit@faucibusid.net', NULL, N'', 2)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (7, N'Noel Harrell', N'ipsum@in.edu', NULL, N'', 2)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (8, N'Anika Lynn', N'mattis.velit@mollis.edu', NULL, N'', 2)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (9, N'Lysandra Parker', N'massa.Suspendisse.eleifend@Loremipsumdolor.com', NULL, N'', 2)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (10, N'Lara Macdonald', N'sit.amet@aaliquetvel.com', NULL, N'', 2)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (11, N'Charlotte Woodward', N'aliquet.diam.Sed@dolordolor.com', NULL, N'', 2)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (12, N'Zahir Medina', N'risus.at.fringilla@massaQuisque.ca', NULL, N'', 2)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (13, N'Natalie Cantu', N'enim.Curabitur.massa@Integersemelit.co.uk', NULL, N'', 2)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (14, N'Alexandra Petty', N'vitae.erat.Vivamus@velquamdignissim.net', NULL, N'', 2)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (15, N'Rhea Carver', N'ac@Aliquamtincidunt.net', NULL, N'', 3)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (16, N'Deborah Atkins', N'semper.erat.in@aceleifendvitae.com', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (17, N'Kibo Ratliff', N'luctus.ipsum.leo@amet.edu', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (18, N'Ezekiel Mcclure', N'Morbi@montesnasceturridiculus.org', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (19, N'Julian Clayton', N'Aliquam@venenatis.net', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (20, N'Isabella Galloway', N'Quisque@malesuada.com', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (21, N'Dean Harrington', N'ut.lacus.Nulla@tempor.com', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (22, N'Zelenia Jones', N'mollis.Phasellus.libero@vulputate.com', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (23, N'Maxine Williams', N'rutrum@adipiscinglobortis.net', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (24, N'Lareina Durham', N'pede@orciPhasellusdapibus.ca', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (25, N'Patience Wooten', N'Etiam.ligula@tortor.edu', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (26, N'Stella Perkins', N'dui@sedconsequat.org', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (27, N'Uriah Hodge', N'velit.egestas.lacinia@posuerecubiliaCurae.co.uk', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (28, N'Mark Valencia', N'massa.Vestibulum.accumsan@sapienmolestie.edu', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (29, N'Uta Burris', N'commodo@pede.co.uk', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (30, N'Elizabeth Rosario', N'Sed.pharetra@Mauriseu.com', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (31, N'Charles Jarvis', N'nisl.elementum.purus@egetodioAliquam.ca', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (32, N'Blaine Holmes', N'scelerisque@neque.net', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (33, N'Kennan Craft', N'Phasellus.at.augue@utmi.edu', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (34, N'Vivian Sharp', N'Donec.vitae@dui.edu', NULL, N'', 5)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (35, N'Clayton Mcclure', N'nonummy.ut.molestie@in.co.uk', NULL, N'', 3)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (36, N'Ivan Hunter', N'ac.fermentum.vel@nascetur.com', NULL, N'', 3)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (37, N'Joy Stewart', N'neque.Morbi.quis@Integervitaenibh.edu', NULL, N'', 3)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (38, N'Nomlanga Maxwell', N'libero.Donec.consectetuer@duinec.ca', NULL, N'', 3)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (39, N'Joan Whitney', N'habitant@sodales.co.uk', NULL, N'', 3)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (40, N'Celeste Snyder', N'adipiscing.fringilla@Proinvelit.edu', NULL, N'', 3)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (41, N'Montana Harvey', N'Quisque.ornare.tortor@diamat.com', NULL, N'', 3)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (42, N'Charde Simmons', N'tortor.nibh@Proin.com', NULL, N'', 3)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (43, N'Miranda Reeves', N'vitae.dolor@justo.co.uk', NULL, N'', 3)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (44, N'Nash Adkins', N'sed@malesuadavel.net', NULL, N'', 3)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (45, N'Mia Dawson', N'nec.quam@sitametrisus.net', NULL, N'', 3)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (46, N'Paki Oneill', N'luctus.vulputate.nisi@metusvitaevelit.net', NULL, N'', 3)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (47, N'Porter Brock', N'fringilla.mi.lacinia@Quisqueimperdieterat.edu', NULL, N'', 3)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (48, N'Carson Trujillo', N'egestas@magnaUttincidunt.org', NULL, N'', 3)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (49, N'Elijah Cain', N'elementum.purus@Praesenteunulla.edu', NULL, N'', 3)
GO
INSERT [dbo].[Employee] ([ID], [FullName], [Email], [NIC], [Notes], [DepartmentId]) VALUES (50, N'Kenyon Pollard', N'vitae.sodales.nisi@etnetus.co.uk', NULL, N'', 3)
GO
