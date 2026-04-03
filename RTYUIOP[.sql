USE [master]
GO
/****** Object:  Database [PROIZVPR]    Script Date: 30.03.2026 20:22:46 ******/
CREATE DATABASE [PROIZVPR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PROIZVPR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PROIZVPR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PROIZVPR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PROIZVPR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PROIZVPR] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PROIZVPR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PROIZVPR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PROIZVPR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PROIZVPR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PROIZVPR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PROIZVPR] SET ARITHABORT OFF 
GO
ALTER DATABASE [PROIZVPR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PROIZVPR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PROIZVPR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PROIZVPR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PROIZVPR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PROIZVPR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PROIZVPR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PROIZVPR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PROIZVPR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PROIZVPR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PROIZVPR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PROIZVPR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PROIZVPR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PROIZVPR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PROIZVPR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PROIZVPR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PROIZVPR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PROIZVPR] SET RECOVERY FULL 
GO
ALTER DATABASE [PROIZVPR] SET  MULTI_USER 
GO
ALTER DATABASE [PROIZVPR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PROIZVPR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PROIZVPR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PROIZVPR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PROIZVPR] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PROIZVPR] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PROIZVPR', N'ON'
GO
ALTER DATABASE [PROIZVPR] SET QUERY_STORE = ON
GO
ALTER DATABASE [PROIZVPR] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PROIZVPR]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 30.03.2026 20:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[id_client] [int] IDENTITY(1,1) NOT NULL,
	[client_name] [nvarchar](150) NOT NULL,
	[contact_person] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 30.03.2026 20:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id_comment] [int] IDENTITY(1,1) NOT NULL,
	[id_request] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[comment_text] [nvarchar](max) NOT NULL,
	[comment_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_comment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 30.03.2026 20:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[id_equipment] [int] IDENTITY(1,1) NOT NULL,
	[equipment_name] [nvarchar](150) NOT NULL,
	[model] [nvarchar](100) NULL,
	[serial_number] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_equipment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Failure_types]    Script Date: 30.03.2026 20:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Failure_types](
	[id_failure_type] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_failure_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logins]    Script Date: 30.03.2026 20:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logins](
	[id_login] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Repair_actions]    Script Date: 30.03.2026 20:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repair_actions](
	[id_action] [int] IDENTITY(1,1) NOT NULL,
	[id_request] [int] NOT NULL,
	[id_manager] [int] NOT NULL,
	[additional_specialist_id] [int] NOT NULL,
	[action_reason] [nvarchar](max) NULL,
	[action_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 30.03.2026 20:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[id_request] [int] NOT NULL,
	[request_number] [nvarchar](50) NOT NULL,
	[creation_date] [date] NOT NULL,
	[description] [nvarchar](max) NULL,
	[id_equipment] [int] NOT NULL,
	[id_failure_type] [int] NOT NULL,
	[id_client] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[assigned_to] [int] NULL,
	[deadline_date] [date] NULL,
	[extension_reason] [nvarchar](max) NULL,
	[client_agreement] [bit] NULL,
	[qr_code_generated] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_request] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 30.03.2026 20:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id_role] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 30.03.2026 20:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[id_status] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 30.03.2026 20:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](150) NOT NULL,
	[email] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[id_role] [int] NOT NULL,
	[id_login] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([id_client], [client_name], [contact_person], [phone], [email]) VALUES (1, N'ООО "Ромашка"', N'Иван Петров', N'+74951234567', N'romashka@mail.ru')
INSERT [dbo].[Clients] ([id_client], [client_name], [contact_person], [phone], [email]) VALUES (2, N'ЗАО "Луч"', N'Ольга Сидорова', N'+74957654321', N'luch@mail.ru')
INSERT [dbo].[Clients] ([id_client], [client_name], [contact_person], [phone], [email]) VALUES (3, N'ИП Смирнов', N'Антон Смирнов', N'+79031234567', N'smirnov@mail.ru')
INSERT [dbo].[Clients] ([id_client], [client_name], [contact_person], [phone], [email]) VALUES (4, N'ООО "Вектор"', N'Дмитрий Козлов', N'+74951112233', N'vector@yandex.ru')
INSERT [dbo].[Clients] ([id_client], [client_name], [contact_person], [phone], [email]) VALUES (5, N'АО "Старт"', N'Мария Новикова', N'+74954445566', N'start@mail.ru')
INSERT [dbo].[Clients] ([id_client], [client_name], [contact_person], [phone], [email]) VALUES (6, N'ООО "Глобус"', N'Петр Морозов', N'+79039887766', N'globus@mail.ru')
INSERT [dbo].[Clients] ([id_client], [client_name], [contact_person], [phone], [email]) VALUES (7, N'ИП Волкова', N'Анна Волкова', N'+79035554433', N'volkova@mail.ru')
INSERT [dbo].[Clients] ([id_client], [client_name], [contact_person], [phone], [email]) VALUES (8, N'ООО "Альфа"', N'Сергей Зайцев', N'+74957778899', N'alfa@yandex.ru')
INSERT [dbo].[Clients] ([id_client], [client_name], [contact_person], [phone], [email]) VALUES (9, N'ЗАО "Бета"', N'Татьяна Соколова', N'+79031112233', N'beta@mail.ru')
INSERT [dbo].[Clients] ([id_client], [client_name], [contact_person], [phone], [email]) VALUES (10, N'ООО "Омега"', N'Николай Петров', N'+74953334455', N'omega@mail.ru')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([id_comment], [id_request], [id_user], [comment_text], [comment_date]) VALUES (1, 1, 3, N'Проверил питание, нужна замена материнской платы', CAST(N'2026-03-30T13:42:46.660' AS DateTime))
INSERT [dbo].[Comments] ([id_comment], [id_request], [id_user], [comment_text], [comment_date]) VALUES (2, 1, 4, N'Заказал материнскую плату, придет через 3 дня', CAST(N'2026-03-30T13:42:46.660' AS DateTime))
INSERT [dbo].[Comments] ([id_comment], [id_request], [id_user], [comment_text], [comment_date]) VALUES (3, 2, 3, N'Почистил от пыли, шум пропал', CAST(N'2026-03-30T13:42:46.660' AS DateTime))
INSERT [dbo].[Comments] ([id_comment], [id_request], [id_user], [comment_text], [comment_date]) VALUES (4, 4, 3, N'Переустановил драйвера, все работает', CAST(N'2026-03-30T13:42:46.660' AS DateTime))
INSERT [dbo].[Comments] ([id_comment], [id_request], [id_user], [comment_text], [comment_date]) VALUES (5, 5, 5, N'Заменил термопасту, температура в норме', CAST(N'2026-03-30T13:42:46.660' AS DateTime))
INSERT [dbo].[Comments] ([id_comment], [id_request], [id_user], [comment_text], [comment_date]) VALUES (6, 7, 6, N'Установил новый SSD, данные восстановлены', CAST(N'2026-03-30T13:42:46.660' AS DateTime))
INSERT [dbo].[Comments] ([id_comment], [id_request], [id_user], [comment_text], [comment_date]) VALUES (7, 8, 8, N'Перенастроил сеть, проблема не решена окончательно', CAST(N'2026-03-30T13:42:46.660' AS DateTime))
INSERT [dbo].[Comments] ([id_comment], [id_request], [id_user], [comment_text], [comment_date]) VALUES (8, 10, 10, N'Заказал новый экран, ожидаем поставку', CAST(N'2026-03-30T13:42:46.660' AS DateTime))
INSERT [dbo].[Comments] ([id_comment], [id_request], [id_user], [comment_text], [comment_date]) VALUES (9, 11, 3, N'Обновил драйвера видеокарты', CAST(N'2026-03-30T13:42:46.660' AS DateTime))
INSERT [dbo].[Comments] ([id_comment], [id_request], [id_user], [comment_text], [comment_date]) VALUES (10, 13, 4, N'Заменил кулер, шум ушел', CAST(N'2026-03-30T13:42:46.660' AS DateTime))
INSERT [dbo].[Comments] ([id_comment], [id_request], [id_user], [comment_text], [comment_date]) VALUES (11, 14, 5, N'Срок продлен до 5 апреля', CAST(N'2026-03-30T13:42:46.660' AS DateTime))
INSERT [dbo].[Comments] ([id_comment], [id_request], [id_user], [comment_text], [comment_date]) VALUES (12, 15, 6, N'QR-код сгенерирован и отправлен клиенту', CAST(N'2026-03-30T13:42:46.660' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([id_equipment], [equipment_name], [model], [serial_number]) VALUES (1, N'Ноутбук Lenovo', N'ThinkPad T14', N'SN123456789')
INSERT [dbo].[Equipment] ([id_equipment], [equipment_name], [model], [serial_number]) VALUES (2, N'Системный блок HP', N'ProDesk 400', N'SN987654321')
INSERT [dbo].[Equipment] ([id_equipment], [equipment_name], [model], [serial_number]) VALUES (3, N'МФУ Canon', N'MF445dw', N'SN555666777')
INSERT [dbo].[Equipment] ([id_equipment], [equipment_name], [model], [serial_number]) VALUES (4, N'Ноутбук Dell', N'Latitude 5420', N'SN111222333')
INSERT [dbo].[Equipment] ([id_equipment], [equipment_name], [model], [serial_number]) VALUES (5, N'Моноблок Apple', N'iMac 24', N'SN444555666')
INSERT [dbo].[Equipment] ([id_equipment], [equipment_name], [model], [serial_number]) VALUES (6, N'Сервер HP', N'ProLiant DL380', N'SN777888999')
INSERT [dbo].[Equipment] ([id_equipment], [equipment_name], [model], [serial_number]) VALUES (7, N'Ноутбук Asus', N'ZenBook 14', N'SN123987456')
INSERT [dbo].[Equipment] ([id_equipment], [equipment_name], [model], [serial_number]) VALUES (8, N'Коммутатор Cisco', N'Catalyst 2960', N'SN456123789')
INSERT [dbo].[Equipment] ([id_equipment], [equipment_name], [model], [serial_number]) VALUES (9, N'Принтер HP', N'LaserJet Pro', N'SN789456123')
INSERT [dbo].[Equipment] ([id_equipment], [equipment_name], [model], [serial_number]) VALUES (10, N'Планшет Samsung', N'Galaxy Tab S8', N'SN321654987')
INSERT [dbo].[Equipment] ([id_equipment], [equipment_name], [model], [serial_number]) VALUES (11, N'Рабочая станция Dell', N'Precision 3650', N'SN654987321')
INSERT [dbo].[Equipment] ([id_equipment], [equipment_name], [model], [serial_number]) VALUES (12, N'Сервер IBM', N'PowerEdge R750', N'SN987321654')
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[Failure_types] ON 

INSERT [dbo].[Failure_types] ([id_failure_type], [type_name]) VALUES (2, N'Зависает система')
INSERT [dbo].[Failure_types] ([id_failure_type], [type_name]) VALUES (5, N'Замена компонента')
INSERT [dbo].[Failure_types] ([id_failure_type], [type_name]) VALUES (1, N'Не включается')
INSERT [dbo].[Failure_types] ([id_failure_type], [type_name]) VALUES (6, N'Перегрев')
INSERT [dbo].[Failure_types] ([id_failure_type], [type_name]) VALUES (4, N'Проблемы с сетью')
INSERT [dbo].[Failure_types] ([id_failure_type], [type_name]) VALUES (3, N'Шум при работе')
SET IDENTITY_INSERT [dbo].[Failure_types] OFF
GO
SET IDENTITY_INSERT [dbo].[Logins] ON 

INSERT [dbo].[Logins] ([id_login], [login], [password]) VALUES (1, N'ivanov_a', N'pass123')
INSERT [dbo].[Logins] ([id_login], [login], [password]) VALUES (2, N'petrov_s', N'pass456')
INSERT [dbo].[Logins] ([id_login], [login], [password]) VALUES (3, N'sidorov_k', N'pass789')
INSERT [dbo].[Logins] ([id_login], [login], [password]) VALUES (4, N'smirnov_d', N'pass101')
INSERT [dbo].[Logins] ([id_login], [login], [password]) VALUES (5, N'kozlov_m', N'pass202')
INSERT [dbo].[Logins] ([id_login], [login], [password]) VALUES (6, N'novikov_i', N'pass303')
INSERT [dbo].[Logins] ([id_login], [login], [password]) VALUES (7, N'morozov_v', N'pass404')
INSERT [dbo].[Logins] ([id_login], [login], [password]) VALUES (8, N'volkov_e', N'pass505')
INSERT [dbo].[Logins] ([id_login], [login], [password]) VALUES (9, N'zaitsev_a', N'pass606')
INSERT [dbo].[Logins] ([id_login], [login], [password]) VALUES (10, N'sokolova_e', N'pass707')
SET IDENTITY_INSERT [dbo].[Logins] OFF
GO
SET IDENTITY_INSERT [dbo].[Repair_actions] ON 

INSERT [dbo].[Repair_actions] ([id_action], [id_request], [id_manager], [additional_specialist_id], [action_reason], [action_date]) VALUES (1, 1, 2, 4, N'Исполнитель Сидоров не справляется по срокам, подключен Смирнов', CAST(N'2026-03-30T13:42:46.670' AS DateTime))
INSERT [dbo].[Repair_actions] ([id_action], [id_request], [id_manager], [additional_specialist_id], [action_reason], [action_date]) VALUES (2, 2, 2, 3, N'Требуется дополнительная диагностика', CAST(N'2026-03-30T13:42:46.670' AS DateTime))
INSERT [dbo].[Repair_actions] ([id_action], [id_request], [id_manager], [additional_specialist_id], [action_reason], [action_date]) VALUES (3, 5, 7, 6, N'Сложный случай перегрева, нужен опытный специалист', CAST(N'2026-03-30T13:42:46.670' AS DateTime))
INSERT [dbo].[Repair_actions] ([id_action], [id_request], [id_manager], [additional_specialist_id], [action_reason], [action_date]) VALUES (4, 8, 7, 9, N'Проблемы с сетью требуют второго специалиста', CAST(N'2026-03-30T13:42:46.670' AS DateTime))
INSERT [dbo].[Repair_actions] ([id_action], [id_request], [id_manager], [additional_specialist_id], [action_reason], [action_date]) VALUES (5, 11, 2, 5, N'Зависания в играх - нужна помощь Козлова', CAST(N'2026-03-30T13:42:46.670' AS DateTime))
INSERT [dbo].[Repair_actions] ([id_action], [id_request], [id_manager], [additional_specialist_id], [action_reason], [action_date]) VALUES (6, 12, 7, 8, N'Проблема с диском - подключен Волков', CAST(N'2026-03-30T13:42:46.670' AS DateTime))
INSERT [dbo].[Repair_actions] ([id_action], [id_request], [id_manager], [additional_specialist_id], [action_reason], [action_date]) VALUES (7, 13, 2, 3, N'Шум кулера - диагностика вдвоем', CAST(N'2026-03-30T13:42:46.670' AS DateTime))
INSERT [dbo].[Repair_actions] ([id_action], [id_request], [id_manager], [additional_specialist_id], [action_reason], [action_date]) VALUES (8, 14, 7, 5, N'Продление срока - дополнительная проверка', CAST(N'2026-03-30T13:42:46.670' AS DateTime))
SET IDENTITY_INSERT [dbo].[Repair_actions] OFF
GO
INSERT [dbo].[Requests] ([id_request], [request_number], [creation_date], [description], [id_equipment], [id_failure_type], [id_client], [id_status], [assigned_to], [deadline_date], [extension_reason], [client_agreement], [qr_code_generated]) VALUES (1, N'REQ-001', CAST(N'2026-03-20' AS Date), N'Ноутбук не включается после падения', 1, 1, 1, 2, 3, CAST(N'2026-03-28' AS Date), NULL, 0, 1)
INSERT [dbo].[Requests] ([id_request], [request_number], [creation_date], [description], [id_equipment], [id_failure_type], [id_client], [id_status], [assigned_to], [deadline_date], [extension_reason], [client_agreement], [qr_code_generated]) VALUES (2, N'REQ-002', CAST(N'2026-03-22' AS Date), N'Системный блок сильно шумит', 2, 3, 2, 1, NULL, CAST(N'2026-03-30' AS Date), NULL, 0, 0)
INSERT [dbo].[Requests] ([id_request], [request_number], [creation_date], [description], [id_equipment], [id_failure_type], [id_client], [id_status], [assigned_to], [deadline_date], [extension_reason], [client_agreement], [qr_code_generated]) VALUES (3, N'REQ-003', CAST(N'2026-03-25' AS Date), N'МФУ не ловит сеть', 3, 4, 3, 2, 4, CAST(N'2026-04-01' AS Date), NULL, 0, 0)
INSERT [dbo].[Requests] ([id_request], [request_number], [creation_date], [description], [id_equipment], [id_failure_type], [id_client], [id_status], [assigned_to], [deadline_date], [extension_reason], [client_agreement], [qr_code_generated]) VALUES (4, N'REQ-004', CAST(N'2026-03-10' AS Date), N'Зависает система при старте', 4, 2, 1, 3, 3, CAST(N'2026-03-20' AS Date), NULL, 0, 1)
INSERT [dbo].[Requests] ([id_request], [request_number], [creation_date], [description], [id_equipment], [id_failure_type], [id_client], [id_status], [assigned_to], [deadline_date], [extension_reason], [client_agreement], [qr_code_generated]) VALUES (5, N'REQ-005', CAST(N'2026-03-15' AS Date), N'Перегрев при работе', 5, 6, 4, 2, 5, CAST(N'2026-03-29' AS Date), NULL, 0, 0)
INSERT [dbo].[Requests] ([id_request], [request_number], [creation_date], [description], [id_equipment], [id_failure_type], [id_client], [id_status], [assigned_to], [deadline_date], [extension_reason], [client_agreement], [qr_code_generated]) VALUES (6, N'REQ-006', CAST(N'2026-03-18' AS Date), N'Не загружается ОС', 6, 2, 5, 1, NULL, CAST(N'2026-03-27' AS Date), NULL, 0, 0)
INSERT [dbo].[Requests] ([id_request], [request_number], [creation_date], [description], [id_equipment], [id_failure_type], [id_client], [id_status], [assigned_to], [deadline_date], [extension_reason], [client_agreement], [qr_code_generated]) VALUES (7, N'REQ-007', CAST(N'2026-03-01' AS Date), N'Замена жесткого диска', 7, 5, 6, 3, 6, CAST(N'2026-03-15' AS Date), NULL, 0, 1)
INSERT [dbo].[Requests] ([id_request], [request_number], [creation_date], [description], [id_equipment], [id_failure_type], [id_client], [id_status], [assigned_to], [deadline_date], [extension_reason], [client_agreement], [qr_code_generated]) VALUES (8, N'REQ-008', CAST(N'2026-03-05' AS Date), N'Проблемы с сетью', 8, 4, 7, 4, 8, CAST(N'2026-03-19' AS Date), N'Ждем запчасти', 1, 0)
INSERT [dbo].[Requests] ([id_request], [request_number], [creation_date], [description], [id_equipment], [id_failure_type], [id_client], [id_status], [assigned_to], [deadline_date], [extension_reason], [client_agreement], [qr_code_generated]) VALUES (9, N'REQ-009', CAST(N'2026-03-12' AS Date), N'Не печатает', 9, 5, 8, 2, 9, CAST(N'2026-03-26' AS Date), NULL, 0, 0)
INSERT [dbo].[Requests] ([id_request], [request_number], [creation_date], [description], [id_equipment], [id_failure_type], [id_client], [id_status], [assigned_to], [deadline_date], [extension_reason], [client_agreement], [qr_code_generated]) VALUES (10, N'REQ-010', CAST(N'2026-02-28' AS Date), N'Трещина экрана', 10, 1, 9, 3, 10, CAST(N'2026-03-14' AS Date), NULL, 0, 1)
INSERT [dbo].[Requests] ([id_request], [request_number], [creation_date], [description], [id_equipment], [id_failure_type], [id_client], [id_status], [assigned_to], [deadline_date], [extension_reason], [client_agreement], [qr_code_generated]) VALUES (11, N'REQ-011', CAST(N'2026-03-08' AS Date), N'Зависает в играх', 11, 2, 10, 2, 3, CAST(N'2026-03-25' AS Date), NULL, 0, 0)
INSERT [dbo].[Requests] ([id_request], [request_number], [creation_date], [description], [id_equipment], [id_failure_type], [id_client], [id_status], [assigned_to], [deadline_date], [extension_reason], [client_agreement], [qr_code_generated]) VALUES (12, N'REQ-012', CAST(N'2026-03-20' AS Date), N'Система не видит диск', 12, 5, 1, 1, NULL, CAST(N'2026-04-03' AS Date), NULL, 0, 0)
INSERT [dbo].[Requests] ([id_request], [request_number], [creation_date], [description], [id_equipment], [id_failure_type], [id_client], [id_status], [assigned_to], [deadline_date], [extension_reason], [client_agreement], [qr_code_generated]) VALUES (13, N'REQ-013', CAST(N'2026-03-14' AS Date), N'Шум кулера', 2, 3, 2, 2, 4, CAST(N'2026-03-28' AS Date), NULL, 0, 0)
INSERT [dbo].[Requests] ([id_request], [request_number], [creation_date], [description], [id_equipment], [id_failure_type], [id_client], [id_status], [assigned_to], [deadline_date], [extension_reason], [client_agreement], [qr_code_generated]) VALUES (14, N'REQ-014', CAST(N'2026-03-19' AS Date), N'Срок продлен по просьбе клиента', 4, 2, 3, 5, 5, CAST(N'2026-04-05' AS Date), N'Клиент попросил перенести', 1, 0)
INSERT [dbo].[Requests] ([id_request], [request_number], [creation_date], [description], [id_equipment], [id_failure_type], [id_client], [id_status], [assigned_to], [deadline_date], [extension_reason], [client_agreement], [qr_code_generated]) VALUES (15, N'REQ-015', CAST(N'2026-03-23' AS Date), N'QR-код сгенерирован для отзыва', 1, 1, 4, 2, 6, CAST(N'2026-03-31' AS Date), NULL, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([id_role], [role_name]) VALUES (1, N'Администратор')
INSERT [dbo].[Roles] ([id_role], [role_name]) VALUES (3, N'Исполнитель')
INSERT [dbo].[Roles] ([id_role], [role_name]) VALUES (2, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Statuses] ON 

INSERT [dbo].[Statuses] ([id_status], [status_name]) VALUES (1, N'В ожидании')
INSERT [dbo].[Statuses] ([id_status], [status_name]) VALUES (2, N'В работе')
INSERT [dbo].[Statuses] ([id_status], [status_name]) VALUES (3, N'Выполнено')
INSERT [dbo].[Statuses] ([id_status], [status_name]) VALUES (4, N'Не выполнено')
INSERT [dbo].[Statuses] ([id_status], [status_name]) VALUES (5, N'Продлен срок')
SET IDENTITY_INSERT [dbo].[Statuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id_user], [full_name], [email], [phone], [id_role], [id_login]) VALUES (1, N'Алексей Иванов', N'ivanov@mail.ru', N'+79161234567', 1, 1)
INSERT [dbo].[Users] ([id_user], [full_name], [email], [phone], [id_role], [id_login]) VALUES (2, N'Сергей Петров', N'petrov@mail.ru', N'+79162345678', 2, 2)
INSERT [dbo].[Users] ([id_user], [full_name], [email], [phone], [id_role], [id_login]) VALUES (3, N'Константин Сидоров', N'sidorov@mail.ru', N'+79163456789', 3, 3)
INSERT [dbo].[Users] ([id_user], [full_name], [email], [phone], [id_role], [id_login]) VALUES (4, N'Дмитрий Смирнов', N'smirnov@mail.ru', N'+79164567890', 3, 4)
INSERT [dbo].[Users] ([id_user], [full_name], [email], [phone], [id_role], [id_login]) VALUES (5, N'Михаил Козлов', N'kozlov@mail.ru', N'+79165678901', 3, 5)
INSERT [dbo].[Users] ([id_user], [full_name], [email], [phone], [id_role], [id_login]) VALUES (6, N'Игорь Новиков', N'novikov@mail.ru', N'+79166789012', 3, 6)
INSERT [dbo].[Users] ([id_user], [full_name], [email], [phone], [id_role], [id_login]) VALUES (7, N'Владимир Морозов', N'morozov@mail.ru', N'+79167890123', 2, 7)
INSERT [dbo].[Users] ([id_user], [full_name], [email], [phone], [id_role], [id_login]) VALUES (8, N'Евгений Волков', N'volkov@mail.ru', N'+79168901234', 3, 8)
INSERT [dbo].[Users] ([id_user], [full_name], [email], [phone], [id_role], [id_login]) VALUES (9, N'Андрей Зайцев', N'zaitsev@mail.ru', N'+79169012345', 3, 9)
INSERT [dbo].[Users] ([id_user], [full_name], [email], [phone], [id_role], [id_login]) VALUES (10, N'Елена Соколова', N'sokolova@mail.ru', N'+79160123456', 2, 10)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__failure___543C4FD913272BF2]    Script Date: 30.03.2026 20:22:47 ******/
ALTER TABLE [dbo].[Failure_types] ADD UNIQUE NONCLUSTERED 
(
	[type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__logins__7838F272E5348FCD]    Script Date: 30.03.2026 20:22:47 ******/
ALTER TABLE [dbo].[Logins] ADD UNIQUE NONCLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__requests__8EF03D9C61707B06]    Script Date: 30.03.2026 20:22:47 ******/
ALTER TABLE [dbo].[Requests] ADD UNIQUE NONCLUSTERED 
(
	[request_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__roles__783254B1954711AF]    Script Date: 30.03.2026 20:22:47 ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[role_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__statuses__501B37530DB0A407]    Script Date: 30.03.2026 20:22:47 ******/
ALTER TABLE [dbo].[Statuses] ADD UNIQUE NONCLUSTERED 
(
	[status_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__users__1DEA7BAC8ED40419]    Script Date: 30.03.2026 20:22:47 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[id_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [comment_date]
GO
ALTER TABLE [dbo].[Repair_actions] ADD  DEFAULT (getdate()) FOR [action_date]
GO
ALTER TABLE [dbo].[Requests] ADD  DEFAULT ((0)) FOR [client_agreement]
GO
ALTER TABLE [dbo].[Requests] ADD  DEFAULT ((0)) FOR [qr_code_generated]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([id_request])
REFERENCES [dbo].[Requests] ([id_request])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[Repair_actions]  WITH CHECK ADD FOREIGN KEY([additional_specialist_id])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[Repair_actions]  WITH CHECK ADD FOREIGN KEY([id_manager])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[Repair_actions]  WITH CHECK ADD FOREIGN KEY([id_request])
REFERENCES [dbo].[Requests] ([id_request])
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD FOREIGN KEY([assigned_to])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD FOREIGN KEY([id_client])
REFERENCES [dbo].[Clients] ([id_client])
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD FOREIGN KEY([id_equipment])
REFERENCES [dbo].[Equipment] ([id_equipment])
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD FOREIGN KEY([id_failure_type])
REFERENCES [dbo].[Failure_types] ([id_failure_type])
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD FOREIGN KEY([id_status])
REFERENCES [dbo].[Statuses] ([id_status])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([id_login])
REFERENCES [dbo].[Logins] ([id_login])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([id_role])
REFERENCES [dbo].[Roles] ([id_role])
GO
USE [master]
GO
ALTER DATABASE [PROIZVPR] SET  READ_WRITE 
GO
