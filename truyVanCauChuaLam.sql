
/***Chưa làm *** Câu 1.6. Liệt kê thông tin mã xe, hãng xe của toàn bộ các xe được thuê một lần duy nhất*/

	SELECT      XECHOTHUE.MaXe, HangXe
	FROM        XECHOTHUE
	            INNER JOIN CHITIETHOPDONG ON XECHOTHUE.MaXe = CHITIETHOPDONG.MaXe
				INNER JOIN HOPDONGTHUEXE ON CHITIETHOPDONG.MaHopDong = HOPDONGTHUEXE.MaHopDong
	GROUP BY    XECHOTHUE.MaXe, HangXe, HOPDONGTHUEXE.MaHopDong
	GO

	/*** Chưa làm*** Câu 1.11 Liệt kê không trùng lặp thông tin mã khách hàng, họ và tên khách hàng của các khách hàng có địa chỉ là ‘Hải Châu’ 
	đã từng thuê xê thuộc loại xe có mô tả là ‘Xe 24 chỗ’ hoặc các khách hàng từng thuê xe có thời gian nhận xe là 07/07/2020. 
	Sắp xếp tăng dần theo mã khách hàng và giảm dần theo họ và tên khách hàng */

	SELECT DISTINCT KHACHHANG.MaKH, HoVaTen
	FROM   KHACHHANG
	       INNER JOIN HOPDONGTHUEXE ON KHACHHANG.MaKH = HOPDONGTHUEXE.MaKH
		   INNER JOIN CHITIETHOPDONG ON HOPDONGTHUEXE.MaHopDong = CHITIETHOPDONG.MaHopDong
		   INNER JOIN XECHOTHUE ON CHITIETHOPDONG.MaXe = XECHOTHUE.MaXe
		   INNER JOIN LOAIXE ON XECHOTHUE.MaLoaiXe = LOAIXE.MaLoaiXe
	WHERE  (DiaChi = N'Hải Châu' AND MoTa = N'Xe 24 chỗ') OR
	       (DiaChi = N'Hải Châu' AND NgayNhanXe = '2020/07/07')
	ORDER BY MaKH ASC , HoVaTen DESC
	GO

	/**** Chưa làm*** Câu 1.12. Thống kê số lần được thuê của các xe mà xe đó có số ngày mượn lớn hơn 10 ngày gồm các thông tin mã xe, số lần thuê. */
	
	SELECT MaXe , COUNT(CHITIETHOPDONG.MaHopDong) AS N'Số lần được thuê xe'
	FROM   CHITIETHOPDONG
	WHERE  DATEDIFF(DAY, NgayNhanXe, NgayTraXe) > 10
	GROUP BY MaXe
	GO

	/**** Chưa làm*** Câu 1.13. Cho biết có bao nhiêu xe đã được đùng để cho thuê trong tổng số xe */

	SELECT COUNT(MaXe)  AS N'Số xe đã được dùng để cho thuê'
	FROM   CHITIETHOPDONG
	GROUP BY MaXe
	GO

	/**** Chưa làm*** Câu 1.14. Liệt kê thông tin của những khách hàng đã từng thuê xe vào năm 2018 nhưng chưa từng thuê vào năm 2019. */

	SELECT   KHACHHANG.MaKH, HoVaTen, DiaChi, SoDienThoai,  HOPDONGTHUEXE.MaHopDong
	FROM     KHACHHANG
	         INNER JOIN HOPDONGTHUEXE ON KHACHHANG.MaKH = HOPDONGTHUEXE.MaKH
			 INNER JOIN CHITIETHOPDONG ON HOPDONGTHUEXE.MaHopDong = CHITIETHOPDONG.MaHopDong

	WHERE    KHACHHANG.MaKH IN (SELECT MaKH FROM HOPDONGTHUEXE  WHERE YEAR(NgayNhanXe) = '2018' )
	AND      KHACHHANG.MaKH NOT IN (SELECT MaKH FROM HOPDONGTHUEXE  WHERE YEAR(NgayNhanXe) = '2019' )
    GO

	-- Truy vấn thêm thuộc tính MaHopDong để dễ đối chiếu dữ liệu --
	-- Bên trong IN là toàn bộ danh sách , SELECT để chọn ra phù hợp với điều kiện --

	SELECT * FROM CHITIETHOPDONG
	GO

	/**** Chưa làm*** Câu 1.15. Liệt kê họ và tên của khách hàng mà có từ hai hợp đồng thuê xe trở lên */

	SELECT  HoVaTen 
	FROM    KHACHHANG
	        INNER JOIN HOPDONGTHUEXE ON KHACHHANG.MaKH = HOPDONGTHUEXE.MaKH
    WHERE   KHACHHANG.MaKH IN (SELECT MaKH FROM HOPDONGTHUEXE  GROUP BY MaKH HAVING COUNT(MaHopDong) >= 2)
	GO
	 
	 -- Dữ liệu cho rành mạch , không trùng nhau nên Liệt kê trả về rỗng --

	 
    /*** Chưa làm *** Câu 1.17 Xóa những loại dịch vụ chưa từng được sử dụng trong bất kỳ một hợp đồng nào. */

	DELETE FROM LOAIDICHVU
	WHERE  NOT EXISTS (SELECT MaLoaiDichVu FROM CHITIETHOPDONG WHERE MaLoaiDichVu = LOAIDICHVU.MaLoaiDichVu)
	GO

	SELECT * FROM CHITIETHOPDONG
	GO

	
	 Q+ = { M, N, K, Q }
	 f1 : KQ -> N
	 f2 : M -> K
	 f3 : N -> MKQ

	 TN = {}  ;  TĐ = {}  ;  TG = { M , N, K, Q }

	 STT    TG_i     ( TN U TG_i)    (TN U TG_i)+    SK : ( TN U TG_i)+ = Q+     K
	 1       
	 2       M           M              MK                 
	 3       N           N              NMKQ                  +                  +
	 4       K           K              K
	 5       Q           Q              Q
	 6       MN          MN             MNKQ                  +                  
	 7       MK          MK             MK
	 8       MQ          MQ             MKNQ                  +                  +
	 9       NK          NK             NK
	 10      NQ          NQ             NQ
	 11      KQ          KQ             KQNM                  +                  +
	 12      MNK         MNK            MNKQ                  +
	 13      MNQ         MNQ            MNKQ                  +
	 14      NKQ         NKQ            MNKQ                  +
	 15      MKQ         MKQ            MKQN                  +
	 16      MNKQ        MNKQ           MNKQ                  +

	 ==> Lược đồ quan hệ trên có 2 khóa : N  ,   KQ   , MQ