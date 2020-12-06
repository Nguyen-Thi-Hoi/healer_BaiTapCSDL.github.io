
   
   /* 
   
   MASV     : 3120218061
   Họ & Tên : Nguyễn Thị Hội
   Lớp      : 18CNTT4
   */

	USE MASTER
	GO

	CREATE DATABASE ThueXeDuLich
	GO

	USE ThueXeDuLich
	GO

	CREATE TABLE KHACHHANG
	(
		MaKH            VARCHAR(4) NOT NULL,
		HoVaTen         NVARCHAR(50),
		DiaChi          NVARCHAR(50),
		SoDienThoai     VARCHAR(11)

		CONSTRAINT PK_KHACHHANG PRIMARY KEY (MaKH)
	)
	GO

	CREATE TABLE LOAIXE
	(
		MaLoaiXe       VARCHAR(4) NOT NULL,
		MoTa           NVARCHAR(50)

		CONSTRAINT PK_LOAIXE PRIMARY KEY (MaLoaiXe)

	)
	GO

	CREATE TABLE XECHOTHUE
	(
		MaXe          VARCHAR(4) NOT NULL,
		BienSoXe      VARCHAR(20),
		HangXe        NVARCHAR(50),
		MaLoaiXe      VARCHAR(4),
		DonGiaChoThue FLOAT

		CONSTRAINT PK_XECHOTHUE PRIMARY KEY (MaXe)

	)
	GO

	CREATE TABLE LOAIDICHVU
	( 
		MaLoaiDichVu   VARCHAR(4) NOT NULL,
		MoTaLoaiDichVu NVARCHAR(50)

		CONSTRAINT PK_LOAIDICHVU PRIMARY KEY (MaLoaiDichVu)
	)
	GO

	CREATE TABLE HOPDONGTHUEXE
	(
		MaHopDong      VARCHAR(4) NOT NULL,
		MaKH           VARCHAR(4),
		SoTienCoc      FLOAT,
		TrangThaiHoatDong   NVARCHAR(50)
	
		CONSTRAINT PK_HOPDONGTHUEXE  PRIMARY KEY (MaHopDong)

	)
	GO

	CREATE TABLE CHITIETHOPDONG
	(
		MaHopDong      VARCHAR(4) NOT NULL,
		MaXe           VARCHAR(4) NOT NULL,
		MaLoaiDichVu   VARCHAR(4),
		NgayNhanXe     DATE,
		NgayTraXe      DATE

		CONSTRAINT PK_CHITIETHOPDONG PRIMARY KEY (MaHopDong, MaXe)
	)
	GO


	-- TAO DU LIEU BẢNG KHACHHANG --

	INSERT INTO KHACHHANG
	VALUES ('001',N'Đặng Hoài Sơn', N'Liên Chiểu', '0905123456' )
	GO

	INSERT INTO KHACHHANG
	VALUES ('002',N'Đặng Ngọc Chi', N'Hải Châu', '0914987654' )
	GO

	INSERT INTO KHACHHANG
	VALUES ('003',N'Nguyễn Thị A', N'Hòa Khánh', '0914987653' )
	GO

	INSERT INTO KHACHHANG
	VALUES ('004',N'Nguyễn Thị B', N'Quảng Nam', '0914987652' )
	GO

	INSERT INTO KHACHHANG
	VALUES ('005',N'Nguyễn Thị C', N'Quảng Ngãi', '0914987651' )
	GO

	INSERT INTO KHACHHANG
	VALUES ('006',N'Nguyễn Thị D', N'Huế', '0914987657' )
	GO

	INSERT INTO KHACHHANG
	VALUES ('007',N'Nguyễn Thị E', N'Đà Nẵng', '0914987659' )
	GO

	INSERT INTO KHACHHANG
	VALUES ('008',N'Nguyễn Thị F', N'Đà Nẵng', '0915987659' )
	GO

	INSERT INTO KHACHHANG
	VALUES ('009',N'Nguyễn Thị G', N'Đà Nẵng', '09134987659' )
	GO

	INSERT INTO KHACHHANG
	VALUES ('010',N'Nguyễn Thị H', N'Đà Nẵng', '0924987659' )
	GO

	SELECT * FROM KHACHHANG
	GO

	-- TẠO DỮ LIỆU BẢNG LOAIXE --

	INSERT INTO LOAIXE
	VALUES  ('101', N'Xe 4 chỗ')
	GO

	INSERT INTO LOAIXE
	VALUES  ('102', N'Xe 24 chỗ')
	GO

	INSERT INTO LOAIXE
	VALUES  ('103', N'Xe 6 chỗ')
	GO

	INSERT INTO LOAIXE
	VALUES  ('104', N'Xe 10 chỗ')
	GO

	INSERT INTO LOAIXE
	VALUES  ('105', N'Xe 14chỗ')
	GO

	INSERT INTO LOAIXE
	VALUES  ('106', N'Xe 25 chỗ')
	GO

	INSERT INTO LOAIXE
	VALUES  ('107', N'Xe 30 chỗ')
	GO

	INSERT INTO LOAIXE
	VALUES  ('108', N'Xe 100 chỗ')
	GO

	INSERT INTO LOAIXE
	VALUES  ('109', N'Xe 20 chỗ')
	GO

	INSERT INTO LOAIXE
	VALUES  ('110', N'Xe 30 chỗ')
	GO

	SELECT * FROM LOAIXE
	GO

	-- TẠO DỮ LIỆU BẢNG XECHOTHUE --

	INSERT INTO XECHOTHUE
	VALUES ('201', '43A-567.28', N'Kia', '101', '300000')
	GO

	INSERT INTO XECHOTHUE
	VALUES ('202', '43D-129.98', N'HonDa', '102', '300000')
	GO
	INSERT INTO XECHOTHUE
	VALUES ('203', '53A-567.28', N'Toyota', '103', '500000')
	GO
	INSERT INTO XECHOTHUE
	VALUES ('204', '63A-567.28', N'Kiaa', '104', '100000')
	GO
	INSERT INTO XECHOTHUE
	VALUES ('205', '73A-567.28', N'Kiab', '105', '200000')
	GO

	INSERT INTO XECHOTHUE
	VALUES ('206', '93A-567.28', N'Kiac', '106', '400000')
	GO

	INSERT INTO XECHOTHUE
	VALUES ('207', '233A-567.28', N'Kiad', '107', '60000')
	GO

	INSERT INTO XECHOTHUE
	VALUES ('208', '83A-567.28', N'SamSung', '108', '130000')
	GO

	INSERT INTO XECHOTHUE
	VALUES ('209', '43A-567.28', N'AB', '109', '140000')
	GO

	INSERT INTO XECHOTHUE
	VALUES ('210', '53A-567.28', N'Nokia', '110', '150000')
	GO


	SELECT * FROM XECHOTHUE
	GO

	-- TẠO DỮ LIỆU BẢNG LOAIDICHVU--

	INSERT INTO LOAIDICHVU
	VALUES ('301', N'Đám cưới')
	GO

	INSERT INTO LOAIDICHVU
	VALUES ('302', N'Du Lịch')
	GO

	INSERT INTO LOAIDICHVU
	VALUES ('303', N'Nhà Hàng')
	GO

	INSERT INTO LOAIDICHVU
	VALUES ('304', N'Đám giỗ')
	GO

	INSERT INTO LOAIDICHVU
	VALUES ('305', N'Liên Hoan')
	GO

	INSERT INTO LOAIDICHVU
	VALUES ('306', N'Liên Hoan')
	GO

	INSERT INTO LOAIDICHVU
	VALUES ('307', N'Liên Hoan')
	GO

	INSERT INTO LOAIDICHVU
	VALUES ('308', N'Liên Hoan')
	GO

	INSERT INTO LOAIDICHVU
	VALUES ('309', N'Đám ma')
	GO

	INSERT INTO LOAIDICHVU
	VALUES ('310', N'Đám giỗ')
	GO

	SELECT * FROM LOAIDICHVU
	GO

	-- TẠO DỮ LIỆU BẢNG HOPDONGTHUEXE --

	INSERT INTO HOPDONGTHUEXE
	VALUES ('401', '001',0 , N'Đã kết thúc')
	GO

	INSERT INTO HOPDONGTHUEXE
	VALUES ('402', '002',200000 , N'Đang cho thuê')
	GO

	INSERT INTO HOPDONGTHUEXE
	VALUES ('403', '003',350000 , N'Chưa bắt đầu')
	GO

	INSERT INTO HOPDONGTHUEXE
	VALUES ('404', '004',120000 , N'Đang cho thê')
	GO

	INSERT INTO HOPDONGTHUEXE
	VALUES ('405', '005',140000 , N'Chưa bắt đầu')
	GO

	INSERT INTO HOPDONGTHUEXE
	VALUES ('406', '006',130000 , N'Đã kết thúc')
	GO

	INSERT INTO HOPDONGTHUEXE
	VALUES ('407', '007',40000 , N'Đang cho thuê')
	GO

	INSERT INTO HOPDONGTHUEXE
	VALUES ('408', '008', 500000, N'Đang cho thuê')
	GO

	INSERT INTO HOPDONGTHUEXE
	VALUES ('409', '009',200000 , N'Chưa bắt đầu')
	GO

	INSERT INTO HOPDONGTHUEXE
	VALUES ('410', '010',200000 , N' Đã kết thúc')
	GO

	SELECT * FROM HOPDONGTHUEXE
	GO

	-- TẠO DỮ LIỆU CHITIETHOPDONG --

	INSERT INTO CHITIETHOPDONG
	VALUES ('401', '201', '301', '2018/06/13','2018/06/30'  )
	GO

	INSERT INTO CHITIETHOPDONG
	VALUES ('402', '202', '302', '2019/09/13','2019/09/30'  )
	GO
	INSERT INTO CHITIETHOPDONG
	VALUES ('403', '203', '303', '2020/07/07','2020/07/30'  )
	GO
	INSERT INTO CHITIETHOPDONG
	VALUES ('404', '204', '304', '2018/05/13','2018/05/30'  )
	GO

	INSERT INTO CHITIETHOPDONG
	VALUES ('405', '205', '305', '2018/04/13','2018/04/30'  )
	GO

	INSERT INTO CHITIETHOPDONG
	VALUES ('406', '206', '306', '2019/08/23','2019/08/30'  )
	GO

	INSERT INTO CHITIETHOPDONG
	VALUES ('407', '207', '307', '2020/06/06','2020/06/30'  )
	GO

	INSERT INTO CHITIETHOPDONG
	VALUES ('408', '208', '308', '2018/02/15', '2018/02/28' )
	GO

	INSERT INTO CHITIETHOPDONG
	VALUES ('409', '209', '309', '2018/01/11','2018/01/30'  )
	GO

	INSERT INTO CHITIETHOPDONG
	VALUES ('410', '210', '310', '2018/10/13','2018/10/30'  )
	GO

	SELECT * FROM CHITIETHOPDONG
	GO

	--TẠO KHÓA NGOẠI --

	ALTER TABLE XECHOTHUE
	ADD CONSTRAINT FK_XCT_LOAIXE FOREIGN KEY (MaLoaiXe) REFERENCES LOAIXE (MaLoaiXe)
	GO

	ALTER TABLE HOPDONGTHUEXE
	ADD CONSTRAINT FK_HDTX_KHACHHANG FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH)
	GO

	ALTER TABLE CHITIETHOPDONG
	ADD CONSTRAINT FK_CTHD_HOPDONGTHUEXE FOREIGN KEY (MaHopDong) REFERENCES HOPDONGTHUEXE (MaHopDong)
	GO

	ALTER TABLE CHITIETHOPDONG
	ADD CONSTRAINT FK_CTHD_XECHOTHUE FOREIGN KEY (MaXe) REFERENCES XECHOTHUE(MaXe)
	GO

	ALTER TABLE CHITIETHOPDONG 
	ADD CONSTRAINT FK_CTHD_LOAIDICHVU FOREIGN KEY (MaLoaiDichVu) REFERENCES LOAIDICHVU(MaLoaiDichVu)
	GO


	-- TRUY VẤN --

	-- Câu 1.3. Liệt kê những xe cho thuê gồm các thông tin về mã xe, biển số xe, hãng xe có đơn giá cho thuê nhỏ hơn 500.000 VND-- 
	
	SELECT MaXe, BienSoXe, HangXe
	FROM XECHOTHUE
	WHERE  DonGiaChoThue < 500000
	GO

	/* Câu 1.4. Liệt kê những khách hàng gồm thông tin mã khách hàng, họ và tên khách hàng có địa chỉ ở ‘Liên Chiểu’ 
	mà có số điện thoại bắt đầu bằng ‘090’ và những khách hàng có địa chỉ ở ‘Hải Châu’ mà có số điện thoại bắt đầu bằng ‘091’. */

	SELECT MaKH, HoVaTen
	FROM   KHACHHANG
	WHERE ( DiaChi = N'Liên Chiểu' AND SoDienThoai LIKE '090%') AND -- OR-- 
		  ( DiaChi = N'Hải Châu' AND SoDienThoai LIKE '091%')
	GO

	-- ==> LÀM SAI 

	/* Câu 1.5. Liệt kê thông tin của các khách hàng có họ (trong họ tên) là ‘Đặng */

	SELECT * FROM KHACHHANG
	WHERE    HoVaTen LIKE N'Đặng%'
	GO

	/***Chưa làm *** Câu 1.6. Liệt kê thông tin mã xe, hãng xe của toàn bộ các xe được thuê một lần duy nhất*/
	  
	  SELECT      XECHOTHUE.MaXe, HangXe
	FROM        XECHOTHUE
	            INNER JOIN CHITIETHOPDONG ON XECHOTHUE.MaXe = CHITIETHOPDONG.MaXe
				INNER JOIN HOPDONGTHUEXE ON CHITIETHOPDONG.MaHopDong = HOPDONGTHUEXE.MaHopDong
	GROUP BY    XECHOTHUE.MaXe, HangXe, HOPDONGTHUEXE.MaHopDong
	GO

	-- Cách 2 . Liệt kê thông tin mã xe, và số lần thuê xe của mỗi xe--

	   SELECT MaXe , COUNT(MaHopDong) AS N'Số lần thuê xe'
	   FROM   CHITIETHOPDONG
	   GROUP BY MaXe
	   GO

	-- Cách 3: Liệt kê thông tin mã xe, hãng xe 

	/* Câu 1.7. Liệt kê các hợp đồng cho thuê gồm mã hợp đồng, số tiền đặt cọc có trạng thái hợp đồng là ‘Đã kết thúc’ 
	   của khách hàng có tên là ‘Chi’. */
    
	-- Cách 1 --
	SELECT * 
	FROM  HOPDONGTHUEXE
		  INNER JOIN KHACHHANG ON HOPDONGTHUEXE.MaKH = KHACHHANG.MaKH
	WHERE TrangThaiHoatDong = N'Đã kết thúc' AND
		  HoVaTen LIKE N'Chi%'
	GO

	-- Cách 2--
	SELECT MaHopDong, SoTienCoc
	FROM   HOPDONGTHUEXE
	       INNER JOIN KHACHHANG ON HOPDONGTHUEXE.MaKH = KHACHHANG.MaKH
	WHERE  TrangThaiHoatDong = N'Đã kết thúc' AND
	       HoVaTen LIKE N'Chi%'
	GO
	
	/*Câu 1.8. Liệt kê thông tin của các khách hàng mà chưa có hợp đồng thuê xe nào.*/

	SELECT * FROM KHACHHANG
	WHERE    MaKH NOT IN (SELECT MaKH FROM HOPDONGTHUEXE)
	GO

	-- CÁCH 2 --
	SELECT *
	FROM   KHACHHANG
	WHERE  NOT EXISTS ( SELECT MaKH FROM HOPDONGTHUEXE 
	                     WHERE KHACHHANG.MaKH = HOPDONGTHUEXE.MaKH)
    GO

	-- CÁCH 3 --

	SELECT MaKH, HoVaTen, DiaChi
	FROM   KHACHHANG
	EXCEPT
	SELECT KHACHHANG.MaKH, HoVaTen, DiaChi
	FROM   KHACHHANG
	       INNER JOIN HOPDONGTHUEXE ON KHACHHANG.MaKH = HOPDONGTHUEXE.MaKH
	GO

	-- CÁCH 4 --

	SELECT KHACHHANG.MaKH, HoVaTen, DiaChi, SoDienThoai
	FROM   HOPDONGTHUEXE RIGHT OUTER JOIN KHACHHANG ON HOPDONGTHUEXE.MaKH = KHACHHANG.MaKH
	WHERE  HOPDONGTHUEXE.MaKH IS NULL
	GO

	/*Câu 1.9. Cho biết những mã hợp đồng mà vừa sử dụng loại dịch vụ 'Đám cưới' vừa sử dụng loại dịch vụ 'Du lịch' */

	SELECT MaHopDong
	FROM   CHITIETHOPDONG 
		   INNER JOIN LOAIDICHVU ON CHITIETHOPDONG.MaLoaiDichVu = LOAIDICHVU.MaLoaiDichVu
	WHERE  MoTaLoaiDichVu = N'Đám cưới' AND
		   MoTaLoaiDichVu = N'Du lịch'
	GO

	/*Câu 1.10. Liệt kê họ và tên khách hàng, mã hợp đồng, trạng thái hợp đồng của tất cả các hợp đồng với yêu cầu
	 những khách hàng chưa có một hợp đồng nào thì cũng phải liệt kê thông tinh những họ và tên khách hàng đó ra. */

	SELECT HoVaTen, MaHopDong, TrangThaiHoatDong
	FROM   KHACHHANG
		   LEFT OUTER JOIN HOPDONGTHUEXE ON KHACHHANG.MaKH = HOPDONGTHUEXE.MaKH
	GO

	-- ==> LÀM SAI (RIGHT OUTER JOIN)

	/*** Chưa làm*** Câu 1.11 Liệt kê không trùng lặp thông tin mã khách hàng, họ và tên khách hàng của các khách hàng có địa chỉ là ‘Hải Châu’ 
	đã từng thuê xê thuộc loại xe có mô tả là ‘Xe 24 chỗ’ hoặc các khách hàng từng thuê xe có thời gian nhận xe là 07/07/2020. 
	Sắp xếp tăng dần theo mã khách hàng và giảm dần theo họ và tên khách hàng */

	SELECT DISTINCT KHACHHANG.MaKH, HoVaTen
	FROM   KHACHHANG
	       INNER JOIN HOPDONGTHUEXE ON KHACHHANG.MaKH = HOPDONGTHUEXE.MaKH
		   INNER JOIN CHITIETHOPDONG ON HOPDONGTHUEXE.MaHopDong = CHITIETHOPDONG.MaHopDong
		   INNER JOIN XECHOTHUE ON CHITIETHOPDONG.MaXe = XECHOTHUE.MaXe
		   INNER JOIN LOAIXE ON XECHOTHUE.MaLoaiXe = LOAIXE.MaLoaiXe
	WHERE  (DiaChi = N'Hải Châu' AND MoTa = N'Xe 24 chỗ') OR
	       (DiaChi = N'Hải Châu' AND NgayNhanXe = '2020/07/07')
	ORDER BY MaKH ASC , HoVaTen DESC
	GO

	/**** Chưa làm*** Câu 1.12. Thống kê số lần được thuê của các xe mà xe đó có số ngày mượn lớn hơn 10 ngày gồm các thông tin mã xe, số lần thuê. */
	
	
	SELECT MaXe , COUNT(CHITIETHOPDONG.MaHopDong) AS N'Số lần được thuê xe'
	FROM   CHITIETHOPDONG
	WHERE  DATEDIFF(DAY, NgayNhanXe, NgayTraXe) > 10
	GROUP BY MaXe
	GO

	/**** Chưa làm*** Câu 1.13. Cho biết có bao nhiêu xe đã được đùng để cho thuê trong tổng số xe */

	SELECT COUNT(MaXe)  AS N'Số xe đã được dùng để cho thuê'
	FROM   CHITIETHOPDONG
	GROUP BY MaXe
	GO

	/**** Chưa làm*** Câu 1.14. Liệt kê thông tin của những khách hàng đã từng thuê xe vào năm 2018 nhưng chưa từng thuê vào năm 2019. */

	SELECT   KHACHHANG.MaKH, HoVaTen, DiaChi, SoDienThoai,  HOPDONGTHUEXE.MaHopDong
	FROM     KHACHHANG
	         INNER JOIN HOPDONGTHUEXE ON KHACHHANG.MaKH = HOPDONGTHUEXE.MaKH
			 INNER JOIN CHITIETHOPDONG ON HOPDONGTHUEXE.MaHopDong = CHITIETHOPDONG.MaHopDong

	WHERE    KHACHHANG.MaKH IN (SELECT MaKH FROM HOPDONGTHUEXE  WHERE YEAR(NgayNhanXe) = '2018' )
	AND      KHACHHANG.MaKH NOT IN (SELECT MaKH FROM HOPDONGTHUEXE  WHERE YEAR(NgayNhanXe) = '2019' )
    GO

	/**** Chưa làm*** Câu 1.15. Liệt kê họ và tên của khách hàng mà có từ hai hợp đồng thuê xe trở lên */

	SELECT  HoVaTen 
	FROM    KHACHHANG
	        INNER JOIN HOPDONGTHUEXE ON KHACHHANG.MaKH = HOPDONGTHUEXE.MaKH
    WHERE   KHACHHANG.MaKH IN (SELECT MaKH FROM HOPDONGTHUEXE  GROUP BY MaKH HAVING COUNT(MaHopDong) >= 2)
	GO

	/*câu 1.16. Cập nhật cột trạng thái hợp đồng thành ‘Bị hủy’ đối với những hợp đồng có trạng thái là ‘Chưa bắt đầu’ và có số tiền đặt cọc là 0. */
	
	UPDATE  HOPDONGTHUEXE
	SET     TrangThaiHoatDong = N'Bị hủy'
	WHERE   TrangThaiHoatDong = N'Chưa bắt đầu'
	GO

	
    /*** Chưa làm *** Câu 1.17 Xóa những loại dịch vụ chưa từng được sử dụng trong bất kỳ một hợp đồng nào. */

	
	DELETE FROM LOAIDICHVU
	WHERE  NOT EXISTS (SELECT MaLoaiDichVu FROM CHITIETHOPDONG WHERE MaLoaiDichVu = LOAIDICHVU.MaLoaiDichVu)
	GO

	SELECT * FROM CHITIETHOPDONG
	GO

	/*Câu 2. Cho lược đồ quan hệ Q (M, N, K, Q) có Q+ = { M, N, K, Q } 
	  và tập phụ thuộc hàm       F = { KQ→N, M→K, N→MKQ }.

	 Áp dụng thuật toán tìm tất cả các khóa để tìm tất cả các khóa của lược đồ quan hệ Q. */

	 -- Giải --
	 /

	 f1 KQ → N
     f2 M → K
     f3 N→MKQ
	 VT = KQMN ,     VP = NKMQ
	+Tập nguồn TN: {rỗng}
	+Tập trung gian TG: {KQMN} vì tập trung gian có 4 phần tử nên stt = 16
	+ Q+ = {M,N,K,Q}
	+ TG = {MNKQ} M,N,K,Q
	   
	STT	 TG_i	   ( TN  TG_i)	  ( TN  TG_i)+	  SK ( TN  TG_i)+ = Q+	   K
	1					
	2	 M	        M	               MK		
	3	 N	        N	               NMKQ	             +	               +
	4	 K	        K	               K		
	5	 Q      	Q	               Q		
	6	 MN     	MN	               MNKQ	             +                  
	7	 MK	        MK	               MK		
	8	 MQ	        MQ	               MQ		                       
	9	 NK	        NK	               NKMQ	             +	
	10	 NQ	        NQ	               NQMK	             +	
	11	 KQ	        KQ	               KQNM				 +	               
	12	 MNK	    MNK	               MNKQ			     +	
	13	 MNQ	    MNQ	               MNQK				 +	
	14	 MKQ	    MKQ	               MKQN				 +	
	15	 NKQ	    NKQ	               NKQM				 +	
	16	 MNKQ	    MNKQ	           MNKQ				 +	

					
	Ta có tập siêu khóa S = {N, MN, MQ, NK, NQ, KQ, MNK, MNQ, MKQ, NKQ, MNKQ}
	Tuy nhiên vì N chứ trong MN,NK,NQ,MNK,MNQ,NKQ,MNKQ  vậy ta tìm được khóa là : {N}



	/*Câu 3. Cho cơ sở dữ liệu quan hệ NHÂN VIÊN gồm các lược đồ quan hệ:

	 NHANVIEN (MaNV, TenNV, DiaChi, NgaySinh, ChucVu, Luong)
	          có các phụ thuộc hàm: MaNV→(TenNV, DiaChi, NgaySinh, ChucVu);
	                                ChucVu→Luong;
	 DUAN (SoDA, TenDA, NganSach)
	          có phụ thuộc hàm      SoDA →( TenDA, NganSach)

     PHANCONG (MaNV, SoDA, NhiemVu, ThoiGian) 
		      có phụ thuộc hàm      (MaNV, SoDA)→(NhiemVu, ThoiGian)

     Xác định dạng chuẩn cao nhất của các lược đồ quan hệ trên, giải thích.  */