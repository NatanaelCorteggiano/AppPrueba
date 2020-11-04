IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

CREATE TABLE [Paises] (
    [Id] int NOT NULL IDENTITY,
    [Nombre] nvarchar(max) NULL,
    CONSTRAINT [PK_Paises] PRIMARY KEY ([Id])
);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20201026202359_Inicial', N'2.1.14-servicing-32113');

GO


CREATE TABLE [Provincias] (
    [Id] int NOT NULL IDENTITY,
    [Nombre] nvarchar(max) NULL,
    [PaisId] int NOT NULL,
    CONSTRAINT [PK_Provincias] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Provincias_Paises_PaisId] FOREIGN KEY ([PaisId]) REFERENCES [Paises] ([Id]) ON DELETE CASCADE
);

GO

CREATE INDEX [IX_Provincias_PaisId] ON [Provincias] ([PaisId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20201027145355_Provincias', N'2.1.14-servicing-32113');

GO


CREATE TABLE [Ciudad] (
    [Id] int NOT NULL IDENTITY,
    [Nombre] nvarchar(max) NULL,
    [ProvinciaId] int NOT NULL,
    CONSTRAINT [PK_Ciudad] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Ciudad_Provincias_ProvinciaId] FOREIGN KEY ([ProvinciaId]) REFERENCES [Provincias] ([Id]) ON DELETE CASCADE
);

GO

CREATE INDEX [IX_Ciudad_ProvinciaId] ON [Ciudad] ([ProvinciaId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20201027150424_Ciudades', N'2.1.14-servicing-32113');

GO
