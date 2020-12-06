
	USE MASTER
	GO

	CREATE DATABASE Buoi1_HeQTCSDL
	GO

	USE Buoi1_HeQTCSDL
	GO

/* Câu 1
   Cho cơ sở dữ liệu Thực tập gồm các quan hệ:
   SV(SV#, HT, NS, QUE, HL)
   DT(DT#, TDT, CN, KP)
   SD(SV#, DT#, NTT, KM, KQ)

   Câu 2. Nhập dữ liệu: Mỗi bảng ít nhất 10 bản ghi. 
   Trong đó, HT phải chứa tập {Hùng, Chiến, Trang}, Que 
   và NTT phải có {Quảng Nam, Huế, Quảng Ngãi}, 
   KP có {2,000,000; 4,000,000; 6,000,000},
    KQ có {4,7,9}

   Câu 3: TRUY VẤN
	3.1 In danh sách gồm Mã SV, Tên SV, Mã ĐT, Tên ĐT . Những SV không thực hiện đề tài cũng hiển thị ra
 */

	CREATE TABLE SINHVIEN
	(
	   MASV     VARCHAR(3)      CONSTRAINT SV_MASV_PK PRIMARY KEY (MASV),
	   HOTEN    NVARCHAR(50)    CONSTRAINT SV_HT_NN NOT NULL,
	   NGAYSINH DATE,
	   QUE      NVARCHAR(50),
	   HOCLUC   NVARCHAR(50)
	)
	GO


	CREATE TABLE DETAI
	(
		MADETAI    VARCHAR(3)   CONSTRAINT DT_MADT_PK PRIMARY KEY,
		TENDETAI   NVARCHAR(255) CONSTRAINT DT_TENDT_NN NOT NULL, 
		CHUNHIEMDT NVARCHAR(50),
		KINHPHI    FLOAT
	)
	GO

	CREATE TABLE SINHVIENDETAI
	(
		MASV          VARCHAR(3) ,
		MADETAI       VARCHAR(3),
		NOITHUCTAP    NVARCHAR(50),
		SOKM          FLOAT,
		KETQUA        INT

		CONSTRAINT SVDT_MASV_MADT_PK PRIMARY KEY (MASV, MADETAI),
		CONSTRAINT SVDT_MASV_FK FOREIGN KEY (MASV) REFERENCES SINHVIEN (MASV),
		CONSTRAINT SVDT_MADT_FK FOREIGN KEY (MADETAI) REFERENCES DETAI (MADETAI),
	)
	GO


-- NHẬP DỮ LIỆU --

  -- NHẬP DỮ LIỆU BẢNG SINH VIÊN --

  INSERT INTO SINHVIEN (MASV, HOTEN, NGAYSINH, QUE, HOCLUC)
  VALUES      ('001', N'Hùng', '2000/01/10', N'Quảng Nam', N'Giỏi')
  GO

  INSERT INTO SINHVIEN
  VALUES      ('002', N'Chiến','2000/02/11', N'Huế', N'Khá')
  GO

  INSERT INTO SINHVIEN
  VALUES      ('003', N'Trang','2000/03/12', N'Quảng Ngãi', N'Trung bình')
  GO

  INSERT INTO SINHVIEN
  VALUES      ('004', N'Bình', '2000/04/13', N'Quảng Bình', N'Yếu')
  GO

  INSERT INTO SINHVIEN
  VALUES      ('005', N'Chỉnh', '2000/05/14', N'Quảng Trị', N'Khá')
  GO

  INSERT INTO SINHVIEN
  VALUES      ('006', N'Duy', '2000/06/15',  N'Huế', N'Giỏi')
  GO

  INSERT INTO SINHVIEN
  VALUES      ('007', N'Hằng', '2000/07/16', N'Quảng Ninh', N'Trung bình')
  GO

  INSERT INTO SINHVIEN
  VALUES      ('008', N'Hội', '2000/08/17', N'Quảng Nam', N'Khá')
  GO

  INSERT INTO SINHVIEN
  VALUES      ('009', N'Lài', '2000/09/18', N'Liên Chiểu', N'Giỏi')
  GO

  INSERT INTO SINHVIEN
  VALUES      ('010', N'Lộc','2000/10/20', N'Sài Gòn', N'Trung bình')
  GO

  SELECT * FROM SINHVIEN
  GO

  -- NHẬP DỮ LIỆU BẢNG ĐỀ TÀI --

  INSERT INTO DETAI (MADETAI, TENDETAI, CHUNHIEMDT, KINHPHI)
  VALUES      ('100', N'Đặc điểm địa chất và đánh giá tiềm năng dầu khí của Mỏ Bạch Hổ', N'Phùng Thị Huệ', 2000000 )
  GO

  INSERT INTO DETAI
  VALUES      ('101', N'Đặc điểm địa chất và tiềm năng Mỏ Thiên Ưng – Mãng Cầu', N'Nguyễn Đức Hoàng', 4000000)
  GO

  INSERT INTO DETAI
  VALUES      ('102', N'Nghiên cứu phương pháp chiết suất và đánh giá hoạt tính ức chế của sản phẩm chiết xuất từ nguyên liệu thiên nhiên', N'Phan Thanh Toản', 6000000 )
  GO

  INSERT INTO DETAI
  VALUES      ('103', N'Nâng cao hiệu quả làm sạch và vận chuyển mùn khoan khi khoan trong thân giếng', N'Phạm Quốc Đô', 8000000)
  GO

  INSERT INTO DETAI
  VALUES      ('104', N'Giải pháp EOR khả thi đối với các mỏ có nhiệt độ cao và áp suất cao ở Việt Nam', N'Nguyễn Quang Khải', 8200000)
  GO

  INSERT INTO DETAI
  VALUES      ('105', N'Mô hình toán mô phỏng quá trình khoan dầu khí', N'Trần Công Minh', 7900000 )
  GO

  INSERT INTO DETAI
  VALUES      ('106', N'Thu hồi dầu tăng cường bằng phương pháp bơm ép chất hoạt động bề mặt', N'Trần Phương', 500000 )
  GO

  INSERT INTO DETAI
  VALUES      ('107', N'Nghiên cứu tổng quan về địa chất - cấu trúc và triển vọng dầu khí Bể Sông Hồng"', N'Đỗ Văn Huy', 7500000 )
  GO

  INSERT INTO DETAI
  VALUES      ('108', N'	Tổng quan về cấu trúc- kiến tạo của Bể Malay-Thổ Chu, Địa Hóa Dầu Khí và đặc điểm hệ thống dầu khí', N'Nguyễn Xuân Vũ', 6700000 )
  GO

  INSERT INTO DETAI
  VALUES      ('109', N'Nghiên cứu, phân tích tướng trầm tích Miocen và ý nghĩa dầu khí của bể Nam Côn Sơn', N'Lâm Trọng Đức', 8100000 )
  GO

   SELECT * FROM DETAI
   GO

   -- NHẬP DỮ LIỆU BẢNG SINH VIÊN ĐỀ TÀI --

   INSERT INTO SINHVIENDETAI (MASV, MADETAI, NOITHUCTAP, SOKM, KETQUA)
   VALUES      ('001', '100', N'Quảng Nam', 15, 4)
   GO

   INSERT INTO SINHVIENDETAI
   VALUES      ('002', '101', N'Huế', 10, 7)
   GO

   INSERT INTO SINHVIENDETAI
   VALUES      ('003', '102', N'Quảng Ngãi',20 , 9)
   GO

   INSERT INTO SINHVIENDETAI
   VALUES      ('004', '103', N'Quảng Bình',30 , 8)
   GO

   INSERT INTO SINHVIENDETAI
   VALUES      ('005', '104', N'Quảng Trị', 40 , 8 )
   GO

   INSERT INTO SINHVIENDETAI
   VALUES      ('006', '105', N'Huế', 50, 6)
   GO

   INSERT INTO SINHVIENDETAI
   VALUES      ('007', '106', N'Quảng Ninh', 25, 7)
   GO

   INSERT INTO SINHVIENDETAI
   VALUES      ('008', '107', N'Quảng Nam', 35, 10)
   GO

   INSERT INTO SINHVIENDETAI
   VALUES      ('009', '108', N'Liên Chiểu', 28, 10)
   GO

   INSERT INTO SINHVIENDETAI
   VALUES      ('010', '109', N'Sài Gòn', 40, 5)
   GO

   SELECT * FROM SINHVIENDETAI
   GO

   -- TRUY VẤN --

   /* 3.1 In danh sách gồm Mã SV, Tên SV, Mã ĐT, Tên ĐT . Những SV không thực hiện đề tài cũng hiển thị ra */

   SELECT    SINHVIEN.MASV, HOTEN, DETAI.MADETAI, TENDETAI
   FROM      SINHVIEN
             LEFT OUTER JOIN SINHVIENDETAI ON SINHVIEN.MASV = SINHVIENDETAI.MASV
			 LEFT OUTER JOIN DETAI ON SINHVIENDETAI.MADETAI = DETAI.MADETAI
   GO
