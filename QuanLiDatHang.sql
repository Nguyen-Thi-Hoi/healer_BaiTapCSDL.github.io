
	USE MASTER
	GO

	CREATE DATABASE QuanLiDatHang
	GO

	USE QuanLiDatHang
	GO

	
	CREATE TABLE KHACHHANG
	(
	MAKHACHHANG     VARCHAR(6) NOT NULL,
	TENCONGTY       NVARCHAR(255),
	TENGIAODICH     VARCHAR(20),
	DIACHI          NVARCHAR(255),
	EMAIL           VARCHAR(10),
	DIENTHOAI       VARCHAR(8),
	FAX             VARCHAR(20)

	CONSTRAINT PK_KHACHHANG PRIMARY KEY (MAKHACHHANG)
	)
	GO

	CREATE TABLE NHACUNGCAP
	(
	MACONGTY       VARCHAR(6) NOT NULL,
	TENCONGTY      NVARCHAR(255),
	TENGIAODICH    VARCHAR(20),
	DIACHI         NVARCHAR(255),
	DIENTHOAI      VARCHAR(8),
	FAX            VARCHAR(20),
	EMAIL          VARCHAR(20)

	CONSTRAINT PK_NHACUNGCAP PRIMARY KEY (MACONGTY)
	)
	GO

	CREATE TABLE LOAIHANG
	(
	MALOAIHANG     VARCHAR(2) NOT NULL,
	TENLOAIHANG    NVARCHAR(255)

	CONSTRAINT PK_LOAIHANG PRIMARY KEY (MALOAIHANG)
	)
	GO

	CREATE TABLE MATHANG
	(
	MAHANG         VARCHAR(6) NOT NULL,
	TENHANG        NVARCHAR(255),
	MACONGTY       VARCHAR(6),
	MALOAIHANG     VARCHAR(2),
	SOLUONG        INT,
	DONVITINH      NVARCHAR(20),
	GIAHANG        FLOAT

	CONSTRAINT PK_MATHANG PRIMARY KEY (MAHANG)

	)
	GO

	CREATE TABLE NHANVIEN
	(
	MANHANVIEN      VARCHAR(6) NOT NULL,
	HO              NVARCHAR(255),
	TEN             NVARCHAR(20),
	NGAYSINH        DATE,
	NGAYLAMVIEC     DATE,
	DIACHI          NVARCHAR(255),
	DIENTHOAI       VARCHAR(12),
	LUONGCOBAN      FLOAT,
	PHUCAP          FLOAT

	CONSTRAINT PK_NHANVIEN PRIMARY KEY (MANHANVIEN)
	)
	GO

	CREATE TABLE DONDATHANG
	(
	SOHOADON           VARCHAR(6) NOT NULL,
	MAKHACHHANG        VARCHAR(6),
	MANHANVIEN         VARCHAR(6),
	NGAYDATHANG        DATE,
	NGAYGIAOHANG       DATE,
	NGAYCHUYENHANG     DATE,
	NOIGIAOHANG        NVARCHAR(255)

	CONSTRAINT PK_DONDATHANG PRIMARY KEY (SOHOADON)
	)
	GO

	CREATE TABLE CHITIETDATHANG
	(
	SOHOADON        VARCHAR(6) NOT NULL,
	MAHANG          VARCHAR(6) NOT NULL,
	GIABAN          FLOAT,
	SOLUONG         INT,
	MUCGIAMGIA      INT

	CONSTRAINT PK_CHITIETDATHANG PRIMARY KEY (SOHOADON, MAHANG)
	)
	GO


	-- TẠO KHÓA NGOẠI--


	ALTER TABLE DONDATHANG
	ADD CONSTRAINT FK_DDH_KHACHHANG FOREIGN KEY (MAKHACHHANG) REFERENCES KHACHHANG (MAKHACHHANG)
	GO

	ALTER TABLE MATHANG
	ADD CONSTRAINT FK_MH_NHACUNGCAP FOREIGN KEY (MACONGTY) REFERENCES NHACUNGCAP (MACONGTY)
	GO

	ALTER TABLE MATHANG
	ADD CONSTRAINT FK_MH_LOAIHANG FOREIGN KEY (MALOAIHANG) REFERENCES LOAIHANG (MALOAIHANG)
	GO

	ALTER TABLE CHITIETDATHANG
	ADD CONSTRAINT FK_CTDH_MATHANG FOREIGN KEY (MAHANG) REFERENCES MATHANG (MAHANG)
	GO

	ALTER TABLE DONDATHANG
	ADD CONSTRAINT FK_DDH_NHANVIEN FOREIGN KEY (MANHANVIEN) REFERENCES NHANVIEN (MANHANVIEN)
	GO

	ALTER TABLE CHITIETDATHANG
	ADD CONSTRAINT FK_CTDH_DONDATHANG FOREIGN KEY (SOHOADON) REFERENCES DONDATHANG (SOHOADON)
	GO

	-- INSERT DU LIEU --

	INSERT INTO KHACHHANG
	VALUES      ('KH001', N'ĐIỆN TOÁN SÀI GÒN', 'CINOTEC', N'43 Yết Kiều P6 Q3 TP HCM',NULL , '7931752',NULL )
	GO

	INSERT INTO KHACHHANG
	VALUES      ('KH002', N'VẬT TƯ THIẾT BỊ GIAO THÔNG VẬN TẢI', 'COMECO', N'226 An Dương Vương P11 Q11 TP HCM',NULL , '8456781',NULL )
	GO

	INSERT INTO KHACHHANG
	VALUES      ('KH003', N'PHÁT HÀNH SÁCH SÀI GÒN', 'FAHASA', N'12 Thuận Kiều Q5 TP HCM',NULL , '8452792',NULL )
	GO

	INSERT INTO KHACHHANG
	VALUES      ('KH004', N'DỊCH VỤ ĐẦU TƯ NƯỚC NGOÀI', 'FISC', N'31 Trương Định P6 Q1 TP HCM', NULL, '8458247',NULL )
	GO

	INSERT INTO KHACHHANG
	VALUES      ('KH005', N'HƯNG SÁNG', 'HUNGSAN', N'175 Lý Thường Kiệt',NULL , '5465487', NULL)
	GO

	INSERT INTO KHACHHANG
	VALUES      ('KH006', N'BỘT GIẶC LIX', 'LIXCO', N'79 Bàn Cờ P3 Q5 TP HCM',NULL , '8952187', NULL)
	GO

	SELECT * FROM KHACHHANG
	GO

	-----------                              --------

	INSERT INTO NHACUNGCAP
	VALUES      ('CC001', N'BỘT GIẶT LIX', 'LIXCO', N'79 Bàn Cờ P3 Q5 TP HCM',NULL , '8952187', NULL)
	GO

	INSERT INTO NHACUNGCAP
	VALUES      ('CC002', N'THỦY SẢN XUẤT KHẨU', 'SAFICO', N'47 Bãi Sậy P1 Q11 TP HCM',NULL ,NULL, NULL )
	GO

	INSERT INTO NHACUNGCAP
	VALUES      ('CC003', N'VÀNG BẠC ĐÁ QUÝ SÀI GÒN', 'SJC', N'350 CMT8 P12 Q3 TP HCM',NULL , '8543543',NULL )
	GO

	INSERT INTO NHACUNGCAP
	VALUES      ('CC004', N'THƯƠNG MẠI TẤN PHÁT', 'TAFACO', N'4 Trần Phú Q5 TP HCM', NULL, '8754875',NULL )
	GO

	INSERT INTO NHACUNGCAP
	VALUES      ('CC005', N'DỊCH VỤ VẬN TẢI', 'TRANACO', N'156 Lê Đại Hành P7 Q10 TP HCM',NULL , '8654635',NULL )
	GO

	INSERT INTO NHACUNGCAP
	VALUES      ('CC006', N'NƯỚC GIẢI KHÁT SÀI GÒN', 'SABICO', N'343 Nhật Tảo Q10',NULL ,NULL,NULL )
	GO

	SELECT * FROM NHACUNGCAP
	GO

	-----                   ---------------

	INSERT INTO LOAIHANG
	VALUES      ('1', N'Thực phẩm')
	GO

	INSERT INTO LOAIHANG
	VALUES      ('2', N'Nước uống')
	GO

	INSERT INTO LOAIHANG
	VALUES      ('3', N'Hoa quả')
	GO

	INSERT INTO LOAIHANG
	VALUES      ('4', N'May mặc')
	GO

	INSERT INTO LOAIHANG
	VALUES      ('5', N'Gia dụng')
	GO

	SELECT * FROM LOAIHANG
	GO

	--------------            -----------

	INSERT INTO MATHANG
	VALUES      ('MH001', N'Rượu',         'CC006', '2', 4,  N'chai', 2305000 )
	GO

	INSERT INTO MATHANG
	VALUES      ('MH002', N'Gia vị',       'CC004', '1', 2,  N'thùng',400000 )
	GO

	INSERT INTO MATHANG
	VALUES      ('MH003', N'Táo',          'CC005', '3', 28, N'kg',   50000 )
	GO

	INSERT INTO MATHANG
	VALUES      ('MH004', N'Cá hộp',       'CC002', '1', 5,  N'thùng',650000 )
	GO

	INSERT INTO MATHANG
	VALUES      ('MH005', N'Áo Việt Tiến', 'CC004', '4', 60, N'cái',  203000 )
	GO

	INSERT INTO MATHANG
	VALUES      ('MH006', N'Bột giặt',     'CC001', '5', 9,  N'thùng', 509000)
	GO

	SELECT * FROM MATHANG
	GO

	------------------                      ----------------------

	INSERT INTO NHANVIEN
	VALUES      ('NV001', N'Nguyễn Ngọc', N'Nga',  '1964/12/10', '2004/07/13', N'13 Hùng Vương',  '0909123233',   4000000, 1200000)
	GO

	INSERT INTO NHANVIEN
	VALUES      ('NV002', N'Hà Vinh ',     N'Phát', '1979/12/07', '2006/06/13', N'89 Đồng Khởi',   NULL,           2800000 , 1000000)
	GO

	INSERT INTO NHANVIEN
	VALUES      ('NV003', N'Nguyễn Kim ',  N'Ngọc', '1980/12/25', '2009/09/01', N'187 Hậu Giang',  '0935123789',   2100000 ,NULL )
	GO

	INSERT INTO NHANVIEN
	VALUES      ('NV004', N'Trương Duy ',  N'Hùng', '1986/10/10', '2011/04/24', N'77 Trương Định', '01227678768', 1900000, NULL)
	GO

	INSERT INTO NHANVIEN
	VALUES      ('NV005', N'Lê Văn ',     N'Hùng', '1957/03/06', '2004/07/13', N'56 Nguyễn Trãi', '5745867',     4700000, 1800000)
	GO

	SELECT * FROM NHANVIEN
	GO

	--------------                   --------------

	INSERT INTO DONDATHANG
	VALUES      ('10143', 'KH004', 'NV001', '2011/01/10',NULL, NULL, NULL)
	GO

	INSERT INTO DONDATHANG
	VALUES      ('10150', 'KH005', 'NV004' ,'2011/05/03',NULL,NULL , NULL)
	GO

	INSERT INTO DONDATHANG
	VALUES      ('10156', 'KH004', 'NV004', '2011/01/12',NULL,NULL , NULL)
	GO

	INSERT INTO DONDATHANG
	VALUES      ('10157', 'KH002', 'NV003', '2011/07/04',NULL,NULL , NULL)
	GO

	INSERT INTO DONDATHANG
	VALUES      ('10226', 'KH003', 'NV003', '2011/08/11','2011/09/11', NULL, N'12 Thuận Kiều Q5 TP HCM')
	GO

	SELECT * FROM DONDATHANG
	GO

	--------               --------------

	INSERT INTO CHITIETDATHANG
	VALUES      ('10148', 'MH003', 57000, 20, 0)
	GO

	INSERT INTO CHITIETDATHANG
	VALUES      ('10148', 'MH004', 720000, 1, 0)
	GO

	INSERT INTO CHITIETDATHANG
	VALUES      ('10150', 'MH002', 430000, 1, 0)
	GO

	INSERT INTO CHITIETDATHANG
	VALUES      ('10157', 'MH001', 2700000, 3, 0)
	GO

	INSERT INTO CHITIETDATHANG
	VALUES      ('10157', 'MH006', 530000, 2, 0)
	GO

	INSERT INTO CHITIETDATHANG
	VALUES      ('10226', 'MH004', 720000, 2, 0)
	GO

	SELECT * FROM CHITIETDATHANG
	GO


	-- TRUY VẤN --

	/* Sử dụng câu lệnh SELECT để viết các yêu cầu truy vấn dữ liệu sau đây: */
	
	/* 1	Cho biết danh sách các đối tác cung cấp hàng cho công ty.*/
	        
			SELECT NHACUNGCAP.MACONGTY, TENCONGTY
			FROM   NHACUNGCAP
			GO
	
	/* 2	Mã hàng, tên hàng và số lượng của các mặt hàng hiện có trong công ty.*/
	        
			SELECT MAHANG, TENHANG, SOLUONG
			FROM MATHANG
			GO

	/* 3	Họ tên và địa chỉ và năm bắt đầu làm việc của các nhân viên trong công ty.*/
	        
			SELECT CONCAT('', HO, TEN) AS N'HỌ TÊN', DIACHI AS N'ĐỊA CHỈ', YEAR(NGAYLAMVIEC) AS N'NĂM BĐ LÀM VIỆC'
			FROM NHANVIEN
			GO
			
	/* 4	Địa chỉ và điện thoại của nhà cung cấp có tên giao dịch TAFACO là gì?*/
	         
			 SELECT DIACHI, DIENTHOAI, TENGIAODICH
			 FROM   NHACUNGCAP
			 WHERE  TENGIAODICH = 'TAFACO'
			 GO

	/* 5	Cho biết mã và tên của các mặt hàng có giá lớn hơn 100000 và số lượng hiện có ít hơn 50.*/

	        SELECT MAHANG, TENHANG
			FROM   MATHANG
			WHERE  (GIAHANG > 100000) AND (SOLUONG < 50)
			GO

	/* 6	Cho biết mỗi mặt hàng trong công ty do ai cung cấp.*/
     
	        SELECT   MAHANG, TENHANG, TENCONGTY
			FROM     MATHANG
			         INNER JOIN NHACUNGCAP ON MATHANG.MACONGTY = NHACUNGCAP.MACONGTY
			GO
					              
	/* 7    Công ty Dịch vụ vận tải  đã cung cấp những mặt hàng nào?*/
	        
			SELECT TENCONGTY, MAHANG, TENHANG
			FROM   NHACUNGCAP
			       INNER JOIN MATHANG ON NHACUNGCAP.MACONGTY = MATHANG.MACONGTY
		    WHERE  TENCONGTY = N'DỊCH VỤ VẬN TẢI'
			GO

	/* 8	Loại hàng thực phẩm do những công ty nào cung cấp và địa chỉ của các công ty đó là gì?*/
	        
            SELECT * FROM LOAIHANG
			GO

			SELECT TENLOAIHANG, TENCONGTY, DIACHI
			FROM   LOAIHANG
			       INNER JOIN MATHANG ON LOAIHANG.MALOAIHANG = MATHANG.MALOAIHANG
				   INNER JOIN NHACUNGCAP ON MATHANG.MACONGTY = NHACUNGCAP.MACONGTY
		    WHERE  TENLOAIHANG = N'Thực phẩm'
			GO

	/* 9   Những khách hàng nào (tên giao dịch) đã đặt mua mặt hàng Cá hộp của công ty?*/
	        
			SELECT * FROM MATHANG
		    GO

			SELECT TENGIAODICH, TENHANG
			FROM   KHACHHANG
			       INNER JOIN DONDATHANG ON KHACHHANG.MAKHACHHANG = DONDATHANG.MAKHACHHANG
				   INNER JOIN CHITIETDATHANG ON DONDATHANG.SOHOADON = CHITIETDATHANG.SOHOADON
				   INNER JOIN MATHANG ON CHITIETDATHANG.MAHANG = MATHANG.MAHANG
			WHERE  TENHANG = N'Cá hộp'
			GO

	/* 10  Đơn đặt hàng số 10148 do ai đặt và do nhân viên nào lập, thời gian và địa điểm giao hàng là ở đâu?*/
	        
			SELECT * FROM DONDATHANG
			GO

			SELECT MAKHACHHANG, MANHANVIEN, NGAYGIAOHANG, NOIGIAOHANG
			FROM   DONDATHANG
			WHERE  SOHOADON = '10148'
			GO

	/* 11  Hãy cho biết số tiền lương mà công ty phải trả cho mỗi nhân viên là bao nhiêu (lương = lương cơ bản + phụ cấp).*/

	        SELECT MANHANVIEN, HO, TEN,
			       LUONGCOBAN + CASE  
				                WHEN PHUCAP IS NULL THEN 0
								ELSE PHUCAP
								END  AS N'TIỀN LƯƠNG MỖI NV'
			FROM   NHANVIEN
			GO


	/* 12  Trong đơn đặt hàng số 10226 đặt mua những mặt hàng nào và số tiền mà khách hàng phải trả cho mỗi mặt hàng là bao nhiêu 
	(số tiền phải trả được tính theo công thức SOLUONG×GIABAN – SOLUONG×GIABAN×MUCGIAMGIA/100)*/
            
			SELECT * FROM CHITIETDATHANG
			GO

			SELECT CHITIETDATHANG.SOHOADON,TENHANG,
			       (CHITIETDATHANG.SOLUONG*GIABAN - CHITIETDATHANG.SOLUONG*GIABAN*MUCGIAMGIA/100) AS N'SỐ TIỀN CẦN TRẢ'
		    FROM   CHITIETDATHANG
			       INNER JOIN MATHANG ON CHITIETDATHANG.MAHANG = MATHANG.MAHANG
		    WHERE  SOHOADON = '10226'
		    GO


	/* 13***   Hãy cho biết có những khách hàng nào lại chính là đối tác cung cấp hàng của công ty (tức là có cùng tên giao dịch).*/
            
           select KHACHHANG.TENGIAODICH from KHACHHANG where KHACHHANG.MAKHACHHANG in
           (select KHACHHANG.MAKHACHHANG from DONDATHANG where DONDATHANG.SOHOADON in
           (select DONDATHANG.SOHOADON from CHITIETDATHANG where CHITIETDATHANG.MAHANG in
           (select CHITIETDATHANG.MAHANG from MATHANG where MATHANG.MACONGTY in
           (select MATHANG.MACONGTY from NHACUNGCAP where NHACUNGCAP.TENGIAODICH = KHACHHANG.TENGIAODICH))))
		   GO

		   -- CÁCH 2 --
		   SELECT KHACHHANG.TENGIAODICH
		   FROM   KHACHHANG, NHACUNGCAP
		   WHERE  NHACUNGCAP.TENGIAODICH = KHACHHANG.TENGIAODICH
		   GO

	/* 14  Trong công ty có những nhân viên nào có cùng ngày vào làm?*/
 
           SELECT  a.HO, a.TEN, b.HO, b.TEN, b.NGAYLAMVIEC
		   FROM    NHANVIEN a INNER JOIN NHANVIEN b
		           ON a.NGAYLAMVIEC = b.NGAYLAMVIEC AND
				      a.MANHANVIEN <> b.MANHANVIEN
		   GO

	/* 15  Những đơn đặt hàng nào yêu cầu giao hàng ngay tại công ty đặt hàng và những đơn đó là của công ty nào?*/
 
            SELECT 	SOHOADON, TENCONGTY, TENGIAODICH, NGAYDATHANG, NOIGIAOHANG
			FROM    DONDATHANG
			        INNER JOIN KHACHHANG ON DONDATHANG.NOIGIAOHANG = KHACHHANG.DIACHI
		    GO
				              
	/* 16  Cho biết tên công ty,  tên giao dịch, địa chỉ và điện thoại của các khách hàng và các nhà cung cấp hàng cho công ty.*/
	        
			SELECT TENCONGTY, TENGIAODICH,DIACHI, DIENTHOAI
			FROM   KHACHHANG
			UNION  ALL
			SELECT TENCONGTY, TENGIAODICH, DIACHI, DIENTHOAI
			FROM   NHACUNGCAP
			GO

	/* 17  Những mặt hàng nào chưa từng được khách hàng đặt mua? */

	        SELECT MATHANG.MAHANG, TENHANG
			FROM   MATHANG
			WHERE  NOT EXISTS (SELECT MAHANG FROM CHITIETDATHANG
			                   WHERE MAHANG = MATHANG.MAHANG)
			GO

	/* 18  Những nhân viên nào của công ty chưa từng lập bất kỳ một hoá đơn đặt hàng nào?*/
	 
	        SELECT MANHANVIEN, HO, TEN
			FROM   NHANVIEN
			WHERE  NOT EXISTS (SELECT MANHANVIEN FROM DONDATHANG
			                   WHERE MANHANVIEN = NHANVIEN.MANHANVIEN)
            GO

	/* 19  Những nhân viên nào của công ty có lương cơ bản cao nhất?*/

	       SELECT   MANHANVIEN, HO, TEN 
		   FROM     NHANVIEN
		   WHERE    LUONGCOBAN = (SELECT MAX(LUONGCOBAN) FROM NHANVIEN)
		   GO

	/* 20  Tổng số tiền mà khách hàng phải trả cho mỗi đơn đặt hàng là bao nhiêu?*/
 
           SELECT DONDATHANG.SOHOADON, DONDATHANG.MAKHACHHANG, TENCONGTY, TENGIAODICH,
			      SUM(SOLUONG*GIABAN - SOLUONG*GIABAN*MUCGIAMGIA/100) AS N'SỐ TIỀN CẦN TRẢ MỖI ĐƠN ĐH'
		    FROM  KHACHHANG
			      INNER JOIN DONDATHANG ON KHACHHANG.MAKHACHHANG = DONDATHANG.MAKHACHHANG
				  INNER JOIN CHITIETDATHANG ON DONDATHANG.SOHOADON = CHITIETDATHANG.SOHOADON
		    GROUP BY DONDATHANG.SOHOADON, DONDATHANG.MAKHACHHANG, TENCONGTY, TENGIAODICH
			GO
			      
	/* 21  Trong năm 2011, những mặt hàng nào chỉ được đặt mua đúng một lần.*/
 
           SELECT MATHANG.MAHANG, TENHANG  
		   FROM   MATHANG 
		           INNER JOIN CHITIETDATHANG ON MATHANG.MAHANG = CHITIETDATHANG.MAHANG
				   INNER JOIN DONDATHANG ON CHITIETDATHANG.SOHOADON = DONDATHANG.SOHOADON
		   WHERE   YEAR(NGAYDATHANG) = '2011'
		   GROUP BY MATHANG.MAHANG, TENHANG
		   HAVING COUNT(CHITIETDATHANG.MAHANG) = 1
		   GO

	/* 22  Hãy cho biết mỗi một khách hàng đã phải bỏ ra bao nhiêu tiền để đặt mua hàng của công ty?*/
	       
		   SELECT KHACHHANG.MAKHACHHANG, TENCONGTY, TENGIAODICH,
		          SUM(SOLUONG*GIABAN - SOLUONG*GIABAN*MUCGIAMGIA/100) AS N'TIỀN ĐẶT MUA HÀNG CỦA CTY'
		    FROM  KHACHHANG
			      INNER JOIN DONDATHANG ON KHACHHANG.MAKHACHHANG = DONDATHANG.MAKHACHHANG
				  INNER JOIN CHITIETDATHANG ON DONDATHANG.SOHOADON = CHITIETDATHANG.SOHOADON
		    GROUP BY KHACHHANG.MAKHACHHANG, TENCONGTY, TENGIAODICH
		    GO

		   
	/* 23  Mỗi một nhân viên của công ty đã lập  bao nhiêu đơn đặt hàng (nếu nhân viên chưa hề lập một hoá đơn nào thì cho kết quả là 0)*/
           
		   SELECT   NHANVIEN.MANHANVIEN, HO, TEN, COUNT(SOHOADON) AS N'SỐ ĐƠN ĐẶT HÀNG'
		   FROM     NHANVIEN
		            LEFT OUTER JOIN DONDATHANG ON NHANVIEN.MANHANVIEN = DONDATHANG.MANHANVIEN
		   GROUP BY NHANVIEN.MANHANVIEN, HO, TEN
		   GO

	/* 24  Cho biết tổng số tiền hàng mà cửa hàng thu được trong mỗi tháng của năm 2003 (thời được gian tính theo ngày đặt hàng).*/

	       SELECT   MONTH(NGAYDATHANG) AS N'TIỀN CH THU ĐƯỢC MỖI THÁNG',
		            SUM(SOLUONG*GIABAN - SOLUONG*GIABAN*MUCGIAMGIA/100)
		   FROM     DONDATHANG
		            INNER JOIN CHITIETDATHANG ON DONDATHANG.SOHOADON = CHITIETDATHANG.SOHOADON
		   WHERE    YEAR(NGAYDATHANG) = '2003'
		   GROUP BY MONTH(NGAYDATHANG)
		   GO
		    
	/* 25  Hãy cho biết tổng số tiền lời mà công ty thu  được từ mỗi mặt hàng trong năm 2011.*/

	       SELECT   MATHANG.MAHANG, TENHANG,
		            SUM(CHITIETDATHANG.SOLUONG*GIABAN - CHITIETDATHANG.SOLUONG*GIABAN*MUCGIAMGIA/100) - SUM(CHITIETDATHANG.SOLUONG*GIABAN) AS N'TỔNG TIỀN LỜI CTY THU ĐƯỢC MỖI MH 2011'
		   FROM     DONDATHANG
		            INNER JOIN CHITIETDATHANG ON DONDATHANG.SOHOADON = CHITIETDATHANG.SOHOADON
				    INNER JOIN MATHANG ON CHITIETDATHANG.MAHANG = MATHANG.MAHANG
		   WHERE    YEAR(NGAYDATHANG) = '2011'
		   GROUP BY MATHANG.MAHANG, TENHANG
		   GO

	/* 26  Hãy cho biết tổng số lượng hàng của mỗi mặt hàng mà công ty đã có (tổng số lượng hàng hiện có và đã bán).*/

	       SELECT    MATHANG.MAHANG, TENHANG,
		             MATHANG.SOLUONG +
					 CASE
					 WHEN SUM(CHITIETDATHANG.SOLUONG) IS NULL THEN 0
					 ELSE SUM(CHITIETDATHANG.SOLUONG)
					 END AS N'TỔNG SỐ LƯỢNG HÀNG'
		   FROM      MATHANG   
		             LEFT OUTER JOIN CHITIETDATHANG ON MATHANG.MAHANG = CHITIETDATHANG.MAHANG
		   GROUP BY  MATHANG.MAHANG, TENHANG, MATHANG.SOLUONG
		   GO
		
    SELECT NHACUNGCAP.MaNhaCC , NHACUNGCAP.TenNhaCC
	FROM   NHACUNGCAP 
	       INNER JOIN DANGKYCUNGCAP ON NHACUNGCAP.MaNhaCC = DANGKYCUNGCAP.MaNhaCC
		   INNER JOIN MUCPHI ON DANGKYCUNGCAP.MaMP = MUCPHI.MaMP
		   INNER JOIN DONGXE ON MUCPHI.DongXe = DONGXE.DongXe
    WHERE  ( DONGXE.HangXe = 'Toyota' AND MUCPHI.DonGia = 15000 ) OR
	       ( DONGXE.HangXe = 'KIA' AND MUCPHI.DonGia = 20000 )
		       
	/* 27 Nhân viên nào của công ty bán được số lượng hàng nhiều nhất và số lượng hàng bán được của những nhân viên này là bao nhiêu?*/
	

	/* 28  Đơn đặt hàng nào có số lượng hàng được đặt mua ít nhất */
 

	/* 29  Số tiền nhiều nhất mà mỗi khách hàng đã từng bỏ ra để đặt hàng trong các đơn đặt hàng là bao nhiêu?*/

	/* 30  Mỗi một  đơn đặt hàng đặt mua những mặt hàng nào và tổng số tiền mà mỗi đơn đặt hàng phải trả là bao nhiêu?*/
 
 
	/* 31   Hãy cho biết mỗi một loại hàng bao gồm những mặt hàng nào, tổng số lượng hàng của mỗi loại và tổng số lượng của tất cả các mặt hàng 
	        hiện có trong công ty là bao nhiêu?*/
 
	/* 32  Thống kê xem trong năm 2011, mỗi một mặt hàng trong mỗi tháng và trong cả năm bán được với số lượng bao nhiêu:
	       Yêu cầu: Kết quả 
	       được hiển thị dưới dạng bảng, hai cột cột đầu là mã hàng và tên hàng, các cột còn lại tương ứng với các tháng từ 1 đến 12 và cả năm. 
		   Như vậy mỗi dòng trong kết quả cho biết số lượng hàng bán được mỗi tháng và trong cả năm của mỗi mặt hàng.*/


	/*Sử dụng câu lệnh UPDATE để thực hiện các yêu cầu sau: */
	/* 33  Cập nhật lại giá trị trường NGAYCHUYENHANG của những bản ghi có NGAYCHUYENHANG chưa xác định (NULL) trong bảng DONDATHANG
	       bằng với giá trị của trường NGAYDATHANG.*/

	/* 34  Tăng số lượng hàng của những mặt hàng do công ty SAFICO cung cấp lên gấp đôi.*/
 
	/* 35  Cập nhật giá trị của trường NOIGIAOHANG trong bảng DONDATHANG bằng địa chỉ của khách hàng đối với những đơn đặt hàng 
	       chưa xác định được nơi giao hàng (giá trị trường NOIGIAOHANG bằng NULL).*/
 
	/* 36  Cập nhật lại dữ liệu trong bảng KHACHHANG sao cho nếu tên công ty và tên giao dịch của khách hàng trùng với tên công ty 
	       và tên giao dịch của một nhà cung cấp nào đó thì địa chỉ, điện thoại, fax và e-mail phải giống nhau.*/

	/* 37  Tăng lương lên gấp rưỡi cho những nhân viên bán được số lượng hàng nhiều hơn 10 trong năm 2011.*/
 
	/* 38  Tăng phụ cấp lên bằng 50% lương cho những nhân viên bán được hàng nhiều nhất.*/


	/* 39  Giảm 25% lương của những nhân viên trong năm 2011 không lập được bất kỳ đơn đặt hàng nào.*/


	/* 40  Giả sử trong bảng DONDATHANG có thêm trường SOTIEN cho biết số tiền mà khách hàng phải trả trong mỗi đơn đặt hàng. 
	       Hãy tính giá trị cho trường này.*/
 
 
	/*Thực hiện các yêu cầu dưới đây bằng câu lệnh DELETE.*/
 
	/* 41  Xoá khỏi bảng NHANVIEN những nhân viên đã làm việc trong công ty quá 5 năm.*/
 
	/* 42  Xoá những đơn đặt hàng trước năm 2010 ra khỏi cơ sở dữ liệu.*/

	/* 43  Xoá khỏi bảng LOAIHANG những loại hàng hiện không có mặt hàng.*/
 

	/* 44   Xoá khỏi bảng KHACHHANG những khách hàng hiện không có bất kỳ đơn đặt hàng nào cho công ty.*/
 
	/* 45  Xoá khỏi bảng MATHANG những mặt hàng có số lượng bằng 0 và không được đặt mua trong bất kỳ đơn đặt hàng nào.*/

	
	/* =======================================================  */


	--          BÀI TẬP THỦ TỤC            -----

	/* 5.1: Tạo thủ tục lưu trữ để thông qua thủ tục này có thể bổ dung thêm một bảng ghi mới cho bảng MATHANG ( thủ tục phải thực hiện
	kiểm tra tính hợp lệ của dữ liệu cần bổ sung : không trùng khóa chính và đảm bảo toàn vẹn tham chiếu */

	        CREATE PROCEDURE sp_insert_mathang(

			        @MAHANG         VARCHAR(6),
					@TENHANG        NVARCHAR(255),
					@MACONGTY       VARCHAR(6) = NULL,
					@MALOAIHANG     VARCHAR(2),
					@SOLUONG        INT,
					@DONVITINH      NVARCHAR(20) = NULL,
					@GIAHANG        FLOAT)

             AS
			    BEGIN
					IF NOT EXISTS ( SELECT MAHANG FROM MATHANG WHERE MAHANG = @MAHANG)
					IF @MACONGTY IS NULL OR EXISTS (SELECT MACONGTY FROM NHACUNGCAP
													WHERE MACONGTY = @MACONGTY ) AND
					   @MALOAIHANG IS NULL OR EXISTS ( SELECT MALOAIHANG FROM LOAIHANG
													   WHERE MALOAIHANG = @MALOAIHANG )
					INSERT INTO MATHANG
					VALUES ( @MAHANG , @TENHANG , @MACONGTY, @MALOAIHANG, @SOLUONG, @DONVITINH, @GIAHANG )
                END
			GO

	/* 5.2: Tạo thủ tục lưu trữ có chức năng thống kê tổng số lượng hàng bán được của một mặt hàng có mã bất kỳ ( mã mặt hàng cần thống kê là tham số của thủ tục.) */
	        
			CREATE PROCEDURE sp_thongKeBanHang ( @MAHANG VARCHAR(6)) 
			AS
			    BEGIN

				    SELECT MATHANG.MAHANG , TENHANG , SUM(CHITIETDATHANG.SOLUONG ) AS 'Tong so luong'
					FROM   MATHANG LEFT OUTER JOIN CHITIETDATHANG ON MATHANG.MAHANG = CHITIETDATHANG.MAHANG
					WHERE  MATHANG.MAHANG = @MAHANG
					GROUP BY MATHANG.MAHANG , TENHANG
				END
			GO
