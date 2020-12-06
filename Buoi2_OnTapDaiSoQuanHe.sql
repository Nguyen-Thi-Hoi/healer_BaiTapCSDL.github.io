
USE master
GO

CREATE DATABASE b1_NHANVIEN
GO

USE b1_NHANVIEN
GO

CREATE TABLE NHANVIEN
(
   MaNV        VARCHAR(4) NOT NULL,
   TenNV       NVARCHAR(20),
   HoNV        NVARCHAR(20),
   NgSinh      DATE,
   DiaChi      NVARCHAR(20),
   Phai        NVARCHAR(4),
   Luong       FLOAT,
   Ma_NQL      VARCHAR(4),
   PHG         VARCHAR(4)

   CONSTRAINT PK_NHANVIEN  PRIMARY KEY (MaNV)

)
GO

CREATE TABLE PHONGBAN
(
   MaPhong     VARCHAR(4) NOT NULL,
   TenPhong    NVARCHAR(20),
   TrPHG       VARCHAR(4),
   NG_NhanChuc DATE

   CONSTRAINT PK_PHONGBAN PRIMARY KEY (MaPhong)
   
)
GO

CREATE TABLE DIADIEM_PHG
(
   MaPhong     VARCHAR(4) NOT NULL,
   DiaDiem     NVARCHAR(20) NOT NULL,

   CONSTRAINT PK_DIADIEM_PHG  PRIMARY KEY (MaPhong, DiaDiem)
)   
GO


CREATE TABLE THANNHAN
(
   Ma_NhanVien  VARCHAR(4)  NOT NULL,
   TenTN        NVARCHAR(20) NOT NULL,
   Phai         NVARCHAR(4),
   NgSinh       DATE,
   QuanHe       NVARCHAR(20)

   CONSTRAINT PK_THANNHAN  PRIMARY KEY (Ma_NhanVien , TenTN)
)
GO

CREATE TABLE DEAN
(
   MaDA       VARCHAR(4) NOT NULL,
   TenDA      NVARCHAR(20),
   DiaDiem_DA NVARCHAR(20),
   Phong      VARCHAR(4)

   CONSTRAINT PK_DEAN  PRIMARY KEY (MaDA)
  
)
GO

CREATE TABLE  PHANCONG
(
   Ma_NhanVien VARCHAR(4) NOT NULL,
   SoDA        VARCHAR(4) NOT NULL,
   ThoiGian    INT

   CONSTRAINT PK_PHANCONG PRIMARY KEY (Ma_NhanVien, SoDA)


)
GO

-- TẠO DỮ LIỆU --

-- BẢNG NHANVIEN --

INSERT INTO NHANVIEN
VALUES ('100', N'Thanh Bình', N'Nguyễn', '2000/01/01', N'Đà Nẵng', N'Nam',20000 , '100', '200' ),
       ('101', N'Hoài Chỉnh', N'Lê',     '1995/02/11', N'Đà Nẵng', N'Nam',30000 , '101', '201' ),
	   ('102', N'Hoài Duy',	  N'Trương', '1994/03/21', N'Đà Nẵng', N'Nam',40000 , '102', '202' ),
	   ('103', N'Thanh Hằng', N'Đào',    '1996/04/25', N'Đà Nẵng', N'Nữ', 50000 , '103', '203' ),
	   ('104', N'LyLy',       N'Huỳnh',  '1998/05/30', N'Đà Nẵng', N'Nữ', 60000 , '104', '204' )
GO

-- BẢNG PHONGBAN --

INSERT INTO PHONGBAN
VALUES ('200', N'Khách Hàng',        '100', '2020/01/15'),
       ('201', N'Nhân sự',           '101', '2018/11/15'),
	   ('202', N'Kế hoạch',          '102', '2019/02/24'),
	   ('203', N'Marketing',         '103', '2019/05/25'),
	   ('204', N'Kinh tế - Đầu tư ', '104', '2020/05/15')
GO

-- BẢNG DEAN --

INSERT INTO DEAN
VALUES ('300', N'Nghiên cứu hạt giống',     N'Hải Dương',	   '200'),
       ('301', N'Chế tạo máy nhặt rác',     N'Trường DHSPKT ', '201'),
	   ('302', N'Lập trình game ',			N'FPT',			   '202'),
	   ('303', N'Chế tạo máy hơi nước',		N'ĐH Lạc Hồng',	   '203'),
	   ('304', N'Lập trình Android',		N'FSoft',		   '204')

GO

-- BẢNG PHANCONG --

INSERT INTO PHANCONG
VALUES ('100', '300', 1),
       ('101', '301', 2),
	   ('102', '302', 3),
	   ('103', '303', 4),
       ('104', '304', 5)
GO


-- BẢNG DIADIEM_PHG --

INSERT INTO DIADIEM_PHG
VALUES ('200', 'Khu A'),
       ('201', 'Khu B'),
	   ('202', 'Khu C'),
	   ('203', 'Khu D'),
	   ('204', 'Khu E')
GO

-- BẢNG THANNHAN --

INSERT INTO THANNHAN
VALUES ('100', N'Ánh', N'Nữ',   '1997/03/13', N'Chị'),
       ('101', N'Bảo', N'Nam',  '1990/03/13', N'Anh'),
	   ('102', N'Duy', N'Nam',  '1991/03/13', N'Anh'),
	   ('103', N'Oanh', N'Nữ',  '2000/03/13', N'Em gái'),
	   ('104', N'Hưng', N'Nam', '1999/03/13', N'Chồng')
GO


-- TẠO KHÓA NGOẠI --

ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NHANVIEN FOREIGN KEY (Ma_NQL) REFERENCES NHANVIEN (MaNV)
GO

ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PC_NV FOREIGN KEY (Ma_NhanVien) REFERENCES NHANVIEN (MaNV)
GO

ALTER TABLE THANNHAN
ADD CONSTRAINT FK_TN_NHANVIEN FOREIGN KEY (Ma_NhanVien) REFERENCES NHANVIEN (MaNV)
GO

ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NV_PHONGBAN FOREIGN KEY (PHG) REFERENCES PHONGBAN (MaPhong)
GO

ALTER TABLE PHONGBAN
ADD CONSTRAINT FK_PB_NV FOREIGN KEY (TrPHG) REFERENCES NHANVIEN (MaNV)
GO

ALTER TABLE DIADIEM_PHG
ADD CONSTRAINT FK_DD_PHONGBAN FOREIGN KEY (MaPhong) REFERENCES PHONGBAN (MaPhong)
GO

ALTER TABLE DEAN
ADD CONSTRAINT FK_DEAN_PHONGBAN FOREIGN KEY (Phong) REFERENCES PHONGBAN (MaPhong)
GO

ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PC_DEAN FOREIGN KEY (SoDA) REFERENCES DEAN (MaDA)
GO


-- TRUY VẤN --
 /*Ví dụ 4  Cho biết mã nhân viên có tham gia đề án hoặc có thân nhân */

 -- CÁCH 1 --

( π                         ( NHANVIEN )   JOIN           ( PHANCONG ))
      MaNV
 ∪
( π                         ( NHANVIEN )   JOIN           ( THANNHAN ))
      MaNV
)

Hoặc π              (PHANCONG)   ∪      π                      (THANNHAN)
       Ma_NhanVien                               Ma_NhanVien

-- CÁCH 2 --

   SELECT Ma_NhanVien
   FROM   PHANCONG
   UNION ALL
   SELECT Ma_NhanVien
   FROM   THANNHAN
   GO


/* Ví dụ 5 Cho biết mã nhân viên có người thân và có tham gia đề án */

 π                   (PHANCONG)   ∩      π                      (THANNHAN)
       Ma_NhanVien                           Ma_NhanVien

-- Cách 2 --

   SELECT   Ma_NhanVien
   FROM     PHANCONG
   INTERSECT
   SELECT   Ma_NhanVien
   FROM     THANNHAN
   GO

/* Ví dụ 6 Cho biết mã nhân viên không có thân nhân nào */

( π                ( NHANVIEN )              
      MaNV
  -
( π                ( THANNHAN )
      MaNV

-- CÁCH 2 --

   SELECT MaNV
   FROM NHANVIEN
   EXCEPT
   SELECT Ma_NhanVien
   FROM   THANNHAN
   GO

   -- CÁCH 2.1 --

   SELECT MaNV
   FROM   NHANVIEN
          INNER JOIN THANNHAN ON NHANVIEN.MaNV = THANNHAN.Ma_NhanVien
   WHERE  NHANVIEN.MaNV NOT IN (SELECT Ma_NhanVien FROM THANNHAN WHERE Ma_NhanVien = THANNHAN.Ma_NhanVien)
   GO


	-- Câu 11 --
 /*Cho biết nhân viên có lương hơn lương của nhân viên ‘Tùng’
• Quan hệ: NHANVIEN
• Thuộc tính: LUONG */

 /* Ví dụ 12
• Với mỗi nhân viên, hãy cho biết thông tin của phòng
ban mà họ đang làm việc
• Quan hệ: NHANVIEN, PHONGBAN  */
   
  /* Ví dụ 13
• Với mỗi phòng ban hãy cho biết các địa điểm của
phòng ban đó
• Quan hệ: PHONGBAN, DDIEM_PHG */

SELECT * FROM PHANCONG
GO

SELECT * FROM DEAN
GO

USE NHANVIEN
GO

--1--
Select A.MaNV, count (A.mada)	
From PHANCONG A
Group by A.MaNV
	Having count (A.Mada)=(Select count(distinct B.mada) from phancong B)

SELECT 	
--2--	
CREATE VIEW tongdetai AS
	SELECT COUNT(MADA) AS tongDeAn FROM dbo.DEAN
	CREATE VIEW detainhanvien AS
	SELECT DISTINCT MA_NVIEN , COUNT(SODA) AS SoDeAN FROM dbo.PHANCONG GROUP BY MA_NVIEN
	SELECT MA_NVIEN FROM tongdetai, detainhanvien WHERE SoDeAN =tongDeAn
	
	
	
	
--3--	
Select A.MaNV, count (A.mada)

	
From PHANCONG A

	
Group by A.MaNV

	Having count (A.Mada)=(Select count(distinct B.mada) from phancong B)
	
-- 4 --	
SELECT DISTINCT MA_NVIEN FROM dbo.PHANCONG
	WHERE EXISTS (
	    SELECT MA_NVIEN , COUNT(SODA) AS SoDeAN FROM dbo.PHANCONG DaAnNV
	    WHERE PHANCONG.MA_NVIEN = DaAnNV.MA_NVIEN GROUP BY MA_NVIEN
	    HAVING COUNT(SODA)
	    IN (SELECT COUNT(MADA) AS SoDeAN FROM dbo.DEAN TongDaAn))