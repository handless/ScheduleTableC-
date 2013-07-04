
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 07/04/2013 15:18:56
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


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


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
    [Name] nvarchar(max)  NOT NULL
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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------