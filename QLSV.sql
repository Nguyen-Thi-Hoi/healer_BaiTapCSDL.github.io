﻿USE MASTER
GO

CREATE DATABASE QLSV
GO

USE QLSV
GO

-- Tao bang va khoa chinh --

CREATE TABLE DMKHOA
(
    MAKHOA     VARCHAR ( 5) NOT NULL ,
	TENKHOA    NVARCHAR ( 50)

	CONSTRAINT PK_DMKHOA PRIMARY KEY (MAKHOA),
)
GO

CREATE TABLE DMNGANH
(
   MANGANH       VARCHAR ( 7) NOT NULL ,
   TENNGANH      NVARCHAR (50),
   MAKHOA        VARCHAR (5)

   CONSTRAINT PK_DMNGANH PRIMARY KEY (MANGANH ),

)
GO

CREATE TABLE DMLOP
(
   MALOP           VARCHAR (5) NOT NULL ,
   TENLOP          NVARCHAR (50),
   MANGANH         VARCHAR (7),
   KHOAHOC         VARCHAR (3),
   HEDT            VARCHAR (3),
   NAMNHAPHOC      INT

   CONSTRAINT PK_DMLOP PRIMARY KEY ( MALOP ),

)
GO

CREATE TABLE DMHOCPHAN
(
    MAHP           VARCHAR (4) NOT NULL ,
	TENHP          NVARCHAR (50),
	SODVHT         VARCHAR (2),
	MANGANH        VARCHAR (7),
	HOCKY          VARCHAR (2)

    CONSTRAINT PK_DMHOCPHAN PRIMARY KEY (MAHP),
)
GO

CREATE TABLE DIEMHP
(
   MASV            VARCHAR (4) NOT NULL ,
   MAHP            VARCHAR (4) NOT NULL ,
   DIEMHP          FLOAT

   CONSTRAINT PK_DIEMHP PRIMARY KEY (MASV, MAHP ),

)
GO

CREATE TABLE SINHVIEN
(
    MASV          VARCHAR (4) NOT NULL ,
	HOTEN         NVARCHAR (50),
	MALOP         VARCHAR (5),
	GIOITINH      VARCHAR (6),
	NGAYSINH      DATE,
	DIACHI        NVARCHAR (50)

	CONSTRAINT PK_SINHVIEN PRIMARY KEY (MASV ),
)
GO

-- Tạo ràng buộc miền giá trị  CHECK cho bảng sinh viên - GIOITINH --

ALTER TABLE SINHVIEN
ADD CONSTRAINT CK_SV_GIOITINH CHECK ( GIOITINH IN (N'False',  N'True'));
GO


--  Tạo khóa ngoại --

ALTER TABLE DMNGANH -- 
ADD CONSTRAINT FK_KHOA_DMNGANH FOREIGN KEY ( MAKHOA ) REFERENCES DMKHOA ( MAKHOA );
GO

ALTER TABLE DMLOP
ADD CONSTRAINT FK_NGANH_DMLOP FOREIGN KEY ( MANGANH ) REFERENCES DMNGANH ( MANGANH );
GO

ALTER TABLE SINHVIEN -- 
ADD CONSTRAINT FK_LOP_SINHVIEN FOREIGN KEY ( MALOP ) REFERENCES DMLOP ( MALOP );
GO

ALTER TABLE DIEMHP
ADD CONSTRAINT FK_SV_DIEMHP FOREIGN KEY ( MASV ) REFERENCES SINHVIEN ( MASV );
GO

ALTER TABLE DIEMHP
ADD CONSTRAINT FK_DHP_DIEMHP FOREIGN KEY ( MAHP ) REFERENCES DMHOCPHAN ( MAHP );
GO

-- Tạo dữ liệu cho bảng DMKHOA --

INSERT INTO DMKHOA (MAKHOA, TENKHOA)
VALUES             (N'CNTT', N' Công nghệ thông tin')

INSERT INTO DMKHOA ( MAKHOA, TENKHOA)
VALUES             ( N'KT', N'Kế Toán')

INSERT INTO DMKHOA ( MAKHOA, TENKHOA)
VALUES             ( N'SP', N'Sư Phạm ');
GO



-- Tạo dữ liệu cho bảng danh mục ngành -- 

INSERT INTO DMNGANH ( MANGANH, TENNGANH, MAKHOA)
VALUES ('140902', N' Sư Phạm Toán Tin', N'SP')

INSERT INTO DMNGANH (MANGANH, TENNGANH, MAKHOA)
VALUES ('480202', N' Tin học ứng dụng', N'CNTT');
GO


-- Tạo dữ liệu bảng DMLOP --

INSERT INTO DMLOP ( MALOP, TENLOP, MANGANH, KHOAHOC, HEDT, NAMNHAPHOC)
VALUES ( N'CT11', N'Cao đẳng tin học', '480202', '11', 'TC', 2013)

INSERT INTO DMLOP ( MALOP, TENLOP, MANGANH, KHOAHOC, HEDT, NAMNHAPHOC)
VALUES ( N'CT12', N'Cao đẳng tin học', '480202', '12', 'CĐ', 2013)

INSERT INTO DMLOP ( MALOP, TENLOP, MANGANH, KHOAHOC, HEDT, NAMNHAPHOC)
VALUES ( N'CT13', N'Cao đẳng tin học', '480202', '13', 'CĐ', 2014);
GO

-- Tạo dữ liệu bảng SINHVIEN --

INSERT INTO SINHVIEN ( MASV, HOTEN, MALOP, GIOITINH, NGAYSINH, DIACHI)
VALUES ( '001', N' Phan Thanh', N'CT12 ', N'False ', ' 1990/12/09 ', N' Tuy Phuoc ')

INSERT INTO SINHVIEN ( MASV, HOTEN, MALOP, GIOITINH, NGAYSINH, DIACHI)
VALUES ( '002', N' Nguyễn Thị Cẩm...', N'CT12 ', N'True ', ' 1994/12/01 ', N' Quy Nhơn ')

INSERT INTO SINHVIEN ( MASV, HOTEN, MALOP, GIOITINH, NGAYSINH, DIACHI)
VALUES ( '003', N' Võ Thị Hà', N'CT12 ', N'True ', ' 1995/02/07', N' An Nhơn ')

INSERT INTO SINHVIEN ( MASV, HOTEN, MALOP, GIOITINH, NGAYSINH, DIACHI)
VALUES ( '004', N' Trần Hoài Nam ', N'CT12 ', N'False ', ' 1994/05/04 ', N' Tây Sơn ')

-- 1 KHÓA CHÍNH KẾT HỢP BỞI 2 THUỘC TÍNH -- 
INSERT INTO SINHVIEN ( MASV, HOTEN, MALOP, GIOITINH, NGAYSINH, DIACHI)
VALUES ( '005', N' Trần Văn Hoàng', N'CT13 ', N'False ', ' 1995/04/08 ', N' Vĩnh Thạnh ')

INSERT INTO SINHVIEN ( MASV, HOTEN, MALOP, GIOITINH, NGAYSINH, DIACHI)
VALUES ( '006', N'Đặng Thị Thảo', N'CT13  ', N'True', ' 1995/12/06 ', N' Quy Nhơn ')

INSERT INTO SINHVIEN ( MASV, HOTEN, MALOP, GIOITINH, NGAYSINH, DIACHI)
VALUES ( '007', N' Lê Thị Sen ', N'CT13 ', N'True ', '1994/12/08 ', N' Phù Cát ')

INSERT INTO SINHVIEN ( MASV, HOTEN, MALOP, GIOITINH, NGAYSINH, DIACHI)
VALUES ( '008', N' Nguyễn Văn Huy ', N'CT11 ', N'False ', ' 1995/04/06 ', N' Phú Mỹ ')

INSERT INTO SINHVIEN ( MASV, HOTEN, MALOP, GIOITINH, NGAYSINH, DIACHI)
VALUES ( '009', N' Trần Thị Hoa', N'CT11 ', N'True ', ' 1994/09/08 ', N' Hoài Nhơn ');
GO


-- Tạo dữ liệu cho bảng DMHOCPHAN --

INSERT INTO  DMHOCPHAN ( MAHP, TENHP, SODVHT, MANGANH, HOCKY)
VALUES ( '001', N' Toán cao cấp A1', ' 4', '480202', '1' )

INSERT INTO  DMHOCPHAN ( MAHP, TENHP, SODVHT, MANGANH, HOCKY)
VALUES ( '002', N' Tiếng Anh 1', ' 3', '480202', '1' )

INSERT INTO  DMHOCPHAN ( MAHP, TENHP, SODVHT, MANGANH, HOCKY)
VALUES ( '003', N' Vật lý đại cương ', '4', '480202', '1' )

INSERT INTO  DMHOCPHAN ( MAHP, TENHP, SODVHT, MANGANH, HOCKY)
VALUES ( '004', N' Tiếng anh 2', ' 7', '480202', '1' )

INSERT INTO  DMHOCPHAN ( MAHP, TENHP, SODVHT, MANGANH, HOCKY)
VALUES ( '005', N' Tiếng anh 1', ' 3', '140909', '2' )

INSERT INTO  DMHOCPHAN ( MAHP, TENHP, SODVHT, MANGANH, HOCKY)
VALUES ( '006', N' Xác suất thống kê ', '3', '140909', '2' );
GO

-- tạo dữ liệu cho bảng DIEMHP --

INSERT INTO DIEMHP ( MASV, MAHP, DIEMHP )
VALUES ('002', '002', 5.9 )

INSERT INTO DIEMHP ( MASV, MAHP, DIEMHP )
VALUES ('002', '003', 4.5 )

INSERT INTO DIEMHP ( MASV, MAHP, DIEMHP )
VALUES ('003', '001', 4.3 )

INSERT INTO DIEMHP ( MASV, MAHP, DIEMHP )
VALUES ('003', '002', 6.7)

INSERT INTO DIEMHP ( MASV, MAHP, DIEMHP )
VALUES ('003', '003', 7.3 )

INSERT INTO DIEMHP ( MASV, MAHP, DIEMHP )
VALUES ('004', '001', 4.0 )

INSERT INTO DIEMHP ( MASV, MAHP, DIEMHP )
VALUES ('004', '002', 5.2 )

INSERT INTO DIEMHP ( MASV, MAHP, DIEMHP )
VALUES ('004', '003', 3.5 )

INSERT INTO DIEMHP ( MASV, MAHP, DIEMHP )
VALUES ('005', '001', 9.8 )

INSERT INTO DIEMHP ( MASV, MAHP, DIEMHP )
VALUES ('005', '002', 7.9 )

INSERT INTO DIEMHP ( MASV, MAHP, DIEMHP )
VALUES ('005', '003', 7.5 )

INSERT INTO DIEMHP ( MASV, MAHP, DIEMHP )
VALUES ('006', '001', 6.1 )

INSERT INTO DIEMHP ( MASV, MAHP, DIEMHP )
VALUES ('006', '002', 5.6 )

INSERT INTO DIEMHP ( MASV, MAHP, DIEMHP )
VALUES ('006', '003', 4.0 )

INSERT INTO DIEMHP ( MASV, MAHP, DIEMHP )
VALUES ('007', '001', 6.2);
GO

SELECT * FROM SINHVIEN
GO

-- xóa dữ liệu để truy vấn --




--*Buổi 3:
--DẠNG 1: CÂU LỆNH TRUY VẤN CÓ ĐIỀU KIỆN  - Tìm hiểu trước về SELECT
--Bài số 1: Câu lệnh SQL không kết nối 
--1. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ) , Namsinh của những sinh viên có họ không bắt đầu bằng chữ N,L,T. 
--2. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ) , Namsinh của những sinh viên nam học lớp CT11. 
--3. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ) của những sinh viên học lớp CT11,CT12,CT13. 
--4. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ), Tuổi của những sinh viên có tuổi từ 19-21.

SELECT MASV, HOTEN, MALOP, NGAYSINH, GIOITINH, YEAR (NGAYSINH ) AS NAMSINH
FROM SINHVIEN
WHERE  HOTEN  NOT LIKE N'[NTL]%';

SELECT * FROM SINHVIEN
GO

SELECT * FROM SINHVIEN
WHERE HOTEN LIKE 'N%' OR
      HOTEN LIKE 'L%' OR
	- HOTEN LIKE 'T%';

--2. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ) , Namsinh của những sinh viên nam học lớp CT11. 
SELECT MASV, HOTEN, MALOP, NGAYSINH, GIOITINH, YEAR (NGAYSINH ) AS 'NAMSINH'
FROM SINHVIEN
WHERE  GIOITINH = N'False' AND MALOP = 'CT11';

--3. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ) của những sinh viên học lớp CT11,CT12,CT13.

SELECT MASV, HOTEN, MALOP, NGAYSINH, GIOITINH
FROM SINHVIEN
WHERE MALOP IN ('CT11', 'CT12', 'CT13' );

--4. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ), Tuổi của những sinh viên có tuổi từ 19-21.

SELECT MASV, HOTEN, MALOP, NGAYSINH, GIOITINH, YEAR (GETDATE()) - YEAR (NGAYSINH ) AS ' TUOI1'
FROM SINHVIEN
WHERE YEAR (GETDATE()) - YEAR (NGAYSINH ) IN ( '19', '20', '21' );
