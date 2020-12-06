
-- BƯỚC 1 --
USE master
GO

-- BƯỚC 2 --
CREATE DATABASE QLNV;
GO
USE QLNV;
GO

-- BƯỚC 3 ( TẠO TÊN BẢNG + KHÓA CHÍNH --
CREATE TABLE NHANVIEN
(
   HONV   NVARCHAR(255),
   TENLOT NVARCHAR (255),
   TENNV  NVARCHAR (255),
   MANV   NVARCHAR (255) NOT NULL,
   NGSINH DATETIME,
   DCHI   NVARCHAR (255),
   PHAI   NVARCHAR (255),
   LUONG  INT,
   MA_NQL NVARCHAR (255),
   PHG    INT

   CONSTRAINT PK_NHANVIEN PRIMARY KEY (MANV),
   
   CONSTRAINT CK_NHANVIEN_PHAI CHECK ( PHAI IN ('NAM' , 'NU'))
)
GO

CREATE TABLE PHONGBAN
(
   MAPHONG     INT NOT NULL,
   TENPHONG    NVARCHAR (255),
   TRPHONG     NVARCHAR (255),
   NG_NHANCHUC DATETIME

   CONSTRAINT PK_PHONGBAN PRIMARY KEY (MAPHONG),

)
GO

-- Để chỉnh sửa cấu trúc 1 bảng, dùng câu lệnh ALTER TABLE, Và Add một CONSTRAINT KHÓA NGOẠI vào --
-- VÍ DỤ: giữa 2 bảng nhân viên và phòng ban , khóa ngoại với thuộc tính PHG của PHONG BAN tham chiếu đến thuộc tính khóa chính MANV của bảng NHÂN VIÊN


ALTER TABLE PHONGBAN
ADD CONSTRAINT FK_NHANVIEN_PHONGBAN
FOREIGN KEY (TRPHONG)
REFERENCES NHANVIEN (MANV);


                -----------------------------------------
CREATE TABLE DEAN
(
   TENDEAN    NVARCHAR(255),
   MADUAN     NVARCHAR (255),
   DDIEM_DUAN NVARCHAR (255),
   PHONG      INT NOT NULL 

   CONSTRAINT PK_DEAN PRIMARY KEY (MADUAN),
   CONSTRAINT FK_DEAN_PHONGBAN FOREIGN KEY (PHONG) REFERENCES PHONGBAN (MAPHONG)

)
GO

-- BƯỚC 4 : TẠO KHÓA NGOẠI --
   -- Bảng ĐỀ ÁN có khóa ngoại tham chiếu đến bảng PHÒNG BAN --
-------------------------------------------


-- BƯỚC 5 : THÊM DỮ LIỆU --

-- Nhớ!!! KHÔNG ĐƯỢC điền thông tin trùng nhau , đặt biệt là KHÓA CHÍNH.
--        KHÔNG TẬP TRUNG -> SAI NHIỀU - nhập liệu không đúng thứ tự 
--        Dòng dữ liệu cuối cùng thì để ;
--        Thêm dữ liệu tuy dài nhưng rõ ràng - dễ sửa lỗi!!!

-- Thêm dữ liệu cho bảng nhân viên ---

INSERT INTO NHANVIEN ( HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES               (N'Nguyễn' , N'Thị', N'Hội', '001', '2000/05/20', N'Quảng Nam', 'NU', '4205', NULL, NULL );
GO

INSERT INTO NHANVIEN ( HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES               (N'Nguyễn' , N'Thị', N'Thanh Hà', '002', '1995/10/20', N'Quảng Nam', 'NU', '145', NULL , NULL); 
GO

-- thêm dữ liệu cho bảng phòng ban--

INSERT INTO PHONGBAN ( MAPHONG, TENPHONG, TRPHONG, NG_NHANCHUC )
VALUES               ('10', N'Phòng Tài Chính', '001', '2019-08-28');
GO

INSERT INTO PHONGBAN ( MAPHONG, TENPHONG, TRPHONG, NG_NHANCHUC )
VALUES               ('12',  N'Phòng Nhân Sự', '002', '2000-05-20');
GO

-- thêm dữ liệu cho bảng đề án

INSERT INTO DEAN ( TENDEAN, MADUAN, DDIEM_DUAN, PHONG )
VALUES           ( N' Nghiên cứu khoa học ', 'A00', N'Đại Lãnh', '10' );
GO

INSERT INTO DEAN ( TENDEAN, MADUAN, DDIEM_DUAN, PHONG )
VALUES           ( N'Phân tích sản phẩm', 'A01', N'Đại Lãnh', '12' );
GO

SELECT * FROM NHANVIEN
GO

SELECT * FROM PHONGBAN
GO

SELECT * FROM DEAN
GO

-- BƯỚC 6 : VIẾT CÂU TRUY VẤN ( CHƯA HỌC ) --