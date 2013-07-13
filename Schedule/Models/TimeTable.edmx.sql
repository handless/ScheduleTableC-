
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 07/12/2013 16:33:09
-- Generated from EDMX file: C:\Users\handless\Documents\GitHub\ScheduleTableC-\Schedule\Models\TimeTable.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [TimeTable];
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

-- Creating table 'LessonSet'
CREATE TABLE [dbo].[LessonSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TeacherId] int  NOT NULL,
    [Classroom_Id] int  NOT NULL,
    [Day_Id] int  NOT NULL,
    [Time_Id] int  NOT NULL
);
GO

-- Creating table 'ClassroomSet'
CREATE TABLE [dbo].[ClassroomSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'TimeSet'
CREATE TABLE [dbo].[TimeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [InTime] datetime  NOT NULL
);
GO

-- Creating table 'GroupSet'
CREATE TABLE [dbo].[GroupSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'TeacherSet'
CREATE TABLE [dbo].[TeacherSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'DaySet'
CREATE TABLE [dbo].[DaySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'StudentSet'
CREATE TABLE [dbo].[StudentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [GroupId] int  NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SubjectSet'
CREATE TABLE [dbo].[SubjectSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'LessonGroup'
CREATE TABLE [dbo].[LessonGroup] (
    [Lesson_Id] int  NOT NULL,
    [Group_Id] int  NOT NULL
);
GO

-- Creating table 'TeacherSubject'
CREATE TABLE [dbo].[TeacherSubject] (
    [Teacher_Id] int  NOT NULL,
    [Subject_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'LessonSet'
ALTER TABLE [dbo].[LessonSet]
ADD CONSTRAINT [PK_LessonSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ClassroomSet'
ALTER TABLE [dbo].[ClassroomSet]
ADD CONSTRAINT [PK_ClassroomSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TimeSet'
ALTER TABLE [dbo].[TimeSet]
ADD CONSTRAINT [PK_TimeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'GroupSet'
ALTER TABLE [dbo].[GroupSet]
ADD CONSTRAINT [PK_GroupSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TeacherSet'
ALTER TABLE [dbo].[TeacherSet]
ADD CONSTRAINT [PK_TeacherSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DaySet'
ALTER TABLE [dbo].[DaySet]
ADD CONSTRAINT [PK_DaySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StudentSet'
ALTER TABLE [dbo].[StudentSet]
ADD CONSTRAINT [PK_StudentSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SubjectSet'
ALTER TABLE [dbo].[SubjectSet]
ADD CONSTRAINT [PK_SubjectSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Lesson_Id], [Group_Id] in table 'LessonGroup'
ALTER TABLE [dbo].[LessonGroup]
ADD CONSTRAINT [PK_LessonGroup]
    PRIMARY KEY NONCLUSTERED ([Lesson_Id], [Group_Id] ASC);
GO

-- Creating primary key on [Teacher_Id], [Subject_Id] in table 'TeacherSubject'
ALTER TABLE [dbo].[TeacherSubject]
ADD CONSTRAINT [PK_TeacherSubject]
    PRIMARY KEY NONCLUSTERED ([Teacher_Id], [Subject_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Classroom_Id] in table 'LessonSet'
ALTER TABLE [dbo].[LessonSet]
ADD CONSTRAINT [FK_LessonClassroom]
    FOREIGN KEY ([Classroom_Id])
    REFERENCES [dbo].[ClassroomSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LessonClassroom'
CREATE INDEX [IX_FK_LessonClassroom]
ON [dbo].[LessonSet]
    ([Classroom_Id]);
GO

-- Creating foreign key on [Day_Id] in table 'LessonSet'
ALTER TABLE [dbo].[LessonSet]
ADD CONSTRAINT [FK_LessonDay]
    FOREIGN KEY ([Day_Id])
    REFERENCES [dbo].[DaySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LessonDay'
CREATE INDEX [IX_FK_LessonDay]
ON [dbo].[LessonSet]
    ([Day_Id]);
GO

-- Creating foreign key on [Time_Id] in table 'LessonSet'
ALTER TABLE [dbo].[LessonSet]
ADD CONSTRAINT [FK_LessonTime]
    FOREIGN KEY ([Time_Id])
    REFERENCES [dbo].[TimeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LessonTime'
CREATE INDEX [IX_FK_LessonTime]
ON [dbo].[LessonSet]
    ([Time_Id]);
GO

-- Creating foreign key on [Lesson_Id] in table 'LessonGroup'
ALTER TABLE [dbo].[LessonGroup]
ADD CONSTRAINT [FK_LessonGroup_Lesson]
    FOREIGN KEY ([Lesson_Id])
    REFERENCES [dbo].[LessonSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Group_Id] in table 'LessonGroup'
ALTER TABLE [dbo].[LessonGroup]
ADD CONSTRAINT [FK_LessonGroup_Group]
    FOREIGN KEY ([Group_Id])
    REFERENCES [dbo].[GroupSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LessonGroup_Group'
CREATE INDEX [IX_FK_LessonGroup_Group]
ON [dbo].[LessonGroup]
    ([Group_Id]);
GO

-- Creating foreign key on [TeacherId] in table 'LessonSet'
ALTER TABLE [dbo].[LessonSet]
ADD CONSTRAINT [FK_TeacherLesson]
    FOREIGN KEY ([TeacherId])
    REFERENCES [dbo].[TeacherSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TeacherLesson'
CREATE INDEX [IX_FK_TeacherLesson]
ON [dbo].[LessonSet]
    ([TeacherId]);
GO

-- Creating foreign key on [GroupId] in table 'StudentSet'
ALTER TABLE [dbo].[StudentSet]
ADD CONSTRAINT [FK_GroupStudent]
    FOREIGN KEY ([GroupId])
    REFERENCES [dbo].[GroupSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GroupStudent'
CREATE INDEX [IX_FK_GroupStudent]
ON [dbo].[StudentSet]
    ([GroupId]);
GO

-- Creating foreign key on [Teacher_Id] in table 'TeacherSubject'
ALTER TABLE [dbo].[TeacherSubject]
ADD CONSTRAINT [FK_TeacherSubject_Teacher]
    FOREIGN KEY ([Teacher_Id])
    REFERENCES [dbo].[TeacherSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Subject_Id] in table 'TeacherSubject'
ALTER TABLE [dbo].[TeacherSubject]
ADD CONSTRAINT [FK_TeacherSubject_Subject]
    FOREIGN KEY ([Subject_Id])
    REFERENCES [dbo].[SubjectSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TeacherSubject_Subject'
CREATE INDEX [IX_FK_TeacherSubject_Subject]
ON [dbo].[TeacherSubject]
    ([Subject_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------