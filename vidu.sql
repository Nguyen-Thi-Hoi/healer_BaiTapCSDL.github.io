USE master
GO

CREATE DATABASE ViDu
go

USE ViDu
GO

CREATE TABLE SinhVien
(  

    MaSV VARCHAR(3) NOT NULL,
    TenSV  VARCHAR(50)
    
    CONSTRAINT PK_SinhVien PRIMARY KEY ( MaSV)
)
GO

CREATE TABLE BangDiem
(  

    MaSV VARCHAR(3) ,
    MaMH  VARCHAR (4),
    Diem VARCHAR(3)
   
)
GO

INSERT INTO SinhVien VALUES ('SV1', 'T1')
INSERT INTO SinhVien VALUES ('SV2', 'T2')
INSERT INTO SinhVien VALUES ('SV3', 'T3')
INSERT INTO SinhVien VALUES ('SV4', 'T4')
GO


INSERT INTO BangDiem VALUES ('SV1', 'A', '1')
INSERT INTO BangDiem VALUES ('SV1', 'B', '2')
INSERT INTO BangDiem VALUES ('SV1', 'C', '3')
INSERT INTO BangDiem VALUES ('SV2', 'A', '8')
INSERT INTO BangDiem VALUES ('SV2', 'C', '4')
INSERT INTO BangDiem VALUES ('SV3', 'B', '7')
GO

SELECT SinhVien.MaSV, TenSV, MaMH, Diem
FROM SinhVien
     FULL OUTER JOIN BangDiem ON SinhVien.MaSV = BangDiem.MaSV
GO
