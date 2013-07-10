
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 07/08/2013 15:24:40
-- Generated from EDMX file: C:\Users\handless\Documents\GitHub\ScheduleTableC-\Schedule\Models\ScheduleModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [schedule];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_StudentGroup]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Students] DROP CONSTRAINT [FK_StudentGroup];
GO
IF OBJECT_ID(N'[dbo].[FK_GroupSubject_Group]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[GroupSubject] DROP CONSTRAINT [FK_GroupSubject_Group];
GO
IF OBJECT_ID(N'[dbo].[FK_GroupSubject_Subject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[GroupSubject] DROP CONSTRAINT [FK_GroupSubject_Subject];
GO
IF OBJECT_ID(N'[dbo].[FK_TeacherSubject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Subjects] DROP CONSTRAINT [FK_TeacherSubject];
GO
IF OBJECT_ID(N'[dbo].[FK_DaySubject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Subjects] DROP CONSTRAINT [FK_DaySubject];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Students]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Students];
GO
IF OBJECT_ID(N'[dbo].[Groups]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Groups];
GO
IF OBJECT_ID(N'[dbo].[Subjects]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Subjects];
GO
IF OBJECT_ID(N'[dbo].[Teachers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Teachers];
GO
IF OBJECT_ID(N'[dbo].[DaySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DaySet];
GO
IF OBJECT_ID(N'[dbo].[GroupSubject]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GroupSubject];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Students'
CREATE TABLE [dbo].[Students] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [GroupId] int  NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Groups'
CREATE TABLE [dbo].[Groups] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Subjects'
CREATE TABLE [dbo].[Subjects] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TeacherId] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [DayId] int  NOT NULL
);
GO

-- Creating table 'Teachers'
CREATE TABLE [dbo].[Teachers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Hours] int  NOT NULL
);
GO

-- Creating table 'DaySet'
CREATE TABLE [dbo].[DaySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DayName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'GroupSubject'
CREATE TABLE [dbo].[GroupSubject] (
    [Group_Id] int  NOT NULL,
    [Subject_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [PK_Students]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Groups'
ALTER TABLE [dbo].[Groups]
ADD CONSTRAINT [PK_Groups]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Subjects'
ALTER TABLE [dbo].[Subjects]
ADD CONSTRAINT [PK_Subjects]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Teachers'
ALTER TABLE [dbo].[Teachers]
ADD CONSTRAINT [PK_Teachers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DaySet'
ALTER TABLE [dbo].[DaySet]
ADD CONSTRAINT [PK_DaySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Group_Id], [Subject_Id] in table 'GroupSubject'
ALTER TABLE [dbo].[GroupSubject]
ADD CONSTRAINT [PK_GroupSubject]
    PRIMARY KEY NONCLUSTERED ([Group_Id], [Subject_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [GroupId] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [FK_StudentGroup]
    FOREIGN KEY ([GroupId])
    REFERENCES [dbo].[Groups]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentGroup'
CREATE INDEX [IX_FK_StudentGroup]
ON [dbo].[Students]
    ([GroupId]);
GO

-- Creating foreign key on [Group_Id] in table 'GroupSubject'
ALTER TABLE [dbo].[GroupSubject]
ADD CONSTRAINT [FK_GroupSubject_Group]
    FOREIGN KEY ([Group_Id])
    REFERENCES [dbo].[Groups]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Subject_Id] in table 'GroupSubject'
ALTER TABLE [dbo].[GroupSubject]
ADD CONSTRAINT [FK_GroupSubject_Subject]
    FOREIGN KEY ([Subject_Id])
    REFERENCES [dbo].[Subjects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GroupSubject_Subject'
CREATE INDEX [IX_FK_GroupSubject_Subject]
ON [dbo].[GroupSubject]
    ([Subject_Id]);
GO

-- Creating foreign key on [TeacherId] in table 'Subjects'
ALTER TABLE [dbo].[Subjects]
ADD CONSTRAINT [FK_TeacherSubject]
    FOREIGN KEY ([TeacherId])
    REFERENCES [dbo].[Teachers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TeacherSubject'
CREATE INDEX [IX_FK_TeacherSubject]
ON [dbo].[Subjects]
    ([TeacherId]);
GO

-- Creating foreign key on [DayId] in table 'Subjects'
ALTER TABLE [dbo].[Subjects]
ADD CONSTRAINT [FK_DaySubject]
    FOREIGN KEY ([DayId])
    REFERENCES [dbo].[DaySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DaySubject'
CREATE INDEX [IX_FK_DaySubject]
ON [dbo].[Subjects]
    ([DayId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------