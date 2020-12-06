
--1 . Truy xuất dữ liệu với câu lệnh SECLECT

-- Cú pháp chung của câu lệnh SELECT Có dạng:
-- SECLECT [ ALL | DISTINCT ] [ TOP n ] Danh sách chọn
-- [ INTO tên bảng mới ]
-- FROM Danh_sách_bảng/khung_nhìn
-- [WHERE Điều_kiện]
-- [GROUP BY Danh_sách_cột]
-- [HAVING Điều_kiện]
-- [ORDER BY Cột_Sắp_xếp]
-- [COMPUTE Danh_sách_hàm_gộp [BY Danh_sách_cột]]

-- ví dụ 1. In toàn bộ thông tin của tất cả các bảng

USE QLSV
GO

SELECT * FROM DMKHOA
GO

SELECT * FROM DMNGANH
GO

SELECT * FROM DMLOP
GO

SELECT * FROM SINHVIEN
GO

SELECT * FROM DIEMHP
GO

SELECT * FROM DMHOCPHAN
GO

--> Dấu * cho biết toàn bộ thông tin các cột và dữ liệu của bảng

========================================================================================

-- 2. Mệnh đề FROM
  -- Trong câu lệnh SECLECT ==> Được sử dụng nhằm chỉ định các bảng và khung nhìn cần truy xuất dữ liệu
  -- Sau FROM : danh sách tên các bảng và khung nhìn tham gia vào truy vấn
  --            Tên các bảng và khung nhìn cách nhau bởi dấu phẩy
 --- Có thể sử dụng bí danh - hoặc khung bình trong câu lệnh SECLECT. 
  -- Bí danh được gán trong MĐ FROM - được đặt ngay sau tên bảng
  
  -- Ví dụ 2: Câu lệnh gán bí danh
  
  SELECT * FROM DMKHOA DanhMucKhoa
  GO
  
  SELECT * FROM DMNGANH DanhMucNganh
  GO
  
  SELECT * FROM SINHVIEN SinhVien
  GO
  
  -----vv--vv--vv--v---------------
   
   --- Có thể sử dụng AS để đặt bí danh hoặc khung nhìn của các bản.
-- ví dụ --
  SELECT * FROM DMKHOA AS KHOA
  GO

  SELECT * FROM SINHVIEN AS SV
  GO

  SELECT * FROM DMNGANH AS NGANH
  GO

  SELECT * FROM DIEMHP AS DIEMHOCPHAN
  GO

  SELECT * FROM DMHOCPHAN AS HOCPHAN
  GO

===================================================================
 
 -- 3: danh sách chọn trong câu lệnh SECLECT

 -- Các trường, các biểu thức được chỉ định ngay sau từ khóa SELECT
 -- và được phân cách bởi dấu phẩy

 -- a) Chọn tất cả các cột trong bảng
 --       + Sử dụng * để hiển thị tất cả các trường trong bảng
 --       + Các  cột được hiển thị trong kết quả truy vấn sẽ tuân thủ theo thứ tự mà chúng ta đã tạo ra khi bảng được định nghĩa
 
 -- ví dụ : Danh sách câu lệnh chọn toàn bộ dữ liệu đã tạo trong database
 
 SELECT * FROM DMKHOA
 GO
 
 SELECT * FROM DMNGANH
 GO
 
 SELECT * FROM DMLOP
 GO
 
 SELECT * FROM SINHVIEN
 GO

 SELECT * FROM DIEMHP
 GO

 SELECT * FROM DMHOCPHAN
 GO

 -- B, Tên cột trong danh sách chọn
 -- trường hợp cần chỉ định cụ thể các cột cần hiển thị trong kết quả truy vấn
 -- Ta sẽ chỉ định danh sách các tên cột trong danh sách chọn
 -- Không có dấu " * "
 -- ví dụ: Câu lệnh chỉ định danh sách tên các cột được hiển thị trong danh sách chọn 
 

 SELECT MAKHOA, TENKHOA
 FROM DMKHOA
 GO

 SELECT MASV, HOTEN, MALOP
 FROM SINHVIEN
 GO


 SELECT MALOP, TENLOP, MANGANH, KHOAHOC
 FROM DMLOP
 GO

 -- V..V...V-----

 -- LƯU Ý : 
 --       + Nếu truy vấn được thực hiện trên nhiều bảng/ khung nhìn và trong các bảng / khung nhìn có các trường TRÙNG TÊN thì TÊN của những trường này nếu xuất hiện trong danh sách chọn phải được viết dưới dạng:
 --         TÊN BẢNG.TÊN TRƯỜNG

 -- Trường hợp 1: Truy vấn nhiều bảng và các bảng có các cột riêng biệt
 -- kết quả hiện thị, sẽ gộp chung các bảng lại với nhau theo thứ tự truy vấn

 SELECT TENKHOA, MASV, HOTEN, MALOP, GIOITINH
 FROM DMKHOA, SINHVIEN
 GO

 -- Trường hợp 2: Truy vấn nhiều bảng , và các bảng có cột bị trùng

 SELECT DMKHOA.MAKHOA, TENKHOA, MANGANH, TENNGANH, DMNGANH.MAKHOA
 FROM DMKHOA, DMNGANH
 GO
 
   -- C, Thay đổi tiêu đề các cột

--			+ Để đặt tiêu đề cho một cột nào đó, ta sử dụng cách viết:
--				Tiêu_đề_cột = Tên_trường
--				Hoặc Tên_trường AS Tiêu_đề_cột
--				Hoặc Tên_trường Tiêu_đề_cột

SELECT N' Mã ngành ' = MANGANH,
       TENNGANH AS N' Tên ngành ',
	   MAKHOA  N' Mã khoa '
FROM DMNGANH
GO

   -- D, Sử dụng cấu trúc CASE trong danh sách chọn
-- Cấu trúc CASE được sử dụng trong danh sách chọn nhằm THAY ĐỔI KẾT QUẢ TRUY VẤN tùy thuộc vào các trường hợp khác nhau
--  * Cú pháp:
--           CASE biểu thức
--              WHEN biểu thức kiểm tra THEN kết quả
--              [ . . . ]
--              [ ELSE kết quả của ELSE ]
--           END

-- VÍ DỤ 6: Hiển thị MASV, HOTEN, MALOP, GIOITINH ( Nam hoặc Nữ ) , NGAYSINH, DIACHI của các sinh viên

SELECT MASV, HOTEN, MALOP, NGAYSINH, DIACHI,
       CASE GIOITINH
	        WHEN 'FALSE' THEN N'Nam'
			ELSE N'Nữ'
		END AS N' Giới tính'
FROM SINHVIEN
GO

-- Hoặc

--         CASE
--                WHEN điều kiện  THEN kết quả
--                   [. . . ]
--                ELESE  kết quả của ELSE
--         END

SELECT MASV, HOTEN, MALOP, NGAYSINH, DIACHI,
       CASE 
	       WHEN GIOITINH = 'FALSE' THEN N'Nam'
		   ELSE  N'Nữ'
		END AS N'Giới tính'
FROM SINHVIEN
GO


-- E, Hằng và biểu thức trong danh sách chọn:
--       +Ngoài danh sách trường ,trong danh sách chọn của câu lệnh SELECT còn có thể sử dụng các biểu thức .
--        Mỗi biểu thức trong danh sách chọn trở thành một cột trong kết quả truy vấn

-- Ví dụ: Cho biết tên học phần và số tiết ( số DVHT * 15) Của các môn học

SELECT MAHP, TENHP, SODVHT * 15 AS N' Số tiết'
FROM DMHOCPHAN
GO


----  LƯU Ý ----
-- Nếu trong danh sách chọn có sự xuất hiện của các giá trị hằng thì giá trị này sẽ xuất hiện trong một cột của kết quả truy vấn ở tất cả các dòng.

-- Ví dụ: 

SELECT TENHP, N' Số tiết' , SODVHT * 15 AS N' Số tiết'
FROM DMHOCPHAN
GO


----- F, Loại bỏ các dòng dữ liệu trùng nhau trong kết quả truy vấn
--      + Chỉ định thêm từ khóa DISTNCT ngay SAU từ khóa SELECT

SELECT DISTINCT MANGANH
FROM DMNGANH
GO

---- G, Giới hạn số lượng dòng trong kết quả truy vấn
--       + Chỉ định thêm từ khóa TOP ngay TRƯỚC danh sách chọn của câu lệnh SELECT

-- Ví dụ 10: Hiển thị Mã sinh viên, họ tên, mã lớp, Giới tính (Nam hoặc Nữ), ngày sinh, dia chi của 5 sinh viên viên đầu tiên trong danh sách

SELECT TOP 5 MASV, HOTEN, MALOP, NGAYSINH, DIACHI,
        CASE GIOITINH
		    WHEN 'False' THEN N'Nam'
			ELSE N'Nữ'
		END AS N' Giới tính'
FROM SINHVIEN
GO


--       + Chỉ định số lượng các dòng cần hiển thị theo tỷ lệ PHẦN TRĂM  bằng cách sử dụng thêm từ khóa PERCENT

-- Ví dụ : Câu lệnh dưới đây hiển thị họ tên, Giới tính (Nam hoặc nữ) và ngày sinh của 10% số lượng sinh viên hiện có trong bảng SINHVIEN

SELECT TOP 10 PERCENT HOTEN, NGAYSINH,
              CASE
			     WHEN GIOITINH = 'False' THEN N'Nam'
				 ELSE N'Nữ'
			  END AS N'Giới tính'
FROM SINHVIEN
GO

              
========================================================

-----4. CHỈ ĐỊNH ĐIỀU KIỆN TRUY VẤN DỮ LIỆU

--      + Mệnh đề WHERE trong câu lệnh SELECT -> xác định điều kiện cho việc truy xuất DL
--      + Sau WHERE là biểu thức logic. Dòng dữ liệu thỏa mãn điều kiện -> được hiển thị ở kết quả truy vấn

-- ví dụ: Hiển thị danh sách các học phần có SODVHT > 3

SELECT *
FROM DMHOCPHAN
WHERE SODVHT > 3
GO

-- Sử dụng CONVERT ( kiểu dữ liệu ( độ dài ), Biểu thức, Định dạng )

-- ví dụ: Cho biết MASV, HOTEN, GIOITINH ( Nam hoặc Nữ ) và ngày sinh ( dd/mm/yyyy ) của các sinh viên

SELECT MASV, HOTEN, 
      CASE
	      WHEN GIOITINH = 'False' THEN N'Nam'
		  ELSE N'Nữ'
	  END AS N'Giới tính',

	  CONVERT ( VARCHAR(10), NGAYSINH , 103 ) AS N' Ngày Sinh'

FROM SINHVIEN
GO

  
-- Ví dụ 14: Cho biết mã , họ tên, giới tính ( Nam hoặc nữ ) và ngày sinh (dd/mm/yyyy) của các sinh viên có tuổi <= 25

SELECT MASV, HOTEN, 
       CASE GIOITINH
	      WHEN 'FALSE' THEN N'Nam' ELSE N'Nữ'
		END AS N' Giới tính',

        CONVERT ( VARCHAR(10), NGAYSINH , 103 ) AS N' Ngày sinh'

FROM SINHVIEN    
   
WHERE		YEAR(GETDATE()) - YEAR( NGAYSINH ) <= 25  
 GO

 --B, Kiểm tra giới hạn của dữ liệu:
-- + Để kiểm tra xem giá trị dữ liệu nằm trong (ngoài) một khoảng nào đó, ta sử dụng toán tử BETWEEN (NOT BETWEEN) như sau:
--				Cách sử dụng						Ý nghĩa
--				Giá_trị BETWEEN a AND b             a <= Giá trị <= b
--				Giá_trị NOT BETWEEN a AND b         (Giá_trị < a) OR (Giá_trị > b)

--Ví dụ: Cho biết HoTen, GioiTinh (Nam hoặc Nữ), NgaySinh(mm/dd/yyyy), Tuổi của các sinh viên có tuổi nằm trong khoảng 20 đến 25

SELECT HOTEN,
       CASE
	       WHEN GIOITINH = 'False' THEN N'Nam' ELSE N'Nữ'
		END AS N' Giới tính',

		CONVERT ( VARCHAR(10) , NGAYSINH , 101 ) AS N'Tuổi'
FROM SINHVIEN

WHERE YEAR(GETDATE()) - YEAR ( NGAYSINH ) BETWEEN 20 AND 25
GO


-----C, Danh sách ( IN  và NOT IN )
-- + IN -> chỉ định điều kiện tìm kiếm dữ liệu cho câu lệnh SELECT là một danh sách các giá trị
-- + Sau IN hoặc NOT IN  có thể là 1 danh sách các giá trị hoặc một câu lệnh SELECT khác

-- Ví dụ 16: Hiển thị danh sách của các học phần có số đơn vị học trình là 4, 7

-- Cách 1:
SELECT * 
FROM DMHOCPHAN
WHERE SODVHT = 4 OR SODVHT = 7
GO

-- Cách 2:
SELECT *
FROM DMHOCPHAN
WHERE SODVHT IN (4, 7)
GO


-----D, Toán tử LIKE và các kí tự đại diện.
-- Ví dụ 17: Cho biết họ tên , GioiTinh(Nam hoặc Nữ), NgaySinh (dd-mm-yy) của các sinh viên có họ là Nguyễn

SELECT HOTEN,
       CASE
	      WHEN GIOITINH = 'False' THEN N'Nam' ELSE N'Nữ'
	   END AS N'Giới tính ',

	   CONVERT ( VARCHAR(10) , NGAYSINH , 103 ) AS N'Ngày sinh'
FROM SINHVIEN

WHERE HOTEN  LIKE N'[Trần%]'
GO


--- E, Giá trị NULL

-- Trong mệnh đề WHERE, để kiểm tra giá trị của một cột có giá trị NULL hay không, ta sử dụng cách viết:
--		WHERE tên_cột IS NULL
-- Hoặc 
--		WHERE tên_cột IS NOT NULL

-- Ví dụ 18: Kiểm tra MaSV  có dữ liệu hay không

SELECT MASV
FROM SINHVIEN
WHERE MASV IS NULL
GO


SELECT MASV
FROM SINHVIEN
WHERE MASV IS NOT NULL
GO


==========================================

------5, TẠO MỚI BẢNG DỮ LIỆU TỪ KẾT QUẢ CỦA CÂU LỆNH SELECT

-- + Câu lệnh SELECT ... INTO có tác dụng tạo một bảng mới có cấu trúc và dữ liệu được xác định từ kết quả của truy vấn.
-- + Bảng mới được tạo ra sẽ có số cột được chỉ định trong danh sách chọn và số dòng kết quả của truy vấn.

-- Ví dụ: Câu lệnh truy vấn dữ liệu từ bảng SINHVIEN và tạo một bảng TUOISV bao gồm các trường HoTen, NgaySinh, DiaChi, Tuoi

SELECT HOTEN, NGAYSINH,DIACHI,
       YEAR (GETDATE()) - YEAR ( NGAYSINH ) AS TUOI
INTO TUOISV
FROM SINHVIEN
GO

-- Trông danh sách chọn có các biểu thức --> phải đặt tên
-- Kiểm tra lại bảng , bảng TUOISV được tạo mới, có kết quả gồm HOTEN,NGAYSINH, DIACHI, TUOI
SELECT * FROM SINHVIEN
GO
SELECT * FROM TUOISV
GO

==================================================

------6, SẮP XẾP KẾT QUẢ TRUY VẤN

--  + Trong trường hợp muốn dữ liệu được sắp xếp theo chiều tăng hoặc giảm của giá trị của một hoặc nhiều trường hợp, ta sử dụng thêm mệnh đề ORDER BY trong câu lệnh SELECT.
--	+ Sau ORDER BY là danh sách các cột cần sắp xếp (tối đa là 16 cột).
--	+ Dữ liệu được sắp xếp có thể theo chiều tăng (ASC) hoặc giảm (DESC), mặc định là theo chiều tăng dần ( ASC )

-- Ví dụ : Hiển thị danh sách các MaSV, MaHP, DiemHP và sắp xếp theo chiều giảm dần theo DiemHP:

 SELECT *
 FROM DIEMHP
 ORDER BY DIEMHP DESC
 GO

 --Nếu sau ORDER BY có nhiều cột -> việc sắp xếp DL được ưu tiên TRÁI -> PHẢI
 -- Ví dụ 21: Hiển thị danh sách MaSV, HoTen, MaLop, Gioi Tinh, Tuoi , DiaChi và được sắp xếp theo chiều GIẢM DẦN MaSV, Tuoi

    SELECT MASV, HOTEN, MALOP, 
        CASE GIOITINH
		    WHEN 'False ' THEN '0' ELSE '1'
		END AS N'Giới tính',

		YEAR(GETDATE()) - YEAR (NGAYSINH) AS Tuoi,
		DIACHI
	FROM SINHVIEN
	ORDER BY GIOITINH DESC,  Tuoi DESC
	GO


--- sắp xếp theo chiều GIOITINH  tăng , Tuoi giảm

SELECT MASV, HOTEN, MALOP, 
        CASE GIOITINH
		    WHEN 'False ' THEN '0' ELSE '1'
		END AS N'Giới tính',

		YEAR(GETDATE()) - YEAR (NGAYSINH) AS Tuoi,
		DIACHI
 FROM SINHVIEN
 ORDER BY GIOITINH ASC,  Tuoi DESC
 GO



