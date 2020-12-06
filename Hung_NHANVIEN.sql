CREATE DATABASE NHANVIEN
GO
USE NHANVIEN
GO
CREATE TABLE NHANVIEN
(
   MaNV        VARCHAR(4) NOT NULL,
   HoTenNV     VARCHAR(20),
   NgSinh      DATE,
   DiaChi      VARCHAR(20),
   Phai        VARCHAR(4),
   Luong       FLOAT,
   Ma_NQL      VARCHAR(4),
   PHG         VARCHAR(4)
   CONSTRAINT PK_NHANVIEN  PRIMARY KEY (MaNV)
)
GO
CREATE TABLE PHONGBAN
(
   MaPhong     VARCHAR(4) NOT NULL,
   TenPhong    VARCHAR(20),
   TrPHG       VARCHAR(20),
   DiaChiTrPHG VARCHAR(20),
   NgSinhTrPHG DATE,
   NG_NhanChuc DATE
   CONSTRAINT PK_PHONGBAN PRIMARY KEY (MaPhong)
)
GO
CREATE TABLE DIADIEM_PHG
(
   MaPhong     VARCHAR(4) NOT NULL,
   DiaDiem     VARCHAR(20) NOT NULL,
   CONSTRAINT PK_DIADIEM_PHG  PRIMARY KEY (MaPhong, DiaDiem)
)   
GO
CREATE TABLE THANNHAN
(
   Ma_NhanVien  VARCHAR(4)  NOT NULL,
   TenTN        VARCHAR(20) NOT NULL,
   Phai         VARCHAR(4),
   NgSinh       DATE,
   QuanHe       VARCHAR(20)
   CONSTRAINT PK_THANNHAN  PRIMARY KEY (Ma_NhanVien , TenTN)
)
GO
CREATE TABLE DEAN
(
   MaDA       VARCHAR(4) NOT NULL,
   TenDA      VARCHAR(20),
   DiaDiem_DA VARCHAR(20),
   Phong      VARCHAR(4)
   CONSTRAINT PK_DEAN  PRIMARY KEY (MaDA)
)
GO
CREATE TABLE  PHANCONG
(
   Ma_NhanVien VARCHAR(4) NOT NULL,
   SoDA        VARCHAR(4) NOT NULL,
   ThoiGian    int,
   CONSTRAINT PK_PHANCONG PRIMARY KEY (Ma_NhanVien, SoDA)

)
GO
-- TẠO DỮ LIỆU --
-- BẢNG NHANVIEN --
INSERT INTO NHANVIEN
VALUES ('NV1', 'Ly Ronaldo DeLima', '1976-09-18', 'Da Nang', 'Nam',20000 , 'QL01', 'P001' ),
       ('NV2', 'Nguyen Ruud Gullit',     '1995-03-21', 'Quy Nhon', 'Nam',30000 , 'QL02', 'P002' ),
	   ('NV3', 'Le Z.Ibrahimovic', '2000-12-31', 'Ho Chi Minh', 'Nam',40000 , 'QL03', 'P003' ),
	   ('NV4', 'Truong Lionel Messi',    '1997-01-01', 'Ha Noi', 'Nu', 50000 , 'QL04', 'P004' ),
	   ('NV5', 'Huynh C.Ronaldo',  '2005-11-05', 'Hai Phong', 'Nu', 60000 , 'QL05', 'P005' ),
	   ('NV6', 'Trinh Gareth Bale',  '2001-06-13', 'Phu Yen', 'Nam', 70000 , 'QL05', 'P005' )
GO
-- BẢNG PHONGBAN --
INSERT INTO PHONGBAN
VALUES ('P001', 'Khach Hang',        'Ly P.Maldini',	  'Da Nang',	'1976-04-17','2020-01-15'),
       ('P002', 'Nhan su',           'Nguyen A.Nesta',	   'Da Nang',	'1965-12-20','2018-11-15'),
	   ('P003', 'Ke Hoach',          'Trinh F.Cannavaro', 'Hai Phong',	'1992-07-01','2019-02-04'),
	   ('P004', 'Marketing',         'Phong R.Baggio',		'Nghe An',	'1968-11-15','2019-05-25'),
	   ('P005', 'Kinh te - Dau tu ', 'Truong P.Guardiola', 'Quang Tri',	'1987-08-28','2020-05-15')
GO
-- BẢNG DEAN --
INSERT INTO DEAN
VALUES ('DA01', 'Real Madrid',     ' Da Nang',	  'P001'),
       ('DA02', 'Barca',			'Hai Phong ', 'P002'),
	   ('DA03', 'Manchester City',	'Quy Nhon',	  'P003'),
	   ('DA04', 'Liverpool',		'Quang Nam',  'P004'),
	   ('DA05', 'Chelse',			'Hue',		  'P005')
GO
-- BẢNG PHANCONG --
INSERT INTO PHANCONG
VALUES ('NV1', '02', 10),
       ('NV2', '03', 8),
	   ('NV3', '04', 6),
	   ('NV4', '01', 2),
       ('NV5', '02', 1),
	   ('NV6', '01', 12)
GO

-- BẢNG DIADIEM_PHG --
INSERT INTO DIADIEM_PHG
VALUES ('P001', 'Da Nang'),
       ('P002', 'Quy Nhon'),
	   ('P003', 'Quang Ngai'),
	   ('P004', 'Quang Tri'),
	   ('P005', 'Hai Phong')
GO
-- BẢNG THANNHAN --
INSERT INTO THANNHAN
VALUES ('NV1', 'Sergio Ramos', 'Nu',   '1997-03-13', 'Chị'),
       ('NV2', 'David Luiz', 'Nam',  '1990-03-13', 'Anh'),
	   ('NV3', 'Virgil van Dijk', 'Nam',  '1991-03-13', 'Anh'),
	   ('NV4', 'Gerard Pique', 'Nu',  '2000-03-13', 'Em'),
	   ('NV5', 'Fabio Cannavaro', 'Nam', '1999-03-13', 'Chau'),
	   ('NV6', 'Paolo Maldini', 'Nam', '1999-03-13', 'Bo')
GO
--Cau2: Với những đề án ở ‘Ha Noi’, cho biết mã đề án, mã phòng ban chủ trì đề án, họ tên trưởng phòng cùng với ngày sinh và địa chỉ của người ấy.
SELECT HoTenNV, MaDA, PHONGBAN.MaPhong, TrPHG, NgSinhTrPHG, DiaChiTrPHG
FROM NHANVIEN 
JOIN PHONGBAN ON PHONGBAN.TRPHG = NHANVIEN.MANV
JOIN DIADIEM_PHG ON DIADIEM_PHG.MaPhong  = PHONGBAN.MaPhong
JOIN DEAN ON DEAN.PHONG =  PHONGBAN.MaPhong
WHERE DEAN.DiaDiem_DA = 'Ha Noi'
--Cau3: Tìm họ tên của nhân viên phòng số 5 có tham gia vào đề án “Sản phẩm X” với số giờ làm việc trên 10 giờ
SELECT HoTenNV
FROM PHONGBAN JOIN NHANVIEN ON PHONGBAN.MaPhong = NHANVIEN.PHG
				JOIN DEAN ON DEAN.Phong = PHONGBAN.MaPhong
				JOIN PHANCONG ON PHANCONG.Ma_NhanVien = NHANVIEN.MaNV
WHERE TenDA = 'Sản phẩm X' and ThoiGian >= 10

--Cau4: Tìm họ tên của những nhân viên được “Tung” phụ trách trực tiếp
SELECT NHANVIEN.HoTenNV FROM NHANVIEN
WHERE HoTenNV LIKE '%Tung%'
--Cau5: Cho biết các mã đề án có: Nhân viên với họ là ‘Nguyen’ tham gia hoặc, Trưởng phòng chủ trì đề án đó với họ là ‘Nguyen
SELECT NHANVIEN.HoTenNV , DEAN.MADA 
FROM DEAN JOIN PHANCONG ON PHANCONG.SODA = DEAN.MADA
			JOIN NHANVIEN ON NHANVIEN.MANV  = PHANCONG.Ma_NhanVien
WHERE HoTenNV LIKE '%NGUYEN%'
UNION
SELECT  NHANVIEN.HoTenNV,DEAN.MADA FROM DEAN 
JOIN PHONGBAN ON DEAN.PHONG = PHONGBAN.MaPhong
JOIN NHANVIEN ON PHONGBAN.TRPHG = NHANVIEN.MANV
WHERE NHANVIEN.HoTenNV LIKE '%NGUYEN%'
--Cau6: Tìm nhân viên có người thân cùng tên và cùng giới tính
SELECT THANNHAN.TENTN
FROM NHANVIEN
JOIN THANNHAN ON THANNHAN.Ma_NhanVien =  NHANVIEN.MANV
WHERE THANNHAN.TENTN = NHANVIEN.HoTenNV 
INTERSECT
SELECT THANNHAN.TENTN
FROM NHANVIEN
JOIN THANNHAN ON THANNHAN.Ma_NhanVien =  NHANVIEN.MANV
WHERE THANNHAN.PHAI = NHANVIEN.PHAI 
--Cau7: Tìm những nhân viên không có thân nhân nào  
SELECT NHANVIEN.MANV FROM NHANVIEN
EXCEPT
SELECT NHANVIEN.MANV FROM NHANVIEN
JOIN THANNHAN ON THANNHAN.Ma_NhanVien = NHANVIEN.MANV

--Cau8: Tìm những nhân viên có lương lớn hơn lương của ít nhất một nhân viên phòng 4
SELECT MaNV FROM NHANVIEN WHERE Luong > (SELECT MIN(Luong) FROM NHANVIEN WHERE PHG='P004')
--Cau9: Tìm những nhân viên có lương lớn hơn lương của tất cả nhân viên phòng 4
SELECT MaNV FROM NHANVIEN WHERE Luong > (SELECT MAX(Luong) FROM NHANVIEN WHERE PHG='P004')
--Cau10: Tìm những trưởng phòng có tối thiểu một thân nhân
SELECT MaNV FROM NHANVIEN WHERE MaNV in(SELECT Ma_NhanVien FROM THANNHAN)

--Cau11: Tìm tên các nhân viên được phân công làm tất cả các đề án
SELECT * FROM NHANVIEN WHERE MaNV IN (SELECT Ma_NhanVien FROM phancong)
--Cau12: Tìm tổng lương, lương cao nhất, lương thấp nhất và lương trung bình của các nhân viên
SELECT SUM(Luong) AS TongLuong, MAX(Luong) AS MaxLuong, MIN(Luong) AS MinLuong, AVG(Luong) AS LuongTB
FROM NHANVIEN
--Cau13.Cho biết số lượng nhân viên và lương trung bình của phòng ‘Nghien cuu’
SELECT  COUNT(MaNV) AS SoLuongNV , (SUM(NHANVIEN.Luong)/COUNT(Luong)) AS LuongTB
FROM NHANVIEN JOIN PHONGBAN ON PHONGBAN.MaPhong = NHANVIEN.PHG
WHERE PHONGBAN.TenPhong = 'NGHIEN CUU'
--Cau14: Cho biết số lượng nhân viên của từng phòng ban. Xuất ra tên phòng và số lượng
SELECT  PHONGBAN.TenPhong, COUNT(NHANVIEN.PHG) AS SoluongNV
FROM NHANVIEN JOIN PHONGBAN ON PHONGBAN.MaPhong = NHANVIEN.PHG 
GROUP BY PHONGBAN.TenPhong
--Cau15:Với mỗi nhân viên cho biết mã số, họ tên, số lượng đề án và tổng thời gian mà họ tham gia
SELECT MaNV, HoTenNV, COUNT(MaDA) AS SoluongDA, SUM(ThoiGian) AS TongTG
FROM PHANCONG JOIN NHANVIEN ON PHANCONG.Ma_NhanVien = NHANVIEN.MaNV
			JOIN DEAN ON DEAN.MaDA = PHANCONG.SoDA
GROUP BY MaNV, HoTenNV
--Cau16: Cho biết những nhân viên tham gia từ 2 đề án trở lên
SELECT MaNV, HoTenNV
FROM NHANVIEN JOIN PHANCONG ON PHANCONG.Ma_NhanVien = NHANVIEN.MaNV
			JOIN DEAN ON DEAN.MaDA = PHANCONG.SoDA
GROUP BY MaNV, HoTenNV
HAVING COUNT(MaDA) >= 2
--Cau17: Cho biết những phòng ban (TENPHG) có lương trung bình của các nhân viên lớn lơn 20000
SELECT PHG FROM NHANVIEN
GROUP BY PHG
HAVING AVG(Luong) > 20000
--Cau18: Tìm những phòng ban có lương trung bình cao nhất
SELECT MaPhong, HoTenNV, Luong
FROM PHONGBAN JOIN NHANVIEN ON NHANVIEN.PHG = PHONGBAN.MaPhong
WHERE Luong IN (SELECT MAX(Luong) FROM NHANVIEN)

--Cau19: Tìm 3 nhân viên có lương cao nhất
SELECT TOP 3 NHANVIEN.MaNV
FROM NHANVIEN
ORDER BY Luong DESC
--Cau20: Tìm mã và tên các nhân viên làm việc tại phòng ‘Nghien cuu’
		--Cach1:
SELECT MaNV, HoTenNV FROM NHANVIEN JOIN PHONGBAN ON PHONGBAN.MaPhong = NHANVIEN.PHG  WHERE TenPhong = 'NGHIEN CUU'
--Cau21: Tìm họ tên các nhân viên và tên các đề án nhân viên tham gia nếu có
SELECT HoTenNV, TenDA
FROM NHANVIEN JOIN PHONGBAN ON PHONGBAN.MaPhong = NHANVIEN.PHG
			JOIN DEAN ON DEAN.Phong = PHONGBAN.MaPhong
--Cau22: Cho biết họ tên các nhân viên và tuổi về hưu của họ (nam 60 tuổi, nữ 55 tuổi)
SELECT HoTenNV
FROM NHANVIEN
WHERE YEAR(GETDATE()) - YEAR(NgSinh) >= ( CASE Phai
	WHEN 'Nam' THEN 60
	WHEN 'Nu' THEN 55
END )
--Cau23: Cho biết họ tên các nhân viên và năm về hưu
SELECT HoTenNV, (CASE Phai WHEN 'Nam' THEN YEAR(NgSinh)+ 60 WHEN 'Nu' THEN Year(NgSinh) +55 END) AS NamVeHuu FROM NHANVIEN
--Cau24: Xóa đi những nhân viên ở phòng ‘Nghien cuu’
DELETE FROM NHANVIEN WHERE PHG IN ( SELECT MaPhong
FROM PHONGBAN
WHERE TenPhong='Nghien cuu')
--Cau25: Với đề án có mã số 10, hãy thay đổi nơi thực hiện đề án thành ‘Vung Tau’ và phòng ban phụ trách là phòng 5
UPDATE DEAN
SET DiaDiem_DA = 'VUNG TAU ' , Phong= 'P005'
WHERE MaDA = 'DA10'