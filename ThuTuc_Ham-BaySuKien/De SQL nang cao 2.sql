
USE MASTER
GO

CREATE DATABASE QLHangKhong
GO

USE QLHangKhong
GO

CREATE TABLE LOAIMAYBAY
(
    MaLoai         VARCHAR(4) NOT NULL,
	LoaiMB         VARCHAR(20),
	DongCo         VARCHAR(50),
	TocDoToiThieu  VARCHAR(20),
	TocDoToiDa     VARCHAR(20)

	CONSTRAINT PK_LOAIMAYBAY PRIMARY KEY (MaLoai)
)
GO

CREATE TABLE MAYBAY
(
    SoHieuMB        VARCHAR(5) NOT NULL,
	MaLoai          VARCHAR(4),
	NgayBatDauSD    DATE

	CONSTRAINT PK_MAYBAY PRIMARY KEY (SoHieuMB)

)
GO

CREATE TABLE PHICONG
(
    MaPC       VARCHAR(5) NOT NULL,
	TenPC      VARCHAR(50),
	TrinhDo    VARCHAR(20),
	NamKN      INT

	CONSTRAINT PK_PHICONG PRIMARY KEY (MaPC)
)
GO


CREATE TABLE LICHTRINHBAY
(
    MaLT            VARCHAR(6) NOT NULL,
	SoHieuMB        VARCHAR(5),
	MaPC            VARCHAR(5),
	NoiDi           VARCHAR(20),
	NoiDen          VARCHAR(20),
	ThoiGianDi      DATETIME,
	ThoiGianDen     DATETIME

	CONSTRAINT PK_LICHTRINHBAY PRIMARY KEY (MaLT)
)
GO

-- NHẬP DỮ LIỆU --

INSERT INTO LOAIMAYBAY
VALUES ('L01', 'Boeing 747', 'tuoc bin canh quat', '1000km/h', '3000km/h'),
       ('L02', 'A321',       'tuoc bin phan luc',  '1500km/h', '3200km/h'),
	   ('L03', 'Boeing 737', 'tuoc bin roc ket',   '1100km/h', '2500km/h')
GO

INSERT INTO MAYBAY
VALUES ('VN01', 'L01', '2015/05/20'),
       ('JS02', 'L01', '2015/05/21'),
	   ('AS01', 'L02', '2015/05/22')
GO

INSERT INTO PHICONG
VALUES ('PC01', 'Tran Dinh Nam', 'Co Pho', 3),
       ('PC02', 'Jonh henry',    'Co Truong', 8)
GO

INSERT INTO LICHTRINHBAY
VALUES ('LT001', 'VN01', 'PC02', 'Ha Noi',  'Da Nang',  '2015/05/20 14:00', '2015/05/20 16:00'),
       ('LT002', 'AS01', 'PC01', 'Da Nang', 'Thai Lan', '2015/04/13 08:00', '2015/04/13 13:00')
GO


-- TẠO RÀNG BUỘC --

ALTER TABLE MAYBAY
ADD CONSTRAINT FK_MAYBAY_LOAIMAYBAY FOREIGN KEY (MaLoai) REFERENCES LOAIMAYBAY (MaLoai)
GO

ALTER TABLE LICHTRINHBAY
ADD CONSTRAINT FK_LTBAY_MAYBAY FOREIGN KEY (SoHieuMB) REFERENCES MAYBAY (SoHieuMB)
GO

ALTER TABLE LICHTRINHBAY
ADD CONSTRAINT FK_LTBAY_PHICONG FOREIGN KEY (MaPC) REFERENCES PHICONG (MaPC)
GO


SELECT * FROM PHICONG
GO

USE QLHangKhong
GO


-- BÀI TẬP THỦ TỤC --

/* Câu 1a: Tạo khung nhìn V_MayBay để thấy được thông tin của tất cả máy bay có tốc dộ tối thiểu lớn hơn 1100km/h và được bắt đầu sử dụng từ ngày '01/01/2014'*/

        CREATE VIEW V_MayBay
		AS
		SELECT MAYBAY.SoHieuMB, MAYBAY.NgayBatDauSD, LOAIMAYBAY.MaLoai, LOAIMAYBAY.LoaiMB, LOAIMAYBAY.TocDoToiThieu, LOAIMAYBAY.TocDoToiDa
		FROM   MAYBAY
		       INNER JOIN LOAIMAYBAY ON MAYBAY.MaLoai = LOAIMAYBAY.MaLoai
		WHERE  LOAIMAYBAY.TocDoToiThieu > '1100km/h' AND NgayBatDauSD = '2014/01/01'
		GO

		SELECT * FROM V_MayBay
		GO

	
		GO

/* Câu 1b: Thông qua khung nhìn V_MayBay hực hiện việc cập nhật ngày bắt đầu sử dụng thành '2014/01/31' đối với những máy bay có ngày bắt đầu sử  dụng là '2014/02/28' */
        
		UPDATE V_MayBay
		SET    NgayBatDauSD = '2014/02/28 '
		WHERE  NgayBatDauSD = '2014/31/01'
		GO


/* Câu 2: Tạo 2 thủtục (Stored Procedure):
   -- a.Thủ tục Sp_1: Dùng để xóa thông tin của những phi công có mã phi công được truyền vào như một tham số của thủ tục.(1 điểm) */
       
	   CREATE PROCEDURE  Sp_1
		       @MaPC  VARCHAR(5)
		AS
		    BEGIN
		        
				DELETE FROM PHICONG WHERE MaPC = @MaPC

		    END	     
        GO

		-- Thực thi --
		EXECUTE Sp_1 'PC01'
		GO
   
   
   -- b.Thủ tục Sp_2: Dùng để bổ sung thêm bản ghi mới vào bảngLICHTRINHBAY (Sp_2 phải  thực  hiện  kiểm  tra  tính  hợp  lệcủa  dữ liệu được  bổ sung  là  không  trùng  khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng có liên quan). (1 điểm) */

        CREATE PROCEDURE Sp_2
		        @MaLT            VARCHAR(6),
				@SoHieuMB        VARCHAR(5),
				@MaPC            VARCHAR(5),
				@NoiDi           VARCHAR(20),
				@NoiDen          VARCHAR(20),
				@ThoiGianDi      DATETIME,
				@ThoiGianDen     DATETIME
		AS
		BEGIN
		      IF EXISTS ( SELECT MaLT FROM LICHTRINHBAY WHERE MaLT = @MaLT ) AND
			     EXISTS ( SELECT SoHieuMB FROM MAYBAY WHERE SoHieuMB = @SoHieuMB ) AND
				 EXISTS ( SELECT MaPC FROM PHICONG WHERE MaPC = @MaPC )
			  BEGIN
			       
				   IF EXISTS ( SELECT MaLT FROM LICHTRINHBAY WHERE MaLT = @MaLT )
				      BEGIN
					        PRINT N' Đã trùng dữ liệu từ DB '  
					  END
			       ELSE
				      INSERT INTO LICHTRINHBAY
					  VALUES (@MaLT, @SoHieuMB, @MaPC, @NoiDi, @NoiDen, @ThoiGianDi, @ThoiGianDen )
			  END
			  ELSE
			  BEGIN
			       PRINT N'Không tồn tại chuyến bay '
			  END
		END
		GO

		-- Thực thi --
		EXEC Sp_2 'LT001', 'VN01', 'PC02', 'Ha Noi',  'Da Nang',  '2015/05/20 14:00', '2015/05/20 16:00'
		GO

/* Câu 3: Viết 2 bẫy sự kiện (trigger)cho bảng LICHTRINHBAY theo yêu cầu sau: */
  
/*  a.Trigger_1:  Khi  thực  hiện  thêm  một  lịch  trình  bay  cho  một  máy  bay  bất  kỳ thì  kiểm tra dữ
      liệu nơi đi phải khác nơi đến,nếu không hợp lệ thì hiển thị thông báo "Dữ liệu nơi đi phải khác nơi đến  của  cùng  một  chuyến  bay"
      và  quay  lui  (rollback)  giao  tác. Bẫy sự kiện chỉ xử lý 1 bản ghi.(1 điểm) */

	       CREATE TRIGGER Trigger_1 ON LICHTRINHBAY
		   FOR  INSERT
		   AS
		      BEGIN
			          IF(SELECT NoiDi FROM inserted) = (SELECT NoiDen FROM inserted)
					      PRINT N'Dữ liệu nơi đi phải khác nơi dến của cùng một chuyến đi'
					  ELSE
					       ROLLBACK

			  END
			  GO

			  INSERT INTO LICHTRINHBAY
			  VALUES ( 'Ha Noi',  'Ha Noi')
			  GO
			    

/*  b.Trigger_2: Khi cập nhập lại thời gian đi (tức là thời gian cất cánh), kiểm tra thời gian cập nhật có phù hợp hay không
      (thời gian đi phải nhỏ hơn thời gian đến). Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu không hiển thị thông báo "thời gian đi phải nhỏ hơn thời gian đến ít nhất là 30 phút"
      và thực hiện quay lui giao tác. (1 điểm)


/* Câu  4:  Tạo hàm do người dùng định nghĩa (user-defined function) đểtính  chi  phí  bảo  trì cho cả năm 2015.Mã máy bay sẽđược truyền vào thôngqua tham số đầu vào của hàm.
   Cụthểnhư sau:
       -Nếu tổng sốlần bay của máy bay dưới 25 lần, thì kết quảlà chi phí bảo trì được trả 5.000.000 trên mỗi tháng trong năm. (1 điểm)
       -Nếu tổng sốlần bay của máy bay từ 25 lần trở lên, thì kết quảlà chi phí bảo trì được trả10.000.000 trên mỗi tháng trong năm. (1 điểm) */


/*  Câu  5:Tạo thủ tục Sp_PhiCong tìm những phi công đã từng thực hiện lái một chuyến bay bất  kỳ (nghĩa là có lưu trữ thông  tin  của  phi  công 
           trong  bảng  LICHTRINHBAY) để xóa thông  tin  về những phi công đó  trong  bảng  PHICONG  và  xóa  thông  tin  về những chuyến   bay   của   những  phi  công  đó 
           (tức  là  phải  xóa  những  bản  ghi  trong  bảng LICHTRINHBAY có liên quan). (2 điểm)*/