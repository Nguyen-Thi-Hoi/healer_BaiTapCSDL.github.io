
	USE master
	GO

	CREATE DATABASE QuanLiDauTuVon
	GO

	USE QuanLiDauTuVon
	GO

	CREATE TABLE LOAIHINHKD
	(
	MaLoaiHinh    VARCHAR(5) NOT NULL,
	TenLoaiHinh   NVARCHAR(100),
	QuyMo         NVARCHAR(100),
	LinhVuc       NVARCHAR(100)

	CONSTRAINT PK_LOAIHINHKD PRIMARY KEY ( MaLoaiHinh)
	)
	GO

	CREATE TABLE THANHVIEN
	(
	MaTV          VARCHAR(6) NOT NULL,
	MaLoaiHinh    VARCHAR(5),
	TenTV         NVARCHAR(100),
	DiaChi        NVARCHAR(50),
	SoDienThoai   VARCHAR(11),
	NgaySinh      DATE,
	GioiTinh      NVARCHAR(5)

	CONSTRAINT PK_THANHVIEN PRIMARY KEY ( MaTV)
	CONSTRAINT CK_THANHVIEN_GioiTinh CHECK ( GioiTinh IN (N'Nam' , N'Nữ') )
	)
	GO


	CREATE TABLE NHANVIEN
	(
	MaNV          VARCHAR(6) NOT NULL,
	TenNV         NVARCHAR(100),
	NgaySinh      DATE,
	DiaChi        NVARCHAR(50),
	ViTri         NVARCHAR(50)

	CONSTRAINT PK_NHANVIEN PRIMARY KEY (MaNV)
	)
	GO

	CREATE TABLE LOAIDUAN
	(
	MaLoaiDuAn    VARCHAR(6) NOT NULL,
	TenLoaiDuAn   NVARCHAR(50),
	MoTa          NVARCHAR(100)

	CONSTRAINT PK_LOAIDUAN PRIMARY KEY (MaLoaiDuAn)  
	)
	GO

	CREATE TABLE DUAN
	(
	MaDuAn             VARCHAR(6) NOT NULL,
	MaTVDang           VARCHAR(6),
	MaLoaiDuAn         VARCHAR(6),
	TenDuAn            NVARCHAR(100),
	NoiDung            NVARCHAR(255),
	NgayDang           DATE,
	NgayHetHan         DATE,
	ThoiGianThucHien   INT,
	CongNghe           NVARCHAR(100),
	ChiPhiYeuCau       FLOAT

	CONSTRAINT PK_DUAN PRIMARY KEY (MaDuAn)
	)
	GO

	CREATE TABLE DANGKYDAUTU
	(
	MaDuAn             VARCHAR(6) NOT NULL,
	MaTVDauTu          VARCHAR(6) NOT NULL,
	MaNVPheDuyet       VARCHAR(6),
	ChiPhiDauTu        FLOAT,
	NgayDKDauTu        DATE,
	PhanTram           INT,
	TrangThaiPheDuyet  NVARCHAR(50)

	CONSTRAINT PK_DANGKYDAUTU PRIMARY KEY ( MaDuAn, MaTVDauTu)
	)
	GO

		  -- Thêm dữ liệu MaLoaiHinh --

	INSERT INTO LOAIHINHKD VALUES ('LH01', N'Cá nhân',             N'1 người',            N'Công nghệ thông tin hoặc khác')
	INSERT INTO LOAIHINHKD VALUES ('LH02', N'Nhóm phát triển',     N'2 đến 5 người',      N'Công nghệ thông tin hoặc khác')
	INSERT INTO LOAIHINHKD VALUES ('LH03', N'Công ty TNHH',        N'2 đến 50 người',     N'Công nghệ thông tin hoặc khác')
	INSERT INTO LOAIHINHKD VALUES ('LH04', N'Doanh nghiệp tư nhân',N'cá nhân làm chủ',    N'Công nghệ thông tin hoặc khác')
	INSERT INTO LOAIHINHKD VALUES ('LH05', N'Công ty cổ phần',     N'từ 3 người trở lên', N'Công nghệ thông tin hoặc khác')
	GO

		  -- Thêm dữ liệu THANHVIEN -- 
	      
	INSERT INTO THANHVIEN VALUES ('TV001', 'LH01', N'Trần Nguyên Hà',   N'Liên Chiểu', '0905366322', '1982/11/7',  N'Nam')
	INSERT INTO THANHVIEN VALUES ('TV002', 'LH02', N'Phan Bá Như',      N'Sơn Trà',    '0932568956', '1980/11/10', N'Nữ')
	INSERT INTO THANHVIEN VALUES ('TV003', 'LH03', N'Nguyễn Thanh Hải', N'Hòa Xuân',   '0165874121', '1975/03/15', N'Nữ')
	INSERT INTO THANHVIEN VALUES ('TV004', 'LH04', N'Nguyễn Hoàng Nam', N'Hải Nam',    '0906855685', '1980/04/10', N'Nam')
	INSERT INTO THANHVIEN VALUES ('TV005', 'LH05', N'Phạm Như Hoàng',   N'Hải Châu',   '0963258452', '1965/12/20', N'Nam')
	GO

		  -- Thêm dữ liệu NHANVIEN -- 
	   
	INSERT INTO NHANVIEN VALUES ('NV001', N'Nguyễn Hoài',      '1981/5/20',  N'Hòa Xuân', N'sale')
	INSERT INTO NHANVIEN VALUES ('NV002', N'Trần Thanh Duyên', '1975/11/23', N'Sơn Trà',  N' marketing ')
	INSERT INTO NHANVIEN VALUES ('NV003', N'Mai Quang Dũng',   '1980/3/21',  N'Hòa Cầm',  N'sale')
	INSERT INTO NHANVIEN VALUES ('NV004', N'Trần Anh',        '1980/3/25',  N'Cẩm Lệ',   N' marketing ')
	INSERT INTO NHANVIEN VALUES ('NV005', N'Hoàng Hải',       '1987/12/30', N'Sơn Trà',  N'sale')
	GO


		  -- Thêm dữ liệu LOAIDUAN -- 
	      
	INSERT INTO LOAIDUAN VALUES ('LDA01', N'Giáo dục',   N'Liên quan giáo dục , thư viện')
	INSERT INTO LOAIDUAN VALUES ('LDA02', N'Thương mại', N'Liên quan lĩnh vực mua bán trực tuyến')
	INSERT INTO LOAIDUAN VALUES ('LDA03', N'Kế toán',    N'Liên quan đến các hệ thống doanh nghiệp')
	INSERT INTO LOAIDUAN VALUES ('LDA04', N'Điện tử',    N'Tin học hóa, số hóa các thiết bị điện tử')
	GO

		  -- Thêm dữ liệu DUAN -- 
	       
	INSERT INTO DUAN VALUES ('DA001', 'TV002', 'LDA02' , N'Môi giới kết hôn',                                   N'Hỗ trợ tư vấn và tìm bạn bốn phương cho những người có nhu cầu muốn kết bạn',                                                   '2015/10/4', '2015/12/20', 1, N'Java, Spring framework, HTML, CSS, Javascript', 20000000)
	INSERT INTO DUAN VALUES ('DA002', 'TV003', 'LDA01' , N'Hỗ trợ luyện thi ĐH',                                N'Cho phép học sinh đăng ký thi thử các môn Toán, Lý, Hóa',                                                                       '2015/8/20', '2015/8/20',  2, N'PHP, Cake framework, HTML, CSS, Jqueryt',       10000000)
	INSERT INTO DUAN VALUES ('DA003', 'TV002', 'LDA03' , N'Phần mềm tính lương cho nhân viên tại doanh nghiệp', N'Cho phép các doanh nghiệp sử dụng hệ thống tính lương cho nhân viên một cách nhanh chóng, tin học hóa các quy trình tính toán', '2016/3/2',  '2015/4/5',   1, N'Java, Struts framework, AJAX, SQL Server 2008', 100000000)
	GO

	SELECT * FROM DUAN
	GO
		  -- Thêm dữ liệu DANGKYDAUTU -- 
	      
	INSERT INTO DANGKYDAUTU VALUES ('DA001', 'TV004', 'NV001', 5000000  , '2015/10/20', 10, N'Đã duyệt')  
	INSERT INTO DANGKYDAUTU VALUES ('DA001', 'TV003', 'NV001', 15000000 , '2015/11/1',  20, N'Chưa duyệt')
	INSERT INTO DANGKYDAUTU VALUES ('DA002', 'TV005', 'NV002', 10000000 , '2015/9/10',  30, N'Chưa duyệt')
	INSERT INTO DANGKYDAUTU VALUES ('DA003', 'TV002', 'NV003', 50000000 , '2016/03/03', 50, N'Chưa duyệt')
	GO

	SELECT * FROM DANGKYDAUTU
	GO

	--TAO KHOA NGOAI --

	ALTER TABLE DUAN
	ADD CONSTRAINT FK_DUAN_THANHVIEN FOREIGN KEY (MaTVDang) REFERENCES THANHVIEN (MaTV)
	GO

	ALTER TABLE DUAN
	ADD CONSTRAINT FK_DUAN_LOAIDUAN FOREIGN KEY (MaLoaiDuAn) REFERENCES LOAIDUAN (MaLoaiDuAn)
	GO

	ALTER TABLE DANGKYDAUTU
	ADD CONSTRAINT FK_DKDT_THANHVIEN FOREIGN KEY (MaTVDauTu) REFERENCES THANHVIEN (MaTV)
	GO

	ALTER TABLE DANGKYDAUTU
	ADD CONSTRAINT FK_DKDT_NHANVIEN FOREIGN KEY (MaNVPheDuyet) REFERENCES NHANVIEN (MaNV)
	GO

	ALTER TABLE THANHVIEN
	ADD CONSTRAINT FK_TV_LOAIHINHKD FOREIGN KEY (MaLoaiHinh) REFERENCES LOAIHINHKD (MaLoaiHinh)
	GO

	ALTER TABLE DANGKYDAUTU
	ADD CONSTRAINT FK_DKDT_DUAN FOREIGN KEY (MaDuAn) REFERENCES DUAN (MaDuAn)
	GO








	-- TRUY VẤN --

	-- Câu 1: Liệt kê thông tin toàn bộ dự án --

	SELECT * FROM DUAN
	GO

	-- Câu 2: Xóa toàn bộ thành viên thuộc loại hình kinh doanh có tên loại hình là 'công ty cổ phần' --

	DELETE LOAIHINHKD
	WHERE TenLoaiHinh = 'Công ty cổ phần'
	GO

	SELECT * FROM LOAIHINHKD
	GO

	/* Câu 3: Cập nhật giá trị trên cột ViTri của bảng Nhân Viên thành 'Tư vấn viên' đối với những vị trí có giá trị là 'Sale' */

	UPDATE NHANVIEN
	SET ViTri = N'Tư vấn viên'
	WHERE ViTri = 'Sale'
	GO

	SELECT * FROM NHANVIEN
	GO

	/* Câu 4: Liệt kê thông tin của những thành viên ở địa chỉ là 'Liên chiểu' có giới tính là 'Nữ' và 
	những thành viên ở địa chỉ là 'Sơn Trà', có giới tính là 'Nam'. */

	
	SELECT * FROM THANHVIEN
	WHERE (DiaChi = N'Liên Chiểu' AND GioiTinh = N'Nữ') AND ( DiaChi = N'Sơn Trà' AND GioiTinh = N'Nam')
	GO

	/* Câu 5: Liệt kê những thành viên có tên bắt đầu không phải là các ký tự 'T', 'K', 'H' và có độ dài là 6 ký tự. */

	SELECT * FROM THANHVIEN
	WHERE (TenTV NOT LIKE N'[TKH]%') AND ( LEN(TenTV) = 6 )
	GO

	SELECT * FROM THANHVIEN
	GO

	/* Câu 6: Liệt kê thông tin toàn bộ dự án, sắp xếp giảm dần theo chi phí yêu cầu và tăng dần theo ngày đăng dự án*/

	SELECT * FROM DUAN
	ORDER BY ChiPhiYeuCau DESC , NgayDang ASC
	GO

	/* Câu 7: Đếm số dự án đã đăng tương ứng theo từng thành viên, chỉ đếm những dự án có thời gian thực hiện
	lớn hơn 1 tháng và dự án đó đã được đăng trong năm 2015.*/

	SELECT COUNT(DUAN.MaTVDang) AS N'Số dự án đã đăng' FROM DUAN
	WHERE ThoiGianThucHien > 1 AND YEAR(NgayDang) = '2015'
	GO

	/* Câu 8: Liệt kê MaDuAn, TenDuAn, ChiPhiDauTu, PhanTram, TrangThaiPheDuyet của các lần đăng ký đầu tư dự án 
	từ ngày 20/1/2015 đến ngày 30/12/2015 với phần trăm (PhanTram) lợi nhuận sau khi hoàn thành là nhỏ hơn 10%. 
	Liệt kê 5 dòng đầu tiên tìm được.*/

	SELECT DUAN.MaDuAn, TenDuAn, ChiPhiDauTu, PhanTram, TrangThaiPheDuyet 
	FROM DUAN
	 INNER JOIN DANGKYDAUTU ON DUAN.MaDuAn = DANGKYDAUTU.MaDuAn
	WHERE ( NgayDKDauTu BETWEEN '2015/1/20' AND '2015/12/30' ) AND  ( PhanTram < 10 )
	GO

	/* Câu 9: Liệt kê toàn bộ tên thành viên (tên nào giống nhau thì chỉ liệt kê một lần).*/

	SELECT DISTINCT THANHVIEN.TenTV 
	FROM THANHVIEN
	GO

	/* Câu 10: Liệt kê MaDuAn, TenDuAn, TenTV, TenLoaiHinh, TenLoaiDuAn, NgayDang, NgayHetHan, ChiPhiYeuCau, ThoiGianThucHien 
	(của tất cả các lần thành viên đăng dự án)*/

	SELECT DUAN.MaDuAn ,TenDuAn, TenTV, TenLoaiHinh, TenLoaiDuAn, NgayDang, NgayHetHan, ChiPhiYeuCau, ThoiGianThucHien
	FROM LOAIHINHKD
	 INNER JOIN THANHVIEN ON LOAIHINHKD.MaLoaiHinh = THANHVIEN.MaLoaiHinh
	 FULL OUTER JOIN DUAN ON THANHVIEN.MaTV = DUAN.MaTVDang
	 INNER JOIN LOAIDUAN ON DUAN.MaLoaiDuAn = LOAIDUAN.MaLoaiDuAn

	GO

	/* Câu 11: Liệt kê MaDuAn, TenDuAn, TenTVDauTu, TenLoaiHinh, TenNV của các lần đăng ký đầu tư 
	(chính là các bản ghi trong bảng đăng ký đầu tư) chưa được phê duyệt có chi phí yêu cầu đầu tư 
	lớn hơn 100.000.000 VNĐ, có ThoiGianThucHien dự án là từ 3 đến 5 tháng.*/

	SELECT DUAN.MaDuAn, TenDuAn, DANGKYDAUTU.MaTVDauTu, TenLoaiHinh, TenNV
	FROM LOAIHINHKD
	 INNER JOIN THANHVIEN ON LOAIHINHKD.MaLoaiHinh = THANHVIEN.MaLoaiHinh
	 INNER JOIN DUAN ON THANHVIEN.MaTV = DUAN.MaTVDang
	 INNER JOIN DANGKYDAUTU ON DUAN.MaDuAn = DANGKYDAUTU.MaDuAn
	 INNER JOIN NHANVIEN ON DANGKYDAUTU.MaNVPheDuyet = NHANVIEN.MaNV
	WHERE (TrangThaiPheDuyet = N'Chưa duyệt') AND ( ChiPhiYeuCau > 100000000 ) AND (ThoiGianThucHien BETWEEN 3 AND 5)
	GO


	/* Câu 12: Liệt kê thông tin MaTV, TenTV, TenLoaiHinh, MaDuAn, TenDuAn, NoiDung, ChiPhiYeuCau, CongNghe, ThoiGian
	kêu gọi đầu tư ( là số ngày được tính bằng NgayHetHan - NgayDang) của tất cả các lần đăng dự án của Thành viên
	(những Thành viên nào chưa đăng dự án lần nào thì cũng phải liệt kê thành viên đó ra).*/

	SELECT MaTV, TenTV, TenLoaiHinh, DUAN.MaDuAn, TenDuAn, NoiDung, ChiPhiYeuCau, CongNghe, DATEDIFF(DAY, NgayDang, NgayHetHan) AS N'Thời gian kêu gọi đầu tư' 
	FROM LOAIHINHKD
	 INNER JOIN THANHVIEN ON LOAIHINHKD.MaLoaiHinh = THANHVIEN.MaLoaiHinh
	 FULL OUTER JOIN DUAN ON THANHVIEN.MaTV = DUAN.MaTVDang
	GO
	 
	/* Câu 13: Liệt kê thông tin MaTV, TenTV đã từng đăng ký đầu tư với chi phí đầu tư lớn hơn 5.000.000 VNĐ 
	trong một lần đăng ký đầu tư của thành viên hoặc có tên loại hình kinh doanh là ‘Cá nhân’.*/

	SELECT THANHVIEN.MaTV, TenTV 
	FROM   LOAIHINHKD
	   INNER JOIN THANHVIEN ON LOAIHINHKD.MaLoaiHinh = THANHVIEN.MaLoaiHinh
	   INNER JOIN DANGKYDAUTU ON THANHVIEN.MaTV = DANGKYDAUTU.MaTVDauTu
	WHERE ChiPhiDauTu > 5000000 AND TenLoaiHinh = N'Cá nhân'
	GROUP BY THANHVIEN.MaTV , TenTV
	GO

	/* Câu 14: Liệt kê MaTV, TenTV, SoDienThoai của những thành viên chưa từng đăng ký đầu tư bất kỳ dự án nào.*/

	SELECT MaTV, TenTV, SoDienThoai
	FROM   THANHVIEN
	   FULL OUTER JOIN DANGKYDAUTU ON THANHVIEN.MaTV = DANGKYDAUTU.MaTVDauTu
	WHERE  MaTVDauTu  IS NULL
	GO

	/* Câu 15: Liệt kê MaTV, TenTV, MaDuAn, TenDuAn, TenLoaiDuAn của những thành viên đã từng đăng dự án
	với loại dự án là 'Giáo dục' và chưa từng thực hiện đăng dự án với loại dự án là 'Thương mại'*/

	SELECT MaTV, TenTV, DUAN.MaDuAn, TenDuAn, TenLoaiDuAn
	FROM   THANHVIEN
		INNER JOIN DUAN ON THANHVIEN.MaTV = DUAN.MaTVDang
		INNER JOIN LOAIDUAN ON DUAN.MaLoaiDuAn = LOAIDUAN.MaLoaiDuAn
	WHERE  (TenLoaiDuAn = N'Giáo dục') AND MaTVDang NOT IN (SELECT TenLoaiDuAn FROM LOAIDUAN WHERE TenLoaiDuAn = N'Thương mại')
	GO


	/* Câu 16: Liệt kê thông tin MaDuAn, TenTV, TenDuAn, TenLoaiDuAn, ChiPhiDauTu, TrangThaiPheDuyet 
	của các lần đăng ký đầu tư (chính là những bản ghi trong bản đăng ký đầu tư) thuộc loại dự án 'Thương mại' 
	và Thành viên đó chỉ mới đăng ký đầu một lần duy nhất trong năm 2015. Kết quả liệt kê được sắp xếp theo chiều tăng dần 
	của chi phí đầu tư.*/

	SELECT DUAN.MaDuAn, TenTV, TenDuAn, TenLoaiDuAn, ChiPhiDauTu, TrangThaiPheDuyet
	FROM   LOAIDUAN
	   INNER JOIN DUAN ON LOAIDUAN.MaLoaiDuAn = DUAN.MaLoaiDuAn
	   INNER JOIN DANGKYDAUTU ON LOAIDUAN.MaLoaiDuAn = DANGKYDAUTU.MaDuAn
	   INNER JOIN THANHVIEN ON DANGKYDAUTU.MaTVDauTu = THANHVIEN.MaTV
	   
	WHERE  TenLoaiDuAn = N'Thương mại' AND THANHVIEN.MaTV IN 
	 ( SELECT MaTVDauTu FROM THANHVIEN 
	   INNER JOIN DANGKYDAUTU ON THANHVIEN.MaTV = DANGKYDAUTU.MaTVDauTu
	   WHERE YEAR(NgayDKDauTu) = '2015' 
	   GROUP BY MaTVDauTu
	   HAVING COUNT(MaDuAn) = 1)
	ORDER BY ChiPhiDauTu ASC
	GO
