
-- INNER JOIN - CÚ PHÁP THAM GIA

--DẠNG 2: CÂU LỆNH TRUY VẤN CÓ PHÂN NHÓM

--Bài số 1: Câu lệnh SQL có từ khoá GROUP BY không điều kiện.
--1. Cho biết MaLop, TenLop, tổng số sinh viên của mỗi lớp.
--2. Cho biết điểm trung bình chung của mỗi sinh viên, xuất ra bảng mới có
--tên DIEMTBC, biết rằng công thức tính DiemTBC như sau:
--DiemTBC =  (DiemHP * SoDvht) /  (SoDvht)
--3. Cho biết điểm trung bình chung của mỗi sinh viên ở mỗi học kỳ.
--4. Cho biết MaLop, TenLop, số lượng nam nữ theo từng lớp.

USE QLSV
GO

--1. Cho biết MaLop, TenLop, tổng số sinh viên của mỗi lớp.
SELECT * FROM DMLOP
GO

SELECT SINHVIEN.MALOP, TENLOP, COUNT (MASV) AS N' Tổng số sinh viên'
 
FROM  DMLOP
INNER JOIN SINHVIEN
ON DMLOP.MALOP = SINHVIEN.MALOP 

GROUP BY SINHVIEN.MALOP , TENLOP ;
GO

GROUP BY SINHMALOP, TENLOP;
GO

--2. Cho biết điểm trung bình chung của mỗi sinh viên, xuất ra bảng mới có tên DIEMTBC, biết rằng công thức tính DiemTBC như sau:
--   DiemTBC =  (DiemHP * SoDvht) /  (SoDvht)

SELECT MASV , 
       SUM (DIEMHP * SODVHT) / SUM(SODVHT ) AS N'Điểm trung bình'
	   INTO DIEMTBC

FROM DMHOCPHAN

INNER JOIN DIEMHP
ON DMHOCPHAN.MAHP = DIEMHP.MAHP
GROUP BY MASV
GO
