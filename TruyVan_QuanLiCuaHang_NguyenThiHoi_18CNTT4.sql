
USE QUANLYCH
GO

-- Câu 3: Liệt kê những phòng karaoke chứa được số lượng tối đa dưới 20 khách--
SELECT MaPhong FROM PHONG
WHERE SoKhachHangToiDa < 20
GO

-- Câu 4: Câu 4: Liệt kê thông tin của các dịch vụ có đơn vị tính là "Chai" với đơn giá nhỏ hơn 20.000
-- VNĐ và các dịch vụ có đơn vị tính là "Lon" với đơn giá lớn hơn 30.000 VNĐ --

SELECT * FROM DICHVU
WHERE ( DonViTinh = 'Chai' and DonGia < 20.000 ) OR ( DonViTinh = 'Lon' AND DonGia > 30.000 )
GO

-- Câu 5: Liệt kê thông tin của các phòng karaoke có mã phòng bắt đầu bằng cụm từ "VIP"

SELECT * FROM PHONG
WHERE MaPhong LIKE 'VIP%'
GO

/* Câu 6: Liệt kê thông tin của toàn bộ các dịch vụ, yêu cầu sắp xếp giảm dần theo đơn giá (0.5
điểm) */

SELECT * FROM DICHVU
ORDER BY DonGia DESC
GO

/* Câu 7: Đếm số hóa đơn có trạng thái là "Chưa thanh toán" và có thời gian bắt đầu sử
dụng nằm trong ngày hiện tại (0.5 điểm) */

SELECT COUNT ( MAHD ) AS N'Số hóa đơn' FROM HOADON
WHERE  TrangThaiHD = ' Chua thanh toan'  AND DAY(ThoiGianBatDauSD) = DAY(ThoiGianKetThucSD)
GO

/* Câu 8: Liệt kê địa chỉ của toàn bộ các khách hàng với yêu cầu mỗi địa chỉ được liệt kê một
lần duy nhất (0.5 điểm) */

SELECT DISTINCT DiaChi
FROM KHACHHANG
GO

/* Câu 9: Liệt kê MaHD, MaKH, TenKH, DiaChi, MaPhong, DonGia (Tiền giờ),
ThoiGianBatDauSD, ThoiGianKetThucSD của tất cả các hóa đơn có trạng thái là "Đã thanh
toán" */

SELECT  HOADON.MaHD , KHACHHANG.MaKH, TenKH,DiaChi,  HOADON.MaPhong, MUCTIENGIO.DonGia, ThoiGianBatDauSD, ThoiGianKetThucSD  
FROM KHACHHANG
     INNER JOIN HOADON ON KHACHHANG.MaKH = HOADON.MaKH
     INNER JOIN MUCTIENGIO ON HOADON.MaTienGio = MUCTIENGIO.MaTienGio
WHERE TrangThaiHD = 'Da thanh toan '
GROUP BY HOADON.MaHD, KHACHHANG.MaKH, TenKH, DiaChi, HOADON.MaPhong, MUCTIENGIO.DonGia, ThoiGianBatDauSD, ThoiGianKetThucSD 
GO
     
 /* Câu 10: Liệt kê MaKH, TenKH, DiaChi, MaHD, TrangThaiHD của tất cả các hóa đơn với
yêu cầu những khách hàng chưa từng có một hóa đơn nào thì cũng liệt kê thông tin
những khách hàng đó ra (0.5 điểm) */

SELECT KHACHHANG.MaKH , TenKH, DiaChi, HOADON.MaHD, TrangThaiHD
FROM KHACHHANG
FULL OUTER JOIN HOADON ON KHACHHANG.DiaChi = HOADON.MaKH
GO

/* Câu 11: Liệt kê thông tin của các khách hàng đã từng sử dụng dịch vụ "Trái cây" hoặc từng
sử dụng phòng karaoke có mã phòng là "VIP07" (0.5 điểm) */

SELECT HOADON.MaKH, DICHVU.TenDV , HOADON.MaPhong
FROM HOADON
     INNER JOIN CHITIET_SUDUNGDV ON HOADON.MaHD = CHITIET_SUDUNGDV.MaHD
     INNER JOIN DICHVU ON CHITIET_SUDUNGDV.MaDV = DICHVU.MaDV
     
WHERE TenDV = 'Trai cay' OR HOADON.MaPhong IN ( 'VIP07')
GO

/* Câu 12: Liệt kê thông tin của các khách hàng chưa từng sử dụng dịch vụ hát karaoke lần nào
cả (0.5 điểm) */

SELECT * FROM KHACHHANG         
WHERE KHACHHANG.MaKH NOT IN (SELECT HOADON.MaKH FROM HOADON)
GO


/* Câu 13: Liệt kê thông tin của các khách hàng đã từng sử dụng dịch vụ hát karaoke và chưa
từng sử dụng dịch vụ nào khác kèm theo (0.5 điểm) */

SELECT * FROM KHACHHANG
WHERE MaKH IN (SELECT MaKH FROM HOADON) 
  AND MaKH NOT IN (SELECT KHACHHANG.MaKH FROM KHACHHANG 
  JOIN HOADON ON KHACHHANG.MaKH = HOADON.MaKH 
  JOIN CHITIET_SUDUNGDV ON HOADON.MaHD = CHITIET_SUDUNGDV.MaHD )
GO


/* Câu 14: Liệt kê thông tin của những khách hàng đã từng hát karaoke vào năm "2014" nhưng
chưa từng hát karaoke vào năm "2015" (0.5 điểm) */

SELECT * FROM KHACHHANG
WHERE MaKH IN ( SELECT MaKH FROM HOADON WHERE YEAR( ThoiGianBatDauSD ) = '2014' )
 AND  MaKH NOT IN ( SELECT MaKH FROM HOADON WHERE YEAR ( ThoiGianBatDauSD ) = '2015' )
 GO
 

/* Câu 15: Hiển thị thông tin của những khách hàng có số lần hát karaoke nhiều nhất tính từ
đầu năm 2014 đến hết năm 2014 (0.5 điểm) */

SELECT * FROM KHACHHANG
WHERE MaKH IN ( SELECT TOP 1 MaKH FROM HOADON WHERE YEAR ( ThoiGianBatDauSD ) = '2014'  AND YEAR ( ThoiGianKetThucSD) = '2014')
GO


/* Câu 16: Đếm tổng số lượng loại dịch vụ đã được sử dụng trong năm 2014 với yêu cầu chỉ
thực hiện tính đối với những loại dịch vụ có đơn giá từ 50.000 VNĐ trở lên (0.5 điểm) */

SELECT COUNT(DICHVU.MaDV) AS N' Tổng dịch vụ sử dụng' 
FROM DICHVU  
          INNER JOIN CHITIET_SUDUNGDV ON DICHVU.MaDV = CHITIET_SUDUNGDV.MaDV 
          INNER JOIN HOADON ON CHITIET_SUDUNGDV.MaHD = HOADON.MaHD 
WHERE  YEAR(ThoiGianBatDauSD) = '2014' AND DonGia > 50.000
GO


/* Câu 17: Liệt kê MaKH, TenKH, MaSoThue của khách hàng có địa chỉ là "Hải Châu" và
chỉ mới hát karaoke một lần duy nhất, kết quả được sắp xếp giảm dần theo TenKH (0.5
điểm) */

SELECT TenKH, KHACHHANG.DiaChi, MaSoThue, COUNT (KHACHHANG.MaKH) AS N' Số lần hát Karaoke ' 
FROM KHACHHANG
     INNER JOIN HOADON ON KHACHHANG.MaKH = HOADON.MaKH
     INNER JOIN CHITIET_SUDUNGDV ON HOADON.MaHD = CHITIET_SUDUNGDV.MaHD
WHERE DiaChi = 'Hai Chau' AND SoLuong ='1' 
GROUP BY  TenKH ,KHACHHANG.DiaChi, KHACHHANG.MaKH , MaSoThue
ORDER BY TenKH DESC
GO


/* Câu 18: Cập nhật cột TrangThaiHD trong bảng HOADON thành giá trị "Đã hết hạn" đối với
những khách hàng có địa chỉ là "Hải Châu" và có ThoiGianKetThucSD trước ngày
31/12/2015 (0.5 điểm) */

--                   -- 