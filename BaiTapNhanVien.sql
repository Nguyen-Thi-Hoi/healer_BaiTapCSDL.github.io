
USE master
GO

CREATE DATABASE NHANVIEN
GO

USE NHANVIEN
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
   Ma_NhanVien       VARCHAR(4) NOT NULL,
   SoDA              VARCHAR(4) NOT NULL,
   ThoiGian          INT,
   ThoiGianBatDauTH  DATE

   CONSTRAINT PK_PHANCONG PRIMARY KEY (Ma_NhanVien, SoDA)


)
GO

-- TẠO DỮ LIỆU --

-- BẢNG NHANVIEN --

INSERT INTO NHANVIEN
VALUES ('NV1', N'Tung',       N'Nguyễn', '1960/01/01', N'Đà Nẵng',  N'Nam',20000 , 'NV5', '1' ),
	   ('NV2', N'Hoài Duy',	  N'Trương', '1964/03/21', N'Quảng Nam',N'Nam',40000 , 'NV1', '3' ),
	   ('NV3', N'Thanh Hằng', N'Đào',    '1950/04/25', N'Hà Nội',   N'Nữ', 50000 , 'NV2', '4' ),
	   ('NV4', N'LyLy',       N'Huỳnh',  '1990/05/30', N'Vũng Tàu', N'Nữ', 60000 , 'NV4', '5' ),
	   ('NV5', N'Hoài Chỉnh', N'Lê',     '1995/02/11', N'Sài Gòn',  N'Nam',30000 , 'NV3', '2' ),
	   ('NV6', N'Thu Thủy', N'Nguyễn',  '1990/01/03', N'Đà Nẵng', N'Nữ', 60000, 'NV1' , '3')
GO

SELECT * FROM NHANVIEN
GO


-- BẢNG PHONGBAN --

INSERT INTO PHONGBAN
VALUES ('1', N'Khách Hàng',        'NV2', '1980/01/15'),
       ('2', N'Nghiên cứu',        'NV1', '1989/11/15'),
	   ('3', N'Kế hoạch',          'NV5', '1975/02/24'),
	   ('4', N'Marketing',         'NV3', '2015/05/25'),
	   ('5', N'Kinh tế - Đầu tư ', 'NV4', '2018/05/15')
GO

-- BẢNG DEAN --

INSERT INTO DEAN
VALUES ('DA1', N'Nghiên cứu hạt giống',     N'Ha Noi',	       '5'),
       ('DA2', N'San Pham X',               N'Trường DHSPKT ', '1'),
	   ('DA3', N'Lập trình game ',			N'FPT',			   '4'),
	   ('DA4', N'Chế tạo máy hơi nước',		N'ĐH Lạc Hồng',	   '3'),
	   ('10', N'Lập trình Android',	     	N'FSoft',		   '2')

GO

SELECT * FROM DEAN
GO

-- BẢNG PHANCONG --

INSERT INTO PHANCONG
VALUES ('NV1', 'DA1', 1 , '1990/01/20'),
       ('NV2', 'DA5', 2 , '1981/11/24'),
	   ('NV3', 'DA2', 1 , '2016/02/14'),
	   ('NV4', 'DA3', 3 , '2019/05/12'),
       ('NV5', 'DA4', 4 , '1976/05/28'),
	   ('NV1', 'DA2', 2 , '1991/05/20')
GO

SELECT * FROM PHANCONG
GO

-- BẢNG DIADIEM_PHG --

INSERT INTO DIADIEM_PHG
VALUES ('1', N'Liên Chiểu'),
       ('2', N'Hội An'),
	   ('3', N'Hải Châu'),
	   ('4', N'Sơn Trà'),
	   ('5', N'Hà Nội')
GO

-- BẢNG THANNHAN --

INSERT INTO THANNHAN
VALUES ('NV1', N'Ánh',       N'Nữ',   '1990/03/13', N'Con gái'),
       ('NV2', N'Hoài Duy',  N'Nam',  '1994/03/13', N'Con trai'),
	   ('NV3', N'Thu Phương',N'Nữ',  '1980/03/13', N'Cháu gái'),
	   ('NV3', N'Kiều Oanh', N'Nữ',  '1960/03/13', N'Em trai'),
	   ('NV4', N'Tấn Hưng',  N'Nam', '1999/03/13', N'Vợ')
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

-- Truy vấn --

/* 2.Với những đề án ở ‘Ha Noi’, cho biết mã đề án, mã phòng ban chủ trì đề án, họ tên trưởng phòng cùng với ngày sinh và địa chỉ của người ấy.*/

 SELECT MaDA , MaPhong, HoNV, TenNV , NgSinh, DiaChi
 FROM   DEAN
 INNER JOIN PHANCONG on DEAN.MaDA = PHANCONG.SoDA
 INNER JOIN NHANVIEN on PHANCONG.Ma_NhanVien = NHANVIEN.MaNV
 INNER JOIN PHONGBAN on NHANVIEN.MaNV = PHONGBAN.TrPHG
 WHERE DiaDiem_DA LIKE '%Ha Noi%'
 GO


 /* 3. Tìm họ tên của nhân viên phòng số 5 có tham gia vào đề án “Sản phẩm X” với số giờ làm việc trên 10 giờ.*/
 SELECT HoNV, TenNV, ThoiGian
FROM    DEAN 
INNER JOIN PHANCONG ON PHANCONG.SoDA = DEAN.MaDA
INNER JOIN NHANVIEN ON NHANVIEN.MaNV = PHANCONG.Ma_NhanVien
WHERE PHG = '5' AND TenDA = 'San pham X' 
AND THOIGIAN > 10
GO


 /* 4. Tìm họ tên của những nhân viên được “Tung” phụ trách trực tiếp. */
 
 SELECT  NV1.HoNV, NV1.TenNV, NV1.Ma_NQL, NV2.HoNV AS HoNQL, NV2.TenNV AS TenNQL, NV2.MaNV
 FROM    NHANVIEN NV1, NHANVIEN NV2
 WHERE   NV1.Ma_NQL = NV2.MaNV AND NV2.TenNV like '%Tung'
 GO

 /* 5. Cho biết các mã đề án có:
       Nhân viên với họ là ‘Nguyen’ tham gia hoặc,
       Trưởng phòng chủ trì đề án đó với họ là ‘Nguyen’ . */

SELECT SoDA
FROM   PHANCONG INNER JOIN NHANVIEN ON NHANVIEN.MaNV = PHANCONG.Ma_NhanVien
WHERE  HoNV = N'Nguyễn'

UNION

SELECT MaDA
FROM   DEAN INNER JOIN PHONGBAN ON PHONGBAN.MaPhong = DEAN.Phong
INNER JOIN  NHANVIEN ON NHANVIEN.MaNV = PHONGBAN.TrPHG
WHERE  HoNV = N'Nguyễn'
GO

/* 6.Tìm nhân viên có người thân cùng tên và cùng giới tính */

SELECT NHANVIEN.MaNV
FROM   NHANVIEN INNER JOIN THANNHAN ON THANNHAN.Ma_NhanVien = NHANVIEN.MANV
WHERE  TENNV = TENTN

INTERSECT

SELECT DISTINCT NHANVIEN.MANV 
FROM   NHANVIEN 
INNER JOIN dbo.THANNHAN ON THANNHAN.Ma_NhanVien = NHANVIEN.MaNV
WHERE THANNHAN.Phai = NHANVIEN.Phai
GO

SELECT * FROM THANNHAN

/* 7.Tìm những nhân viên không có thân nhân nào */

SELECT *
FROM NHANVIEN
WHERE MaNV NOT IN (SELECT MaNV FROM THANNHAN )
GO

-- CÁCH 2

SELECT  MaNV
FROM    NHANVIEN
EXCEPT
SELECT  Ma_NhanVien
FROM    THANNHAN
GO

/* 8.Tìm những nhân viên có lương lớn hơn lương của ít nhất một nhân viên phòng 4. */

SELECT * 
FROM NHANVIEN
WHERE LUONG > (SELECT MIN(Luong) FROM NHANVIEN
WHERE PHG = '4')
GO

/* 9.Tìm những nhân viên có lương lớn hơn lương của tất cả nhân viên phòng 4 */

SELECT * 
FROM NHANVIEN
WHERE Luong > (SELECT SUM(Luong) FROM NHANVIEN
WHERE PHG = '4')
GO

/* 10.Tìm những trưởng phòng có tối thiểu một thân nhân. */

SELECT * 
FROM   NHANVIEN
WHERE  MaNV IN (SELECT TrPHG FROM PHONGBAN)
AND    MaNV IN (SELECT Ma_NhanVien FROM THANNHAN)
GO

-- CÁCH 2

SELECT   TrPHG 
FROM     PHONGBAN INNER JOIN THANNHAN on  PHONGBAN.TrPHG = THANNHAN.Ma_NhanVien
GROUP BY TrPHG
HAVING COUNT(TrPHG) >=1 
GO

/* 11.Tìm tên các nhân viên được phân công làm tất cả các đề án. */

SELECT * 
FROM   NHANVIEN
WHERE  MANV IN(SELECT Ma_NhanVien FROM PHANCONG A
				GROUP BY A.Ma_NhanVien
				HAVING COUNT(A.SoDA)=(SELECT COUNT(DEAN.MaDA) FROM DEAN))
GO

/* 12. Tìm tổng lương, lương cao nhất, lương thấp nhất và lương trung bình của các nhân viên. */

SELECT SUM(Luong) AS 'TongLuong', MAX(Luong) AS 'LuongCaoNhat' , MIN(Luong) AS 'LuongThapNhat', AVG(Luong) AS 'LuongTB'
FROM   NHANVIEN 
GO

/* 13.Cho biết số lượng nhân viên và lương trung bình của phòng ‘Nghien cuu’ */

SELECT COUNT(MaNV) AS N'Số Nhân Viên', AVG(Luong) AS N'Lương TB' 
FROM   NHANVIEN 
       INNER JOIN PHONGBAN ON PHONGBAN.MaPhong = NHANVIEN.PHG
WHERE  TenPhong = N'Nghiên cứu'
GO

/* 14.Cho biết số lượng nhân viên của từng phòng ban. Xuất ra tên phòng và số lượng.*/

SELECT PHG, COUNT(MaNV) AS N'Số lượng nhân viên'
FROM   NHANVIEN 
GROUP BY PHG
GO

/* 15.Với mỗi nhân viên cho biết mã số, họ tên, số lượng đề án và tổng thời gian mà họ tham gia.*/

SELECT   NHANVIEN.MaNV, TenNV, HoNV, COUNT(SoDA) AS N'Số lượng đề án', SUM(ThoiGian) as N'Tổng thời gian'
FROM     NHANVIEN 
         FULL OUTER JOIN  PHANCONG ON NHANVIEN.MaNV = PHANCONG.Ma_NhanVien
GROUP BY NHANVIEN.MaNV, HoNV, TenNV
GO

/* 16.Cho biết những nhân viên tham gia từ 2 đề án trở lên */

SELECT   NHANVIEN.MaNV, TenNV, HoNV, COUNT(SoDA) as N'Số đề án'
FROM     NHANVIEN 
         INNER JOIN PHANCONG ON NHANVIEN.MaNV = PHANCONG.Ma_NhanVien
GROUP BY NHANVIEN.MaNV, TenNV, HoNV
HAVING COUNT(SoDA) >=2
GO


/* 17.Cho biết những phòng ban (TENPHG) có lương trung bình của các nhân viên lớn lơn 20000 */

SELECT    TenPhong, AVG(Luong) AS N'Lương TB'
FROM      PHONGBAN
          INNER JOIN  NHANVIEN on PHONGBAN.MaPhong = NHANVIEN.PHG
GROUP BY  TenPhong
HAVING AVG(Luong) > 20000
GO


/* 18. Tìm những phòng ban có lương trung bình cao nhất. */

SELECT   TOP 1 TenPhong, AVG(Luong) AS N'Lương TB'
FROM     NHANVIEN 
         INNER JOIN PHONGBAN ON PHONGBAN.MaPhong = NHANVIEN.PHG
GROUP BY TenPhong
ORDER BY AVG(Luong) DESC
GO


/* 19.Tìm 3 nhân viên có lương cao nhất. */

SELECT   TOP 60 PERCENT MaNV , TenNV 
FROM     NHANVIEN
ORDER BY Luong DESC
GO

SELECT MaNV , Luong
FROM  NHANVIEN
GO

SELECT DISTINCT TOP 3 Luong
FROM   NHANVIEN
ORDER BY Luong DESC
GO

/* 20.Tìm mã và tên các nhân viên làm việc tại phòng ‘Nghien cuu’ */

SELECT  MaNV, TenNV
FROM    NHANVIEN 
        INNER JOIN PHONGBAN on NHANVIEN.Phg = PHONGBAN.MaPhong
WHERE   TenPhong = N'Nghiên cứu'
GO

/* 21. Tìm họ tên các nhân viên và tên các đề án nhân viên tham gia nếu có. */

SELECT HONV + ' ' + TENNV AS 'Họ Tên', TenDA 
FROM NHANVIEN 
     LEFT OUTER JOIN PHANCONG ON PHANCONG.Ma_NhanVien = NHANVIEN.MaNV
     LEFT OUTER JOIN DEAN ON DEAN.MADA = PHANCONG.SODA
GO

/* 22.Cho biết họ tên các nhân viên và tuổi về hưu của họ (nam 60 tuổi, nữ 55 tuổi).*/

SELECT HONV + ' ' + TENNV AS N'Họ Tên',
       CASE Phai
            WHEN N'Nam' THEN  N'60 Tuổi' 
            WHEN N'Nữ' THEN N'55 Tuổi'
            END AS TuoiVeHuu
FROM   NHANVIEN 
GO

/* 23.Cho biết họ tên các nhân viên và năm về hưu. */

SELECT HONV + ' ' + TENNV AS 'Họ Tên', 
       CASE Phai
		    WHEN 'Nam' THEN DATEADD(YEAR, 60, NgSinh)
			WHEN 'Nữ'  THEN DATEADD(YEAR,  55,  NgSinh)
			END AS N'Năm về hưu'
FROM NHANVIEN 
GO

/* 24.Xóa đi những nhân viên ở phòng ‘Nghien cuu’ */

DELETE FROM NHANVIEN 
WHERE PHG IN (SELECT MaPhong FROM PHONGBAN WHERE TenPhong = N'Nghiên cứu' )
GO


/* 25. Với đề án có mã số 10, hãy thay đổi nơi thực hiện đề án thành ‘Vung Tau’ và phòng ban phụ trách là phòng 5.*/

UPDATE DEAN 
SET    DiaDiem_DA = N'Vũng Tàu' ,Phong = '5' 
WHERE  MADA = '10'
GO

SELECT * FROM DEAN
GO


/* 26.Tạo khung nhìn hiển thị danh sách họ tên các nhân viên ở Đà Nẵng mà tham gia ít nhất một đề án trong năm 2017.*/


CREATE VIEW DSNV AS  
       SELECT DISTINCT HONV + ' ' + TENNV AS 'Họ Tên' FROM dbo.NHANVIEN INNER JOIN dbo.PHANCONG ON PHANCONG.Ma_NhanVien = NHANVIEN.MANV 
WHERE   DiaChi LIKE '%Đà Nẵng' AND YEAR(ThoiGianBatDauTH) = '2017'
GO

SELECT *
FROM  DSNV
GO

/* 27.Tạo khung nhìn hiển thị các đề án vừa có nhân viên nam vừa có nhân viên nữ tham gia do phòng 'Nghien cuu' chủ trì trong năm ba
 tháng cuối năm 2019. */

 -- không sử dụng khung nhìn để cập nhập dữ liệu //

/* 28. Với mỗi phòng ban cho biết tên phòng ban và địa điểm phòng ban. */

SELECT TenPhong, DiaDiem
FROM   PHONGBAN
       INNER JOIN DIADIEM_PHG ON PHONGBAN.MaPhong = DIADIEM_PHG.MaPhong
GO


/* 29. YC1. Tìm tên những người trưởng phòng của từng phòng ban */

SELECT  MaPhong, TenPhong, TrPHG, HoNV +' '+ TenNV AS N'Họ tên trưởng phòng' 
FROM    PHONGBAN
        INNER JOIN NHANVIEN on PHONGBAN.TrPHG = NHANVIEN.MaNV
GO


/* YC2: Cho biết họ tên và địa điểm của các nhân viên sống ở Sài Gòn, sắp xế tăng dần theo tên. */

SELECT  HoNV, TenNV, DiaChi
FROM    NHANVIEN
WHERE   DiaChi like '%Sài Gòn'
ORDER BY TenNV ASC
GO


/* 30 YC1:. cho biết họ tên và mức lương các nhân viên trên 20 tuổi, sắp xếp tăng dần theo lương. */

SELECT  HoNV, TenNV, Luong, YEAR(GETDATE()) - YEAR(NgSinh) AS N'Tuổi'
FROM    NHANVIEN
WHERE   YEAR(GETDATE()) - YEAR(NgSinh) >= 20
ORDER BY Luong asc
GO

/* YC2: . cho biết MaNV có người thân hay có tham gia đề án. */

SELECT Ma_NhanVien
FROM   THANNHAN
UNION
SELECT Ma_NhanVien
FROM   PHANCONG
GO

/* YC3: cho biết những nhân viên có mức lương trên 25000 ở phòng số 4 hoặc có mức lương trên 30000 ở phòng số 3 */

SELECT *
FROM   NHANVIEN
WHERE  (Luong > 25000 AND PHG = '4') OR (Luong > 30000 AND PHG = '3')
GO

