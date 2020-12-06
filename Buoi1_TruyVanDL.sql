
--*Buổi 3:
--DẠNG 1: CÂU LỆNH TRUY VẤN CÓ ĐIỀU KIỆN  - Tìm hiểu trước về SELECT
--Bài số 1: Câu lệnh SQL không kết nối 


--1. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ) , Namsinh của những sinh viên có họ không bắt đầu bằng chữ N,L,T. 
SELECT MASV, HOTEN, MALOP, NGAYSINH, GIOITINH, YEAR (NGAYSINH ) AS NAMSINH
FROM SINHVIEN
WHERE  HOTEN   NOT LIKE N'[NTL]%';

SELECT * FROM SINHVIEN
WHERE HOTEN LIKE N'[NTL]%';
     

--2. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ) , Namsinh của những sinh viên nam học lớp CT11. 
SELECT MASV, HOTEN, MALOP, NGAYSINH, GIOITINH, YEAR (NGAYSINH ) AS 'NAMSINH'
FROM SINHVIEN
WHERE  GIOITINH = N'False' AND MALOP = 'CT11';

--3. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ) của những sinh viên học lớp CT11,CT12,CT13.

SELECT MASV, HOTEN, MALOP, NGAYSINH, GIOITINH
FROM SINHVIEN
WHERE MALOP IN ('CT11', 'CT12', 'CT13' );

--4. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ), Tuổi của những sinh viên có tuổi từ 19-21.

SELECT MASV, HOTEN, MALOP, NGAYSINH, GIOITINH, YEAR (GETDATE()) - YEAR (NGAYSINH ) AS ' TUOI1'
FROM SINHVIEN
WHERE YEAR (GETDATE()) - YEAR (NGAYSINH ) IN ( '19', '20', '21' ); -- hoặc
WHERE YEAR (GETDATE()) - YEAR (NGAYSINH ) BETWEEN 19 AND 21; 

-- Câu này kết quả xuất ra: là cái bảng trắng nha, vì nay là 2020 - cho năm nhập trong bản , nó lớn hơn 19-21 tuổi rồi, lấy chi mà in nè !.