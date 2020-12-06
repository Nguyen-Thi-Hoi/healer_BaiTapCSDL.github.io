USE MASTER
GO

CREATE DATABASE DICHVUKARAOKE
GO

USE DICHVUKARAOKE
GO

CREATE TABLE KHACHHANG
(
MaKH NVARCHAR(50) NOT NULL,
TenKH NVARCHAR(100),
DiaChi NVARCHAR(150),
SoDT INT,
MaSoThue INT

 CONSTRAINT PK_KHACHHANG PRIMARY KEY (MaKH),
)
GO

CREATE TABLE PHONG
(
MaPhong NVARCHAR(50) NOT NULL ,
SoKhachToiDa INT,
TrangThai NVARCHAR(50),
MoTa NVARCHAR(50)

 CONSTRAINT PK_PHONG PRIMARY KEY (MaPhong),
 )
 
 GO
 CREATE TABLE DICHVU
(
MaDV NVARCHAR(50) NOT NULL ,
TenDV NVARCHAR(50),
DonViTinh NVARCHAR(50),
DonGia INT
 CONSTRAINT PK_DICHVU PRIMARY KEY (MaDV),
 )

 GO
 CREATE TABLE MUCTIENGIO
(
MaTienGio NVARCHAR(50) NOT NULL ,
DonGia INT,
MoTa NVARCHAR(200)

 CONSTRAINT PK_MUCTIENGIO PRIMARY KEY (MaTienGio),
 )

 GO
 CREATE TABLE HOADON
(
MaHD NVARCHAR(50) NOT NULL ,
MaKH NVARCHAR(50),
MaPhong NVARCHAR(50),
MaTienGio NVARCHAR(50),
ThoiGianBatDauSD DATETIME,
ThoiGianKetThucSD DATETIME,
TrangThaiHD NVARCHAR(50),

 CONSTRAINT PK_HOADON PRIMARY KEY (MaHD),
 )

 GO

 CREATE TABLE CHITIETSDDV
(
MaHD NVARCHAR(50) NOT NULL,
MaDV NVARCHAR(50) NOT NULL,
SoLuong INT,

      CONSTRAINT PK_CHITIETSDDV PRIMARY KEY (MaHD, MaDV)
 )
  GO


-- TẠO KHÓA NGOẠI THAM CHIẾU ĐẾN BẢNG KHACHANG --

ALTER TABLE HOADON
ADD CONSTRAINT FK_HOADON_KHACHHANG FOREIGN KEY ( MaKH) REFERENCES KHACHHANG ( MaKH);
GO

ALTER TABLE HOADON
ADD CONSTRAINT FK_HD_PHONG FOREIGN KEY (MaPhong) REFERENCES PHONG (MaPhong)
GO

ALTER TABLE HOADON
ADD CONSTRAINT FK_HD_MUCTIENGIO FOREIGN KEY (MaTienGio) REFERENCES MUCTIENGIO (MaTienGio)
GO

ALTER TABLE CHITIETSDDV
ADD CONSTRAINT FK_CTSDDV_HOADON FOREIGN KEY ( MaHD) REFERENCES HOADON ( MaHD)
GO

ALTER TABLE CHITIETSDDV
ADD CONSTRAINT FK_CTSDDV_DICHVU FOREIGN KEY (MaDV) REFERENCES DICHVU (MaDV)
GO

-- 1 nhập dữ liệu cho bảng KHACHHANG --

INSERT INTO KHACHHANG (MaKH, TenKH, DiaChi, SoDT, MaSoThue)
VALUES  ('KH001', 'Tran Van Nam', 'Hai Chau', '0905123456', '12345678');
GO
INSERT INTO KHACHHANG (MaKH, TenKH, DiaChi, SoDT, MaSoThue)
VALUES ('KH002', 'Nguyen Mai Anh', 'Lien Chieu', '0905123457', '12345679');
GO
INSERT INTO KHACHHANG (MaKH, TenKH, DiaChi, SoDT, MaSoThue)
VALUES ('KH003', 'Phan Hoai Lan Khue', 'Hoa Vang', '0905123458', '12345680');
GO
INSERT INTO KHACHHANG (MaKH, TenKH, DiaChi, SoDT, MaSoThue)
VALUES ('KH004', 'Nguyen Hoai Nguyen', 'Hoa Cam', '0905123459', '12345681');
GO
INSERT INTO KHACHHANG (MaKH, TenKH, DiaChi, SoDT, MaSoThue)
VALUES ('KH005', 'Le Truong Ngoc Anh', 'Hai Chau', '0905123460', '12345682');
GO
INSERT INTO KHACHHANG (MaKH, TenKH, DiaChi, SoDT, MaSoThue)
VALUES ('KH006', 'Ho Hoai Anh', 'Hai Chau', '0905123461', '12345683');
GO
INSERT INTO KHACHHANG (MaKH, TenKH, DiaChi, SoDT, MaSoThue)
VALUES ('KH007', 'Pham Thi Huong', 'Son Tra', '0905123462', '12345684');
GO
INSERT INTO KHACHHANG (MaKH, TenKH, DiaChi, SoDT, MaSoThue)
VALUES ('KH008', 'Chau Tinh Tri', 'Hai Chau', '0905123463', '12345685');
GO
INSERT INTO KHACHHANG (MaKH, TenKH, DiaChi, SoDT, MaSoThue)
VALUES ('KH009', 'Phan Nhu Thao', 'Hoa Khanh', '0905123464', '12345686');
GO
INSERT INTO KHACHHANG (MaKH, TenKH, DiaChi, SoDT, MaSoThue)
VALUES ('KH010', 'Tran Thi To Tam', 'Son Tra', '0905123465', '12345687');
GO

-- 2 NHẬP DỮ LIỆU CHO BẢNG PHONG --

INSERT INTO PHONG (MaPhong, SoKhachToiDa, TrangThai, MoTa)
VALUES (N'VIP01', '5', N'Duoc su dung', N'phong vip');
GO
INSERT INTO PHONG (MaPhong, SoKhachToiDa, TrangThai, MoTa)
VALUES ('P02', '10', 'Duoc su dung', 'phong binh thuong');
GO
INSERT INTO PHONG
(MaPhong, SoKhachToiDa, TrangThai, MoTa)
VALUES ('P03', '15', 'Duoc su dung', 'phong binh thuong');
GO
INSERT INTO PHONG (MaPhong, SoKhachToiDa, TrangThai, MoTa)
VALUES ('VIP04', '20', 'Duoc su dung', 'phong vip');
GO
INSERT INTO PHONG (MaPhong, SoKhachToiDa, TrangThai, MoTa)
VALUES ('P05', '25', 'Duoc su dung', 'phong binh thuong');
GO
INSERT INTO PHONG (MaPhong, SoKhachToiDa, TrangThai, MoTa)
VALUES ('P06', '30', 'Duoc su dung', 'phong binh thuong');
GO
INSERT INTO PHONG (MaPhong, SoKhachToiDa, TrangThai, MoTa)
VALUES ('VIP07', '35', 'Duoc su dung', 'phong vip');
GO
INSERT INTO PHONG (MaPhong, SoKhachToiDa, TrangThai, MoTa)
VALUES ('P08', '40', 'Duoc su dung', 'phong binh thuong');
GO
INSERT INTO PHONG (MaPhong, SoKhachToiDa, TrangThai, MoTa)
VALUES ('VIP09', '45', 'Duoc su dung', 'phong vip');
GO
INSERT INTO PHONG (MaPhong, SoKhachToiDa, TrangThai, MoTa)
VALUES ('P10', '50', 'Duoc su dung', 'phong binh thuong')
GO

-- 3 NHẬP DỮ LIỆU CHO BẢNG DICHVU--

INSERT INTO DICHVU (MaDV, TenDV, DonViTinh, DonGia)
VALUES ('DV01', 'Hat Dua', 'bao', '5000');
GO

INSERT INTO DICHVU (MaDV, TenDV, DonViTinh, DonGia)
VALUES ('DV02', 'Trai Cay', 'dia', '30000');
GO
INSERT INTO DICHVU (MaDV, TenDV, DonViTinh, DonGia)
VALUES ('DV03', 'Bia', 'Lon', '5000');
GO
INSERT INTO DICHVU (MaDV, TenDV, DonViTinh, DonGia)
VALUES ('DV04', 'Nuoc Ngot', 'chai', '5000');
GO
INSERT INTO DICHVU (MaDV, TenDV, DonViTinh, DonGia)
VALUES ('DV05', 'Ruou', 'chai', '5000');
GO



-- 4 NHẬP DỮ LIỆU CHO BẢNG MUCTIENGIO --

INSERT INTO MUCTIENGIO (MaTienGio, DonGia, MoTa)
VALUES ('MT01', '60000', 'Ap dung tu 6 gio den 17 gio');
GO
INSERT INTO MUCTIENGIO (MaTienGio, DonGia, MoTa)
VALUES ('MT02', '80000', 'Ap dung tu 17 gio den 22 gio sang');
GO
INSERT INTO MUCTIENGIO (MaTienGio, DonGia, MoTa)
VALUES ('MT03', '100000', 'Ap dung tu sau 22 gio den 6 gio sang');
GO

SELECT * FROM MUCTIENGIO
GO
-- 5 NHẬP DỮ LIỆU CHO BẢNG HOADON --

INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD01', 'KH001', 'VIP01', 'MT01', '11/20/2015 8:15', '11/20/2015 12:30', 'Da thanh toan');
GO
INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD02', 'KH002', 'P02', 'MT01', '12/12/2015 13:10', '12/12/2015 17:20', 'Chua thanh toan');
GO
INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD03', 'KH001', 'P02', 'MT01', '10/15/2015 12:12', '10/15/2015 16:30', 'Da thanh toan');
GO

INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD04', 'KH003', 'VIP01', 'MT02', '9/20/2015 18:30', '9/20/2015 21:00', 'Chua thanh toan');
GO

INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD05', 'KH001', 'P03', 'MT02', '11/25/2014 20:00', '11/25/2015 21:45', 'Thanh toan mot phan');
GO

INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD06', 'KH002', 'VIP01', 'MT01', '9/12/2014 9:20', '9/12/2015 10:45', 'Da thanh toan');
GO

INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD07', 'KH006', 'VIP04', 'MT01', '12/22/2014 11:00', '12/22/2014 14:20', 'Da thanh toan');
GO

INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD08', 'KH007', 'VIP04', 'MT02', '8/23/2014 20:10', '8/23/2014 22:00', 'Chua thanh toan');
GO

INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD09', 'KH006', 'P05', 'MT03', '12/20/2015 22:30', '12/21/2015 1:15', 'Chua thanh toan');
GO

INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD010', 'KH005', 'VIP01', 'MT03', '10/10/2015 1:30', '10/10/2015 3:15', 'Da thanh toan');
GO

INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD011', 'KH004', 'VIP07', 'MT03', '12/25/2015 22:15', '12/26/2015 2:00', 'Da thanh toan');
GO

INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD012', 'KH008', 'P06', 'MT03', '7/25/2014 23:45', '7/26/2015 2:15', 'Da thanh toan');
GO

INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES  ('HD013', 'KH007', 'VIP07', 'MT02', '8/21/2015 18:15', '8/21/2015 20:45', 'Da thanh toan');
GO
INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD014', 'KH004', 'P06', 'MT02', '12/31/2015 19:12', '12/31/2015 21:15', 'Thanh toan mot phan');
GO

INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD015', 'KH001', 'P06', 'MT01', '6/24/2014 13:00', '6/24/2014 13:15', 'Thanh toan mot phan');
GO

INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD016', 'KH003', 'P08', 'MT01', '5/12/2015 8:00', '5/12/2015 10:45', 'Thanh toan mot phan');
GO

INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD017', 'KH003', 'VIP09', 'MT01', '11/20/2015 12:15', '11/20/2015 14:20', 'Da thanh toan');
GO

INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD018', 'KH001', 'P10', 'MT01', '4/12/2015 14:45', '4/12/2015 16:45', 'Da thanh toan');
GO


INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD019', 'KH002', 'VIP09', 'MT03', '11/12/2015 22:12', '11/13/2015 2:00', 'Da thanh toan');
GO
INSERT INTO HOADON (MaHD, MaKH, MaPhong, MaTienGio, ThoiGianBatDauSD, ThoiGianKetThucSD, TrangThaiHD)
VALUES ('HD020', 'KH004', 'VIP09', 'MT03', '2/25/2014 1:15', '2/25/2014 4:15', 'Chua thanh toan');
GO

SELECT * FROM CHITIETSDDV
GO

--6  Nhập dữ liệu cho bảng CHITIETSDDV--

INSERT INTO CHITIETSDDV ( MaHD, MaDV, SoLuong )
VALUES ( 'HD01', 'DV01', '5');
GO

INSERT INTO CHITIETSDDV ( MaHD, MaDV, SoLuong )
VALUES  ( 'HD02', 'DV01', '8');
GO

INSERT INTO CHITIETSDDV ( MaHD, MaDV, SoLuong )
VALUES  ( 'HD02', 'DV02', '5');
GO

INSERT INTO CHITIETSDDV ( MaHD, MaDV, SoLuong )
VALUES  ( 'HD02', 'DV03', '2');
GO

INSERT INTO CHITIETSDDV ( MaHD, MaDV, SoLuong )
VALUES  ( 'HD03', 'DV04', '1');
GO

INSERT INTO CHITIETSDDV ( MaHD, MaDV, SoLuong )
VALUES   ( 'H003', 'DV05', '6');
GO

INSERT INTO CHITIETSDDV ( MaHD, MaDV, SoLuong )
VALUES  ( 'HD04', 'DV01', '5');
GO

INSERT INTO CHITIETSDDV ( MaHD, MaDV, SoLuong )
VALUES    ( 'HD05', 'DV02', '3');
GO

INSERT INTO CHITIETSDDV ( MaHD, MaDV, SoLuong )
VALUES  ( 'HD05', 'DV03', '10');
GO

INSERT INTO CHITIETSDDV ( MaHD, MaDV, SoLuong )
VALUES  ( 'HD05', 'DV04', '2');
GO

INSERT INTO CHITIETSDDV ( MaHD, MaDV, SoLuong )
VALUES  ( 'HD06', 'DV01', '5');
GO

INSERT INTO CHITIETSDDV ( MaHD, MaDV, SoLuong )
VALUES   ( 'HD07', 'DV03', '8');
GO

INSERT INTO CHITIETSDDV ( MaHD, MaDV, SoLuong )
VALUES  ( 'HD07', 'DV04', '10');
GO

INSERT INTO CHITIETSDDV ( MaHD, MaDV, SoLuong )
VALUES  ( 'HD07', 'DV05', '4');
GO

INSERT INTO CHITIETSDDV ( MaHD, MaDV, SoLuong )
VALUES   ( 'HD013', 'DV02', '9');
GO

INSERT INTO CHITIETSDDV ( MaHD, MaDV, SoLuong )
VALUES    ( 'HD011', 'DV02', '8');
GO