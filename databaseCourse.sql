USE Curso

DROP TABLE Aluno

CREATE TABLE [Aluno] (
    [Id] INT NOT NULL,
    [Nome] NVARCHAR(80) NOT NULL,
    [Email] NVARCHAR(180) NOT NULL,
    [Nascimento] DATETIME NULL,    
    [Active] BIT DEFAULT(0) NOT NULL,

    CONSTRAINT [PK_Aluno] PRIMARY KEY([id]),
    CONSTRAINT [UQ_Aluno_Email] UNIQUE([Email]),
)
GO

CREATE INDEX [IX_Aluno_Email] ON [Aluno]([Email])

CREATE TABLE [Curso] (
    [Id] INT NOT NULL,
    [Nome] NVARCHAR(80) NOT NULL,
    [CategoriaId] INT NOT NULL,

    CONSTRAINT [PK_Curso] PRIMARY KEY([id]), 
    CONSTRAINT [FK_Curso_Categoria] FOREIGN KEY([CategoriaId])
        REFERENCES [Categoria]([Id])
)
GO 

CREATE TABLE [Categoria] (
    [Id] INT NOT NULL,
    [Nome] NVARCHAR(80) NOT NULL,

    CONSTRAINT PK_Categoria PRIMARY KEY([Id]),
)
GO


CREATE TABLE [ProgressoCurso] (
    [AlunoId] INT NOT NULL,
    [CursoId] INT NOT NULL,
    [Progresso] INT NOT NULL,
    [UltimaAtualizacao] DATETIME NOT NULL DEFAULT(GETDATE()),

    CONSTRAINT PK_ProgressoCurso PRIMARY KEY([AlunoId], [CursoId]),
)
GO

SELECT * FROM ProgressoCurso;

ALTER TABLE [Aluno] 
    ALTER COLUMN [Active] BIT NOT NULL