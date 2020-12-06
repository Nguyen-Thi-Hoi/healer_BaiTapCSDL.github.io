	
	USE master
	GO
	
	CREATE DATABASE QuanLiTourDuLich
	GO
	
	USE QuanLiTourDuLich
	GO
	
	CREATE TABLE THANHVIEN
	(
	    MaTV             VARCHAR(6) NOT NULL,
		TenTV            NVARCHAR(50),
		NgaySinh         DATE,
		DiaChi           NVARCHAR(50),
		Email            NVARCHAR(50),
		SoDienThoai      VARCHAR(11),
		GioiTinh         NVARCHAR(5)
		
	    CONSTRAINT PK_THANHVIEN PRIMARY KEY (MaTV)
		CONSTRAINT CK_THANHVIEN_GioiTinh CHECK ( GioiTinh IN (N'Nam', N'Nữ'))
		

	)
	GO
	
	CREATE TABLE NHANVIEN
	(
	    MaNV       VARCHAR(6) NOT NULL,
		TenNV      NVARCHAR(50),
		ViTri      NVARCHAR(50)
		
		CONSTRAINT PK_NHANVIEN PRIMARY KEY (MaNV)

	)
	GO
	
	CREATE TABLE PHAMVI
	(
	    MaPV     VARCHAR(5) NOT NULL,
		TenPV    NVARCHAR(50),
		MoTa     NVARCHAR(50)
		
		CONSTRAINT PK_PHAMVI PRIMARY KEY (MaPV)

	)
	GO
	
	CREATE TABLE LOAITOUR
	(
	    MaLoai      VARCHAR(5) NOT NULL,
		TenLoai     NVARCHAR(50),
		QuyDinh     NVARCHAR(50)
		
		CONSTRAINT PK_LOAITOUR PRIMARY KEY (MaLoai)

	)
	GO
	
	CREATE TABLE TOUR
	(
	    MaTour                 VARCHAR(5) NOT NULL,      
		MaTVDang               VARCHAR(6),
		MaPV                   VARCHAR(5),
		MaLoai                 VARCHAR(5),
		TenTour                NVARCHAR(50),
		DiaDiem                NVARCHAR(50),
		NgayKhoiHanh           DATE,
		NgayVe                 DATE,
		NgayKTDangKy           DATE,
		SoLuongNguoiToiDa      INT,
		LichTrinh              NVARCHAR(50),
		YeuCauDoiTuong         NVARCHAR(50),
		ChiPhi                 FLOAT
		
		CONSTRAINT PK_TOUR PRIMARY KEY (MaTour)

	)
	GO
	

	CREATE TABLE DANGKYTOUR
	(
	    MaTVDangKy          VARCHAR(6) NOT NULL,
		MaTour              VARCHAR(5) NOT NULL,
		MaNVPheDuyet        VARCHAR(6),
		NgayDangKy          DATE,
		SoLuongNguoiDK      INT,
		TrangThaiPD         NVARCHAR(50)
		
		CONSTRAINT PK_DANGKYTOUR PRIMARY KEY (MaTVDangKy)
		

	)
	GO
	

	-- NHAP DU LIEU --
	
	INSERT INTO THANHVIEN VALUES ('TV001', N'Trần Mai Linh', '1985/8/7',   N'Hòa Quý',    N'mailinh@gmail.com',  '0905864575', N'Nữ'),
								 ('TV002', N'Hoàng Hoa Hải', '1988/8/20',  N'Sơn Trà',    N'hoahai@gmail.com',   '0905111575', N'Nam'),
								 ('TV003', N'Nguyễn Thanh',  '1986/11/10', N'Liên Chiểu', N'thanh@gmail.com',    '0905864531', N'Nam'),
								 ('TV004', N'Lê Hải Triều',  '1984/10/12', N'Hòa Xuân',   N'haitrieu@gmail.com', '0905999575', N'Nam'),
								 ('TV005', N'Phan Mỹ Hạnh',  '1989/8/20',  N'Sơn Trà',    N'myhanh@gmail.com',   '0905860356', N'Nữ')
    GO
    							 
	INSERT INTO NHANVIEN VALUES  ('NV001', N'Hoàng Lan', N'Tư vấn viên'),
								 ('NV002', N'Kim Khuê',  N'Tư vấn viên'),
								 ('NV003', N'Đức Hạnh',  N'Quản trị viên')
	GO
	
	INSERT INTO PHAMVI VALUES ('PV01', N'Châu Âu',  N'Các nước thuộc Châu Âu'),
							  ('PV02', N'Châu Á',   N'Các nước thuộc Châu Á'),
							  ('PV03', N'Châu Phi', N'Các nước thuộc Châu Phi')
	GO
	
	INSERT INTO LOAITOUR VALUES ('LT01', N'Tour dài ngày ',   N'5 đến 10 ngày'),	
								('LT02', N'Tour ngắn ngày ',  N'1 đến 5 ngày'),
								('LT03', N'Tour nghỉ dưỡng ', N'Trên 10 ngày')
	GO
	
	SELECT * FROM LOAITOUR
	GO
	
	INSERT INTO TOUR VALUES  ('T001', 'TV002', 'PV02', 'LT01', N'Huế - Đà Nẵng', N'Thiền viện trúc lâm, cổ viện chàm, Chùa Linh ấn ', '2015/10/20', '2015/10/27', '2015/10/1', 5 , N'8:10 - 20/10/2015 tập trung tại bến xe Đồng Nai khởi hành đi huế', N'Nữ: Lớn hơn 20 và nhỏ hơn 35 Nam: Lớn hơn 25 và nhỏ hơn 40', 2000000 ),							
							 ('T002', 'TV001', 'PV01', 'LT03', N'Mỹ', N'Los angeles, lasvegas', '2014/4/30', '2014/5/19', '2014/3/26',10, N'20:00 - 30/4/2014 khởi hành từ sân bay Sài Gòn. ….', N'Nữ: trên 30 tuổi Nam: trên 25 tuổi', 30000000 ),
							 ('T003', 'TV002', 'PV02', 'LT01', N'Hàn Quốc - Nhật Bản', N'Nami, Tokyo', '2015/12/22', '2015/12/27', '2015/11/20', 15 , N'9:00 - 22/12/2015 khởi hành từ sân bay quốc tế ĐN…', N'Không giới hạn tuổi', 15000000  )
	
	GO
	
	INSERT INTO DANGKYTOUR VALUES  ('TV004', 'T001', 'NV001', '2015/9/20',  2 ,  N'Đã phê duyệt'),
								   ('TV005', 'T002', 'NV001', '2014/3/25',  1 ,  N'Đã phê duyệt'),
							       ('TV003', 'T002', 'NV002',  '2015/11/19',3 ,  N'Chưa phê duyệt')
	GO
	
	
	-- TẠO KHÓA NGOẠI --
	
	ALTER TABLE TOUR
	ADD CONSTRAINT FK_TOUR_THANHVIEN FOREIGN KEY (MaTVDang) REFERENCES THANHVIEN ( MaTV)
	GO
	
	ALTER TABLE TOUR
	ADD CONSTRAINT FK_TOUR_PHAMVI FOREIGN KEY (MaPV) REFERENCES PHAMVI (MaPV)
	GO
	
	ALTER TABLE TOUR
	ADD CONSTRAINT FK_TOUR_LOAITOUR FOREIGN KEY (MaLoai) REFERENCES LOAITOUR ( MaLoai)
	GO
	
	ALTER TABLE DANGKYTOUR
	ADD CONSTRAINT FK_DKT_NHANVIEN FOREIGN KEY (MaNVPheDuyet) REFERENCES NHANVIEN (MaNV)
	GO
	
	ALTER TABLE DANGKYTOUR
	ADD CONSTRAINT FK_DKT_THANHVIEN FOREIGN KEY (MaTVDangKy) REFERENCES THANHVIEN (MaTV)
	GO
	
	ALTER TABLE DANGKYTOUR
	ADD CONSTRAINT FK_DKT_TOUR FOREIGN KEY (MaTour) REFERENCES TOUR (MaTour)
	GO
	
	
	
	 ---***    TRUY VẤN    ***---
	 
  /* Câu 1: Liệt kê thông tin toàn bộ Thành viên.*/
	 
	      SELECT * FROM THANHVIEN
	      GO
	      
 /* Câu 2: Xóa toàn bộ thông tin Thành viên có địa chỉ là 'Hòa Xuân'.*/
          
          DELETE FROM THANHVIEN
          WHERE  DiaChi = N'Hòa Xuân'
          GO
          
          SELECT * FROM THANHVIEN
          GO
          
 /* Câu 3: Cập nhật giá trị của trường vị trí từ bảng Nhân viên sang 'Tư vấn viên' 
           đối với trường vị trí có giá trị là 'Quản trị viên'*/
          
          UPDATE NHANVIEN
          SET    ViTri = N'Tư vấn viên'
          WHERE  ViTri = N'Quản trị viên'
          GO
          
          SELECT ViTri FROM NHANVIEN
          GO
          
          
 /* Câu 4: Liệt kê thông tin MaTV, TenTV, NgaySinh, DiaChi, GioiTinh của những Thành viên 
           có tuổi lớn hơn 18 tuổi, giới tính 'nữ' và những thành viên có tuổi lớn hơn 25 tuổi, giới tính 'nam'*/
           
           SELECT MaTV, TenTV, NgaySinh, DiaChi, GioiTinh
           FROM   THANHVIEN
           WHERE  (DATEDIFF(YEAR, NgaySinh, GETDATE()) > 18 AND GioiTinh = N'Nữ') OR
                  (DATEDIFF(YEAR, NgaySinh, GETDATE()) > 25 AND GioiTinh = N'Nam')
           GO
           
 
 /* Câu 5: Liệt kê những Nhân viên có tên bắt đầu là một trong các ký tự H, T hoặc K và có độ dài là 6 ký tự.*/
           
           SELECT TenNV FROM NHANVIEN
           WHERE  TenNV LIKE '[HTK]%' AND LEN(TenNV) = 6
           GO
           
           SELECT TenNV FROM NHANVIEN
           GO
           
 /* Câu 6: Liệt kê toàn bộ thông tin Thành viên, sắp xếp tăng dần theo ngày sinh và giảm dần theo tên nhân viên*/
           
           SELECT * FROM THANHVIEN
           ORDER BY NgaySinh ASC ,TenTV DESC
           GO
           
 /* Câu 7: Đếm các Tour du lịch đã đăng theo từng thành viên, chỉ đếm những Tour được đăng trong năm 2015. 
           Hiển thị MaTV, TenTV, Số tour mà thành viên đã đăng.*/
           
           SELECT MaTV, TenTV, COUNT(MaTour) AS N'Số tour'
           FROM   THANHVIEN
                  RIGHT OUTER JOIN TOUR ON THANHVIEN.MaTV = TOUR.MaTVDang
           WHERE  YEAR(NgayKhoiHanh) = '2015'     
           GROUP BY THANHVIEN.MaTV, TenTV
           GO
           
 /* Câu 8: Liệt kê thông tin MaTour, TenTV, TenTour, DiaDiem, NgayKhoiHanh, NgayVe, LichTrinh, ChiPhi 
           của tất cả các tour du lịch có thời gian du lịch nhỏ hơn 5 ngày. Liệt kê 10 dòng đầu tiên tìm thấy.*/
           
           SELECT  TOP 10 MaTour, TenTV, TenTour, DiaDiem, NgayKhoiHanh, NgayVe, LichTrinh, ChiPhi
           FROM    THANHVIEN
                   INNER JOIN TOUR ON THANHVIEN.MaTV = TOUR.MaTVDang
           WHERE   DATEDIFF(DAY,NgayKhoiHanh, NgayVe) < 5
           GO
            
 /* Câu 9: Liệt kê tên của toàn bộ Thành viên (tên nào giống nhau thì chỉ liệt kê một lần)*/
           
           SELECT DISTINCT TenTV FROM THANHVIEN
           GO
           
 /* Câu 10: Liệt kê MaTour, TenTV (tên thành viên đăng), TenTour, TenPV, TenLoai, DiaDiem, NgayVe, NgayKhoiHanh, 
            NgayKTDangKy, SoLuongNguoiToiDa, LichTrinh, YeuCauDoiTuong, ChiPhi (của tất cả các tour du lịch đã được đăng ký).*/
            
            SELECT TOUR.MaTour, TenTV, TenTour, TenPV, TenLoai, DiaDiem, NgayVe, NgayKhoiHanh, NgayKTDangKy, SoLuongNguoiToiDa,LichTrinh,YeuCauDoiTuong, ChiPhi
            FROM   TOUR
                   INNER JOIN THANHVIEN ON TOUR.MaTVDang = THANHVIEN.MaTV
                   INNER JOIN PHAMVI ON TOUR.MaPV = PHAMVI.MaPV
                   INNER JOIN LOAITOUR ON TOUR.MaLoai = LOAITOUR.MaLoai
            GO
            
 /* Câu 11: Liệt kê Matour, MaTVDangKy, TenTVDangKy, TenNV, NgayDangKy, SoLuongNguoiDK, TenTour, NgayKhoiHanh,
            NgayVe, LichTrinh, ChiPhi của tất cả các Tour du lịch được đăng ký từ năm 2014 đến năm 2015, có phạm vi là 'Châu Á'.*/
            
            
            SELECT  TOUR.MaTour, MaTVDangKy, TenTV, TenNV, NgayDangKy, SoLuongNguoiDK,TenTour, NgayKhoiHanh, NgayVe, LichTrinh, ChiPhi
            FROM    TOUR
                    INNER JOIN THANHVIEN ON TOUR.MaTVDang = THANHVIEN.MaTV
                    INNER JOIN PHAMVI ON TOUR.MaPV = PHAMVI.MaPV
                    INNER JOIN DANGKYTOUR ON TOUR.MaTour = DANGKYTOUR.MaTour
                    INNER JOIN NHANVIEN ON DANGKYTOUR.MaNVPheDuyet = NHANVIEN.MaNV
            WHERE   YEAR(NgayDangKy) BETWEEN '2014' AND '2015' AND TenPV = N'Châu Á'
            GO
            
 /* Câu 12: Liệt kê MaTour, TenTV (là tên thành viên đăng), TenTour, TenPV, TenLoai, DiaDiem, Thời gian đi du lịch 
           (là số ngày được tính từ NgayVe - NgayKhoiHanh), NgayKTDangKy, SoLuongNguoi, LichTrinh, YeuCauDoiTuong, ChiPhi
           của tất cả các tour du lịch đã được đăng ký (những Tour du lịch nào chưa được bất kỳ thành viên nào đăng ký 
           thì cũng phải liệt kê tour du lịch đó ra).*/
           
           SELECT TOUR.MaTour, TenTV, TenTour, TenPV, TenLoai, DiaDiem ,DATEDIFF(DAY, NgayVe, NgayKhoiHanh) AS N'Thời gian đi du lịch', NgayKTDangKy, SoLuongNguoiToiDa, LichTrinh, YeuCauDoiTuong, ChiPhi
           FROM   TOUR
                  INNER JOIN THANHVIEN ON TOUR.MaTVDang = THANHVIEN.MaTV
                  INNER  JOIN PHAMVI ON TOUR.MaPV = PHAMVI.MaPV
                  INNER  JOIN LOAITOUR ON TOUR.MaLoai = LOAITOUR.MaLoai
                  INNER  JOIN DANGKYTOUR ON TOUR.MaTour = DANGKYTOUR.MaTour
           GO
            
                  
 /* Câu 13: Liệt kê MaTV, TenTV đã từng thực hiện đăng ký Tour với số lượng đăng ký lớn hơn 5 người 
            hoặc đã từng thực hiện đăng tour du lịch có phạm vi là 'Châu Âu'.*/
            
            SELECT THANHVIEN.MaTV, TenTV
            FROM   THANHVIEN
                   INNER JOIN DANGKYTOUR ON THANHVIEN.MaTV = DANGKYTOUR.MaTVDangKy
                   INNER JOIN TOUR ON DANGKYTOUR.MaTour = TOUR.MaTour
                   INNER JOIN PHAMVI ON TOUR.MaPV = PHAMVI.MaPV
            WHERE  SoLuongNguoiDK > 5 OR TenPV = N'Châu Âu'
            GO
            
            
 /* Câu 14: Liệt kê MaTV, TenTV của những thành viên chưa từng thực hiện đăng Tour 
            và cũng chưa từng thực hiện đăng ký tour lần nào.*/
            
            SELECT MaTV, TenTV
            FROM   THANHVIEN
                   INNER JOIN TOUR ON THANHVIEN.MaTV = TOUR.MaTVDang
                   INNER JOIN DANGKYTOUR ON THANHVIEN.MaTV = DANGKYTOUR.MaTVDangKy
            WHERE  MaTV NOT IN (SELECT MaTVDang FROM TOUR) AND
                   MaTV NOT IN (SELECT MaTVDangKy FROM DANGKYTOUR)
            GO
            
 /* Câu 15: Liệt kê MaTV, TenTV, NgaySinh của những Thành viên đã từng thực hiện đăng Tour 
            với loại Tour là 'Tour ngắn ngày' và chưa từng thực hiện đăng tour du lịch với loại tour là 'Tour dài ngày'.*/
            
            SELECT MaTV, TenTV, NgaySinh
            FROM   THANHVIEN
                   INNER JOIN TOUR ON THANHVIEN.MaTV = TOUR.MaTVDang
                   INNER JOIN LOAITOUR ON TOUR.MaLoai = LOAITOUR.MaLoai
            WHERE  MaTV IN (SELECT MaTVDang FROM TOUR WHERE TenLoai = N'Tour ngắn ngày') AND
                   MaTV NOT IN (SELECT MaTVDang FROM TOUR WHERE TenLoai = N'Tour dài ngày')
            GO
            
            
 /* Câu 16: Liệt kê MaTour, TenTour, TenTV (tên thành viên đăng ký) TenLoai, TenPV, DiaDiem, NgayKhoiHanh,
            NgayVe, LichTrinh, SoLuongNguoiDK, ChiPhi của những tour có phạm vi là 'Châu Á'.
            Chỉ liệt kê những Tour chỉ mới được đăng ký du lịch bởi một thành viên duy nhất.
            Kết quả liệt kê cần được sắp xếp giảm dần theo trường ChiPhi.*/
            
            SELECT TOUR.MaTour, TenTour, TenLoai, TenPV, DiaDiem, NgayKhoiHanh, NgayVe, LichTrinh, SoLuongNguoiDK, ChiPhi
			FROM  THANHVIEN 
				  INNER JOIN DANGKYTOUR ON THANHVIEN.MaTV = DANGKYTOUR.MaTVDangKy
				  INNER JOIN TOUR ON DANGKYTOUR.MaTour = TOUR.MaTour
				  INNER JOIN PHAMVI ON TOUR.MaPV = PHAMVI.MaPV
				  INNER JOIN LOAITOUR ON TOUR.MaLoai = LOAITOUR.MaLoai
		    WHERE TenPV = 'Châu Á' AND TOUR.MaTour IN (SELECT MaTour FROM DANGKYTOUR 
		                                               INNER JOIN THANHVIEN ON DANGKYTOUR.MaTVDangKy = THANHVIEN.MaTV
			                                           GROUP BY MaTour HAVING COUNT(MaTV) = 1)
			ORDER BY ChiPhi DESC

      