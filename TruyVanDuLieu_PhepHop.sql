
USE QLSV
GO

-- PHÉP HỢP ( UNION )
--    + Phép hợp được sử dụng trong trường hợp ta cần gộp kết quả của hai hay nhiều truy vấn thành một tập kết quả duy nhất
--    + SQL cung cấp toán tử UNION để thực hiện phép hợp

--    + Cú pháp   --

-- Câu lệnh_1 :
--           UNION [ALL] Câu lệnh_2
--           UNION [ALL] Câu lệnh_3
--           . . . 
--           [UNION [ALL] Câu lệnh n]
--           [ORDER BY Cột sắp xếp]
--           [COMPUTE Danh sách hàm gộp [ BY danh sách cột]]

-- Trong đó:
--        Câu lệnh_1 có dạng:
--                   SELECT Danh sách cột
--                   [INTO tên bảng mới]
--                   [FROM danh sách bảng | Khung nhìn]
--                   [WHERE Điều kiện lọc]
--                   [GROUP BY danh sách cột]
--                   [ HAVING điều kiện]

-- Và câu lệnh i ( i = 2, . . ., n ) có dạng:
--                   [SELECT danh sách cột]
--                   [FROM Danh sách bảng | Khung nhìn]
--                   [WHERE điều kiện lọc]
--                   [FROUP BY danh sách cột]
--                   [HAVING điều kiện]

-- Ví dụ: Bảng DMKHOA với MAKHOA, TENKHOA UNION bảng DMHOCPHAN với TENHP, SODVHT
-- ==> Hai trường được hợp nhau , không cùng kiểu dữ liệu ==> báo lỗi.

SELECT MAKHOA, TENKHOA FROM DMKHOA
UNION
SELECT MAHP, TENHP FROM DMHOCPHAN
GO

--------- LƯU Ý -----------
-- + Khi sử dụng từ khóa UNION để kết hợp , ta cần chú ý các nguyên tắc sau:
--        + Danh sách các cột trong các truy vấn thành phần phải có CÙNG SỐ LƯỢNG
--        + Các cột TƯƠNG ỨNG trong tất cả các bảng, hoặc tập con bất kì các cột được sử dụng trong  bản thân mỗi truy vấn thành phẩn phải CÙNG KIỂU DỮ LIỆU 
--        + Các cột tương ứng trong bản thân từng truy vấn thành phần của một câu lệnh UNION phải xuất hiện theo THỨ TỰ NHƯ NHAU . Nguyên nhân là do phép hợp do sánh các cột từng cột một theo THỨ TỰ ĐƯỢC CHO trong mỗi truy vấn.
--        + Khi các kiểu dữ liệu KHÁC NHAU  được kết hợp với nhau trong câu lệnh UNION, chúng sẽ được chuyển sang kiểu DỮ LIỆU CAO HƠN ( nếu có thể được ).
--        + TIÊU ĐỀ CỘT trong kết quả của PHÉP HỢP sẽ là TIÊU ĐỀ CỘT được CHỈ ĐỊNH trong truy vấn đầu tiên.
--        + Truy vấn thành phần đầu tiên có thể có INTO  để tạo mới một bảng từ KẾT QUẢ CHÍNH của phép HƠP
--        + Mệnh đề ORDER BY và COMPUTE dùng để SẮP XẾP kết quả truy vấn hoặc tính toán các giá trị các giá trị thống kê chỉ được sử dụng ở cuối câu lệnh UNION. Chúng ta không được sử dụng ở trong bất kì truy vấn thành phần nào.
--        + Mệnh đề GROUP BY và HAVING chỉ có thể được sử dụng trong bản thân từng truy vấn thành phần , Chúng không được phép sử dụng để tác động lên kết quả chung của phép hợp
--        + Phép toán UNION có thể được sử dụng bên trong câu lệnh INSERT
--        + Phép toán UNION không được sử dụng trong câu lệnh CREATE VIEW

=======================================================

----- 8, PHÉP NỐI
--        + Khi cần thực hiện một yêu cầu truy vấn dữ liệu từ hai hay nhiều bảng, ta phải sử dụng đến phép nối
--        + Một câu lệnh nối kết hợp với các dòng dữ liệu trong các bảng khác nhau lại theo một hoặc nhiều điều kiện nào đó và hiển thị chúng trong kết quả truy vấn

--    Sử dụng phép nối
--        + Phép nối là cơ sở để thực hiện các yêu cầu truy vấn dữ liệu liên quan đến nhiều bảng
--        + Một câu lệnh nối thực hiện lấy các dòng dữ liệu trong các bảng tham gia truy vấn, so sánh giá trị của các dòng này trên một hay nhiều cột được chỉ định trong điều kiện kết nối và kết hợp các dòng thỏa mãn điều kiện thành những dòng trong kết quả truy vấn
--        + Để thực hiện được một phép nối , cần phải xác định được những yếu tố sau:
--              Những cột nào cần hiển thị trong kết quả truy vấn
--              Những bảng nào có tham gia vào truy vấn
--              Điều kiện để thực hiện phép nối giữa các bảng dữ liệu là gì
--		Trong các yếu tố kể trên  , việc xác định chính xác điều kiện để thực hiện phép nối giữa các bảng đóng vai trò quan trọng nhất
--		Trong đa số các trường hợp ,điều kiện của phép nối được xác định nhờ vào nối quan hệ giữa các bảng cần phải truy xuất dữ liệu
--		Thông thường, đó là điều kiện bằng giữa khóa chính và khóa ngoại của hai bảng có mối quan hệ với nhau
--		Như vậy, để có thể đưa ra một câu lệnh nối thức hiện chính xác yêu cầu truy vấn dữ liệu đòi hỏi phải hiểu được mối quan hệ cũng như ý nghĩa của chúng giữa các bảng dữ liệu.

-- ** Danh sách chọn trong phép nối: **
--        + Một câu lệnh nối cũng được bắt đầu với từ khóa SELECT
--        + Các cột được CHỈ ĐỊNH TÊN sau từ khóa SELECT là các cột được hiển thị trong kết quả truy vấn
--        + Việc sử dụng tên các cột trong danh sách chọn có thể là:
--             . Tên của một số cột nào dó trong các bảng có tham gia vào truy vấn.

--             . Nếu tên cột trong các bảng trùng tên nhau thì tên cột phải được viết dưới dạng sau:
--                      TÊN BẢNG . TÊN CỘT

--             . Dấu (*) được sử dụng trong danh sách chọn khi cần hiển thị tất cả các cột của các bảng tham gia truy vấn

--             . Trong trường hợp cần hiển thị tất cả các cột của một bảng nào đó, ta sử cách viết:
--                         TÊN BẢNG *

-- ** Mệnh đề FROM trong PHÉP NỐI **
--        + Sau mệnh đề FROM trong phép nối là danh sách TÊN các BẢNG  ( hay khung nhìn) tham gia vào truy vấn.
--        + Nếu ta sử dụng dấu (*) trong danh sách chọn thì thứ tự của các bảng liệt kê sau FROM sẽ ảnh hưởng đến thứ tự các cột được hiển thị trong kết quả truy vấn.

-- ** Mệnh đề WHERE trong PHÉP NỐI **
--        + Khi hay hay nhiều bảng được nối với nhau , ta phải chỉ định điều kiện để thực hiện phép nối NGAY SAU mệnh đề WHERE
--        + Điều kiện nối được biểu diễn dưới dạng biểu thức logic so sánh giá trị dữ liệu giữa các cọt của các bảng tham gia truy vấn

--Ví dụ : Hiển thị danh sách các sinh viên với các thông tin: MaSV, HoTen, MaLop, TenLop, HeDT, TenNganh

SELECT MASV, HOTEN, SINHVIEN.MALOP, TENLOP, HEDT, TENNGANH
INTO SV_LOP_NGANH
FROM SINHVIEN , DMLOP, DMNGANH
WHERE    SINHVIEN.MALOP= DMLOP.MALOP
     AND DMLOP.MANGANH = DMNGANH.MANGANH
GO

SELECT * FROM  SV_LOP_NGANH

-- * Trong câu lệnh điều kiện trên, các bảng tham gia vào truy vấn bao gồm SINHVIEN, DMLOP, DMNGANH.
--  + Điều kiện để thực hiện phép nối giữa các bảng bao gồm hai điều kiện:
--	SINHVIEN.MALOP = DMLOP.MALOP
--	và DMLOP.MANGANH  = DMNGANH.MANGANH
--  + Điều kiện nối giữa các bảng trong câu lệnh trên là điều kiện bằng giữa các khóa ngoại và khóa chính của các bảng có mối quan hệ với nhau.
--	+ Hay nói cách khác, điều kiện của phép nối được xác định dựa vào mối quan hệ giữa các bảng trong cơ sở dữ liệu.

===============================================

---- 9, CÁC LOẠI PHÉP NỐI
--    a, Phép nối bằng và phép nối tự nhiên
--           + Một phép nối bằng (equi-join) là một phép nối trong đó GIÁ TRỊ của các CỘT được sử dụng để nối được so sánh với nhau dựa trên tiêu chuẩn BẰNG và tất cả các cột trong các bảng tham gia nối đều được đưa ra trong kết quả.

-- VÍ DỤ: Câu lệnh dưới đâu thực hiện phép nối bằng giữa 2 bảng SINHVIEN và DMLOP

  SELECT *
  FROM SINHVIEN, DMLOP
  WHERE SINHVIEN.MALOP = DMLOP.MALOP
  GO

-- Trong kết quả của câu lệnh trên, cột MALOP xuất hiện hai lần trong kết quả của phép nối (Cột MALOP của bảng SINHVIEN và côt MALOP của bảng DMLOP) và như vậy là không cần thiết.
-- Ta có thể loại bỏ bớt đi những cột trùng tên trong kết quả truy vấn bằng cách CHỈ ĐỊNH DANH SÁCH CỘT cần được hiển thị trong danh sách chọn của câu lệnh.

-- Một dạng đặc biệt của phép kết nối bằng được sử dụng nhiều là phép nối tự nhiên (natural-join).
-- Trong phép nối tự nhiên, điều kiện nối giữa hai bảng chính là điều kiện bằng giữa khóa ngoại và khóa chính của hai bảng.
-- Và trong danh sách chọn của câu lệnh chỉ giữ lại một cột trong hai cột tham gia vào điều kiện của phép nối.

-- VÍ DỤ : Thực hiện phép nối tự nhiên giữa 2 bảng SINHVIEN và DMLOP

      SELECT MASV, HOTEN, GIOITINH, NGAYSINH, DIACHI, SINHVIEN.MALOP, TENLOP, MANGANH, KHOAHOC, HEDT, NAMNHAPHOC
	  INTO SV_LOP
	  FROM SINHVIEN, DMLOP
	  WHERE SINHVIEN.MALOP = DMLOP.MALOP
	  GO

	  SELECT * FROM SV_LOP

-- Viết ngắn gọn hơn

      SELECT SINHVIEN.* , TENLOP, MANGANH, KHOAHOC, HEDT, NAMNHAPHOC
	  INTO SV_LOP_2
	  FROM SINHVIEN, DMLOP
	  WHERE SINHVIEN.MALOP = DMLOP.MALOP
	  GO

	  SELECT * FROM SV_LOP_2

---- ** PHÉP NỐI VỚI CÁC ĐIỀU KIỆN BỔ SUNG ** -----------
--           	+ Trong các câu lệnh nối, ngoài điều kiện của phép nối được chỉ định trong mệnh đề WHERE còn có thể chỉ định các điều kiện tìm kiếm dữ liệu khác (điều kiện chọn).
--              + Thông thường, các điều kiện này được kết hợp với điều kiện nối thông qua toán tử AND

-- Ví dụ : Câu lệnh hiển thị họ tên, ngày sinh, ngành đang học của các sinh viên thuộc khoa CNTT

       SELECT HOTEN, NGAYSINH, TENNGANH, TENKHOA
	   FROM SINHVIEN, DMLOP, DMNGANH, DMKHOA
	   WHERE  TENKHOA = N' Công nghệ thông tin' AND
	          SINHVIEN.MALOP = DMLOP.MALOP AND
			  DMLOP.MANGANH  = DMNGANH.MANGANH AND
			  DMNGANH.MAKHOA = DMKHOA.MAKHOA
	   GO

 -- ví dụ. Câu lệnh hiển thị họ tên , ngày sinh , ngành đang học của các sinh viên thuộc khoa sư phạm

       SELECT HOTEN, NGAYSINH, TENNGANH, TENKHOA
	    FROM  SINHVIEN, DMLOP, DMNGANH, DMKHOA
		WHERE TENKHOA = N'Sư Phạm' AND
			  SINHVIEN.MALOP = DMLOP.MALOP AND
		   	  DMLOP.MANGANH = DMNGANH.MANGANH AND
			  DMNGANH.MAKHOA = DMKHOA.MAKHOA
         GO

--- ** PHÉP TỰ NỐI VÀ CÁC BÍ DANH **
	       
--         + Phép tự nối là phép nối mà trong đó điều kiện nối được chỉ định liên quan đến các cột của cùng một bảng.
--         + Trong trường hợp này, sẽ có sự xuất hiện tên của cùng một bảng nhiều lần trong mệnh đề FROM và do đó các bảng cần phải được đặt bí danh.

--  Ví dụ: Để biết được họ tên và ngày sinh, địa chỉ của các sinh viên có cùng ngày sinh với  sinh viên Trần Đức Chuẩn, ta phải thực hiện phép tự nối ngay trên chính bảng SINHVIEN. 
--         . Trong câu lệnh nối, bảng SINHVIEN xuất hiện trong mệnh đề FROM với bí danh là a và b. 
--         . Bảng SINHVIEN với bí danh là a sử dụng để chọn ra sinh viên có họ tên là Trần Đức Chuẩn và bảng SINHVIEN với bí danh là b sử dụng để xác định các sinh viên trùng ngày sinh với sinh viên Trần Đức Chuẩn.

            SELECT b.HOTEN, b.HOTEN, b.DIACHI
			FROM   SINHVIEN a, SINHVIEN b
			WHERE  a.HOTEN = N' Trần Đức Chuẩn '
			  AND  a.NGAYSINH = b.NGAYSINH
			  AND  a.MASV     <> b.MASV
			GO

--- ** D, PHÉP NỐI KHÔNG DỰA TRÊN TIÊU CHUẨN BẰNG ** --
--         + Trong phép nối này, điều kiện để thực hiện phép nối giữa các bảng dữ liệu không phải là điều kiện so sánh bằng giữa các cột.             
--         + Loại phép nối này trong thực tế thường ít được sử dụng.

-- ** E,  PHÉP NỐI NGOÀI (outer-join)
--         + Trong các phép nối đã đề cập ở trên, chỉ những dòng có giá trị trong các cột được chỉ định thỏa mãn điều kiện kết nối mới được hiển thị trong kết quả truy vấn và được gọi là phép nối trong (inner join)
--         + Theo một nghĩa nào đó, những phép nối này loại bỏ thông tin chứa trong những dòng không thỏa mãn điều kiện nối.
--         + Tuy nhiên, đôi khi ta cũng cần giữ lại những thông tin này bằng cách cho phép những dòng không thỏa mãn điều kiện nối có mặt trong kết quả của phép nối.
--         + Để làm điều này, ta có thể sử dụng phép nối ngoài.

--       * Phép nối ngoài trái (Ký hiệu *=): 
--            Phép nối này hiển thị trong kết quả truy vấn tất cả các dòng dữ liệu của bảng nằm bên trái trong điều kiện nối cho dù những dòng này không thỏa mãn điều kiện của phép nối.
--       * Phép nối ngoài phải (Ký hiệu =*): 
--            Phép nối này hiển thị trong kết quả truy vấn tất cả cấc dòng dữ liệu của bảng nằm bên phải trong điều kiện nối cho dù những dòng này không thỏa điều kiện của phép nối.

-- Ví dụ: Kết nối ngoài bên trái 2 bảng SINHVIEN và DIEMHP
 
         SELECT *
		 FROM SINHVIEN, DIEMHP
		 WHERE SINHVIEN.MASV = DIEMHP.MAHP
		 GO
--       ==> SQL loại bỏ cách này


--- *** 10. SỬ DUNG PHÉP NỐI TRONG SQL2 ***---

--       + Ở phần trước đẫ đề cập đến phương pháp sử dụng phép nối trong và phép nối ngoài trong truy vấn SQL.
--       + Như đã trình bày, điều kiện của phép nối trong câu lệnh được chỉ định trong mệnh đề WHERE thông qua các biểu thức so sánh giữa các bảng tham gia truy vấn.
--       + Chuẩn SQL2 (SQL-92) đưa ra một cách khác để biểu diễn cho phép nối, trong cách biểu diễn này, điều kiện của phép nối không được chỉ định trong mệnh đề WHERE mà được chỉ định ngay trong mệnh đề FROM của câu lệnh.
--       + Cách sử dụng phép nối này cho phép ta biểu diễn phép nối cũng như điều kiện nối được rõ ràng, đặc biệt là trong trường hợp phép nối được thực hiện trên ba bảng trở lên.

--  ** A: PHÉP NỐI TRONG ** 
--       + Điều kiện để thực hiện phép nối trong được chỉ định trong mệnh đề FROM theo cú pháp như sau:

--                 Tên_bảng_1 [INNER] JOIN Tên_bảng_2 ON điều kiện nối

 -- Ví dụ: Để hiển thị họ tên và ngày sinh của các sinh viên Lớp Cao đẳng toán tin ta có 2 cách:
--  CÁCH 1
         SELECT HOTEN, NGAYSINH, TENLOP
		 FROM   SINHVIEN, DMLOP
		 WHERE  TENLOP = N'Cao đẳng toán tin' AND
		        SINHVIEN.MALOP = DMLOP.MALOP
		 GO

-- CÁCH 2
         SELECT HOTEN, NGAYSINH, TENLOP
		 FROM SINHVIEN
		 INNER JOIN DMLOP 
		 ON SINHVIEN.MALOP = DMLOP.MALOP
		 WHERE TENLOP = N' Cao đẳng toán tin'
		 GO

--- ** B. PHÉP NỐI NGOÀI ** --
--       SQL2 cung cấp các phép nối ngoài sau đây:
--			+ Phép nối ngoài trái ( LEFT OUTER JOIN )
--			+ Phép nối ngoài phải ( RIGHT OUTER JOIN )
--			+ Phép nối ngoài đầy đủ ( FULL OUTER JOIN )

--			Cũng tương tự như phép nối trong, điều kiện của phép nối ngoài cũng được chỉ định ngay trong mệnh đề FROM theo cú pháp:

--				Tên_bảng_1 LEFT|RIGHT|FULL [OUTER] JOIN Tên_bảng_2
--							ON Điều_kiện_nối

-- Ví dụ: Kết nối ngoài bên trái 2 bảng SINHVIEN và DIEMHP 

         SELECT *
		 FROM SINHVIEN
		 LEFT OUTER JOIN DIEMHP
		 ON SINHVIEN.MASV = DIEMHP.MASV
		 GO

---- Ví dụ 32: Kết nối ngoài bên phải 2 bảng SINHVIEN và DIEMHP 

         SELECT *
		 FROM SINHVIEN
		 RIGHT OUTER JOIN DIEMHP
		 ON SINHVIEN.MASV = DIEMHP.MASV
		 GO

-- ** Nếu phép kết nối ngoài trái hiển thị trong kết quả truy vấn cả những dòng dữ liệu không thỏa điều kiện nối của bảng bên trái trong phép nối
-- ** Nếu phép kết nối ngoài phải hiển thị trong kết quả truy vấn cả những dòng dữ liệu không thỏa điều kiện nối của bảng bên phải trong phép nối
-- => Trong cả 2 trường hợp trên thì ta sẽ sử dụng phép nối ngoài đầy đủ để hiển thị trong kết quả truy vấn cả những dòng dữ liệu không thỏa điều kiện kết nối của cả 2 bảng tham gia vào phép nối.

-- Ví dụ: Kết nối ngoài đầy đủ 2 bảng SINHVIEN và DIEMHP 

         SELECT *
		 FROM SINHVIEN
		 FULL OUTER JOIN DIEMHP
		 ON SINHVIEN.MASV = DIEMHP.MASV
		 GO


--- *** 11. THỰC HIỆN PHÉP NỐI TRÊN NHIỀU BẢNG *** ---

--         + Một đặc điểm nổi bật của SQL2 là cho phép biểu diễn phép nối trên nhiều bảng dữ liệu một cách rõ ràng.  
--         + Thứ tự thực hiện phép nối giữa các bảng được xác định theo nghĩa kết quả của phép nối này được sử dụng trong một phép nối khác.

-- Ví dụ : Hiển thị họ tên, ngày sinh của các sinh viên thuộc Khoa Sư Phạm

            SELECT HoTen, NgaySinh, TenKhoa
			FROM SINHVIEN
			INNER JOIN DMLOP   ON SINHVIEN.MaLop = DMLOP.MaLop
			INNER JOIN DMNGANH ON DMLOP.MaNganh  = DMNGANH.MaNganh
			INNER JOIN DMKHOA  ON DMNGANH.MaKhoa = DMKHOA.MaKhoa
			GO

--   . Trong câu lệnh trên, thứ tự thực hiện phép nối giữa các bảng được chỉ định rõ ràng:
--        Phép nối giữa hai bảng SINHVIEN và DMLOP được thực hiện trước
--   . Tiếp đến lấy kết quả ở phép kết trên tiếp tục được nối với bảng DMNGANH và cuối cùng kết quả kết nối của 3 bảng trên được kết với bảng DMKHOA.

