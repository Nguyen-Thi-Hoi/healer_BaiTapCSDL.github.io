
   USE QLSV
   GO
   
   
   SELECT *
	FROM SINHVIEN
	LEFT OUTER JOIN DIEMHP
	ON SINHVIEN.MaSV = DIEMHP.MaSV
	GO

   
   
    SELECT *
    FROM SINHVIEN
    LEFT OUTER JOIN DIEMHP
    ON SINHVIEN.MaSV = DIEMHP.MaSV
    GO
     
     SELECT HOTEN, NGAYSINH, TENKHOA
     FROM SINHVIEN
     INNER JOIN DMLOP   ON SINHVIEN.MALOP = DMLOP.MALOP
     INNER JOIN DMNGANH ON DMLOP.MANGANH = DMNGANH.MANGANH
     INNER JOIN DMKHOA  ON DMNGANH.MAKHOA = DMKHOA.MAKHOA
     GO
     
     -- bÀI TẬP 2: vIẾT CÁC CÂU LỆNH CÓ KẾT NỐI JOIN --
     
     -- Câu 1: Hiển thị danh sách gồm MaSV, HoTen, MaLop, DiemHP, MaHP của những sinh viên có điểm HP >= 5
     
     SELECT SINHVIEN.MASV, HOTEN, MALOP, DIEMHP, MAHP
     FROM SINHVIEN
     INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
     WHERE DIEMHP >= 5
     GO
     
     -- Câu 2:  Hiển thị danh sách gồm MaSV, HoTen, MaLop, DiemHP, MaHP được sắp xếp theo ưu tiên MaLop, HoTen theo thứ tự tăng dần
     
     SELECT SINHVIEN.MASV, HOTEN, DMLOP.MALOP, DIEMHP, MAHP
     FROM SINHVIEN
     INNER JOIN DMLOP ON SINHVIEN.MALOP = DMLOP.MALOP
     INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
     ORDER BY MALOP, HOTEN ASC
     GO
     
     -- Câu 3: Hiển thị danh sách gồm MaSV, HoTen, MaLop, TenHP, DiemHP, MaHP, HocKy 
     --của những sinh viên có DiemHP từ 5 đến 7 ở học kỳ 1
     
     SELECT SINHVIEN.MASV, HOTEN, MALOP, TENHP,DIEMHP, DIEMHP.MAHP, DMHOCPHAN.HOCKY
     FROM SINHVIEN
     FULL OUTER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
     FULL OUTER JOIN DMHOCPHAN ON DIEMHP.MAHP = DMHOCPHAN.MAHP
     WHERE ( DIEMHP BETWEEN 4 AND 7 ) 
     GO
     
     -- Câu 4: Hiển thị danh sách sinh viên gồm MaSV, HoTen, MaLop, TenLop, MaKhoa của Khoa có mã CNTT
     -- cách 1:
     SELECT SINHVIEN.MASV,HOTEN, DMLOP.MALOP, TENLOP,DMKHOA.MAKHOA
     FROM SINHVIEN
     INNER JOIN DMLOP ON SINHVIEN.MALOP = DMLOP.MALOP
     INNER JOIN DMNGANH ON DMLOP.MANGANH = DMNGANH.MANGANH
     INNER JOIN DMKHOA ON DMNGANH.MAKHOA = DMKHOA.MAKHOA
     
     WHERE DMKHOA.MAKHOA = N'CNTT'
     GO
     
     -- cách 2
     SELECT SINHVIEN.MASV, HOTEN, DMLOP.MALOP, TENLOP, DMKHOA.MAKHOA
	FROM DMKHOA
	INNER JOIN DMNGANH ON DMKHOA.MAKHOA = DMNGANH.MAKHOA
	INNER JOIN DMLOP ON DMNGANH.MANGANH = DMLOP.MANGANH
	INNER JOIN SINHVIEN ON DMLOP.MALOP  = SINHVIEN.MALOP
	WHERE DMKHOA.MAKHOA = 'CNTT'
	GO


---- *******   DẠNG 2: CÂU LEENHK TRUY VẤN CÓ PHÂN NHÓM ******* ------

-- ví dụ: CHo biết số lượng sinh viên của mỗi lớp --

SELECT DMLOP.MALOP , TENLOP, COUNT (MASV) AS N' SỈ SỐ'
FROM DMLOP , SINHVIEN
WHERE SINHVIEN.MALOP = DMLOP.MALOP
GROUP BY DMLOP.MALOP , TENLOP
GO

-- ==> -- *Lưu ý: Trong trường hợp danh sách chọn của câu lệnh SELECT có cả các hàm gộp và những biểu thức không phải là hàm gộp (DMLOP.MALOP) thì những biểu thức này phải có mặt đầy đủ trong mệnh đề GROUP BY, nếu không câu lệnh sẽ không hợp lệ.

-- *** BÀI TẬP ***

--  * Bài số 1: Câu lệnh SQL có từ khóa GROUP BY không điều kiện:

--  Câu 1: Cho biết MaLop, TenLop, tổng số sinh viên của mỗi lớp.

   SELECT SINHVIEN.MALOP , TENLOP , COUNT(MASV ) AS N' SI SO'
   FROM SINHVIEN
   INNER JOIN DMLOP ON SINHVIEN.MALOP = DMLOP.MALOP
   GROUP BY SINHVIEN.MALOP , TENLOP
   GO

-- Câu 2 Cho biết điểm trung bình chung của mỗi sinh viên ở mỗi học kỳ
   SELECT MASV , SUM(DIEMHP * SODVHT) / SUM(SODVHT) AS DIEMTP
   INTO DIEMTBC
   FROM DIEMHP INNER JOIN DMHOCPHAN ON DIEMHP.MAHP = DMHOCPHAN.MAHP
   GROUP BY MASV
   GO
 
 -- Câu 3: Cho biết điểm trung bình của mỗi sinh viên ở mỗi học kỳ
 
  SELECT HOCKY, MASV, SUM(DIEMHP*SODVHT) / SUM(SODVHT) AS N' ĐIỂM TB'
  FROM DMHOCPHAN INNER JOIN DIEMHP ON DMHOCPHAN.HOCKY = DIEMHP.MAHP
  GROUP BY HOCKY, MASV
  ORDER BY HOCKY
  GO
   
   
      
      
   -- Câu 4: Cho biết MaLop, TenLop, số lượng nam nữ theo từng lớp
   SELECT SINHVIEN.MALOP , TENLOP, COUNT(MASV) AS N'SÔ LƯỢNG NAM NỮ'
   FROM SINHVIEN INNER JOIN DMLOP ON SINHVIEN.MALOP = DMLOP.MALOP
   GROUP BY SINHVIEN.MALOP , TENLOP , GIOITINH
   ORDER BY SINHVIEN.MALOP DESC
   GO
   
   
   -- *** BÀI TẬP 2: CÂU LỆNH GROUP BY với điều kiện lọc ***--
   
   -- Câu 1: Cho biết điểm trung bình chung của mỗi sinh viên ở học kì 1:
   -- DIEMTBC = SUM(DIEMHP*SODVHT ) / SUM ( SODVHT )
   
  
   SELECT MaSV, SUM ( DiemHP * Sodvht ) AS DiemTBC
   FROM DMHOCPHAN INNER JOIN DIEMHP ON DMHOCPHAN.MaHP = DIEMHP.MaHP
   WHERE HocKy = '1'
   GROUP BY MaSV
   GO
   
   -- Câu 2: Cho biết MaSV, HoTen, Số các học phần thiếu điểm ( DiemHP < 5 ) của mỗi sinh viên.
   
   SELECT SINHVIEN.MaSV, HOTEN, COUNT (DIEMHP.MASV) AS N'SỐ LƯỢNG'
   FROM SINHVIEN INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MaSV 
   WHERE DIEMHP < 5
   GROUP BY SINHVIEN.MaSV , HoTen 
   GO
   
   -- Câu 4: Tính tổng số đơn vị học tình có điểm HP < 5 của mỗi sinh viên.
   SELECT SINHVIEN.MASO , HOTEN , SUM(SODVHT) AS N' TỔNG SỐ SVHT'
   FROM SINHVIEN INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
                 INNER JOIN DMHOCPHAN ON DIEMHP.MAHP = DMHOCPHAN.MAHP
   WHERE DIEMHP < 5
   GROUP BY SINHVIEN.MASV , HOTEN
   GO
   
  -- ví dụ : Thông tin sinh viên có điểm trung bình học kì 1 lớn hơn hoặc bằng 5
  
  SELECT SINHVIEN.MaSV ,HoTen, SUM ( DIEMHP * SODVHT ) / SUM (SODVHT )
  FROM SINHVIEN INNER JOIN DIEMHP ON SINHVIEN.MaLop=DIEMHP.MaHP
                INNER JOIN DMHOCPHAN ON DMHOCPHAN.HocKy = DIEMHP.MaHP
  WHERE HocKy = '1'
  GROUP BY SINHVIEN.MaSV , HoTen
  HAVING SUM(DIEMHP * SODVHT ) / SUM(SODVHT ) >= 5
  GO
    
    
 --- *** BÀI TẬP 3: CÂU LỆNH SQL CÓ TỪ KHOS GROUP BY VỚI ĐIỀU KIỆN NHÓM *** ---
 
 -- * cÂU 1: cho biết MALOP, TENLOP, có tổng số sinh viên = 3 --
 
   SELECT SINHVIEN.MALOP ,TENLOP 
   FROM DMLOP INNER JOIN SINHVIEN ON DMLOP.MALOP = SINHVIEN.MALOP
   GROUP BY SINHVIEN.MALOP , TENLOP
 --  HAVING COUNT(MASV)= 3
   GO
   
 --* Câu 2: Cho biết HOTEN, SINHVIEN có điểm TBC các học phần < 6.2
 
 SELECT SINHVIEN.MASV,HOTEN , SUM(DIEMHP * SODVHT ) / SUM(SODVHT) AS N' ĐIỂM TBC'
 INTO DiemTBC
 FROM SINHVIEN INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
               INNER JOIN DMHOCPHAN ON DIEMHP.MAHP = DMHOCPHAN.MAHP
 GROUP BY SINHVIEN.MASV , HOTEN 
 HAVING SUM (DIEMHP * SODVHT ) / SUM(SODVHT) < 6.2
 GO
  
 --* câu 3: Cho tiế HOTEN sinh viên có ít nhất 2 học phần có điểm < 5
 
 SELECT SINHVIEN.MASV , HOTEN
 FROM SINHVIEN INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
               INNER JOIN DMHOCPHAN ON DIEMHP.MAHP = DMHOCPHAN.MAHP
 WHERE DIEMHP < 5
 GROUP BY SINHVIEN.MASV , HOTEN
 HAVING COUNT( DIEMHP.MAHP ) >= 2
 GO
  
--* Câu 4: cho biết HOTEN sinh viên học tất cả các học phần ở ngành 480202
-- cách 1:

SELECT SINHVIEN.MASV, HOTEN , COUNT(DIEMHP.MAHP) AS N'SỐ LƯỢNG HP'
FROM SINHVIEN INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
              INNER JOIN DMHOCPHAN ON DIEMHP.MAHP = DMHOCPHAN.MAHP
WHERE MANGANH = '480202'
GROUP BY SINHVIEN.MASV , HOTEN
HAVING COUNT(DMHOCPHAN.MAHP) = ( SELECT COUNT (MAHP) FROM DMHOCPHAN WHERE MANGANH = '480202')
GO

-- cách 2:

SELECT SINHVIEN.MASV , HOTEN , COUNT(MAHP) AS N'SỐ LƯỢNG HP'
FROM DIEMHP INNER JOIN SINHVIEN ON DIEMHP.MASV = SINHVIEN.MASV
            INNER JOIN DMLOP ON SINHVIEN.MALOP = DMLOP.MALOP
WHERE MANGANH = '480202'
GROUP BY SINHVIEN.MASV , HOTEN
HAVING COUNT(MAHP) = ( SELECT COUNT(MAHP) FROM DMHOCPHAN WHERE MANGANH = '480202')
GO


--* CÂU 5: Cho biết họ tên sinh viên học ít nhất 4 học phần mã '001','002','003','004',

SELECT HOTEN, COUNT(MAHP) AS N'SỐ LƯỢNG'
FROM SINHVIEN INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
WHERE MAHP IN ('001','002','003','004')
GROUP BY HOTEN
HAVING COUNT(MAHP) >= 4
GO

-- *** BÀI TẬP 4: CÂU LỆNH SQL CÓ TỪ KHÓA TOP *** --

-- Câu 1: CHo biết MASV, HOTEN, sinh viên có ĐTB cao nhất ở học kì 1

SELECT TOP 1 SINHVIEN.MASV , HOTEN SUM( DIEMHP * SODVHT ) / SUM(SODVHT) AS N'ĐIỂM TBC'
FROM SINHVIEN INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
              INNER JOIN DMHOCPHAN ON DIEMHP.MAHP = DMHOCPHAN.MAHP
WHERE HOCKY = '1'
GROUP BY SINHVIEN.MASV ,HOTEN
ORDER BY SUM(DIEMHP * SODVHT ) / SUM(SODVHT) DESC
GO

--* CÂU 2: Cho biết MASV, HOTEN sinh viên viên có số học phần điểm HP < 5 nhiều nhết

SELECT SINHVIEN.MASV, HOTEN , COUNT(MAHP) AS N' SỐ HỌC PHẦN' 
FROM SINHVIEN INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
    
WHERE DIEMHP < 5
GROUP BY SINHVIEN.MASV , HOTEN
ORDER BY COUNT(MAHP) DESC
GO

--* CÂU 3: CHo biế MAHP có số sinh viên có điểm HP < 5 nhiều nhất

SELECT TOP 1 MAHP , COUNT(MASV) AS N'SỐ LƯỢNG SV'
FROM DIEMHP
WHERE DIEMHP < 5
GROUP BY MAHP
ORDER BY COUNT(MASV) DESC
GO

-- cÂU 4: cho biết MAHP, TENHP, có số sinh viên có điểm HP < 5 cao nhất

SELECT TOP 1 DMHOCPHAN.MAHP, TENHP , COUNT (MASV ) AS N'SỐ LƯỢNG SV'
FROM DIEMHP INNER JOIN DMHOCPHAN ON DIEMHP.MAHP = DMHOCPHAN.MAHP
WHERE DIEMHP < 5
GROUP BY DMHOCPHAN.MAHP , TENHP 
ORDER BY COUNT(MASV) DESC
GO

--- **** DẠNG 4: CÂU LỆNH TRUY VẤN VỚI CẤU TRÚC LỒNG NHAU *** --

-- ** BÀI TẬP 1: CẤU TRÚC LỒNG NHAU PHỦ ĐỊNH ( KHÔNG , CHƯA )

--* Câu 1: CHo biết HOTEN, sinh viên không học học phần nào

SELECT MASV , HOTEN
FROM SINHVIEN
WHERE MASV NOT IN ( SELECT MASV FROM DIEMHP )
GO

-- Câu 2: Cho biết HOTEN sinh viên chưa học học phần có mã '001'

SELECT MASV, HOTEN
FROM SINHVIEN
WHERE MASV NOT IN ( SELECT MASV FROM DIEMHP WHERE MAHP = '001')
GO

-- Câu 3: CHo biết TENHP ,không có sinh viên có DIEMHP < 5

SELECT DMHOCPHAN.MAHP , TENHP
FROM DIEMHP INNER JOIN DMHOCPHAN ON DIEMHP.DIEMHP = DMHOCPHAN.MAHP
WHERE DMHOCPHAN.TENHP NOT IN ( SELECT MAHP FROM DIEMHP WHERE DIEMHP < 5 )
GROUP BY DMHOCPHAN.MAHP , TENHP
GO

-- hoặc

SELECT MAHP , TENHP
FROM DMHOCPHAN
WHERE MAHP NOT IN ( SELECT MAHP FROM DIEMHP WHERE DIEMHP < 5 )
GO

-- Câu 4: Cho biết HOTEN sinh viên không có học phần nào với DIEMHP < 5
-- C1
SELECT DISTINCT MASV , HOTEN
FROM SINHVIEN
WHERE MASV NOT IN ( SELECT DISTINCT MASV FROM DIEMHP WHERE DIEMHP < 5 )
GO

-- C2

SELECT SINHVIEN.MASV , HOTEN
FROM SINHVIEN INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
WHERE SINHVIEN.MASV NOT IN ( SELECT MASV FROM DIEMHP WHERE DIEMHP < 5 )
GROUP BY SINHVIEN.MASV , HOTEN
GO


--*** BÀI TẬP 2: CẤU TRÚC LỒNG NHAU KHÔNG KẾT NỐI ---

--* Câu 1: Cho biết MALOP, TENLOP, HEDT,NAMNHAPHOC có sinh viên tên Hoa

SELECT MALOP, TENLOP, HEDT, NAMNHAPHOC FROM DMLOP
WHERE MALOP IN ( SELECT MALOP FROM SINHVIEN WHERE HOTEN LIKE N'%Hoa')
GO

-- Câu 2: Cho biết HOTEN  những sinh viên có DIEMHP '001' < 5


SELECT MASV , HOTEN
FROM SINHVIEN
WHERE MASV NOT IN ( SELECT MASV FROM DIEMHP WHERE MAHP = '001' AND DIEMHP < 5 )
GO

--* Câu 3: cho biết danh sách các học phần có SODVHT >= SODVHT của học phần mã 001

SELECT MAHP , TENHP
FROM DMHOCPHAN
WHERE SODVHT >= ( SELECT SODVHT FROM DMHOCPHAN WHERE MAHP = '001')
GO


--- *** DẠNG 4 : CÂU LỆNH TRUY VẤN VỚI LƯỢNG TỪ ALL , ANY ,EXISTS *** ------

---** Phép so sánh đối với kết quả truy vấn con --
-- Kết quả của truy vấn con có thể được sử dụng để thực hiện phép so sánh số học với một biểu thức của truy vấn cha. Trong trường hợp này , truy vấn con được sử dụng dưới dang

--        WHERE biểu thức toán số học [ ANY | ALL ] 
--                ( truy vấn con )

-- Trong đó : phép toán số học có thể sử dụng bao gồm: =, <> , > , < , >=, <=; Và truy vấn con phải có kết quả bao gồm đúng 1 cột

-- Nếu truy vấn con trả về nhiều hơn một giá trị , việc sử dụng phép so sánh như trên sẽ không hợp lệ , Trong trường hợp này  , sau phép toán so sánh phải sử dụng thêm lượng từ ALL , ANY
-- Lượng từ ALL  được sử dụng khi cần so sánh giá trị của biểu thức với tấc cả các giá trị trả về trong kết quả của truy vấn con
-- Ngược lại phép so sánh với lượng từ ANY có kết quả đúng khi chỉ cần một giá trị bất kfi nào đó trong kết quả của truy vấn con thỏa mãn điều kiện

------------ ************  --------------------
--** ví dụ : in ra danh sách học phần có SODVHT >= SODVHT có mã 003 

SELECT *
FROM DMHOCPHAN
WHERE SODVHT >= ALL (SELECT SODVHT FROM DMHOCPHAN WHERE MAHP = '003')
GO

--* ví dụ: Cho biết HOTEN của sinh viên của lớp Cao đẳng tin học trước tất cả các sinh viên của lớp cao đẳng tin học

SELECT *
FROM DMLOP INNER JOIN SINHVIEN ON DMLOP.MALOP = SINHVIEN.MALOP
WHERE TENLOP = N' CAO ĐẲNG TIN HỌC '
    AND NGAYSINH < ALL ( SELECT NGAYSINH FROM DMLOP
    INNER JOIN SINHVIEN ON DMLOP.MALOP = SINHVIEN.MALOP WHERE DMLOP.MALOP = N' CAO ĐẲNG TIN HỌC ')
GO

--* : Hiển thị họ tên của những sinh viên lớp Cao đẳng toán tin có năm sinh bằng với một sinh viên nào đó của lớp Cao đẳng tin học

SELECT *
FROM DMLOP INNER JOIN SINHVIEN ON DMLOP.MALOP = SINHVIEN.MALOP
WHERE TENLOP = N' CAO ĐẲNG TIN HỌC' AND YEAR(NGAYSINH) IN ( SELECT YEAR(NGAYSINH)
FROM DMLOP INNER JOIN SINHVIEN ON DMLOP.MALOP = SINHVIEN.MALOP WHERE TENLOP = N'CAO ĐẲNG TIN HỌC')
GO


---        ************      --------

-- ** Sử dụng lượng từ EXISTS với truy vấn con
--        - Lượng từ EIXISTS được sử dụng kết hợp với truy vấn con dưới dạng
--                  WHERE [NOT] EXISTS ( truy vấn con )

-- Để kiểm tra xem 1 truy vấn con có trả về dòng kết quả nào hay không , Lượng từ EXISTS ( tương ứng NOT NOT EXISTS ) trả về giá trị TRUE ( tương tự FALSE) nếu kết quả của truy vấn con có ít nhất một dòng ( tương ứng không có dòng nào ). Điều khác biệt của việc sử dụng EXISTS  với 2 cách đã nêu ở trên là trong danh sách chọn của truy vấn con có thể nhiều hơn 2 cột

-- ví dụ : CHo biết HOTEN, của những sinh viên hiện chưa có điểm học phần của bất kì mã học phần nào

SELECT *
FROM SINHVIEN
WHERE NOT EXISTS ( SELECT MASV 
                              FROM DIEMHP WHERE DIEMHP.MASV = SINHVIEN.MASV )
GO

-- *** BÀI 1: LƯỢNG TỪ ALL *** --

-- Câu1: chobieest HOTEN sinh viên có DIEMHP cao nhất

SELECT *
FROM SINHVIEN INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
WHERE DIEMHP >= ALL ( SELECT DIEMHP FROM DIEMHP )
GO

-- Câu 2: Cho biết HOTEN sinh viên có tuổi cao nhất

SELECT *
FROM SINHVIEN
WHERE YEAR(GETDATE()) - YEAR(NGAYSINH) >= ALL ( SELECT YEAR(GETDATE()) - YEAR(NGAYSINH) FROM SINHVIEN)
GO

-- Câu 3: CHo biết MASV, HOTEN, sinh viên có DIEMHP mã '001' cao nhất

SELECT *
FROM SINHVIEN INNER JOIN DIEMHP ON SINHVIEN.MASV =DIEMHP.MASV
WHERE DIEMHP >= ALL ( SELECT DIEMHP FROM DIEMHP WHERE MAHP = '001' )
GO


 ---- *** LƯỢNG TỪ ANY *** --
 
 --* cÂU 1: Cho biết MASV,MAHP, có DIEMHP lớn hơn bất kì các DIEMHP của MASV '001'
 
 SELECT *
 FROM SINHVIEN INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV 
 WHERE DIEMHP > ANY ( SELECT DIEMHP FROM DIEMHP WHERE MAHP = '001')
 GO
 
 -- Câu 2: Cho biết sinh viên có DIEMHP nào đó lớn hơn gấp rưỡi DIEMTB chung của sv ĐÓ
 
 SELECT MASV, DIEMTBC FROM DIEMTBC
 WHERE DIEMTBC > ANY ( SELECT DIEMTBC FROM DIEMTBC WHERE DIEMHP.MASV = DIEMTBC.MASV )
 GO
 

-- *** BÀI 3: LƯỢNG TỪ EXISTS *** --

--* cÂU 1: Cho biết MASV, HOTEN, sinh viên đã ít nhất 1 lần HỌC học phần nào đó

SELECT MASV, HOTEN FROM SINHVIEN
WHERE EXISTS ( SELECT * FROM DIEMHP WHERE SINHVIEN.MASV = DIEMHP.MASV)
GO

 --* Câu 2: Cho biết MASV, HOTEN của sinh viên đã không học phần nào
 
 SELECT MASV, HOTEN FROM SINHVIEN
 WHERE NOT EXISTS ( SELECT * FROM DIEMHP WHERE SINHVIEN.MASV = DIEMHP.MASV)
 GO
 
 --* cÂU 3: cho biết MALOP, TENLOP, đã không có sinh viên nào học
 
 SELECT MALOP, TENLOP FROM DMLOP
 WHERE NOT EXISTS ( SELECT * FROM SINHVIEN WHERE SINHVIEN.MALOP = DMLOP.MALOP)
 GO
 
 
 --   ******* DẠNG 5: CÂU LỆNH TRUY VẤN VỚI CẤU TRÚC TẬP HỢP ******  ---
 
-- Khi sử dụng toán tử UNION để thực  phép hợp , ta cần chú ý các nguyên tác sau:
--      + Danh sách các cột trong các truy vấn thành phần phải có cùng số lượng
--      + Các cột tương ứng trong tất cả các bảng, hoặc tập con bất kí các cột được sử dụng trong bản thân mỗi truy vấn thành phần phải cùng kiểu dữ liệu
--      + Các cột tương ứng trong bản thân từng truy vấn thành phần của mỗi câu lệnh UNION phải xuất hiện theo thứ tự như nhau. Nguyên nhân là do phép hợp so sánh các cột từng cột một theo thứ tự được cho trong mỗi truy vấn
--      + Khi các kiểu dữ liệu khác nhau được kết hợp với nhau trong câu lệnh UNION , chúng sẽ được chuyển sang kiểu dữ liệu cao hơn ( nếu có thể )
--      + Tiêu đề cột của kết quả trong phép hợp sẽ là tiêu đề cột được chỉ định trong truy vấn đầu tiên
--      + Truy vấn thành phần đầu tiên có thể có INTO dể tạo mới một bảng từ kết quả chính của phép hợp
--      + Truy vấn thành phần đầu tiên có thể có INTO để tạo mới một bảng từ kết quả chính của phép hợp
--      + Mệnh đề ORDER TO và COMPUTE dùng để sắp xếp kết quả truy vấn hoặc tính toán các giá trị thống kê chỉ được sử dụng ở cuối câu lệnh UNION. Chúng không được sử dụng ở trong bất kì truy vấn thành phần nào
--      + Mệnh đề GROUP BY và HAVING chỉ có thể thể được sử dụng trong bản thân từng tuy vấn thành phần. CHúng không được phếp sử dụng để tác động lên kết quả chung của phép hợp
--      + Phép toán UNION có thể được sử dụng bên trong câu lệnh INSERT
--      + Phép toán UNION không được sử dụng trong câu lệnh CREATE VIEW


--*** Câu 1: CHo biết MASV đã học ít nhất một trong 2 học phần có mã là '001','002'
      
   SELECT MASV FROM DIEMHP WHERE MAHP = '001'
   UNION ( SELECT MASV FROM DIEMHP WHERE MAHP = '002' )
   GO
   
--*** Câu 2: Cho biết MASV chưa học phần nào

   SELECT MASV FROM SINHVIEN
   EXCEPT ( SELECT MASV FROM DIEMHP )
   GO
   
-- cÂU 3: Cho biết MASV học ít nhất 2 học phần có mã '001' và '002'

   SELECT MASV FROM DIEMHP WHERE MAHP = '001'
   INTERSECT ( SELECT MASV FROM DIEMHP WHERE MAHP = '002' )
   GO
   