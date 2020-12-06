
	USE MASTER
	GO

	CREATE DATABASE QUANLICUAHANG
	GO

	USE QUANLICUAHANG
	GO

	-- TAO BANG --

	CREATE TABLE KHACHHANG
	(
	   MaKH         VARCHAR(6) NOT NULL,
	   TenKH        VARCHAR(50),
	   DiaChi      VARCHAR(50),
	   SoDT         VARCHAR(11),
	   MaSoThue     VARCHAR(10)
	   
	   CONSTRAINT PK_KHACHANG PRIMARY KEY ( MaKH)
	)
	GO

	CREATE TABLE PHONG
	(
	   MaPhong         VARCHAR(6) NOT NULL ,
	   SoKhachToiDa    VARCHAR(3),
	   TrangThai       VARCHAR(50),
	   MoTa            VARCHAR(50)
	   
	   CONSTRAINT PK_PHONG PRIMARY KEY ( MaPhong)
	)
	GO


	CREATE TABLE DICHVU
	(
	   MaDV           VARCHAR(5) NOT NULL,
	   TenDV          VARCHAR(50),
	   DonViTinh      VARCHAR(50),
	   DonGia         FLOAT
	    
		CONSTRAINT PK_DICHVU PRIMARY KEY ( MaDV)
	)
	GO

	CREATE TABLE MUCTIENGIO
	(
	   MaTienGio      VARCHAR(5) NOT NULL,
	   DonGia         FLOAT,
	   MoTa           VARCHAR(50)
	   
	   CONSTRAINT PK_MUCTIENGIO PRIMARY KEY (MaTienGio )
	)
	GO

	CREATE TABLE HOADON
	(
	   MaHD                  VARCHAR(6) NOT NULL,
	   MaKH                  VARCHAR(6),
	   MaPhong               VARCHAR(6),
	   MaTienGio             VARCHAR(5),
	   ThoiGianBatDauSD      DATETIME,
	   ThoiGianKetThucSD     DATETIME,
	   TrangThaiHD           VARCHAR(50)
	   
	   CONSTRAINT PK_HOADON PRIMARY KEY (MaHD)
	)
	GO

	CREATE TABLE CHITIET_SUDUNGDV
	(
	   MaHD        VARCHAR(6) NOT NULL,
	   MaDV        VARCHAR(5) NOT NULL,
	   SoLuong     INT
	   
	   CONSTRAINT PK_CHITIET_SUDUNGDV PRIMARY KEY( MaHD, MaDV )   
	)
	GO

	ALTER TABLE CHITIET_SUDUNGDV
	ALTER COLUMN SoLuong INT
	GO

	ALTER TABLE table_name
	ALTER COLUMN column_name datatype
					-- THÊM DỮ LIỆU --

	-- BẢNG KHÁCH HÀNG --
	 
	INSERT INTO KHACHHANG VALUES ( 'KH001', 'Tran Van Nam',       'Hai Chau',   '0905123456', '12345678')
	INSERT INTO KHACHHANG VALUES ( 'KH002', 'Nguyen Mai Anh',     'Lien Chieu', '0905123457', '12345679')
	INSERT INTO KHACHHANG VALUES ( 'KH003', 'Phan Hoai Lan Khue', 'Hoa Vang',   '0905123458', '12345680')
	INSERT INTO KHACHHANG VALUES ( 'KH004', 'Nguyen Hoai Nguyen', 'Hoa Cam',    '0905123459', '12345681')
	INSERT INTO KHACHHANG VALUES ( 'KH005', 'Le Truong Ngoc Anh', 'Hai Chau',   '0905123460', '12345682')
	INSERT INTO KHACHHANG VALUES ( 'KH006', 'Ho Hoai Anh',        'Hai Chau',   '0905123461', '12345683')
	INSERT INTO KHACHHANG VALUES ( 'KH007', 'Pham Thi Huong',     'Son Tra',    '0905123462', '12345684')
	INSERT INTO KHACHHANG VALUES ( 'KH008', 'Chau Trinh Tri',     'Hai Chau',   '0905123463', '12345685')
	INSERT INTO KHACHHANG VALUES ( 'KH009', 'Phan Nhu Thao',      'Hoa Khanh',  '0905123464', '12345686')
	INSERT INTO KHACHHANG VALUES ( 'KH010', 'Tran Thi To Tam',    'Son Tra',    '0905123465', '12345687')
	GO

	-- BẢNG PHONG --

	INSERT INTO PHONG VALUES ( 'VIP01', '5',  'Duoc su dung', 'phong vip')
	INSERT INTO PHONG VALUES ( 'P02',   '10', 'Duoc su dung', 'phong binh thuong')
	INSERT INTO PHONG VALUES ( 'P03',   '15', 'Duoc su dung', 'phong binh thuong')
	INSERT INTO PHONG VALUES ( 'VIP04', '20', 'Duoc su dung', 'phong vip')
	INSERT INTO PHONG VALUES ( 'P05',   '25', 'Duoc su dung', 'phong binh thuong')
	INSERT INTO PHONG VALUES ( 'P06',   '30', 'Duoc su dung', 'phong binh thuong')
	INSERT INTO PHONG VALUES ( 'VIP07', '35', 'Duoc su dung', 'phong vip')
	INSERT INTO PHONG VALUES ( 'P08',   '40', 'Duoc su dung', 'phong binh thuong')
	INSERT INTO PHONG VALUES ( 'VIP09', '45', 'Duoc su dung', 'phong vip')
	INSERT INTO PHONG VALUES ( 'P10',   '50', 'Duoc su dung', 'phong binh thuong')
	GO

	-- BẢNG DỊCH VỤ --

	INSERT INTO DICHVU VALUES ( 'DV01', 'Hat Dua',  'Bao', 5.000 )
	INSERT INTO DICHVU VALUES ( 'DV02', 'Trai cay', 'Dia', 30.000 )
	INSERT INTO DICHVU VALUES ( 'DV03', 'Bia',      'Lon', 35.000 )
	INSERT INTO DICHVU VALUES ( 'DV04', 'Nuoc ngot','Chai', 10.000 )
	INSERT INTO DICHVU VALUES ( 'DV05', 'Ruou',     'Chai', 200.000 )
	GO

	-- BẢNG MỤC TIỀN GIỜ --

	INSERT INTO MUCTIENGIO VALUES ( 'MT01', 60.000,  'Ap dung tu 6h den 17 gio')
	INSERT INTO MUCTIENGIO VALUES ( 'MT02', 80.000,  'Ap dung sau 17 gio den 22 gio')
	INSERT INTO MUCTIENGIO VALUES ( 'MT03', 100.000, 'Ap dung tu sau 22 gio den 6 gio sang')
	GO

	-- BẢNG HÓA ĐƠN --

	INSERT INTO HOADON VALUES ( 'HD001', 'KH001', 'VIP01', 'MT01', '11/20/2015 8:15',  '11/20/2015 12:30', 'Da thanh toan')
	INSERT INTO HOADON VALUES ( 'HD002', 'KH002', 'P02',   'MT01', '12/12/2015 13:10', '12/12/2015 17:20', 'Chua thanh toan')
	INSERT INTO HOADON VALUES ( 'HD003', 'KH001', 'P02',   'MT01', '10/15/2014 12:12', '10/15/2014 16:30', 'Da thanh toan')
	INSERT INTO HOADON VALUES ( 'HD004', 'KH003', 'VIP01', 'MT02', '9/20/2015  18:30', '9/20/2015  21:00', 'Chua thanh toan')
	INSERT INTO HOADON VALUES ( 'HD005', 'KH001', 'P03',   'MT02', '11/25/2014 20:00', '11/25/2014 21:45', 'Thanh toan mot phan')
	INSERT INTO HOADON VALUES ( 'HD006', 'KH002', 'VIP01', 'MT01', '9/12/2014  9:20',  '9/12/2014  10:45', 'Da thanh toan')
	INSERT INTO HOADON VALUES ( 'HD007', 'KH006', 'VIP04', 'MT01', '12/22/2014 11:00', '12/22/2014 14:20', 'Da thanh toan')
	INSERT INTO HOADON VALUES ( 'HD008', 'KH007', 'VIP04', 'MT02', '8/23/2014  20:10', '8/23/2014  22:00', 'Chua thanh toan')
	INSERT INTO HOADON VALUES ( 'HD009', 'KH006', 'P05',   'MT03', '12/20/2015 22:30', '12/21/2015 1:15',  'Chua thanh toan')
	INSERT INTO HOADON VALUES ( 'HD010', 'KH005', 'VIP01', 'MT03', '10/10/2015 1:30',  '10/10/2015 3:15',  'Da thanh toan')
	INSERT INTO HOADON VALUES ( 'HD011', 'KH004', 'VIP07', 'MT03', '12/25/2015 22:15', '12/26/2015 2:00',  'Da thanh toan')
	INSERT INTO HOADON VALUES ( 'HD012', 'KH008', 'P06',   'MT03', '7/25/2014  23:45', '7/26/2015  2:15',  'Da thanh toan')
	INSERT INTO HOADON VALUES ( 'HD013', 'KH007', 'VIP07', 'MT02', '8/21/2015  18:15', '8/21/2015  20:45', 'Da thanh toan')
	INSERT INTO HOADON VALUES ( 'HD014', 'KH004', 'P06',   'MT02', '12/31/2015 19:12', '12/31/2015 21:15', 'Thanh toan mot phan')
	INSERT INTO HOADON VALUES ( 'HD015', 'KH001', 'P06',   'MT01', '6/24/2014  13:00', '6/24/2014  13:15', 'Thanh toan mot phan')
	INSERT INTO HOADON VALUES ( 'HD016', 'KH003', 'P08',   'MT01', '5/12/2014  8:00',  '5/12/2014  10:45', 'Thanh toan mot phan')
	INSERT INTO HOADON VALUES ( 'HD017', 'KH003', 'VIP09', 'MT01', '11/20/2015 12:15', '11/20/2015 14:20', 'Da thanh toan')
	INSERT INTO HOADON VALUES ( 'HD018', 'KH001', 'P10',   'MT01', '4/12/2015  14:45', '4/12/2015  16:45', 'Da thanh toan')
	INSERT INTO HOADON VALUES ( 'HD019', 'KH002', 'VIP09', 'MT03', '11/12/2015 22:15', '11/13/2015 2:00',  'Da thanh toan')
	INSERT INTO HOADON VALUES ( 'HD020', 'KH004', 'VIP09', 'MT03', '2/25/2014  1:15',  '2/25/2014  4:15',  'Chua thanh toan')
	GO

	-- BẢNG CHI TIẾT - SỦ DỤNG DỊCH VỤ --

	INSERT INTO CHITIET_SUDUNGDV VALUES ( 'HD001', 'DV01', '5')
	INSERT INTO CHITIET_SUDUNGDV VALUES ( 'HD002', 'DV01', '8')
	INSERT INTO CHITIET_SUDUNGDV VALUES ( 'HD002', 'DV02', '5')
	INSERT INTO CHITIET_SUDUNGDV VALUES ( 'HD002', 'DV03', '2')
	INSERT INTO CHITIET_SUDUNGDV VALUES ( 'HD003', 'DV04', '1')
	INSERT INTO CHITIET_SUDUNGDV VALUES ( 'HD003', 'DV05', '6')
	INSERT INTO CHITIET_SUDUNGDV VALUES ( 'HD004', 'DV01', '5')
	INSERT INTO CHITIET_SUDUNGDV VALUES ( 'HD005', 'DV02', '3')
	INSERT INTO CHITIET_SUDUNGDV VALUES ( 'HD005', 'DV03', '10')
	INSERT INTO CHITIET_SUDUNGDV VALUES ( 'HD005', 'DV04', '2')
	INSERT INTO CHITIET_SUDUNGDV VALUES ( 'HD006', 'DV01', '5')
	INSERT INTO CHITIET_SUDUNGDV VALUES ( 'HD007', 'DV03', '8')
	INSERT INTO CHITIET_SUDUNGDV VALUES ( 'HD007', 'DV04', '10')
	INSERT INTO CHITIET_SUDUNGDV VALUES ( 'HD007', 'DV05', '4')
	INSERT INTO CHITIET_SUDUNGDV VALUES ( 'HD013', 'DV02', '9')
	INSERT INTO CHITIET_SUDUNGDV VALUES ( 'HD011', 'DV02', '8')
	GO



			   -- TẠO KHÓA NGOẠI --

	--  tạo khóa ngoại tham chiếu đến bảng KHACHHANG --

	ALTER TABLE HOADON
	ADD CONSTRAINT FK_HD_KHACHHANG FOREIGN KEY (MaKH) REFERENCES KHACHHANG (MaKH)
	GO

	--  tạo khóa ngoại tham chiếu đến bảng PHONG --

	ALTER TABLE HOADON
	ADD CONSTRAINT FK_HD_PHONG FOREIGN KEY (MaPhong) REFERENCES PHONG (MaPhong)
	GO

	--  tạo khóa ngoại tham chiếu đến bảng MUCTIENGIO

	ALTER TABLE HOADON
	ADD CONSTRAINT FK_HD_MUCTIENGIO FOREIGN KEY (MaTienGio) REFERENCES MUCTIENGIO (MaTienGio)
	GO

	--  tạo khóa ngoại tham chiếu đến bảng HOADON

	ALTER TABLE CHITIET_SUDUNGDV
	ADD CONSTRAINT FK_CTSDDV_HOADON FOREIGN KEY ( MaHD) REFERENCES HOADON ( MaHD)
	GO

	--  tạo khóa ngoại tham chiếu đến bảng DICHVU

	ALTER TABLE CHITIET_SUDUNGDV
	ADD CONSTRAINT FK_CTSDDV_DICHVU FOREIGN KEY (MaDV) REFERENCES DICHVU (MaDV)
	GO

	SELECT * FROM KHACHHANG
	GO

	SELECT * FROM HOADON
	GO

	SELECT * FROM PHONG
	GO

	SELECT * FROM DICHVU
	GO

	SELECT * FROM MUCTIENGIO
	GO

	SELECT * FROM CHITIET_SUDUNGDV
	GO

	 --    ==========================================================    --
	 
	 USE QUANLICUAHANG
	 GO

	-- Câu 3: Liệt kê những phòng karaoke chứa được số lượng tối đa dưới 20 khách--

	SELECT MaPhong FROM PHONG
	WHERE SoKhachToiDa < 20
	GO

	-- Câu 4: Câu 4: Liệt kê thông tin của các dịch vụ có đơn vị tính là "Chai" với đơn giá nhỏ hơn 20.000
	-- VNĐ và các dịch vụ có đơn vị tính là "Lon" với đơn giá lớn hơn 30.000 VNĐ --

	SELECT * FROM DICHVU
	WHERE ( DonViTinh = 'Chai' and DonGia < 20.000 ) OR ( DonViTinh = 'Lon' AND DonGia > 30.000 )
	GO

	-- Câu 5: Liệt kê thông tin của các phòng karaoke có mã phòng bắt đầu bằng cụm từ "VIP"

	SELECT * FROM PHONG
	WHERE MaPhong LIKE 'VIP%'
	GO

	/* Câu 6: Liệt kê thông tin của toàn bộ các dịch vụ, yêu cầu sắp xếp giảm dần theo đơn giá (0.5
	điểm) */

	SELECT * FROM DICHVU
	ORDER BY DonGia DESC
	GO

	/* Câu 7: Đếm số hóa đơn có trạng thái là "Chưa thanh toán" và có thời gian bắt đầu sử
	dụng nằm trong ngày hiện tại (0.5 điểm) */

	SELECT COUNT ( MAHD ) AS N'Số hóa đơn' FROM HOADON
	WHERE  TrangThaiHD = ' Chua thanh toan'  AND DAY(ThoiGianBatDauSD) = DAY(GETDATE())
	GO

	/* Câu 8: Liệt kê địa chỉ của toàn bộ các khách hàng với yêu cầu mỗi địa chỉ được liệt kê một
	lần duy nhất (0.5 điểm) */

	SELECT DISTINCT DiaChi
	FROM KHACHHANG
	GO

	/* Câu 9: Liệt kê MaHD, MaKH, TenKH, DiaChi, MaPhong, DonGia (Tiền giờ),
	ThoiGianBatDauSD, ThoiGianKetThucSD của tất cả các hóa đơn có trạng thái là "Đã thanh
	toán" */

	SELECT HOADON.MaHD, KHACHHANG.MaKH, TenKH,DiaChi, HOADON.MaPhong, MUCTIENGIO.DonGia, ThoiGianBatDauSD, ThoiGianKetThucSD
	FROM KHACHHANG
		 INNER JOIN HOADON ON KHACHHANG.MaKH = HOADON.MaHD
		 INNER JOIN MUCTIENGIO ON HOADON.MaTienGio = MUCTIENGIO.MaTienGio
	WHERE TrangThaiHD = 'Da thanh toan '
	GROUP BY HOADON.MaHD, KHACHHANG.MaKH, TenKH , DiaChi, HOADON.MaPhong, MUCTIENGIO.DonGia, ThoiGianBatDauSD, ThoiGianKetThucSD
	GO
	     
	 /* Câu 10: Liệt kê MaKH, TenKH, DiaChi, MaHD, TrangThaiHD của tất cả các hóa đơn với
	yêu cầu những khách hàng chưa từng có một hóa đơn nào thì cũng liệt kê thông tin
	những khách hàng đó ra (0.5 điểm) */

	SELECT KHACHHANG.MaKH , TenKH, DiaChi, HOADON.MaHD, TrangThaiHD
	FROM KHACHHANG
		 FULL OUTER JOIN HOADON ON KHACHHANG.DiaChi = HOADON.MaKH
	GO

	/* Câu 11: Liệt kê thông tin của các khách hàng đã từng sử dụng dịch vụ "Trái cây" hoặc từng
	sử dụng phòng karaoke có mã phòng là "VIP07" (0.5 điểm) */

	SELECT HOADON.MaKH, DICHVU.TenDV , HOADON.MaPhong
	FROM HOADON
		 INNER JOIN CHITIET_SUDUNGDV ON HOADON.MaHD = CHITIET_SUDUNGDV.MaHD
		 INNER JOIN DICHVU ON CHITIET_SUDUNGDV.MaDV = DICHVU.MaDV
	     
	WHERE TenDV = 'Trai cay' OR HOADON.MaPhong IN ( 'VIP07')
	GO

	/* Câu 12: Liệt kê thông tin của các khách hàng chưa từng sử dụng dịch vụ hát karaoke lần nào
	cả (0.5 điểm) */

	SELECT * FROM KHACHHANG
	         
	WHERE KHACHHANG.MaKH NOT IN (SELECT HOADON.MaKH FROM HOADON)
	GO


	/* Câu 13: Liệt kê thông tin của các khách hàng đã từng sử dụng dịch vụ hát karaoke và chưa
	từng sử dụng dịch vụ nào khác kèm theo (0.5 điểm) */

	SELECT * FROM KHACHHANG
	WHERE MaKH IN (SELECT MaKH FROM HOADON) 
	  AND MaKH NOT IN (SELECT KHACHHANG.MaKH FROM KHACHHANG 
	  JOIN HOADON ON KHACHHANG.MaKH = HOADON.MaKH 
	  JOIN CHITIET_SUDUNGDV ON HOADON.MaHD = CHITIET_SUDUNGDV.MaHD )
	GO

	/* Câu 14: Liệt kê thông tin của những khách hàng đã từng hát karaoke vào năm "2014" nhưng
	chưa từng hát karaoke vào năm "2015" (0.5 điểm) */

	 

	SELECT * FROM KHACHHANG
	WHERE MaKH IN ( SELECT MaKH FROM HOADON WHERE YEAR( ThoiGianBatDauSD ) = '2014' )
	 AND  MaKH NOT IN ( SELECT MaKH FROM HOADON WHERE YEAR ( ThoiGianBatDauSD ) = '2015' )
	 GO
	 

	 

	/* Câu 15: Hiển thị thông tin của những khách hàng có số lần hát karaoke nhiều nhất tính từ
	đầu năm 2014 đến hết năm 2014 (0.5 điểm) */

	 

	SELECT * FROM KHACHHANG
	WHERE MaKH IN ( SELECT TOP 1 MaKH FROM HOADON WHERE YEAR ( ThoiGianBatDauSD ) = '2014'  AND YEAR ( ThoiGianKetThucSD) = '2014')
	GO

	 


	/* Câu 16: Đếm tổng số lượng loại dịch vụ đã được sử dụng trong năm 2014 với yêu cầu chỉ
	thực hiện tính đối với những loại dịch vụ có đơn giá từ 50.000 VNĐ trở lên (0.5 điểm) */

	 

	SELECT COUNT(DICHVU.MaDV) AS N' Tổng dịch vụ sử dụng' 
	FROM DICHVU  
			  INNER JOIN CHITIET_SUDUNGDV ON DICHVU.MaDV = CHITIET_SUDUNGDV.MaDV 
			  INNER JOIN HOADON ON CHITIET_SUDUNGDV.MaHD = HOADON.MaHD 
	WHERE  YEAR(ThoiGianBatDauSD) = '2014' AND DonGia > 50.000
	GO

	 


	/* Câu 17: Liệt kê MaKH, TenKH, MaSoThue của khách hàng có địa chỉ là "Hải Châu" và
	chỉ mới hát karaoke một lần duy nhất, kết quả được sắp xếp giảm dần theo TenKH (0.5
	điểm) */

	 

	SELECT KHACHHANG.MaKH, KHACHHANG.TenKH, MaSoThue, COUNT (KHACHHANG.MaKH) AS N' Số lần hát Karaoke ' 
	FROM KHACHHANG
		 INNER JOIN HOADON ON KHACHHANG.MaKH = HOADON.MaKH
		 INNER JOIN CHITIET_SUDUNGDV ON HOADON.MaHD = CHITIET_SUDUNGDV.MaHD
	WHERE DiaChi = 'Hai Chau' AND SoLuong ='1' 
	GROUP BY  TenKH ,KHACHHANG.DiaChi, KHACHHANG.MaKH , MaSoThue
	ORDER BY TenKH DESC
	GO

	 


	/* Câu 18: Cập nhật cột TrangThaiHD trong bảng HOADON thành giá trị "Đã hết hạn" đối với
	những khách hàng có địa chỉ là "Hải Châu" và có ThoiGianKetThucSD trước ngày
	31/12/2015 (0.5 điểm) */

	 
	-- Câu 1, tạo bảng kết quả gồm các cột MaHD, TenKH, tổng số lần sử dụng dịch vụ, sắp xết giảm dần theo MaHD
	-- ht003 tổng số dv là 2, số lượng là 3.

	SELECT HOADON.MaHD , TenKH , SUM(SoLuong) AS N'Tổng số lượng DV', COUNT(CHITIET_SUDUNGDV.MaDV) AS N'Tổng số DV'
	FROM KHACHHANG
		 INNER JOIN HOADON ON KHACHHANG.MaKH = HOADON.MaKH
		 INNER JOIN CHITIET_SUDUNGDV ON HOADON.MaHD = CHITIET_SUDUNGDV.MaHD
	     
	GROUP BY HOADON.MaHD, TenKH
	ORDER BY MaHD DESC
	GO

	-- Câu 2, Liệt kê MaKH, TenKH,  số lần hát karaoke với yêu cầu khách hàng chưa từng sử dụng cũng được liệt kê.

	SELECT KHACHHANG.MaKH , TenKH , COUNT(KHACHHANG.MaKH) AS N'Số lần hát Karaoke'
	FROM  KHACHHANG
		  LEFT JOIN HOADON ON KHACHHANG.MaKH = HOADON.MaKH
		  FULL OUTER JOIN CHITIET_SUDUNGDV ON HOADON.MaHD = CHITIET_SUDUNGDV.MaHD
	GROUP BY KHACHHANG.MaKH , TenKH 
	GO

	-- câu 3. Cho biết các mã hóa đơn mà có số lượng dịch vụ là cao nhất và cao thứ 2

	SELECT TOP 2 CHITIET_SUDUNGDV.MaHD, SUM(SoLuong) AS N'Số lượng DV cao nhất'
	FROM CHITIET_SUDUNGDV
		 INNER JOIN HOADON ON CHITIET_SUDUNGDV.MaHD = HOADON.MaHD
	GROUP BY CHITIET_SUDUNGDV.MaHD
	ORDER BY SUM(SoLuong) DESC
	GO



	-- câu 4. 