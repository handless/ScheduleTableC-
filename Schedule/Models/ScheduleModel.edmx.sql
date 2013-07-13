
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 07/12/2013 13:17:35
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

-- Creating table 'Paras'
CREATE TABLE [dbo].[Paras] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PrepodId] int  NOT NULL,
    [Auditoria_Id] int  NOT NULL,
    [Time_Id] int  NOT NULL,
    [Den_Id] int  NOT NULL
);
GO

-- Creating table 'Auditorias'
CREATE TABLE [dbo].[Auditorias] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Times'
CREATE TABLE [dbo].[Times] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Groups'
CREATE TABLE [dbo].[Groups] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Prepods'
CREATE TABLE [dbo].[Prepods] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Dens'
CREATE TABLE [dbo].[Dens] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Predmets'
CREATE TABLE [dbo].[Predmets] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Students'
CREATE TABLE [dbo].[Students] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [GroupId] int  NOT NULL
);
GO

-- Creating table 'ParaGroup'
CREATE TABLE [dbo].[ParaGroup] (
    [Paras_Id] int  NOT NULL,
    [Groups_Id] int  NOT NULL
);
GO

-- Creating table 'PredmetPrepod'
CREATE TABLE [dbo].[PredmetPrepod] (
    [Predmets_Id] int  NOT NULL,
    [Prepods_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Paras'
ALTER TABLE [dbo].[Paras]
ADD CONSTRAINT [PK_Paras]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Auditorias'
ALTER TABLE [dbo].[Auditorias]
ADD CONSTRAINT [PK_Auditorias]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Times'
ALTER TABLE [dbo].[Times]
ADD CONSTRAINT [PK_Times]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Groups'
ALTER TABLE [dbo].[Groups]
ADD CONSTRAINT [PK_Groups]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Prepods'
ALTER TABLE [dbo].[Prepods]
ADD CONSTRAINT [PK_Prepods]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Dens'
ALTER TABLE [dbo].[Dens]
ADD CONSTRAINT [PK_Dens]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Predmets'
ALTER TABLE [dbo].[Predmets]
ADD CONSTRAINT [PK_Predmets]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [PK_Students]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Paras_Id], [Groups_Id] in table 'ParaGroup'
ALTER TABLE [dbo].[ParaGroup]
ADD CONSTRAINT [PK_ParaGroup]
    PRIMARY KEY NONCLUSTERED ([Paras_Id], [Groups_Id] ASC);
GO

-- Creating primary key on [Predmets_Id], [Prepods_Id] in table 'PredmetPrepod'
ALTER TABLE [dbo].[PredmetPrepod]
ADD CONSTRAINT [PK_PredmetPrepod]
    PRIMARY KEY NONCLUSTERED ([Predmets_Id], [Prepods_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Auditoria_Id] in table 'Paras'
ALTER TABLE [dbo].[Paras]
ADD CONSTRAINT [FK_ParaAuditoria]
    FOREIGN KEY ([Auditoria_Id])
    REFERENCES [dbo].[Auditorias]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ParaAuditoria'
CREATE INDEX [IX_FK_ParaAuditoria]
ON [dbo].[Paras]
    ([Auditoria_Id]);
GO

-- Creating foreign key on [Time_Id] in table 'Paras'
ALTER TABLE [dbo].[Paras]
ADD CONSTRAINT [FK_ParaTime]
    FOREIGN KEY ([Time_Id])
    REFERENCES [dbo].[Times]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ParaTime'
CREATE INDEX [IX_FK_ParaTime]
ON [dbo].[Paras]
    ([Time_Id]);
GO

-- Creating foreign key on [Paras_Id] in table 'ParaGroup'
ALTER TABLE [dbo].[ParaGroup]
ADD CONSTRAINT [FK_ParaGroup_Para]
    FOREIGN KEY ([Paras_Id])
    REFERENCES [dbo].[Paras]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Groups_Id] in table 'ParaGroup'
ALTER TABLE [dbo].[ParaGroup]
ADD CONSTRAINT [FK_ParaGroup_Group]
    FOREIGN KEY ([Groups_Id])
    REFERENCES [dbo].[Groups]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ParaGroup_Group'
CREATE INDEX [IX_FK_ParaGroup_Group]
ON [dbo].[ParaGroup]
    ([Groups_Id]);
GO

-- Creating foreign key on [PrepodId] in table 'Paras'
ALTER TABLE [dbo].[Paras]
ADD CONSTRAINT [FK_PrepodPara]
    FOREIGN KEY ([PrepodId])
    REFERENCES [dbo].[Prepods]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PrepodPara'
CREATE INDEX [IX_FK_PrepodPara]
ON [dbo].[Paras]
    ([PrepodId]);
GO

-- Creating foreign key on [Den_Id] in table 'Paras'
ALTER TABLE [dbo].[Paras]
ADD CONSTRAINT [FK_ParaDen]
    FOREIGN KEY ([Den_Id])
    REFERENCES [dbo].[Dens]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ParaDen'
CREATE INDEX [IX_FK_ParaDen]
ON [dbo].[Paras]
    ([Den_Id]);
GO

-- Creating foreign key on [GroupId] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [FK_GroupStudent]
    FOREIGN KEY ([GroupId])
    REFERENCES [dbo].[Groups]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GroupStudent'
CREATE INDEX [IX_FK_GroupStudent]
ON [dbo].[Students]
    ([GroupId]);
GO

-- Creating foreign key on [Predmets_Id] in table 'PredmetPrepod'
ALTER TABLE [dbo].[PredmetPrepod]
ADD CONSTRAINT [FK_PredmetPrepod_Predmet]
    FOREIGN KEY ([Predmets_Id])
    REFERENCES [dbo].[Predmets]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Prepods_Id] in table 'PredmetPrepod'
ALTER TABLE [dbo].[PredmetPrepod]
ADD CONSTRAINT [FK_PredmetPrepod_Prepod]
    FOREIGN KEY ([Prepods_Id])
    REFERENCES [dbo].[Prepods]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PredmetPrepod_Prepod'
CREATE INDEX [IX_FK_PredmetPrepod_Prepod]
ON [dbo].[PredmetPrepod]
    ([Prepods_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------