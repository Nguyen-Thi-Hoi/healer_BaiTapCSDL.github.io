

USE MASTER
GO

CREATE DATABASE  QLBanHangDienTu
GO

USE QLBanHangDienTu
GO


CREATE TABLE KHACHHANG
(
	MaKH    VARCHAR(6) NOT NULL,
	TenKH   VARCHAR(50),
	Email   VARCHAR(50),
	SoDT    VARCHAR(12),
	DiaChi  VARCHAR(20)

	CONSTRAINT PK_KHACHHANG PRIMARY KEY (MaKH) 
)
GO

CREATE TABLE DMSANPHAM
(
	MaDM       VARCHAR(5) NOT NULL,
	TenDanhMuc VARCHAR(50),
	MoTa       VARCHAR(50)

	CONSTRAINT PK_DMSANPHAM PRIMARY KEY (MaDM)
)
GO

CREATE TABLE SANPHAM
(
	MaSP      VARCHAR(6) NOT NULL,
	MaDM      VARCHAR(5),
	TenSP	  VARCHAR(20),
	SoLuong	  INT,
	GiaTien	  MONEY,
	XuatXu	  VARCHAR(5),

	CONSTRAINT PK_SANPHAM PRIMARY KEY(MaSP)
)
GO

CREATE TABLE THANHTOAN
(
	MaTT         VARCHAR(5) NOT NULL,
	PhuongThucTT VARCHAR(20)

	CONSTRAINT PK_THANHTOAN PRIMARY KEY (MaTT)
)
GO

CREATE TABLE DONHANG
(
	MaDH    VARCHAR(6) NOT NULL,
	MaKH    VARCHAR(6),
	MaTT    VARCHAR(5),
	NgayDat DATE

	CONSTRAINT PK_DONHANG PRIMARY KEY (MaDH)
)
GO

CREATE TABLE CHITIETDONHANG
(
	MaDH      VARCHAR(6) NOT NULL,
	MaSP      VARCHAR(6) NOT NULL,
	SoLuong   INT,
	TongTien  MONEY

	CONSTRAINT PK_CHITIETDONHANG PRIMARY KEY (MaDH, MaSP)
)
GO

INSERT INTO KHACHHANG
VALUES ('KH001', 'Tran Van An', 'antv@gmail.com',   '0905123564', 'Lang Son')

INSERT INTO  KHACHHANG
VALUES ('KH002', 'Phan Phuoc',  'phuocp@gmail.com', '0932568984', 'Da Nang')

INSERT INTO  KHACHHANG
VALUES ('KH003', 'Tran Huu Anh','anhth@gmail.com',  '0901865232', 'Ha Noi')
GO

--
INSERT INTO  DMSANPHAM
VALUES ( 'DM01', 'Thoi Trang Nu',  'vay, ao danh cho nu')

INSERT INTO  DMSANPHAM
VALUES ( 'DM02', 'Thoi Trang Nam', 'quan danh cho nam')

INSERT INTO  DMSANPHAM
VALUES ( 'DM03', 'Trang Suc',      'danh cho nu va nam')
GO

--
INSERT INTO  SANPHAM
VALUES ( 'SP001', 'DM01', 'Dam Maxi',   200, '195,000', 'VN')
  
INSERT INTO  SANPHAM
VALUES ( 'SP002', 'DM01', 'Tui Da My',  50, '3,000,000', 'HK')

INSERT INTO  SANPHAM
VALUES ( 'SP003', 'DM02', 'Lac Tay Uc', 300, '300,000', 'HQ')
GO

--
INSERT INTO  THANHTOAN
VALUES ('TT01', 'Visa')

INSERT INTO  THANHTOAN
VALUES ('TT02', 'Master Card')

INSERT INTO  THANHTOAN
VALUES ('TT03', 'JCB')
GO

--
INSERT INTO  DONHANG
VALUES ( 'DH001', 'KH002', 'TT01', '2014/10/20')

INSERT INTO  DONHANG
VALUES ( 'DH002', 'KH002', 'TT01', '2015/5/15')

INSERT INTO  DONHANG
VALUES ( 'DH003', 'KH001', 'TT03', '2015/4/20')
GO

--
INSERT INTO CHITIETDONHANG
VALUES ('DH001', 'SP002', 3, '56,000')

INSERT INTO CHITIETDONHANG
VALUES ('DH003', 'SP001', 10, '27,444')

INSERT INTO CHITIETDONHANG
VALUES ('DH002', 'SP002', 10, '67,144')
GO


-- TẠO RÀNG BUỘC --

ALTER TABLE DONHANG
ADD CONSTRAINT FK_DONHANG_KHACHHANG FOREIGN KEY (MaKH) REFERENCES KHACHHANG (MaKH)
GO

ALTER TABLE CHITIETDONHANG
ADD CONSTRAINT FK_CTDON_DONHANG FOREIGN KEY (MaDH) REFERENCES DONHANG (MaDH)
GO

ALTER TABLE DONHANG
ADD CONSTRAINT FK_DONHANG_THANHTOAN FOREIGN KEY (MaTT) REFERENCES THANHTOAN (MaTT)
GO

ALTER TABLE SANPHAM
ADD CONSTRAINT FK_SANPHAM_DMSANPHAM FOREIGN KEY (MaDM) REFERENCES DMSANPHAM (MaDM)
GO

ALTER TABLE CHITIETDONHANG
ADD CONSTRAINT FK_CTDH_SANPHAM FOREIGN KEY (MaSP) REFERENCES SANPHAM (MaSP)
GO


-- BÀI TẬP THỦ TỤC --

/* Câu 1a: Tạo một khung nhìn có tên là V_KhachHang đẻ thấy được thông tin của tất cả các đơ  hàng 
   có ngày đặt hàng nhỏ hơn ngày 6/15/2015 của những khách hàng có địa chỉ là "Da Nng' */

        CREATE VIEW V_KhachHang
		AS
		   SELECT DONHANG.MaDH, DONHANG.MaKH, DONHANG.MaTT, DONHANG.NgayDat
		   FROM   DONHANG
		          INNER JOIN KHACHHANG ON DONHANG.MaKH = KHACHHANG.MaKH
		   WHERE  DONHANG.NgayDat <= '2016/06/15' AND KHACHHANG.DiaChi = 'Da Nang'
        GO

	    SELECT * FROM V_KhachHang
		GO

/* Câu 1b: Thông qua khung nhìn V_KhachHang thực hiện việc:
   Cập nhật ngày đặt hàng thành '2015/05/15' đối với những khách hàng đặt hàng vào ngày '2014/06/15" */

        UPDATE V_KhachHang
		SET    NgayDat = '2014/06/15'
		WHERE  NgayDat = '2015/06/15'
		GO

/* Câu 2: Tạo 2 thủ tục:
   a. Thủ tục Sp_1: Dùng để xóa thông tin của những sản phẩm có mã sản phẩm được truyền vào như mộ tham số của thủ tục */
   
        CREATE PROCEDURE  Sp_1
		       @MaSP  VARCHAR(6)
		AS
		    BEGIN
		        
				DELETE FROM SANPHAM WHERE MaSP = @MaSP

		    END	     
        GO

		-- Thực thi --
		EXECUTE Sp_1 'SP003'
		GO

/* b. Thủ tục Sp_2: Dùng để bổ sung thêm bản ghi mới vào bảng CHITIETDONHANG (SP_2 phải thực hiện kiểm tra tính hợp lệ của dữ liệu
   được bổ sung là không trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng có liên quan */

        ALTER PROCEDURE Sp_2
		        @MaDH      VARCHAR(6) ,
				@MaSP      VARCHAR(6) ,
				@SoLuong   INT,
				@TongTien  MONEY
		AS
		BEGIN
		      IF EXISTS ( SELECT MaDH FROM DONHANG WHERE MaDH = @MaDH ) AND
			     EXISTS ( SELECT MaSP FROM SANPHAM WHERE MaSP = @MaSP ) 
				 
			  BEGIN
			       
				   IF EXISTS ( SELECT MaDH FROM CHITIETDONHANG WHERE MaDH = @MaDH )
				      BEGIN
					        PRINT N' Đã trùng dữ liệu từ DB '  
					  END
			       ELSE
				      INSERT INTO CHITIETDONHANG 
					  VALUES (@MaDH, @MaSP, @SoLuong, @TongTien )
			  END
			  ELSE
			  BEGIN
			       PRINT N'Không tồn tại đơn hàng hoặc sản phẩm Update'
			  END
		END
		GO

		-- Thực thi --
		EXEC Sp_2 'DH001', 'SP002', 3, '56,000'
		GO

		SELECT * FROM CHITIETDONHANG
		GO

/* Câu 3: Viết 2 bẫy sự kiện ( trigger) cho bảng CHITIETDONHANG theo yêu cầu sau: */

/* a: Trigger_1: Khi thực hiện đăng ký mới một đơn đặt hàng cho khách hàng thì cập nhật
	lại số lượng sản phẩm trong bảng sản phẩm (tức là số lượng sản phẩm còn lại sau khi
	đã bán). Bẫy sự kiện chỉ xử lý 1 bản ghi. (1 điểm) */

	   -- CÁCH 1 --
	    CREATE TRIGGER Trigger_1 ON CHITIETDONHANG
		FOR INSERT
		AS
		  BEGIN
		        DECLARE @SoLuong  INT
				DECLARE @MaSP  VARCHAR(6)

				SELECT @SoLuong = inserted.SoLuong  FROM inserted
				SELECT @MaSP = inserted.MaSP FROM inserted

				UPDATE SANPHAM 
				SET    SoLuong = SoLuong - @SoLuong
				WHERE  MaSP = @MaSP

		  END

		-- CÁCH 2 --
		CREATE TRIGGER Trigger_c2 ON CHITIETDONHANG
		AFTER INSERT
		AS
		   BEGIN
		         DECLARE  @SoLuong INT
				 DECLARE  @MaSP    VARCHAR(6)

				 SELECT @SoLuong = SoLuong FROM inserted
				 SELECT @MaSP = MaSP  FROM inserted

				 UPDATE SANPHAM
				 SET     SoLuong = (SoLuong - @SoLuong )
				 WHERE   MaSP = @MaSP
		   END


/* b. Trigger_2: Khi cập nhập lại số lượng sản phẩm mà khách hàng đã đặt hàng, kiểm tra
	xem số lượng cập nhật có phù hợp hay không (số lượng phải lớn hơn 1 và nhỏ hơn
	100). Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu không thì hiển thị thông báo "số
	lượng sản phẩm được đặt hàng phải nằm trong khoảng giá trị từ 1 đến 100" và thực
	hiện quay lui giao tác. (1 điểm) */

	       CREATE TRIGGER Trigger_2 ON CHITIETDONHANG
		   FOR UPDATE
		   AS
		      BEGIN
			        DECLARE @SoLuong INT
					SELECT  @SoLuong = SoLuong FROM inserted
					
					IF(@SoLuong BETWEEN 1 AND 100 ) 
					    UPDATE CHITIETDONHANG
						SET SoLuong = @SoLuong
					ELSE
					BEGIN
					    PRINT N'Số lượng sản phẩm được đặt hàng phải nằm trong khoảng giá trị từ 1 đến 100'
						ROLLBACK TRAN
					END
			  END

/* Câu 4: Tạo hàm do người dùng định nghĩa (user-defined function) để tính điểm thưởng cho khách hàng của tất cả 
   các lần đặt hàng trong năm 2014, mã khách hàng sẽ được truyền vào thông qua tham số đầu vào của hàm. Cụ thể như sau: */

   /* Nếu tổng số tiền khách hàng đã trả cho tất cả các lần mua hàng dưới 2.000.000, thì trả về kết quả là khách hàng 
      được nhận 20 điểm thưởng. (1 điểm) */

   /* Nếu tổng số tiền khách hàng đã trả cho tất cả các lần mua hàng từ 2.000.000 trở đi, thì
      trả về kết quả là khách hàng được nhận 50 điểm thưởng. (1 điểm) */

	         CREATE FUNCTION user_defined( @MaKH VARCHAR(6))
			 RETURNS VARCHAR(20)
			 AS
			 BEGIN
			      DECLARE @Notice VARCHAR(20)
				  IF EXISTS ( SELECT KHACHHANG.MaKH FROM KHACHHANG  INNER JOIN DONHANG ON KHACHHANG.MaKH = DONHANG.MaKH
							  WHERE KHACHHANG.MaKH = @MaKH AND

							  YEAR(DONHANG.NgayDat) = '2014'
							  GROUP BY KHACHHANG.MaKH
							  HAVING SUM(CHITIETDONHANG.TongTien) > 2000000)

							  BEGIN
							       SET @Notice = N'Khách hàng được nhận 50 điểm thưởng.'
							  END
							  ELSE
							  BEGIN
							       SET @Notice = N'Khách hàng được nhận 20 điểm thưởng.'
							  END

							  RETURN @Notice
			 END

/* Câu 5: Tạo thủ tục Sp_SanPham tìm những sản phẩm đã từng được khách hàng đặt mua để xóa thông tin về những sản phẩm đó
   trong bảng SANPHAM và xóa thông tin những đơn hàng có liên quan đến những sản phẩm đó (tức là phải xóa những bản ghi
   trong bảng DONHANG và CHITIETDONHANG có liên quan đến các sản phẩm đó). (2 điểm) */

             CREATE PROCEDURE Sp_SanPham1
			 AS
			 BEGIN
			        BEGIN TRAN DELETEPRO;

					DECLARE CONTRO CURSOR
					FOR SELECT MaSP, MaDH FROM CHITIETDONHANG
					OPEN CONTRO

					DECLARE @MaSP  VARCHAR(6)
					DECLARE @MaDH  VARCHAR(6)

					FETCH NEXT FROM CONTRO
					INTO  @MaSP , @MaDH
					WHILE @@FETCH_STATUS = 0
					BEGIN
					      DELETE FROM CHITIETDONHANG

						  IF @@ERROR != 0
						       BEGIN
							         PRINT 'ROLLBACK';
									 ROLLBACK TRAN DELETEPRO
							   END
						   
						   DELETE FROM SANPHAM WHERE SANPHAM.MaSP = @MaSP

						   IF @@ERROR != 0
						        BEGIN
								      PRINT 'ROLLBACK';
									  ROLLBACK TRAN DELETEPRO
								END

							DELETE FROM DONHANG WHERE MaDH = @MaDH

							IF @@ERROR != 0
							     BEGIN
								      PRINT N'ROLLBACK';
									  ROLLBACK TRAN DELETEPRO
								 END
					FETCH NEXT FROM CONTRO
					INTO @MaDH, @MaSP

					END
					CLOSE CONTRO
					DEALLOCATE CONTRO

					COMMIT TRAN DELETEPRO;
			 END

			 -- Thực thi --
			 EXECUTE Sp_SanPham1