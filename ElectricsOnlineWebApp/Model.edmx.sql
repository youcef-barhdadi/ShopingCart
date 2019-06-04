
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/04/2019 12:36:27
-- Generated from EDMX file: C:\Users\ycf\Downloads\Compressed\Simple-.NET-MVC-5-Shopping-Cart-master\ElectricsOnlineWebApp\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-ElectricsOnlineWebApp-20161217010536];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Order_Products_Orders]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order_Products] DROP CONSTRAINT [FK_Order_Products_Orders];
GO
IF OBJECT_ID(N'[dbo].[FK_Order_Products_Products]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order_Products] DROP CONSTRAINT [FK_Order_Products_Products];
GO
IF OBJECT_ID(N'[dbo].[FK_Orders_Customers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_Orders_Customers];
GO
IF OBJECT_ID(N'[dbo].[FK_Products_Suppliers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Products_Suppliers];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[Order_Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order_Products];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[ShoppingCartData]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ShoppingCartData];
GO
IF OBJECT_ID(N'[dbo].[Suppliers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Suppliers];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CID] int IDENTITY(1,1) NOT NULL,
    [FName] varchar(50)  NOT NULL,
    [LName] varchar(50)  NOT NULL,
    [Phone] varchar(50)  NOT NULL,
    [Address1] varchar(50)  NOT NULL,
    [Address2] varchar(50)  NULL,
    [Suburb] varchar(50)  NOT NULL,
    [Postcode] varchar(50)  NOT NULL,
    [State] varchar(50)  NOT NULL,
    [Ctype] varchar(50)  NOT NULL,
    [CardNo] varchar(50)  NOT NULL,
    [ExpDate] datetime  NOT NULL,
    [Email] varchar(50)  NOT NULL
);
GO

-- Creating table 'Order_Products'
CREATE TABLE [dbo].[Order_Products] (
    [OrderID] int  NOT NULL,
    [PID] int  NOT NULL,
    [Qty] int  NOT NULL,
    [TotalSale] decimal(19,4)  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [OrderID] int IDENTITY(1,1) NOT NULL,
    [OrderDate] datetime  NOT NULL,
    [DeliveryDate] datetime  NOT NULL,
    [CID] int  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [PID] int IDENTITY(1,1) NOT NULL,
    [PName] varchar(50)  NOT NULL,
    [Brand] varchar(50)  NOT NULL,
    [UnitPrice] decimal(19,4)  NOT NULL,
    [UnitsInStock] int  NOT NULL,
    [Category] varchar(50)  NOT NULL,
    [Description] varchar(50)  NOT NULL,
    [SID] int  NOT NULL,
    [ROL] int  NOT NULL
);
GO

-- Creating table 'ShoppingCartDatas'
CREATE TABLE [dbo].[ShoppingCartDatas] (
    [TempOrderID] int IDENTITY(1,1) NOT NULL,
    [PID] int  NOT NULL,
    [PName] varchar(50)  NOT NULL,
    [UnitPrice] decimal(19,4)  NOT NULL,
    [Quantity] int  NOT NULL
);
GO

-- Creating table 'Suppliers'
CREATE TABLE [dbo].[Suppliers] (
    [SID] int IDENTITY(1,1) NOT NULL,
    [SName] varchar(50)  NOT NULL,
    [Phone] varchar(50)  NOT NULL,
    [Email] varchar(50)  NOT NULL,
    [Address1] varchar(50)  NOT NULL,
    [Address2] varchar(50)  NULL,
    [Suburb] varchar(50)  NOT NULL,
    [State] varchar(50)  NOT NULL,
    [Postcode] varchar(50)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CID] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CID] ASC);
GO

-- Creating primary key on [OrderID], [PID] in table 'Order_Products'
ALTER TABLE [dbo].[Order_Products]
ADD CONSTRAINT [PK_Order_Products]
    PRIMARY KEY CLUSTERED ([OrderID], [PID] ASC);
GO

-- Creating primary key on [OrderID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([OrderID] ASC);
GO

-- Creating primary key on [PID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([PID] ASC);
GO

-- Creating primary key on [TempOrderID] in table 'ShoppingCartDatas'
ALTER TABLE [dbo].[ShoppingCartDatas]
ADD CONSTRAINT [PK_ShoppingCartDatas]
    PRIMARY KEY CLUSTERED ([TempOrderID] ASC);
GO

-- Creating primary key on [SID] in table 'Suppliers'
ALTER TABLE [dbo].[Suppliers]
ADD CONSTRAINT [PK_Suppliers]
    PRIMARY KEY CLUSTERED ([SID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_Orders_Customers]
    FOREIGN KEY ([CID])
    REFERENCES [dbo].[Customers]
        ([CID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Orders_Customers'
CREATE INDEX [IX_FK_Orders_Customers]
ON [dbo].[Orders]
    ([CID]);
GO

-- Creating foreign key on [OrderID] in table 'Order_Products'
ALTER TABLE [dbo].[Order_Products]
ADD CONSTRAINT [FK_Order_Products_Orders]
    FOREIGN KEY ([OrderID])
    REFERENCES [dbo].[Orders]
        ([OrderID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PID] in table 'Order_Products'
ALTER TABLE [dbo].[Order_Products]
ADD CONSTRAINT [FK_Order_Products_Products]
    FOREIGN KEY ([PID])
    REFERENCES [dbo].[Products]
        ([PID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Order_Products_Products'
CREATE INDEX [IX_FK_Order_Products_Products]
ON [dbo].[Order_Products]
    ([PID]);
GO

-- Creating foreign key on [SID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_Products_Suppliers]
    FOREIGN KEY ([SID])
    REFERENCES [dbo].[Suppliers]
        ([SID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Products_Suppliers'
CREATE INDEX [IX_FK_Products_Suppliers]
ON [dbo].[Products]
    ([SID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------