USE [LibraryApp]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 16/06/2023 12:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[Genre] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[LoanedToID] [uniqueidentifier] NULL,
	[LoanedOnDate] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 16/06/2023 12:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[LoanCard] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [Description], [LoanedToID], [LoanedOnDate]) VALUES (N'272b3811-6fc7-4cb7-b518-db758e87bba1', N'Harry Potter og de vises stein', N'J. K. Rowling', N'Fantasi', N'Harry Potter har ikke opplevd mye magi i sitt liv. Han bor i et kott under trappa hos den ekle familien Dumling, og han har ikke feiret bursdagen sin på elleve år. Men alt dette endrer seg når en ugle leverer et mystisk brev med innbydelse til Galtvort høyere skole for hekseri og trolldom ? et utrolig sted som Harry og alle som leser om ham aldri vil glemme. Her får Harry venner, og magien gjennomsyrer alt fra skoletimer til måltider. Men et skjebnesvangert møte venter ham. Vil Harry, gutten med sikksakkarret, leve opp til forventningene alle har til ham?', NULL, NULL)
GO
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [Description], [LoanedToID], [LoanedOnDate]) VALUES (N'a31a3b79-8a05-4df3-920d-26e28fcbf7a2', N'Tørst', N'Jo Nesbø', N'Drama', N'Et drapsoffer blir funnet i sitt hjem med bitemerker i halsen. Kroppen er tappet for blod. Kan det være vamyprisme - et svært omdiskutert felt i psykiatrien. Tidligere etterforsker Harry Hole vet bedre enn noen at flere av krimhistoriens verste seriemordere har vært diagnostisert som nettopp vampyrister. Men Harry har et annet motiv for å bistå politiet - morderen som slapp unna.', NULL, NULL)
GO
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [Description], [LoanedToID], [LoanedOnDate]) VALUES (N'a39c577f-4905-4b03-aeb5-619bde222029', N'Bryllup på øya', N'Jenny Colgan', N'Romantikk', N'Femte bok i Jenny Colgans suksesserie om Flora MacKenzie og innbyggerne på den lille øya i havet. Det er snart midtsommer. Olivia og Anthony planlegger Et Meget Ekstravagant Bryllup på hotellet på den lille øya Mure. Kokker, musikere og noe så outrert som en levende blomstervegg flys inn. Alt må være perfekt til den store dagen. Kanskje for perfekt? Samtidig gjør Flora alt hun kan for å ikke la bryllupet til Olivia og Anthony overskygge hennes egen store dag med Joel – og feiler totalt. Planleggingen går også på forholdet løs – for de greier ikke å enes om hvordan feiringen skal foregå. Og så er det Lorna og Said, som desperat forsøker å holde forholdet hemmelig for sønnene hans. Men når de bruker all sin tid på å beskytte guttene – hvem skal passe på dem?', NULL, NULL)
GO
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [Description], [LoanedToID], [LoanedOnDate]) VALUES (N'631bb3df-936b-4f8f-9239-47b17003498d', N'Forræderen', N'Jørn Lier-Horst', N'Krim', N'Etter dager og uker med uvanlig mye regn gir jordmassene i et boligområde i Larvik etter. I alt ti hus blir tatt av skredet. Wisting havner midt i redningsarbeidet. Gjennom natten blir alle beboere gjort rede for, og det blir klart at ulykken ikke har krevd menneskeliv. Neste dag blir det likevel funnet en død mann i rasmassene. Nærmere undersøkelser viser at han døde minst 48 timer før raset gikk. Etterforskningen griper inn i flere andre pågående politioperasjoner, og Wisting blir satt til å lede en felles etterforskningsgruppe. Men snart blir det klart at det sitter minst én forræder rundt etterforskerbordet.', NULL, NULL)
GO
INSERT [dbo].[User] ([FirstName], [LastName], [Address], [UserID], [LoanCard]) VALUES (N'Jarl', N'Goli', N'Portveien 2', N'9a0a3376-f812-44e3-8d71-0610a575b108', N'Ingen')
GO
INSERT [dbo].[User] ([FirstName], [LastName], [Address], [UserID], [LoanCard]) VALUES (N'Pål', N'Askeladd', N'Bakveien 69', N'aa7deab6-5f26-44f5-a5f5-138495392b7c', N'Ingen')
GO
INSERT [dbo].[User] ([FirstName], [LastName], [Address], [UserID], [LoanCard]) VALUES (N'Eli', N'Rygg', N'Portveien 2', N'3c06e9ab-060a-40e9-a185-2b066acb94e4', N'Ingen')
GO
INSERT [dbo].[User] ([FirstName], [LastName], [Address], [UserID], [LoanCard]) VALUES (N'Espen', N'Askeladd', N'Rusleveien 23', N'8579338e-9373-4530-9b40-2bac225481e0', N'Ingen')
GO
INSERT [dbo].[User] ([FirstName], [LastName], [Address], [UserID], [LoanCard]) VALUES (N'Nils', N'Bjarne', N'Fjompelia 35', N'ccef6225-6cfc-4739-a432-41ca17d6e857', N'Ingen')
GO
INSERT [dbo].[User] ([FirstName], [LastName], [Address], [UserID], [LoanCard]) VALUES (N'Per', N'Askeladd', N'Omveien 24', N'9dcd5235-1da5-41f2-bae5-c597fde2a779', N'Ingen')
GO
