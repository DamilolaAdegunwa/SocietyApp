--This is the script for generating the SocietyDB 15/11/2019 03:06 AM
create database [SocietyDB];
go
use [SocietyDB];

create table [SocietyDB].[dbo].[Company](
	[Id] [int] identity(1,1) primary key,
	[CompanyName] [varchar](100) not null,
	[CompanyAddress] [varchar](1000) not null,
	[AnnualRevenue] [decimal](10,6) not null,
	[StaffStrength] [int] not null,
	[LogoUrl] [varchar](max) not null,
	[FoundingDate] [datetime] not null,
);

create table [SocietyDB].[dbo].[Gender](
	[Id] [int] identity(1,1) primary key,
	[Gendertype] [varchar](10) not null,
);

set identity_insert [SocietyDB].[dbo].[Gender] on
go
insert into [SocietyDB].[dbo].[Gender] (Id,Gendertype) values (1,N'Male')
go
insert into [SocietyDB].[dbo].[Gender] (Id,Gendertype) values (2,N'Female')
go
set identity_insert [SocietyDB].[dbo].[Gender] off
go

create table [SocietyDB].[dbo].[Country](
	[Id] [int] identity(1,1) primary key,
	[CountryName] [varchar](max) not null,
	[PerCapitalIncome] [decimal](10,6),
	[Population] [int],
	[TotalLandMassInSquareKiloMeter] [decimal](10,6)
);
set identity_insert [SocietyDB].[dbo].[Country] on 
go
insert into [SocietyDB].[dbo].[Country] (Id, CountryName) values (1,N'America')
go
insert into [SocietyDB].[dbo].[Country] (Id, CountryName) values (2,N'Qatar')
go
insert into [SocietyDB].[dbo].[Country] (Id, CountryName) values (3,N'Saudi Arabia')
go
insert into [SocietyDB].[dbo].[Country] (Id, CountryName) values (4,N'Kuwait') 
go
insert into [SocietyDB].[dbo].[Country] (Id, CountryName) values (5,N'Norway') 
go
insert into [SocietyDB].[dbo].[Country] (Id, CountryName) values (6,N'Denmark') 
go
insert into [SocietyDB].[dbo].[Country] (Id, CountryName) values (7,N'Sweden')
go
insert into [SocietyDB].[dbo].[Country] (Id, CountryName) values (8,N'Swisserland')
go
insert into [SocietyDB].[dbo].[Country] (Id, CountryName) values (9,N'Japan') 
go
insert into [SocietyDB].[dbo].[Country] (Id, CountryName) values (10,N'China') 
go
insert into [SocietyDB].[dbo].[Country] (Id, CountryName) values (11,N'Luxemberg')
go
insert into [SocietyDB].[dbo].[Country] (Id, CountryName) values (12,N'South Korea')
go
insert into [SocietyDB].[dbo].[Country] (Id, CountryName) values (13,N'FinLand') 
go
insert into [SocietyDB].[dbo].[Country] (Id, CountryName) values (14,N'Austrialia') 
go
insert into [SocietyDB].[dbo].[Country] (Id, CountryName) values (15,N'Canada')
go
insert into [SocietyDB].[dbo].[Country] (Id, CountryName) values (16,N'Egypt')
go
insert into [SocietyDB].[dbo].[Country] (Id, CountryName) values (17,N'South Africa')
go

create table [SocietyDB].[dbo].[Person](
	[Id] [int] identity(1,1) primary key,
	[Fullname] [varchar](max) not null,
	[CompanyId] [int] not null,/*foreign key alert!!*/
	[DateOfBirth] [datetime] not null,
	[Email] [varchar](max),
	[PhoneNumber] [varchar](100) not null unique,
	[GenderId] [int] not null, /*foreign key alert!!*/
	[CountryId] [int] not null, /*foreign key alert!!*/
	[Address] [varchar](max) not null

	/*foreign key reference starts!!*/
	foreign key ([CompanyId]) references [SocietyDB].[dbo].[Company] ([Id]),
	foreign key ([GenderId]) references [SocietyDB].[dbo].[Gender] ([Id]),
	foreign key ([CountryId]) references [SocietyDB].[dbo].[Country] ([Id])
	/*foreign key reference ends!!*/
);



create table [SocietyDB].[dbo].[SuperMarket](
	[Id] [int] identity(1,1) primary key,
	[SuperMarketName] [varchar](1000) not null,
	[Location] [varchar](1000) not null,
);

create table [SocietyDB].[dbo].[Product](
	[Id] [int] identity(1,1) primary key,
	[ProductName] [varchar](1000) not null,
	[SuperMarketId] [int] not null, /*foreign key alert!!*/
	[PriceInDollars] [decimal](10,6) not null,
	[QuantityInStock] [int] not null,

	/*foreign key contraints*/
	foreign key ([SuperMarketId]) references [SocietyDB].[dbo].[SuperMarket] ([Id])
	/**/
);



create table [SocietyDB].[dbo].[Order](
	[Id] [int] identity(1,1) primary key,
	[ProductId] [int] not null,/*foreign key alert!!*/
	[Quantity] [int] not null,
	[OrderDate] [datetime] not null,
	
	/*foreign key contraints*/
	foreign key ([ProductId]) references [SocietyDB].[dbo].[Product] ([Id])
	/**/
);