
USE QLSV
GO

-- BÀI TẬP : VIẾT CÁC CÂU LỆNH SQL CÓ KẾT NỐI ( JOIN )

-- Câu 1: Hiển thị danh sách gồm MaSV, HoTen, MaLop, DiemHP, MaHP của những sinh viên có điểm HP >= 5

         SELECT SINHVIEN.MALOP, HOTEN, MALOP, DIEMHP, MAHP
		 FROM SINHVIEN

		 INNER JOIN DIEMHP 
		 ON DIEMHP.MASV = SINHVIEN.MASV
		 WHERE DIEMHP >= 5
		 GO

-- Câu 2: :  Hiển thị danh sách gồm MaSV, HoTen, MaLop, DiemHP, MaHP được sắp xếp theo ưu tiên MaLop, HoTen theo thứ tự tăng dần

         SELECT SINHVIEN.MASV , HOTEN, DMLOP.MALOP, DIEMHP, MAHP
		 FROM SINHVIEN
		 INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
		 INNER JOIN DMLOP  ON SINHVIEN.MALOP = DMLOP.MALOP
		 ORDER BY  MALOP , HOTEN ASC
		 GO


-- cÂU 3: -- Câu 3: Hiển thị danh sách gồm MaSV, HoTen, MaLop, TenHP, DiemHP, MaHP, HocKy của những sinh viên có DiemHP từ 5 đến 7 ở học kỳ 1

         SELECT SINHVIEN.MALOP, HOTEN, MALOP, DIEMHP, TENHP, DIEMHP.MAHP, HOCKY
		 FROM   SINHVIEN
		 FULL JOIN DIEMHP ON DIEMHP.MASV = SINHVIEN.MASV
         FULL JOIN DMHOCPHAN ON DIEMHP.MAHP = DMHOCPHAN.MAHP
         WHERE (DIEMHP >= 4 AND DIEMHP <= 7)
         GO

         SELECT *
		 FROM DIEMHP
		 INNER JOIN DMHOCPHAN ON DIEMHP.DIEMHP = DMHOCPHAN.HOCKY
		 INNER JOIN SINHVIEN ON DIEMHP.MASV = SINHVIEN.MASV


		 SELECT *
		 FROM SINHVIEN
		 INNER JOIN DIEMHP ON DIEMHP.MASV = SINHVIEN.MASV
		 INNER JOIN DMHOCPHAN ON DIEMHP.MAHP = DMHOCPHAN. MAHP
		 GO


-- cÂU 4: Hiển thị danh sách sinh viên gồm MaSV, HoTen, MaLop, TenLop, MaKhoa của Khoa có mã CNTT

-- Cách 1 --
          
		  SELECT SINHVIEN.MASV, HOTEN, DMLOP.MALOP , TENLOP , DMKHOA.MAKHOA
		  FROM DMKHOA
		  INNER JOIN DMNGANH ON DMKHOA.MAKHOA = DMNGANH.MAKHOA
		  INNER JOIN DMLOP ON DMNGANH.MANGANH = DMLOP.MANGANH
		  INNER JOIN SINHVIEN ON DMLOP.MALOP = SINHVIEN.MALOP
		  WHERE  DMKHOA.MAKHOA = 'CNTT'
		  GO

-- Cách 2 --

          SELECT SINHVIEN.MALOP  HOTEN, DMLOP.MALOP, TENLOP, MAKHOA
		  FROM SINHVIEN
		  INNER JOIN  DMLOP ON DMLOP.MALOP = SINHVIEN.MALOP
		  INNER JOIN  DMNGANH ON DMLOP.MANGANH = DMNGANH.MAKHOA
		  WHERE MAKHOA = 'CNTT'
		  GO














---------------   -- Câu 2:  Hiển thị danh sách gồm MaSV, HoTen, MaLop, DiemHP, MaHP được sắp xếp theo ưu tiên MaLop, HoTen theo thứ tự tăng dần ---------------
-- * Ta cần xác định:
-- B1: SELECT SINHVIEN.MaSV, HoTen, DMLOP.MaLop, DiemHP, MaHP
--	Ở đây tránh trường hợp lỗi ambiguous khi thực hiện INNER JOIN:
--		- Ở các bảng trên ta thấy tên các cột trùng khá nhiều như: 
--			+ MaSV trùng ở bảng SINHVIEN và DIEMHP -> ta giải quyết bằng cách phân biệt như sau: TenBang.TenCot (SINHVIEN.MaSV)
--			+ MaLop trùng ở bảng SINHVIEN và DMLOP -> ta giải quyết bằng cách phân biệt như sau: TenBang.TenCot (DMLOP.MaLop)

-- * Tìm ràng buộc khóa chính và khóa ngoại của các bảng liên quan đến việc lấy thông tin dữ liệu của các cột
-- B2: Tìm điều kiện kết nối: Ta thấy MaSV tạo nên mối liên hệ của 2 bảng : SINHVIEN và DIEMHP
--  + Sử dụng phép INNER JOIN lấy phần dữ liệu chung của 2 bảng thông qua điều kiện ON SINHVIEN.MaSV = DIEMHP.MaSV
--		FROM SINHVIEN
--		INNER JOIN DIEMHP ON SINHVIEN.MaSV = DIEMHP.MaSV
--  + Sau khi thực hiện bước 2 ta sẽ có bảng mới ta gọi với tên SINHVIEN_DIEMHP như sau:
--		MaSV | HoTen | MaLop | GioiTinh | NgaySinh | DiaChi | MaSV | MaHP | DiemHP

-- B3: Tìm điều kiện kết nối : Ta thấy MaLop -> xuất hiện ở 3 bảng: SINHVIEN , DMLOP, SINHVIEN_DIEMHP
-- Sử dụng bảng mới SINHVIEN_DIEMHP như sau:
--  + Sử dụng phép INNER JOIN lấy phần dữ liệu chung của 2 bảng: SINHVIEN_DIEMHP và DMLOP
--		SINHVIEN_DIEMP INNER JOIN DMLOP ON SINHVIEN.MaLop = DMLOP.MaLop

--	+ Sau khi thực hiện bước 3 ta được bảng mới với tên gọi như sau SINHVIEN_DIEMHP_DMLOP 
--		MaSV | HoTen | MaLop | GioiTinh | NgaySinh | DiaChi | MaSV | MaHP | DiemHP | MaLop | TenLop | MaNganh | KhoaHoc | He_DT | NamNhapHoc

-- B4: Đưa ra điều kiện lọc (Sử dụng WHERE [điều_kiện_lọc]) -> ở câu này không có điều kiện lọc
-- B5: Sắp xếp MaLop, HoTen tăng dần:
--		ORDER BY MaLop, HoTen ASC





