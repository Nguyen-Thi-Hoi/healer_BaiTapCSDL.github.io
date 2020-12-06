
USE MASTER
GO

CREATE DATABASE BTTrigger
GO

USE BTTrigger
GO

CREATE TABLE MATHANG
(
   MAHANG   VARCHAR(3) NOT NULL,
   TENHANG  NVARCHAR(20),
   SOLUONG  INT

   CONSTRAINT PK_MATHANG PRIMARY KEY (MAHANG)
)
GO

CREATE TABLE NHATKYBANHANG
(
   STT       INT NOT NULL,
   NGAY      DATE,
   NGUOIMUA  VARCHAR(10),
   MAHANG    VARCHAR(3),
   SOLUONG   INT,
   GIABAN    FLOAT

   CONSTRAINT PK_NKMH PRIMARY KEY (STT)
)
GO

ALTER TABLE NHATKYBANHANG
ADD CONSTRAINT FK_NKBH_MATHANG FOREIGN KEY (MAHANG) REFERENCES MATHANG (MAHANG)
GO

INSERT INTO MATHANG
VALUES ('H1', N'Xà phòng', 30 ),
       ('H2', N'Kem đánh răng', 45)
GO

INSERT INTO NHATKYBANHANG
VALUES ('1', '2004/01/01', 'Ha', 'H1', 10, 10000.0000),
       ('2', '2004/02/02', 'Phong', 'H2', 10, 5000.0000),
	   ('3', '2004/03/03', 'Thuy', 'H2', 10, 6000.0000)
GO

/* Ví dụ: 5.12 Câu lệnh dưới đây định nghĩa trigger trg_nhatkybanhang_insert. Trigger này có chức
	năng tự động giảm số lượng hàng hiện có khi một mặt hàng nào đó được bán (tức là
	khi câu lệnh INSERT được thực thi trên bảng NHATKYBANHANG) */

	CREATE TRIGGER trg_nhatkybanhang_insert
	ON NHATKYBANHANG
	FOR INSERT
	AS
	BEGIN
	     UPDATE MATHANG
		 SET    MATHANG.SOLUONG = MATHANG.SOLUONG - inserted.SOLUONG
		 FROM   MATHANG INNER JOIN inserted ON MATHANG.MAHANG = inserted.MAHANG
	END
	GO

	-- Sau khi ta thực hiện câu lệnh sau: --

	INSERT INTO NHATKYBANHANG (STT, NGAY, NGUOIMUA, MAHANG, SOLUONG, GIABAN)
	VALUES  ('2004/05/05', 'Nguyen', 'H1', 10, 5200)
	GO

/* Ví dụ 5.13  Xét lại ví dụ với hai bảng MATHANG và NHATKYBANHANG, trigger
	dưới đây được kích hoạt khi ta tiến hành cập nhật cột SOLUONG cho một bản ghi của bảng NHATKYBANHANG (lưu ý chỉ cập nhật đúng một bảng ghi) */

	CREATE TRIGGER trg_nhatkybanhang_update_soluong
	ON NHATKYBANHANG
	FOR UPDATE
	AS
	  BEGIN
	       IF UPDATE(SOLUONG)
		      UPDATE MATHANG
			  SET MATHANG.SOLUONG = MATHANG.SOLUONG - (inserted.SOLUONG  - deleted.SOLUONG )
			  FROM  (deleted INNER JOIN inserted ON deleted.STT = inserted.STT ) INNER JOIN MATHANG
			         ON MATHANG.MAHANG = deleted.MAHANG
	  END

	  -- Với trigger ở VD trên, câu lệnh : --

	  UPDATE NHATKYBANHANG
	  SET    SOLUONG = SOLUONG + 20
	  WHERE  STT = 1

	  -- tương đương với câu lệnh --

	  UPDATE NHATKYBANHANG
	  SET    NGUOIMUA = 'Mai Huu Toan'
	  WHERE  STT = 3
