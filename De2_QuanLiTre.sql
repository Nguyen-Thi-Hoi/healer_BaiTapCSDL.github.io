
	USE MASTER
	GO

	CREATE DATABASE QuanLiTreEm
	GO

	USE QuanLiTreEm
	GO

	CREATE TABLE GIAOVIEN
	( 
		MaGV        VARCHAR(6) NOT NULL,
		TenGV       NVARCHAR(50),
		DiaChi      NVARCHAR(50),
		SoDienThoai VARCHAR(11),
		NgaySinh    DATE,
		TrinhDo     NVARCHAR(50)
	    
		CONSTRAINT PK_GIAOVIEN PRIMARY KEY (MaGV)
	)
	GO

	CREATE TABLE KHOI
	(
		MaKhoi     VARCHAR(4) NOT NULL,
		TenKhoi    NVARCHAR(50),
		DoTuoi     NVARCHAR(50),
	    
		CONSTRAINT PK_KHOI PRIMARY KEY (MaKhoi)
	)
	GO

	CREATE TABLE LOP
	(
		MaLop         VARCHAR(4) NOT NULL,
		MaGVCN        VARCHAR(6),
		MaKhoi        VARCHAR(4),
		TenLop        NVARCHAR(50),
		SoLuongTre    INT,
		NgayKhaiGiang DATE,
		NgayBeGiang   DATE
	    
		CONSTRAINT PK_LOP PRIMARY KEY (MaLop) 
	)
	GO
     
     
	CREATE TABLE TRE
	(
		MaTre         VARCHAR(5) NOT NULL,
		MaLop         VARCHAR(4),
		HoTen         NVARCHAR(50),
		HoTenCha      NVARCHAR(50),
		HoTenMe       NVARCHAR(50),
		NgayDangKy    DATE,
		NgaySinh      DATE,
		GioiTinh      NVARCHAR(4),
		DiaChi        NVARCHAR(50),
		SoDienThoai   VARCHAR(11)
	    
		CONSTRAINT PK_TRE PRIMARY KEY ( MaTre)
	   
	)
	GO
	 
	CREATE TABLE THEODOIVANG
	(
		MaTre         VARCHAR(5),
		NgayHoc       DATE,
		TGBuoiSang    NVARCHAR(50),
		TGBuoiChieu   NVARCHAR(50),
		LyDo          NVARCHAR(50),
		MoTa          NVARCHAR(50)
	    
		CONSTRAINT PK_THEODOIVANG PRIMARY KEY (MaTre, NgayHoc )
	)
	GO

	 -- Nhập dữ liệu -- 
	 
	 INSERT INTO GIAOVIEN VALUES ('GV001' , N'Nguyễn Hoàng Lan',N'Hải Châu',	'0905682632', '1988/11/1',	N'Thạc sĩ')
	 INSERT INTO GIAOVIEN VALUES ('GV002' , N'Phan Nam Như'	,   N'Liên Chiểu',	'0905633522', '1987/02/24', N'Kỹ sư')
	 INSERT INTO GIAOVIEN VALUES ('GV003' , N'Hoàng Nam Mai',	N'Sơn Trà',	    '0932568954', '1984/10/10', N'Giao sư')
	 INSERT INTO GIAOVIEN VALUES ('GV004' , N'Trần Trang',   	N'NHòa Hải',	'01258614552', '1986/3/20', N'Thạc sĩ')
	 GO

	INSERT INTO  KHOI VALUES ('K01', N'Nhà trẻ', N'2 đến 3') 
	INSERT INTO  KHOI VALUES ('K02', N'Mầm',     N'3 đến 4')
	INSERT INTO  KHOI VALUES ('K03', N'Chồi',    N'4 đến 5')
	INSERT INTO  KHOI VALUES ('K04', N'Lá',      N'5 đến 6')
	GO

	SELECT * FROM TRE
	GO

	INSERT INTO LOP VALUES ('L01', 'GV001', 'K01', N'Lop A',10 , '2015/11/20', '2016/11/20')
	INSERT INTO LOP VALUES ('L02', 'GV002', 'K02', N'Lop B',20 , '2015/4/20',  '2016/4/20')
	INSERT INTO LOP VALUES ('L03', 'GV003', 'K01', N'Lop C',15 , '2015/5/3',   '2016/5/3')
	INSERT INTO LOP VALUES ('L04', 'GV004', 'K03', N'Lop D',20 , '2015/3/2',   '2016/3/2')
	GO

	INSERT INTO TRE VALUES ('T001' ,'L01', N'Nguyễn Thanh Duyên',N'Nguyễn Chiến Thắng',N'Phạm An Giang',     '2015/11/20', '2012/2/2',    N'Nữ',  N'Hòa Xuân','0905863258'),
						   ('T002', 'L04', N'Phan Minh Hải',     N'Phan Minh Nhân',    N'Trần Lê Mai',       '2016/3/2',  '2011/10/3',    N'Nam', N'Cẩm Lệ',  '0932568745'),
						   ('T003', 'L03', N'Lê Thu Hoài',	     N'Lê Tấn Nam',	       N'Nguyễn Hiền Mai',   '2015/5/3',   '2013/8/25',   N'Nữ',  N'Hải Châu','0905687423'),
						   ('T004',	'L01', N'Trần Xuân Anh',	 N'Trần Xuân Lan',	   N'Phạm Thu Nga',      '2014/12/24',   '2012/2/10', N'Nam', N'Hà Tiên', '0981456789'),
						   ('T005',	'L04', N'Lưu Đăng Khoa',	 N'Lưu Đăng Khải',	   N'Nguyễn Hoàng Dung', '2015/12/10',   '2010/10/20',N'Nam', N'Lưu Đan', '0905863258')
	GO

	INSERT INTO THEODOIVANG VALUES ('T001',	'2015/11/25',N'nghỉ',     	N'không',	N'sốt xuất huyết', N'nghỉ dài ngày'),
								   ('T001',	'2016/1/2',  N'nghỉ',     	N'không',	N'đau dạ dày',     N'nghỉ 1 ngày'),
								   ('T002',	'2016/4/3',	 N'nghỉ',	    N'không',	N'sốt nhẹ',	       N'nghỉ 1 ngày'),
								   ('T003',	'2015/6/10', N'bình thường',N'nghỉ',	N'về quê',         N'nghỉ 1 ngày'),
								   ('T004',	'2015/2/1',	 N'nghỉ',	    N'không',	N'gia đình bận',   N'nghỉ 1 ngày'),
								   ('T005',	'2016/4/3',	 N'không',	    N'nghỉ',	N'sốt nhẹ',	       N'nghỉ dài ngày')
	GO
	
	
	                                    --***  TAO KHOA NGOAI   ***--
	
	   ALTER TABLE LOP
	   ADD CONSTRAINT FK_LOP_GIAOVIEN FOREIGN KEY (MaGVCN) REFERENCES GIAOVIEN (MaGV)
	   GO
	     
	   ALTER TABLE LOP
	   ADD CONSTRAINT FK_LOP_KHOI FOREIGN KEY (MaKhoi) REFERENCES KHOI (MaKhoi)
	   GO
	   
	   ALTER TABLE TRE
	   ADD CONSTRAINT FK_TRE_LOP FOREIGN KEY (MaLop) REFERENCES LOP (MaLop)
	   GO
	   
	   ALTER TABLE THEODOIVANG
	   ADD CONSTRAINT FK_TDV_TRE FOREIGN KEY (MaTre) REFERENCES TRE (MaTre)
	   GO
	   
		                                --***  TRUY VẤN  *** --
	/* Câu 1: Liệt kê thông tin của toàn bộ trẻ (bé) đang theo học tại trường mầm non. */

		   SELECT * FROM TRE
		   GO
	       
	/* Câu 2: Xóa toàn bộ thông tin của Giáo viên có trình độ là 'Cao đẳng'.*/
	       
		   DELETE FROM GIAOVIEN
		   WHERE TrinhDo = N'Cao đẳng'
		   GO
	       
		   SELECT TrinhDo FROM GIAOVIEN
		   GO
	       
	/* Câu 3: Cập nhật thông tin ngày đăng ký của trẻ thành '20/11/2015' đối với những trẻ có ngày đăng ký là '20/11/2014'.*/
	       
		   UPDATE TRE
		   SET NgayDangKy = '2015/11/20'
		   WHERE NgayDangKy = '2014/11/20'
		   GO
	       
		   SELECT NgayDangKy FROM TRE
		   GO
	       
	  
	       
	/* Câu 4: Liệt kê thông tin của những trẻ có ngày sinh trong năm 2014, ở tại địa chỉ là 'Hòa Xuân' và những trẻ 
	   có ngày sinh trong năm 2015, ở tại địa chỉ là 'Cẩm Lệ'.*/
	   
		   SELECT * FROM TRE
		   WHERE ( YEAR(NgaySinh) = '2014' AND DiaChi = N'Hòa Xuân') AND (YEAR(NgaySinh) = '2015' AND DiaChi = N'Cẩm Lệ')
		   GO
	       
		   SELECT * FROM TRE
		   GO
	       
	/* Câu 5: Liệt kê thông tin của những Giáo viên có tên với ký tự bắt đầu không phải là các ký tự 'H', 'T' hoặc 'D' 
	   và có độ dài là 7 ký tự.*/
	       
		   SELECT * FROM GIAOVIEN
		   WHERE TenGV NOT LIKE '[HTD]%' AND LEN(TenGV) = 7
		   GO
	       
	/* Câu 6: Liệt kê thông tin của toàn bộ trẻ có giới tính là 'Nữ', sắp xếp giảm dần theo họ tên và tăng dần theo ngày sinh.*/
		   SELECT * FROM TRE
		   WHERE GioiTinh = N'Nữ'
		   ORDER BY HoTen DESC , NgaySinh ASC
		   GO
	       
	       
	/* Câu 7: Đếm tổng số lượng trẻ theo học tương ứng với mỗi khối hiện có (nghĩa là tương ứng với mỗi khối sẽ có
		bao nhiêu trẻ theo học) của trường mầm non, chỉ đếm những trẻ có địa chỉ là 'Hòa Xuân'.*/
		   SELECT MaKhoi, SUM(SoLuongTre) AS N'Số lượng trẻ'
		   FROM  LOP
				 INNER JOIN TRE ON LOP.MaLop = TRE.MaLop
		   WHERE DiaChi = N'Hòa Xuân'
		   GROUP BY MaKhoi
		   GO
	       
	       
	/* Câu 8: Liệt kê MaTre, HoTen, HoTenCha, HoTenMe, NgayDangKy, GioiTinh, DiaChi của những Trẻ đã từng vắng/nghỉ 
	   trong năm 2013 thuộc khối nhà trẻ .Liệt kê 5 dòng đầu tiên tìm được.*/
	        
			SELECT TOP 5 TRE.MaTre, HoTen, HoTenCha, HoTenMe, NgayDangKy, GioiTinh, DiaChi
			FROM  TRE
				  INNER JOIN THEODOIVANG ON TRE.MaTre = THEODOIVANG.MaTre
			WHERE YEAR(NgayHoc) = '2013'
			GO
	        
	/* Câu 9: Liệt kê họ tên của toàn bộ trẻ (họ tên nào giống nhau thì chỉ liệt kê một lần).*/
			SELECT HoTen FROM TRE     -- ( hoặc DISTINCT )
			GROUP BY HoTen
			GO
	        
	        
	/* Câu 10: Liệt kê MaTre, HoTen, TenLop, TenGV, TenKhoi, NgayHoc, TGBuoiSang, TGBuoiChieu, LyDo
	   (của tất cả các lần nghỉ học của Trẻ)*/
	        
			SELECT TRE.MaTre, HoTen, TenLop, TenGV, TenKhoi, NgayHoc, TGBuoiSang, TGBuoiChieu, LyDo
			FROM   KHOI
				   INNER JOIN LOP ON KHOI.MaKhoi = LOP.MaKhoi
				   INNER JOIN GIAOVIEN ON LOP.MaGVCN = GIAOVIEN.MaGV
				   INNER JOIN TRE ON LOP.MaLop = TRE.MaLop
				   INNER JOIN THEODOIVANG ON TRE.MaTre = THEODOIVANG.MaTre
			GO
	          
	        
	/* Câu 11: Liệt kê MaGV, TenGV, TrinhDo, TenLop, TenKhoi, SoLuongTre của tất cả các giáo viên chủ nhiệm các lớp được khai giảng 
	   từ năm 2015 và bế giảng trong năm 2016. Chỉ liệt kê những giáo viên có độ tuổi từ 24 đến 30 tuổi.*/
	        
			SELECT MaGV, TenGV, TrinhDo, TenLop, TenKhoi, SoLuongTre
			FROM  GIAOVIEN
				  INNER JOIN LOP ON GIAOVIEN.MaGV = LOP.MaGVCN
				  INNER JOIN KHOI ON LOP.MaKhoi = KHOI.MaKhoi
			WHERE YEAR(NgayKhaiGiang) = '2015' AND YEAR(NgayBeGiang) = '2016' AND 
			      YEAR(GETDATE()) - YEAR(NgaySinh) BETWEEN 24 AND 30 
			GO
	        
	        -- cách 2 -- 
	        SELECT GIAOVIEN.MaGV, TenGV, TrinhDo, TenLop, TenKhoi, SoLuongTre
			FROM   GIAOVIEN INNER JOIN LOP ON GIAOVIEN.MaGV =  LOP.MaGVCN
			       INNER JOIN KHOI ON LOP.MaKhoi = KHOI.MaKhoi
			 WHERE YEAR(NgayKhaiGiang) = '2015' AND YEAR(NgayBeGiang) = '2016' 
			 AND   DATEDIFF(YEAR,NgaySinh,GETDATE()) BETWEEN 24 AND 30
			 GO
	   
	/*-- Câu 12: Liệt kê thông tin của tất cả các trẻ và các lần theo dõi vắng/nghỉ của trẻ. Thông tin cần liệt kê bao gồm 
	   MaTre, HoTen,HoTenCha, HoTenMe, TenLop, NgayHoc, TGBuoiSang, TGBuoiChieu, LyDo.*/
	        
	        
			SELECT TRE.MaTre, HoTen, HoTenCha, HoTenMe, TenLop, NgayHoc, TGBuoiSang, TGBuoiChieu, LyDo
			FROM THEODOIVANG
				 INNER JOIN TRE ON THEODOIVANG.MaTre = TRE.MaTre
				 INNER JOIN LOP ON TRE.MaLop = LOP.MaLop
			GO
	        

	/* Câu 13: Liệt kê MaTre, HoTen, HoTenCha, NgaySinh, TenLop của những trẻ đăng ký học vào lớp có số lượng trẻ là 10 trẻ
	   hoặc đã đăng ký học lớp thuộc khối 'mầm'.*/
	        
			SELECT TRE.MaTre,HoTen, HoTenCha, NgaySinh, TenLop
			FROM   TRE 
				   INNER JOIN LOP ON TRE.MaLop = LOP.MaLop
				   INNER JOIN KHOI ON LOP.MaKhoi = KHOI.MaKhoi
			WHERE  SoLuongTre = 10 OR TenKhoi = N'Mầm'
			GO


	/* Câu 14: Liệt kê MaTre, HoTen, NgaySinh, NgayDangKy, GioiTinh của những trẻ chưa từng vắng/nghỉ buổi nào
	   khi tham gia học tại trường.*/
	        
		   SELECT MaTre, HoTen, NgaySinh, NgayDangKy, GioiTinh
		   FROM   TRE
		   WHERE  MaTre NOT IN (SELECT MaTre FROM THEODOIVANG)
		   GO
	       
 
	/* Câu 15: Liệt kê MaLop, TenLop, TenKhoi, TenGV của những lớp đã có trẻ vắng/nghỉ trong năm 2015
	   và chưa từng vắng/ nghỉ trong năm 2014.*/
	   
	       SELECT   LOP.MaLop, TenLop, TenKhoi, TenGV
	       FROM     KHOI
				    INNER JOIN LOP ON KHOI.MaKhoi = LOP.MaKhoi
				    INNER JOIN GIAOVIEN ON LOP.MaGVCN = GIAOVIEN.MaGV
				    INNER JOIN TRE ON LOP.MaLop = TRE.MaLop
				    INNER JOIN THEODOIVANG ON TRE.MaTre = THEODOIVANG.MaTre
	       WHERE    TRE.MaTre IN ( SELECT MaTre FROM THEODOIVANG WHERE YEAR(NgayHoc) = '2015') AND
	                TRE.MaTre NOT IN (SELECT MaTre FROM THEODOIVANG WHERE YEAR(NgayHoc) = '2014')
	       GROUP BY LOP.MaLop, TenLop, TenKhoi, TenGV
	       GO
	       
	 
	/* Câu 16: Liệt kê MaTre, Hoten, NgayDangky, TenLop, TenGV, TenKhoi , NgaySinh, DiaChi của những trẻ
	   đã từng nghỉ/vắng vào 'Buổi sáng' và chỉ mới nghỉ một lần duy nhất từ ngày 1/2/2015 đến 30/11/2015. 
	   Kết quả liệt kê được sắp xếp tăng dần của trường NgaySinh.*/
	       
	       SELECT   DISTINCT TRE.MaTre, HoTen, NgayDangKy, TenLop, TenGV, TenKhoi, TRE.NgaySinh, TRE.DiaChi
	       FROM     KHOI
				    INNER JOIN LOP ON KHOI.MaKhoi = LOP.MaKhoi
				    INNER JOIN GIAOVIEN ON LOP.MaGVCN = GIAOVIEN.MaGV
				    INNER JOIN TRE ON LOP.MaLop = TRE.MaLop
				    INNER JOIN THEODOIVANG ON TRE.MaTre = THEODOIVANG.MaTre
	       
	       WHERE    TGBuoiSang = N'nghỉ' AND TRE.MaTre IN (SELECT MaTre FROM THEODOIVANG 
	                WHERE NgayHoc BETWEEN '2015/2/1' AND '2015/11/30' AND (TGBuoiSang = N'nghỉ' OR TGBuoiChieu = N'nghỉ')
	                GROUP BY MaTre
	                HAVING COUNT(TGBuoiSang) = 1 OR COUNT(TGBuoiChieu) = 1)
	       ORDER BY TRE.NgaySinh ASC
	       GO
	       
	                  