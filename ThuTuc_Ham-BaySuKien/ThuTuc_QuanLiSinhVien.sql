
	USE MASTER
	GO

	CREATE DATABASE QuanLiSinhVien
	GO

	USE QuanLiSinhVien
	GO

	CREATE TABLE SINHVIEN
	(
	   MASV        NVARCHAR(10) NOT NULL,
	   HODEM       NVARCHAR(25),
	   TEN         NVARCHAR(10),
	   NGAYSINH    SMALLDATETIME,
	   GIOITINH    BIT,
	   NOISINH     NVARCHAR(10),
	   MALOP       NVARCHAR(10)

	   CONSTRAINT PK_SINHVIEN PRIMARY KEY (MASV)
	)
	GO

	CREATE TABLE LOP
	(
	   MALOP         NVARCHAR(10) NOT NULL,
	   TENLOP        NVARCHAR(30),
	   KHOA			 SMALLINT,
	   HEDAOTAO      NVARCHAR(25),
	   NAMNHAPHOC    INT,
	   SISO          INT,
	   MAKHOA        NVARCHAR(5)

	   CONSTRAINT PK_LOP PRIMARY KEY (MALOP)
	)
	GO

	CREATE TABLE KHOA
	(
		MAKHOA       NVARCHAR(5) NOT NULL,
		TENKHOA      NVARCHAR(50),
		DIENTHOAI    NVARCHAR(15)

		CONSTRAINT PK_KHOA PRIMARY KEY (MAKHOA)
	)
	GO

	CREATE TABLE MONHOC
	(
		MAMONHOC     NVARCHAR(10) NOT NULL,
		TENMONHOC    NVARCHAR(50),
		SODVHT       SMALLINT

		CONSTRAINT PK_MONHOC PRIMARY KEY (MAMONHOC)
	)
	GO

	CREATE TABLE DIEMTHI
	(
	   MAMONHOC     NVARCHAR(10) NOT NULL,
	   MASV         NVARCHAR(10) NOT NULL ,
	   DIEMLAN1     NUMERIC(5, 2),
	   DIEMLAN2     NUMERIC(5, 2)

	   CONSTRAINT PK_DIEMTHI PRIMARY KEY (MAMONHOC , MASV)
	)
	GO

	ALTER TABLE DIEMTHI
	ADD CONSTRAINT FK_DIEMTHI_SINHVIEN FOREIGN KEY (MASV) REFERENCES SINHVIEN (MASV)
	GO

	ALTER TABLE DIEMTHI
	ADD CONSTRAINT FK_DIEMTHI_MONHOC FOREIGN KEY (MAMONHOC) REFERENCES MONHOC (MAMONHOC)
	GO

	ALTER TABLE SINHVIEN
	ADD CONSTRAINT FK_SINHVIEN_LOP FOREIGN KEY (MALOP) REFERENCES LOP (MALOP)
	GO

	ALTER TABLE LOP
	ADD CONSTRAINT FK_LOP_KHOA FOREIGN KEY (MAKHOA ) REFERENCES KHOA (MAKHOA)
	GO



	/* Ví dụ 5.1 : 
	 1. Bổ sung thêm môn học 'Cơ sở dữ liệu' có mã TI-005 và số đơn vị học trình là 5 vào bảng MONHOC
	 2. Lên danh sách nhập điểm thi môn cơ sở dữ liệu cho các sinh viên học
		lớp có mã C24102 (tức là bổ sung thêm vào bảng DIEMTHI các bản ghi
		với cột MAMONHOC nhận giá trị TI-005, cột MASV nhận giá trị lần
		lượt là mã các sinh viên học lớp có mã C24105 và các cột điểm là
		NULL).   */

		CREATE PROCEDURE sp_LenDanhSachDiem(
										   @MAMONHOC   NVARCHAR(10),
										   @TENMONHOC  NVARCHAR(50),
										   @SODVHT     SMALLINT,
										   @MALOP      NVARCHAR(10))
		AS
			  BEGIN
				   INSERT INTO MONHOC
				   VALUES (@MAMONHOC, @TENMONHOC, @SODVHT)

				   INSERT INTO DIEMTHI (MAMONHOC, MASV)
						 SELECT @MAMONHOC, MASV
						 FROM   SINHVIEN
						 WHERE  MALOP = @MALOP
			  END

	 /* Lời gọi thủ tục */
     
		 sp_LenDanhSachDiem 'TI-005', N'Cơ sở dữ liệu', 5, 'C24102'
		 GO

	/*  Số lượng các đối số cũng như thứ tự của chúng phải phù hợp với số lượng và thứ tự của các tham số khi định nghĩa thủ tục.
		Trong trường hợp lời gọi thủ tục được thực hiện bên trong một thủ tục khác, bên
		trong một trigger hay kết hợp với các câu lệnh SQL khác, ta sử dụng cú pháp như sau:
    
						EXECUTE tên_thủ_tục [danh_sách_các_đối_số]  */

	/* Ví dụ 5.2 : Lời gọi thủ tục ở ví dụ 5.1 có thể viết như sau */

		 sp_LenDanhSachDiem @MALOP = 'C24102',
							@TENMONHOC = N'Cơ sở dữ liệu',
							@MAMONHOC = 'TI-005',
							@SODVHT = 5

	/* Ví dụ 5.3: Trong định nghĩa của thủ tục dưới đây sử dụng các biến chứa các giá trị truy xuất được cơ sở dữ liệu */

		  CREATE PROCEDURE sp_Vidu(
				  @MALOP1   NVARCHAR(10),
				  @MALOP2   NVARCHAR(10))
		  AS
				  DECLARE   @TENLOP1      NVARCHAR(30)
				  DECLARE   @NAMNHAPHOC1  INT     
				  DECLARE   @TENLOP2      NVARCHAR(30)
				  DECLARE   @NAMNHAPHOC2  INT
			  
				  SELECT    @TENLOP1 = TENLOP,
							@NAMNHAPHOC1 = NAMNHAPHOC
				  FROM      LOP WHERE MAKHOA = @MALOP1
			  
				  SELECT    @TENLOP2 = TENLOP,
							@NAMNHAPHOC2 = NAMNHAPHOC
				  FROM      LOP WHERE MAKHOA = @MALOP2
			  
				  PRINT     @TENLOP1 +' nhap hoc nam ' + str(@NAMNHAPHOC1)
				  PRINT     @TENLOP2 +' nhap hoc nam ' + str(@NAMNHAPHOC2)
			  
				  IF  @NAMNHAPHOC1 = @NAMNHAPHOC2
					  PRINT 'Hai lớp nhập học cùng năm'
				  ELSE
					  PRINT 'Hai lớp nhập học khác năm'
		GO
	
		
		/* Ví dụ 5.4: Xét câu lệnh sau */
	
				CREATE PROCEDURE sp_Conghaiso( @a INT, @b INT, @c INT)
				AS
					SELECT  @c = @a + @b
				
					DECLARE @tong INT
					SELECT  @tong = 0
					EXECUTE sp_Consp_Conghaiso 100 , 200 , @tong
					SELECT  @tong

		/* ==> Câu lệnh "SELECT @tong" cuối cùng trong loạt các câu lệnh trên sẽ cho kết quả : 0 */

		/* Trong trường hợp cần phải giữ lại giá trị của đối số sau khi kết thúc thủ tục, ta
		   phải khai báo tham số của thủ tục theo cú pháp như sau:

						  @tên_tham_số kiểu_dữ_liệu OUTPUT
			hoặc:
						  @tên_tham_số kiểu_dữ_liệu OUT

			và trong lời gọi thủ tục, sau đối số được truyền cho thủ tục, ta cũng phải chỉ định thêm
			từ khoá OUTPUT (hoặc OUT ) */

		/* Ví dụ 5.5 : Ta định nghĩa lại thủ tục ở ví dụ 5.4 như sau */

				 CREATE PROCEDURE sp_Conghaiso(
						@a   INT,
						@b   INT,
						@c   INT OUTPUT )
				 AS
						SELECT @c = @a + @b

		/* và thực hiện lời gọi thủ tục trong 1 tập lệnh các câu lệnh sau */

				 DECLARE  @tong INT
				 SELECT   @tong = 0
				 EXECUTE  sp_Conghaiso 100, 200, @tong OUTPUT
				 SELECT   @tong

				 -- ==> Câu lệnh "SELECT @tong" kết quả : 300

		/* 5.1.6 Tham số với giá trị mặc định

		  Các tham số được khai báo trong thủ tục có thể nhận các giá trị mặc định. Giá  trị mặc định sẽ được gán cho tham số trong trường hợp 
		  không truyền đối số cho tham số khi có lời gọi đến thủ tục.
 
		  Tham số với giá trị mặc định được khai báo theo cú pháp như sau:

									   @tên_tham_số kiểu_dữ_liệu = giá_trị_mặc_định  */
		/*Ví dụ 5.6 */
	        
				CREATE PROC sp_TestDefault(
						@TENLOP    NVARCHAR(30) = NULL,
						@NOISINH   NVARCHAR(100) = N'Huế' )
				AS
					BEGIN
					   IF @TENLOP  IS NULL
						  SELECT HODEM, TEN
						  FROM   SINHVIEN INNER JOIN LOP ON SINHVIEN.MALOP = LOP.MALOP
						  WHERE  NOISINH = @NOISINH
					   ELSE
						  SELECT HODEM, TEN
						  FROM   SINHVIEN INNER JOIN LOP ON SINHVIEN.MALOP = LOP.MALOP
						  WHERE  NOISINH = @NOISINH AND TENLOP = @TENLOP
				END

		/* 
		Thủ tục sp_TestDefault được định nghĩa với tham số @tenlop có giá trị mặc định là NULL và tham số @noisinh có giá trị mặc định là Huế. 
		 Với thủ tục được định nghĩa như trên, ta có thể thực hiện các lời gọi với các mục đích khác nhau như sau:*/

	  --  • Cho biết họ tên của các sinh viên sinh tại Huế:
	            sp_TestDefault

	  --   • Cho biết họ tên của các sinh viên lớp Tin K24 sinh tại Huế:
	            sp_TestDefault @TENLOP = 'Tin K24'

	  --   • Cho biết họ tên của các sinh viên sinh tại Nghệ An:
	            sp_TestDefault @NOISINH = N'Nghệ An'

      --   • Cho biết họ tên của các sinh viên lớp Tin K26 sinh tại Đà Nẵng:
	            sp_Testdefault @TENLOP = 'Tin K26', @NOISINH = 'Đà Nẵng' 
	 
		