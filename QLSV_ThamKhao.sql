
USE MASTER
GO


CREATE DATABASE QLSV_ThamKhao
GO

USE QLSV_ThamKhao
GO

-- *** Tạo bảng
-- CREATE TABLE Tên_bảng( cột_1 [kiểu_dữ_liệu(kích thước)], cột_2 [Kiểu_dữ_liệu(kích thước)], ... cột_n [kiểu_dữ_liệu(kích thước)] )
CREATE TABLE DMKHOA
(
	MaKhoa varchar(4) NOT NULL PRIMARY KEY,
	TenKhoa nvarchar(255) 

)

CREATE TABLE DMNGANH
(
	MaNganh varchar(6) NOT NULL PRIMARY KEY,
	TenNganh nvarchar(255),
	MaKhoa varchar(4) NOT NULL 
)

CREATE TABLE DMLOP
(
	MaLop varchar(4) NOT NULL PRIMARY KEY,
	TenLop nvarchar(255),
	MaNganh varchar(6) NOT NULL,
	KhoaHoc int,
	HeDT varchar(2),
	NamNhapHoc int
)

CREATE TABLE SINHVIEN
(
	MaSV varchar(3) NOT NULL PRIMARY KEY,
	HoTen varchar(255),
	MaLop varchar(4),
	GioiTinh bit,
	NgaySinh DATE,
	DiaChi nvarchar(255)
)

CREATE TABLE DMHOCPHAN
(
	MaHP varchar(3) NOT NULL PRIMARY KEY,
	TenHP nvarchar(255),
	Sodvht int,
	MaNganh varchar(6),
	HocKy int
)

CREATE TABLE DIEMHP
(
	MaSV varchar(3) NOT NULL,
	MaHP varchar(3) NOT NULL,
	DiemHP float
	
	PRIMARY KEY(MaSV, MaHP)
)

-- 1. Thêm dữ liệu vào bảng:
--  Lệnh Insert:
--  * Ý nghĩa:
--		- Bổ sung các dòng dữ liệu vào cuối bảng.
--	* Cú pháp:
--		- INSERT INTO tên_bảng[(danh_sách_cột)]
--			VALUES(danh sách giá trị)
--    Bổ sung nhiều dòng bằng cách truy xuất dữ liệu từ các bảng dữ liệu khác.

--  INSERT INTO tên_bảng[danh_sách_cột]
--	Câu lệnh SELECT


-- Nhập dữ liêu DIEMHP --
INSERT INTO DIEMHP VALUES('002', '002', 5.9)
INSERT INTO DIEMHP VALUES('002', '003', 4.5)
INSERT INTO DIEMHP VALUES('003', '001', 4.3)
INSERT INTO DIEMHP VALUES('003', '002', 6.7)
INSERT INTO DIEMHP VALUES('003', '003', 7.3)
INSERT INTO DIEMHP VALUES('003', '004', 8.3)
INSERT INTO DIEMHP VALUES('004', '001', 4.0)
INSERT INTO DIEMHP VALUES('004', '002', 5.2)
INSERT INTO DIEMHP VALUES('004', '003', 3.5)
INSERT INTO DIEMHP VALUES('005', '001', 9.8)
INSERT INTO DIEMHP VALUES('005', '002', 7.9)
INSERT INTO DIEMHP VALUES('005', '003', 7.5)
INSERT INTO DIEMHP VALUES('006', '001', 6.1)
INSERT INTO DIEMHP VALUES('006', '002', 5.6)
INSERT INTO DIEMHP VALUES('006', '003', 4.0)
INSERT INTO DIEMHP VALUES('007', '001', 6.2)

SELECT * FROM DIEMHP
GO

-- Nhập dữ liệu DMHOCPHAN --
INSERT INTO DMHOCPHAN VALUES('001', N'Toán cao cấp A1', 4, '480202', 1)
INSERT INTO DMHOCPHAN VALUES('002', N'Tiếng Anh 1', 3, '480202', 1)
INSERT INTO DMHOCPHAN VALUES('003', N'Vật lý đại cương', 4, '480202', 1)
INSERT INTO DMHOCPHAN VALUES('004', N'Tiếng Anh 2', 7, '480202', 1)
INSERT INTO DMHOCPHAN VALUES('005', N'Tiếng Anh 1', 3, '140909', 2)
INSERT INTO DMHOCPHAN VALUES('006', N'Xác suất thống kê', 3, '140902', 2)

SELECT * FROM DMHOCPHAN
GO

-- 2. Thay đổi kiểu dữ liệu cho cột trong bảng
-- ALTER TABLE tên_bảng
-- ALTER COLUMN tên_cột_đã_có [kiểu dữ liệu_Mới]

-- 3. Thêm 1 cột mới trong bảng (Tương tự ở trên)
-- ALTER TABLE Tên_bảng
-- ALTER COLUMN tên_cột_mới [kiểu_dữ_liệu]

-- 4. Cập nhật dữ liệu cho bảng (Sửa đổi các dòng dữ liệu có sẵn)
-- UPDATE Tên_bảng
-- SET cột_1 = value_1, cột_2 = value_2, ...
-- WHERE [điều kiện]

-- Lệnh UPDATE
-- * Ý nghĩa: Cập nhật dữ liệu cho một hay nhiều cột trong bảng.
-- * Cú pháp: 
--		UPDATE tên_bảng
--		SET Tên_cột_1 = biểu_thức_1,
--			Tên_cột_2 = biểu_thức_2
--		[,..., Tên_cột_k = biểu_thức_k]
--		[FROM Danh sách bảng]
--		[WHERE điều_kiện]

-- * Lưu ý: WHERE: Chỉ cập nhật cột có dòng thỏa mãn điều kiện.
-- * Lưu ý: FROM: Dữ liệu cập nhật liên quan đến nhiều bảng.

ALTER TABLE SINHVIEN
ALTER COLUMN HoTen nvarchar(255)
GO

ALTER TABLE SINHVIEN
ALTER COLUMN GioiTinh varchar(5)
GO

ALTER TABLE SINHVIEN
ALTER COLUMN MaLop varchar(4)

GO
-- Nhập dữ liệu SINHVIEN --
INSERT INTO SINHVIEN VALUES('001', N'Phan Thanh', 'CT12', 'FALSE','1990/12/09', N'Tuy Phước')
INSERT INTO SINHVIEN VALUES('002', N'Nguyễn Thi Cẩm', 'CT12', 'TRUE','1994/12/01', N'Quy Nhơn')
INSERT INTO SINHVIEN VALUES('003', N'Võ Thị Hà', 'CT12', 'TRUE','1995/02/07', N'An Nhơn')
INSERT INTO SINHVIEN VALUES('004', N'Trần Hoài Nam', 'CT12', 'FALSE','1994/05/04', N'Tây Sơn')
INSERT INTO SINHVIEN VALUES('005', N'Trần Văn Hoàng', 'CT13', 'FALSE','1995/04/08', N'Vĩnh Thạnh')
INSERT INTO SINHVIEN VALUES('006', N'Đặng Thị Thảo', 'CT13', 'TRUE','1995/12/06', N'Quy Nhơn')
INSERT INTO SINHVIEN VALUES('007', N'Lê Thị Sen', 'CT13', 'TRUE','1994/12/08', N'Phù Cát')
INSERT INTO SINHVIEN VALUES('008', N'Nguyễn Văn Huy', 'CT11', 'FALSE','1995/04/06', N'Phù Mỹ')
INSERT INTO SINHVIEN VALUES('009', N'Trần Thi Hoa', 'CT11', 'TRUE','1994/09/08', N'Hoài Nhơn')
INSERT INTO SINHVIEN VALUES('010', N'Trần Đức Chuẩn', 'CT15', 'FALSE', '1997/05/17', N'Đồng Hới')
INSERT INTO SINHVIEN VALUES('011', N'Trần Thị Thu Hà', 'CT14', 'TRUE', '1999/10/11', N'Quảng Bình')
INSERT INTO SINHVIEN VALUES('012', N'Trần Thị Thu Hằng', 'CT12', 'TRUE', '1997/05/17', N'Quảng Bình')

--SELECT CONVERT(varchar(10), GETDATE(), 101) GO--
SELECT * FROM SINHVIEN
GO  


-- Nhập dữ liệu DMLOP --
INSERT INTO DMLOP VALUES('CT11', N'Cao đẳng tin học', '480202', 11, 'TC',2013)
INSERT INTO DMLOP VALUES('CT12', N'Cao đẳng tin học', '480202', 12, 'CĐ',2013)
INSERT INTO DMLOP VALUES('CT13', N'Cao đẳng tin học', '480202', 13, 'CĐ',2014)
INSERT INTO DMLOP VALUES('CT14', N'Cao đẳng toán tin', '140902', 13, 'CĐ',2014)
INSERT INTO DMLOP VALUES('CT15', N'Cao đẳng toán tin', '140902', 13, 'CĐ',2012)
SELECT * FROM DMLOP
GO  

-- Nhập dữ liệu DMNGANH --
INSERT INTO DMNGANH VALUES('140902', N'Sư phạm toán tin', 'SP')
INSERT INTO DMNGANH VALUES('480202', N'Tin học ứng dụng', 'CNTT')

SELECT * FROM DMNGANH
GO  

-- Nhập dữ liệu DMKHOA --
INSERT INTO DMKHOA VALUES('CNTT', N'Công nghệ thông tin')
INSERT INTO DMKHOA VALUES('KT', N'Kế toán')
INSERT INTO DMKHOA VALUES('SP', N'Sư phạm')

SELECT * FROM DMKHOA
GO 

-- *** FOREIGN kEY
-- 1. Thêm ràng buộc khóa ngoại vào cho bảng --
-- ALTER TABLE tên_bảng_tham_chiếu
-- ADD CONSTRAINT [Tên_Thay_Thế] FOREIGN KEY([Khóa_Ngoại] REFERENCES Tên_bảng_được_tham_chiếu (Khóa_chính)

ALTER TABLE DMNGANH
ADD CONSTRAINT FK_Nganh_Khoa FOREIGN KEY(MaKhoa) REFERENCES DMKHOA(MaKhoa)
Go
ALTER TABLE DMLOP
ADD CONSTRAINT FK_MLOP_Nganh FOREIGN KEY(MaNganh) REFERENCES DMNGANH(MaNganh)
Go

ALTER TABLE SINHVIEN
ADD CONSTRAINT FK_SV_Lop FOREIGN KEY(MaLop) REFERENCES DMLOP(MaLop)
Go

ALTER TABLE DIEMHP
ADD CONSTRAINT FK_Diem_SV FOREIGN KEY(MaSV) REFERENCES SINHVIEN(MaSV)

ALTER TABLE DIEMHP
ADD CONSTRAINT FK_Diem_HP FOREIGN KEY(MaHP) REFERENCES DMHOCPHAN(MaHP)

-- 2. Xóa ràng buộc khóa ngoại
-- ALTER TABLE tên_bảng_cần_xóa_khóa_ngoại
-- DROP CONSTRAINT [Tên_Thay_Thế]

---------------------------------------------------------------------------
-- *** PRIMARY KEY
-- 1. Thêm ràng buộc khóa chính vào cho bảng --
--  + Thêm 1 khóa chính
-- ALTER TABLE tên_bảng_cần_thêm_khóa_chính
-- ADD CONSTRAINT [Tên_Thay_Thế] PRIMARY KEY (Khóa_chính)

--  + Thêm 2 khóa chính
-- ALTER TABLE tên_bảng_cần_thêm_khóa_chính
-- ADD CONSTRAINT [Tên_Thay_Thế] PRIMARY KEY (Khóa_chính_1, Khóa_chính_2)

-- 2. Xóa ràng buộc khóa chính
-- ALTER TABLE tên_bảng_cần_xóa_khóa_chính
-- DROP CONSTRAINT [Tên_thay_thế]

---------------------------------------------------------------------------------

-- *** Xóa dữ liệu của dòng trong bảng hoặc xóa dữ liệu của toàn bộ bảng
--	1. Xóa dữ liệu của dòng trong bảng
--		DELETE FROM Tên_Bảng
--		WHERE [điều_kiện];
--   -> Các dòng dữ liệu khi xóa là không thể phục hồi, nên viết và thi hành câu lệnh delete thật cẩn trọng.

--	2. Xóa dữ liệu toàn bộ bảng
--		DELETE FROM Tên_Bảng
--	 -> Các dòng dữ liệu khi xóa là không thể phục hồi, nên  viết và thi hành câu lệnh delete thật cẩn trọng.

-- Lệnh DELETE
-- * Ý nghĩa: Xóa các dòng dữ liệu trong 1 bảng
-- * Cú pháp: 
--		DELETE FROM tên_bảng
--		[FROM danh_sách_bảng]
--		[WHERE điều_kiện]
-- Nếu không  có WHERE thì xóa tất cả các dòng

-------------------------------------------------------------------------------------------------
-- *** Xóa database
USE master
DROP DATABASE QLSV_ThamKhao

SELECT MASV, HOTEN, MALOP, NGAYSINH, GIOITINH, YEAR (NGAYSINH ) AS NAMSINH
FROM SINHVIEN
WHERE  HOTEN  NOT LIKE N'[NTL]%';

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
WHERE YEAR (GETDATE()) - YEAR (NGAYSINH ) IN ( '19', '20', '21' ); -- hoặc
--WHERE YEAR (GETDATE()) - YEAR (NGAYSINH ) BETWEEN 19 AND 21; 


SELECT * FROM SINHVIEN
GO