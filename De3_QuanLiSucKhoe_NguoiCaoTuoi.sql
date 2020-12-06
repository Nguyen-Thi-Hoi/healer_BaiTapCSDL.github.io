
   
   USE master
   GO
   
   CREATE DATABASE QuanLiSucKhoe
   GO
   
   USE QuanLiSucKhoe
   GO
   
   CREATE TABLE YTA
   (
       MaYTa       VARCHAR(5) NOT NULL,  
       TenYTa      NVARCHAR(50),
       NgaySinh    DATE,
       DiaChi      NVARCHAR(50),
       TrinhDo     NVARCHAR(50),
       GioiTinh    NVARCHAR(5)
       
       
       CONSTRAINT PK_YTA PRIMARY KEY (MaYTa)
       CONSTRAINT CK_YTA_GioiTinh CHECK ( GioiTinh IN (N'Nam' , N'Nữ'))
   )
   GO
   
   CREATE TABLE CHEDODINHDUONG
   (
        MaCDDinhDuong      VARCHAR(5) NOT NULL ,
		TenCDDinhDuong     NVARCHAR(50),
		DiemTam            NVARCHAR(50),
		GiuaSang           NVARCHAR(50),
		BuaTrua            NVARCHAR(50),
		GiuaChieu          NVARCHAR(50),
		BuaToi             NVARCHAR(50),
		MoTa               NVARCHAR(50)
		
		CONSTRAINT PK_CHEDODINHDUONG PRIMARY KEY ( MaCDDinhDuong)

   )
   GO
   
   CREATE TABLE NGUOIGIAMHO
   (
        MaNGiamHo         VARCHAR(6) NOT NULL,
		HotenNGiamHo      NVARCHAR(50),
		NgaySinh          DATE,
		DiaChi            NVARCHAR(50),
		SoDienThoai       VARCHAR(11)
		
		CONSTRAINT PK_NGUOIGIAMHO PRIMARY KEY ( MaNGiamHo )

   )
   GO
   
   CREATE TABLE CHEDOCHAMSOC
   (
        MaCDChamSoc       VARCHAR(5),
		TenCDChamSoc      NVARCHAR(50),
		MoTa              NVARCHAR(255),

		CONSTRAINT PK_CHEDOCHAMSOC PRIMARY KEY ( MaCDChamSoc )
   )
   GO
   
   CREATE TABLE NGUOICAOTUOI
   (
        MaNCaoTuoi     VARCHAR(7) NOT NULL,
		MaNGiamHo      VARCHAR(6),
		MaCDChamSoc    VARCHAR(5),
		HoTen          NVARCHAR(50),
		NgaySinh       DATE,
		GioiTinh       NVARCHAR(5)

		CONSTRAINT PK_NGUOICAOTUOI PRIMARY KEY ( MaNCaoTuoi )
   )
   GO
   
   CREATE TABLE THEODOICANNANG
   (
        MaNCaoTuoi        VARCHAR(7) NOT NULL,
		ThoiGianBD        DATE NOT NULL,
		ThoiGianKT        DATE,
		CanNang           INT,
		DienBienCanNang   NVARCHAR(50)
		CONSTRAINT PK_THEODOICANNANG PRIMARY KEY ( MaNCaoTuoi, ThoiGianBD )
   )
   GO
   
   CREATE TABLE THEODOISUCKHOE
   ( 
        MaNCaoTuoi           VARCHAR(7) NOT NULL,
		NgayTheoDoi          DATE NOT NULL,
		MaYTa                VARCHAR(5),
		MaCDDinhDuong        VARCHAR(5),
		TinhTrangSucKhoe     NVARCHAR(50),
		LyDoKhongKhoe        NVARCHAR(50),
		MoTaBieuHien         NVARCHAR(255)

		CONSTRAINT PK_THEODOISUCKHOE PRIMARY KEY ( MaNCaoTuoi, NgayTheoDoi )
   )
   GO
   
   
   -- thêm dữ liệu --
   
   INSERT INTO YTA VALUES ( 'YT01', N'Mỹ Liên', 	'1988/8/20',	N'Hòa Minh', N'y sĩ',       N'Nữ'),
						  (	'YT02',	N'Kim Oanh',	'1985/12/30',	N'Cẩm Lệ',	 N'điều dưỡng',	N'Nữ'),
    					  ( 'YT03',	N'Thiên Kim',   '1984/8/12',	N'Đô Lan',	 N'trung cấp',	N'Nữ')
 
   GO
   
   INSERT INTO CHEDODINHDUONG VALUES ('DD01',	N'chế độ bình thường',	N'Sữa, cháo lươn',	  N'nước cam, chuối',	            N'cơm cá, canh',	   N'Sữa, bánh su',         	N'cơm thịt',	        N'cố định'),
									 ('DD02',   N'chế độ đặc biệt',	    N'sữa, cháo hạt sen', N'nước cam, đu đủ',	            N'cơm thịt, rau, canh',	N'Chè sen',             	N'cơm cá',	            N'cố định'),
									 ('DD03',	N'chế độ tự chọn',	    N'sữa, xôi tự chọn',  N'nước dừa, bánh ngọt các loại',	N'cơm cá, rau, canh',	N'Bánh ngọt nhiều loại',	N'cơm, bún hoặc cháo',	N'tự chọn')
	
   GO
   
   INSERT INTO NGUOIGIAMHO VALUES ( 'GH001',	N'Phan Bá Mãi',   	'1985/12/10',  N'Hòa Hải',	'0905862354'),
								   ('GH002',	N'Nguyễn Huy Như',	'1982/3/2',	   N'Cẩm Lệ',	'0932568471'),
									('GH003',	N'Lê Văn Tiến',	    '1975/4/20',   N'Hải Châu',	'0902548796'),
									('GH004',	N'Trần Quốc Sơn',	'1986/11/23',  N'Lao Đạn',	'0987456258'),
									('GH005',	N'Nguyễn Châu Oanh','1978/10/7',   N'Hòa Xuân',	'0982548756')

   GO
   SELECT * from NGUOIGIAMHO
   go
   
   INSERT INTO CHEDOCHAMSOC VALUES  ('CS01',	N'An dưỡng',	        N'Phục vụ ăn uống, tắm giặt, sinh hoạt'),
									('CS02',    N'Người lú lẫn',     	N'Theo dõi 24/24 quan tâm mọi thời điểm'),
									('CS03',	N'Phục hồi chức năng',	N'Hỗ trợ phục hồi chức năng dựa vào chế độ luyện tập'),
									('CS04',	N'Thể chất',	        N'Chăm sóc người bị liệt, viêm loét')

   GO
   
   INSERT INTO NGUOICAOTUOI VALUES ('NCT001',	 'GH002', 	 'CS01', 	N'Nguyễn Ba',    	'1940/3/10',	N'Nam'),
								   ('NCT002',	 'GH003',	 'CS01', 	N'Trần Khải',       '1950/8/20',	N'Nam'),
								   ('NCT003',	 'GH004', 	 'CS03', 	N'Phan Văn Khải',	'1945/10/3',	N'Nam'),
								   ('NCT004',	 'GH001', 	 'CS02', 	N'Nguyễn Thị Mai',	'1960/12/20',	N'Nữ'),
								   ('NCT005',	 'GH004', 	 'CS02', 	N'Nguyễn Thái Hòa',	'1949/12/2',	N'Nữ')

   GO
   
   INSERT INTO THEODOICANNANG VALUES ('NCT001',	'2015/5/1', 	'2015/6/1',	56,	N'Tăng cân'),
									 ('NCT002',	'2016/1/30',	'2016/2/28',70,	N'Tăng cân'),
									 ('NCT001',	'2015/3/2',	    '2015/4/2',	45,	N'Giảm cân')

   GO
   
   SELECT * FROM THEODOICANNANG
   GO
   
   
   INSERT INTO THEODOISUCKHOE VALUES ('NCT001',	'2015/4/1',	'YT01',	'DD01',	N'Bình thường',    	N'Không',       	N'Ăn uống và hoạt động bình thường'),
									 ('NCT002',	'2015/9/7',	'YT01',	'DD02',	N'Biểu hiện yếu',	N'Bị viêm dạ dày',	N'Bữa sáng không ăn được nhiều, bữa trưa và tối không ăn.'),
									 ('NCT003',	'2014/8/5',	'YT02',	'DD01',	N'Bình thường',     N'Không',       	N'Ăn uống và hoạt động bình thường')

   GO
   
   -- TẠO KHÓA NGOẠI --
   
   ALTER TABLE THEODOISUCKHOE
   ADD CONSTRAINT FK_TDSK_YTA FOREIGN KEY (MaYTa) REFERENCES YTA ( MaYTa)
   GO
   
   ALTER TABLE THEODOISUCKHOE
   ADD CONSTRAINT FK_TDSK_CHEDODINHDUONG FOREIGN KEY (MaCDDinhDuong) REFERENCES CHEDODINHDUONG (MaCDDinhDuong)
   GO
   
   ALTER TABLE NGUOICAOTUOI
   ADD CONSTRAINT FK_NCT_NGUOIGIAMHO FOREIGN KEY ( MaNGiamHo) REFERENCES NGUOIGIAMHO ( MaNGiamHo)
   GO
   
   ALTER TABLE NGUOICAOTUOI
   ADD CONSTRAINT FK_NCT_CHEDOCHAMSOC FOREIGN KEY ( MaCDChamSoc) REFERENCES CHEDOCHAMSOC (MaCDChamSoc)
   GO
   
   ALTER TABLE THEODOISUCKHOE
   ADD CONSTRAINT FK_TDSK_NGUOICAOTUOI FOREIGN KEY (MaNCaoTuoi) REFERENCES NGUOICAOTUOI (MaNCaoTuoi)
   GO
   
   ALTER TABLE THEODOICANNANG
   ADD CONSTRAINT FK_TDCN_NGUOICAOTUOI FOREIGN KEY ( MaNCaoTuoi) REFERENCES NGUOICAOTUOI (MaNCaoTuoi)
   GO
   
    
    -- ***   TRUY VẤN DỮ LIỆU   *** --
    
	/* Câu 1: Liệt kê thông tin của toàn bộ Người cao tuổi ở tại viện dưỡng lão.*/
	    
	        SELECT * FROM NGUOICAOTUOI
	        GO
	        

	/* Câu 2: Xóa toàn bộ thông tin của các Y tá có trình độ là 'trung cấp'.*/
	        
	        DELETE FROM YTA
	        WHERE  TrinhDo = N'trung cấp'
	        GO
	        
	        SELECT TrinhDo FROM YTA
	        GO
	        

	/* Câu 3: Cập nhật trường DiaChi của bảng Y tá thành 'Hòa Hải' đối với trường DiaChi có giá trị là 'Hòa Minh'.*/
	
	        UPDATE YTA
	        SET DiaChi = N'Hòa Hải'
	        WHERE DiaChi = N'Hòa Minh'
	        GO
	        
	        SELECT DiaChi FROM YTA
	        GO
	        

	/* Câu 4: Liệt kê thông tin của những Người cao tuổi có độ tuổi lớn hơn 70 tuổi, ở tại địa chỉ là 'Hòa Xuân' 
	(chính là địa chỉ của người giám hộ) và những Người cao tuổi có độ tuổi nhỏ hơn 50 tuổi, ở tại địa chỉ là 'Cẩm Lệ'.*/
	
	        
	        SELECT * FROM NGUOICAOTUOI
	                 INNER JOIN NGUOIGIAMHO ON NGUOICAOTUOI.MaNGiamHo = NGUOIGIAMHO.MaNGiamHo
	        WHERE    YEAR(GETDATE()) - YEAR(NGUOICAOTUOI.NgaySinh) > 70 AND NGUOIGIAMHO.DiaChi = N'Hòa Xuân' OR
	                 YEAR(GETDATE()) - YEAR(NGUOICAOTUOI.NgaySinh) < 50 AND NGUOIGIAMHO.DiaChi = N'Cẩm Lệ'
	        GO
	       

	/* Câu 5: Liệt kê họ tên của những Người cao tuổi có họ tên kết thúc là ký tự 'G' và có độ dài 7 ký tự.*/
	
	        SELECT HoTen FROM NGUOICAOTUOI
	        WHERE  HoTen LIKE '%G' AND LEN(HoTen) = 7
	        GO
	        

	/* Câu 6: Liệt kê thông tin toàn bộ Người giám hộ, sắp xếp giảm dần theo họ tên và tăng dần theo ngày sinh.*/
	
	        SELECT * FROM NGUOIGIAMHO
	        ORDER BY HotenNGiamHo DESC, NgaySinh ASC
	        GO
	        
	        

	/* Câu 7: Đếm số người cao tuổi được theo dõi tương ứng từng y tá (nghĩa là mỗi ý tá theo dõi bao nhiêu người cao tuổi), 
	chỉ đếm những người cao tuổi có độ tuổi từ 50 đến 70 tuổi.*/
            
            SELECT   MaYTa, COUNT(THEODOISUCKHOE.MaNCaoTuoi) AS N'Số người cao tuổi được theo dõi'
            FROM     NGUOICAOTUOI
                     INNER JOIN THEODOISUCKHOE ON NGUOICAOTUOI.MaNCaoTuoi = THEODOISUCKHOE.MaNCaoTuoi
            WHERE    DATEDIFF(YEAR, NgaySinh, GETDATE()) BETWEEN 50 AND 70
            GROUP BY MaYTa
            GO
             
            
	/* Câu 8: Liệt kê thông tin MaNGiamHo, HotenNGiamHo, DiaChi của những người giám hộ. Chỉ liệt kê thông tin 
	của những người giám hộ có độ tuổi nhỏ hơn 40 tuổi và có địa chỉ tại 'Cẩm Lệ'. Liệt kê 5 dòng đầu tiên tìm thấy được.*/
            
            SELECT TOP 5 MaNGiamHo, HoTenNGiamHo, DiaChi
            FROM       NGUOIGIAMHO
            WHERE      YEAR(GETDATE()) - YEAR(NgaySinh) < 40 AND DiaChi = N'Cẩm Lệ'
            GO      -- DATEDIFT ( YEAR, NgaySinh, GETDATE()) < 40 ......
            
             
	/* Câu 9: Liệt kê họ tên của toàn bộ Người cao tuổi (tên nào giống nhau thì chỉ liệt kê một lần)*/
	 
	        SELECT DISTINCT HoTen FROM NGUOICAOTUOI
	        GO
	        

	/* Câu 10: Liệt kê MaNCaoTuoi, HoTen, TenCDChamSoc, TenCDDinhDuong, TenYTa, NgaySinh, TinhTrangSucKhoe, LyDoKhongKhoe 
	  (của tất cả các lần theo dõi sức khỏe cho người cao tuổi).*/
	        
	        SELECT   NGUOICAOTUOI.MaNCaoTuoi, HoTen, TenCDChamSoc, TenCDDinhDuong, TenYTa, NGUOICAOTUOI.NgaySinh, TinhTrangSucKhoe, LyDoKhongKhoe
	        FROM     YTA
	                 INNER JOIN THEODOISUCKHOE ON YTA.MaYTa = THEODOISUCKHOE.MaYTa
	                 INNER JOIN CHEDODINHDUONG ON THEODOISUCKHOE.MaCDDinhDuong = CHEDODINHDUONG.MaCDDinhDuong
	                 INNER JOIN NGUOICAOTUOI ON THEODOISUCKHOE.MaNCaoTuoi = NGUOICAOTUOI.MaNCaoTuoi
	                 INNER JOIN CHEDOCHAMSOC ON NGUOICAOTUOI.MaCDChamSoc = CHEDOCHAMSOC.MaCDChamSoc
	                 INNER JOIN THEODOICANNANG ON NGUOICAOTUOI.MaNCaoTuoi = THEODOICANNANG.MaNCaoTuoi
	        GO

	/* Câu 11: Liệt kê thông tin MaNCaoTuoi, HoTen, TenCDChamSoc, TenCDDinhDuong, TenYTa, TinhTrangSucKhoe của những người cao tuổi
	  có ngày theo dõi từ 1/5/2015 đến 30/5/2015 và chưa từng nằm trong chế độ phải theo dõi về cân nặng trong năm 2015.*/
	        
	        SELECT   NGUOICAOTUOI.MaNCaoTuoi, HoTen, TenCDChamSoc, TenCDDinhDuong, TenYTa,  TinhTrangSucKhoe
	        FROM     YTA
	                 INNER JOIN THEODOISUCKHOE ON YTA.MaYTa = THEODOISUCKHOE.MaYTa
	                 INNER JOIN CHEDODINHDUONG ON THEODOISUCKHOE.MaCDDinhDuong = CHEDODINHDUONG.MaCDDinhDuong
	                 INNER JOIN NGUOICAOTUOI ON THEODOISUCKHOE.MaNCaoTuoi = NGUOICAOTUOI.MaNCaoTuoi
	                 INNER JOIN CHEDOCHAMSOC ON NGUOICAOTUOI.MaCDChamSoc = CHEDOCHAMSOC.MaCDChamSoc
	                 
	        WHERE    NGUOICAOTUOI.MaNCaoTuoi NOT IN (SELECT MaNCaoTuoi FROM THEODOICANNANG) AND
	                 NgayTheoDoi BETWEEN '2015/5/1' AND '2015/5/30' 
	              
	        GO
	       
	/* Câu 12: Liệt kê MaNCaoTuoi, Hoten, NgaySinh, TenCDDChamSoc, CanNang,  TenCDDinhDuong, ThoiGianTheoDoiCanNang 
	  (là số ngày được tính bằng cách lấy ThoiGianBĐ - ThoiGianKT) ,DienBienCanNang của tất cả các lần theo dõi cân nặng 
	  của người cao tuổi (những người cao tuổi nào chưa nằm trong chế độ theo dõi cân nặng cũng phải liệt kê thông tin 
	  của người cao tuổi đó ra).*/
	        
	         SELECT   NGUOICAOTUOI.MaNCaoTuoi, HoTen, NgaySinh, TenCDChamSoc, CanNang,  TenCDDinhDuong, DATEDIFF(DAY, ThoiGianBD, ThoiGianKT) AS N'ThoiGianTheoDoiCanNang' , DienBienCanNang
	         FROM     NGUOICAOTUOI
	                  LEFT OUTER JOIN THEODOICANNANG ON NGUOICAOTUOI.MaNCaoTuoi = THEODOICANNANG.MaNCaoTuoi
	                  LEFT OUTER JOIN THEODOISUCKHOE ON NGUOICAOTUOI.MaNCaoTuoi = THEODOISUCKHOE.MaNCaoTuoi
	                  LEFT OUTER JOIN CHEDOCHAMSOC ON NGUOICAOTUOI.MaCDChamSoc = CHEDOCHAMSOC.MaCDChamSoc
	                  LEFT OUTER JOIN CHEDODINHDUONG ON THEODOISUCKHOE.MaCDDinhDuong = CHEDODINHDUONG.MaCDDinhDuong
	         GO
	         
	/* Câu 13: Liệt kê MaNCaoTuoi, HoTen, Tuoi (được tính lấy ngày hiện tại - ngày sinh) của những người cao tuổi 
	   có chế độ chăm sóc là 'An Dưỡng' hoặc có người giám hộ có độ tuổi lớn hơn 40 tuổi.*/
             
             SELECT    NGUOICAOTUOI.MaNCaoTuoi, HoTen, YEAR(GETDATE()) - YEAR(NGUOICAOTUOI.NgaySinh) AS 'Tuoi'
             FROM      NGUOICAOTUOI
                       INNER JOIN NGUOIGIAMHO  ON NGUOICAOTUOI.MaNGiamHo = NGUOIGIAMHO.MaNGiamHo
                       INNER JOIN CHEDOCHAMSOC ON NGUOICAOTUOI.MaCDChamSoc = CHEDOCHAMSOC.MaCDChamSoc
             WHERE     TenCDChamSoc = N'An Dưỡng' OR 
                       DATEDIFF(YEAR,NGUOIGIAMHO.NgaySinh, GETDATE()) > 40
             GO
              
	/* Câu 14: Liệt kê MaYT, TenYTa, NgaySinh, TrinhDo của những y tá chưa từng thực hiện theo dõi bất kỳ người cao tuổi nào.*/
              
             SELECT YTA.MaYTa, TenYTa, NgaySinh, TrinhDo
             FROM   YTA
             WHERE  MaYTa NOT IN (SELECT MaYTa FROM THEODOISUCKHOE)
             GO
         
             SELECT * FROM YTA
              GO
              
	/* Câu 15: Liệt kê MaNCaoTuoi, Hoten, TenCDChamSoc, TenCDDinhDuong, NgayTheoDoi, TinhTrangSucKhoe của những người cao tuổi 
	  có chế độ dinh dưỡng là 'chế độ tự chọn' và chưa từng có chế độ dinh dưỡng là 'chế độ đặc biệt'.*/

             SELECT NGUOICAOTUOI.MaNCaoTuoi, HoTen, TenCDChamSoc, TenCDDinhDuong, NgayTheoDoi, TinhTrangSucKhoe
             FROM   NGUOICAOTUOI
                    INNER JOIN CHEDOCHAMSOC ON NGUOICAOTUOI.MaCDChamSoc = CHEDOCHAMSOC.MaCDChamSoc
                    INNER JOIN THEODOISUCKHOE ON NGUOICAOTUOI.MaNCaoTuoi = THEODOISUCKHOE.MaNCaoTuoi
                    INNER JOIN CHEDODINHDUONG ON THEODOISUCKHOE.MaCDDinhDuong = CHEDODINHDUONG.MaCDDinhDuong
             WHERE  TenCDDinhDuong = N'chế độ tự chọn'
             
             EXCEPT
             
             SELECT NGUOICAOTUOI.MaNCaoTuoi, HoTen, TenCDChamSoc, TenCDDinhDuong, NgayTheoDoi, TinhTrangSucKhoe
             FROM   NGUOICAOTUOI
                    INNER JOIN CHEDOCHAMSOC ON NGUOICAOTUOI.MaCDChamSoc = CHEDOCHAMSOC.MaCDChamSoc
                    INNER JOIN THEODOISUCKHOE ON NGUOICAOTUOI.MaNCaoTuoi = THEODOISUCKHOE.MaNCaoTuoi
                    INNER JOIN CHEDODINHDUONG ON THEODOISUCKHOE.MaCDDinhDuong = CHEDODINHDUONG.MaCDDinhDuong
             WHERE  TenCDDinhDuong = N'chế độ đặc biệtt'
             GO
             
             SELECT * FROM CHEDODINHDUONG
             GO
             
              
	/* Câu 16: Liệt kê thông tin MaNCaoTuoi, Hoten, NgaySinh, HotenNGiamHo, DiaChi, TenCDDinhDuong, NgayTheoDoi, TinhTrangSucKhoe 
	   của những người cao tuổi có chế độ chăm sóc là 'người lú lẫn' và chỉ được đưa vào chế độ theo dõi sức khỏe một lần duy nhất
	   trong năm 2015. Kết quả liệt kê sẽ được sắp xếp giảm dần theo trường NgaySinh*/
	   
	         SELECT NGUOICAOTUOI.MaNCaoTuoi, HoTen, NGUOICAOTUOI.NgaySinh, HoTenNGiamHo, DiaChi, TenCDDinhDuong, NgayTheoDoi, TinhTrangSucKhoe
	         FROM   NGUOICAOTUOI
	                INNER JOIN NGUOIGIAMHO ON NGUOICAOTUOI.MaNGiamHo = NGUOIGIAMHO.MaNGiamHo
	                INNER JOIN CHEDOCHAMSOC ON NGUOICAOTUOI.MaCDChamSoc = CHEDOCHAMSOC.MaCDChamSoc
	                INNER JOIN THEODOISUCKHOE ON NGUOICAOTUOI.MaNCaoTuoi = THEODOISUCKHOE.MaNCaoTuoi
	                INNER JOIN CHEDODINHDUONG ON THEODOISUCKHOE.MaCDDinhDuong = CHEDODINHDUONG.MaCDDinhDuong
	                
	         WHERE  TenCDChamSoc = N'người lú lẫn' AND
	                NGUOICAOTUOI.MaNCaoTuoi IN ( SELECT MaNCaoTuoi FROM THEODOISUCKHOE WHERE YEAR(NgayTheoDoi) = '2015'
	                                             GROUP BY MaNCaoTuoi
	                                             HAVING COUNT(NgayTheoDoi) = 1 )
	         ORDER BY NGUOICAOTUOI.NgaySinh DESC
	         GO
	        
	        
             