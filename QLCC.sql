
USE master
GO

CREATE DATABASE QUANLICAYCANH
GO

USE QUANLICAYCANH
GO

CREATE TABLE LOAICAYCANH
(
    MaLoaiCC     varchar(7) NOT NULL  ,
    MoTaLoaiCC   varchar(50)
    
    CONSTRAINT PK_LOAICAYCANH PRIMARY KEY ( MaLoaiCC )
    
)
GO


CREATE TABLE CAYCANH
(
    MaCayCanh       varchar(7) NOT NULL,
    MoTa            varchar(50),
    MaLoaiCC        varchar(7),
    DonGiaChoThue   FLOAT
    
    CONSTRAINT PK_CAYCANH PRIMARY KEY ( MaCayCanh )

)
GO


CREATE TABLE KHACHHANG
(
     MaKH               varchar(7) NOT NULL,
     HoTenKH            varchar(50),
     DiaChiKH           varchar(50),
     SoDienThoaiKH      varchar(10)
     
     CONSTRAINT PK_KHACHHANG PRIMARY KEY ( MaKH )

)
GO


CREATE TABLE HOPDONGCHOTHUE
(
    MaHopDong             varchar(7) NOT NULL ,
    MaKH                  varchar(7) ,
    SoTienDuocGiamGia     float,
    SoTienDatCoc          float,
    TrangThaiHopDong      varchar(50)
    
    CONSTRAINT PK_HOPDONGCHOTHUE PRIMARY KEY ( MaHopDong )
)
GO


CREATE TABLE LOAIDICHVU
(
   MaLoaiDV        varchar(7) NOT NULL,
   MoTaLoaiDV      varchar(50)
   
   CONSTRAINT PK_LOAIDICHVU PRIMARY KEY ( MaLoaiDV)
)
GO

CREATE TABLE CHITIETHOPDONG
(
   MaHopDong              varchar(7) NOT NULL ,
   MaCayCanh              varchar(7) NOT NULL ,
   SoLuong                int,
   MaLoaiDV               varchar(7),
   NgayBatDauChoThue      DATE,
   NgayKetThucChoThue     DATE,
   
   CONSTRAINT PK_CHITIETHOPDONG PRIMARY KEY ( MaHopDong , MaCayCanh )
)
GO

-- TAO KHOA NGOAI --

ALTER TABLE CAYCANH 
ADD CONSTRAINT FK_CCANH_LOAICAYCANH FOREIGN KEY (MaLoaiCC) REFERENCES LOAICAYCANH(MaLoaiCC)
GO

ALTER TABLE HOPDONGCHOTHUE
ADD CONSTRAINT FK_HDCT_KHACHHANG FOREIGN KEY (MaKH) REFERENCES KHACHHANG (MaKH)
GO

ALTER TABLE CHITIETHOPDONG
ADD CONSTRAINT FK_CTHD_HOPDONGCHOTHUE FOREIGN KEY (MaHopDong) REFERENCES HOPDONGCHOTHUE ( MaHopDong)
GO

ALTER TABLE CHITIETHOPDONG 
ADD CONSTRAINT FK_CTHD_LOAIDICHVU FOREIGN KEY ( MaLoaiDV) REFERENCES LOAIDICHVU ( MaLoaiDV )
GO

ALTER TABLE CHITIETHOPDONG
ADD CONSTRAINT FK_CTDH_CAYCANH FOREIGN KEY ( MaCayCanh ) REFERENCES CAYCANH ( MaCayCanh)
GO

-- ** Bước 2: Thêm dữ liệu cho bảng --

-- bảng loại cây cảnh

INSERT INTO LOAICAYCANH VALUES ( 'LCC01', 'Chung o phong khach ')
INSERT INTO LOAICAYCANH VALUES ( 'LCC02', 'Chung o cau thang ')
INSERT INTO LOAICAYCANH VALUES ( 'LCC03', 'Chung o ngoai san ')
GO

-- bảng cây cảnh

INSERT INTO CAYCANH VALUES ( 'CC001', 'HoaHong',    'LCC01', 10000.00 )
INSERT INTO CAYCANH VALUES ( 'CC002', 'Mai Tu Quy', 'LCC01', 20000.00 )
INSERT INTO CAYCANH VALUES ( 'CC003', 'Hoa Anh Dao','LCC01', 60000.00 )
INSERT INTO CAYCANH VALUES ( 'CC004', 'Bonsai',     'LCC03', 100000.00 )
INSERT INTO CAYCANH VALUES ( 'CC005', 'Hoa Tieu Muoi', 'LCC02', 70000.00 )
GO



-- bảng khách hàng --

INSERT INTO KHACHHANG VALUES ( 'KH0001', 'Bui A',    'Lien Chieu', '09012345' )
INSERT INTO KHACHHANG VALUES ( 'KH0002', 'Bui B',    'Thanh Khe',  '09112345' )
INSERT INTO KHACHHANG VALUES ( 'KH0003', 'Nguyen A', 'Lien Chieu', '09012346')
INSERT INTO KHACHHANG VALUES ( 'KH0004', 'Nguyen B', 'Thanh Khe',  '09012346' )
INSERT INTO KHACHHANG VALUES ( 'KH0005', 'Bui A',    'Hai Chau',   '09012347' )
INSERT INTO KHACHHANG VALUES ( 'KH0006', 'Nguyen B', 'Hai Chau',   '09112347' )
GO



-- bảng hợp đồng cho thuê

INSERT INTO HOPDONGCHOTHUE VALUES ( 'HD0001', 'KH0002', 0.00, 1000000.00, 'Da ket thuc')
INSERT INTO HOPDONGCHOTHUE VALUES ( 'HD0002', 'KH0002', 0.00, 0.00, NULL )
INSERT INTO HOPDONGCHOTHUE VALUES ( 'HD0003', 'KH0001', 0.00, 0.00, 'Da ket thuc')
INSERT INTO HOPDONGCHOTHUE VALUES ( 'HD0004', 'KH0005', 0.00, 0.00, 'Dang cho thue')
INSERT INTO HOPDONGCHOTHUE VALUES ( 'HD0005', 'KH0004', 0.00, 0.00, 'Dang cho thue')
INSERT INTO HOPDONGCHOTHUE VALUES ( 'HD0006', 'KH0004', 0.00, 0.00, 'Chua bat dau')
INSERT INTO HOPDONGCHOTHUE VALUES ( 'HD0007', 'KH0002', 0.00, 0.00, 'Da ket thuc')
INSERT INTO HOPDONGCHOTHUE VALUES ( 'HD0008', 'KH0004', 0.00, 0.00, NULL)
GO

-- bảng loại dịch vụ

INSERT INTO LOAIDICHVU VALUES ( 'L01', 'Chung Tet')
INSERT INTO LOAIDICHVU VALUES ( 'L02', 'Chung nha moi')
GO

-- bảng chi tiết hợp đồng

INSERT INTO CHITIETHOPDONG VALUES ( 'HD0001', 'CC003', '100', 'L01', '2016-03-07', '2016-05-07' )
INSERT INTO CHITIETHOPDONG VALUES ( 'HD0002', 'CC001', '150', 'L01', '2015-10-11', '2015-10-22' )
INSERT INTO CHITIETHOPDONG VALUES ( 'HD0003', 'CC004', '20',  'L01', '2017-12-23', '2017-12-30' )
INSERT INTO CHITIETHOPDONG VALUES ( 'HD0004', 'CC002', '100', 'L01', '2014-01-01', '2014-01-10' )
INSERT INTO CHITIETHOPDONG VALUES ( 'HD0005', 'CC005', '10',  'L01', '2016-10-16', '2016-10-18' )
INSERT INTO CHITIETHOPDONG VALUES ( 'HD0006', 'CC001', '300', 'L01', '2017-12-11', '2017-12-22' )
INSERT INTO CHITIETHOPDONG VALUES ( 'HD0007', 'CC001', '15',  'L01', '2016-02-10', '2016-02-12' )
INSERT INTO CHITIETHOPDONG VALUES ( 'HD0007', 'CC004', '5',   'L01', '2016-02-01', '2016-01-10' )
GO

SELECT *FROM CAYCANH
GO



 ----- *** TRUY VẤN *** ------
 
 -- Câu 1: Liệt kê những cây cảnh có DonGiaChoThue nhỏ hơn 50000d
 
 SELECT MoTa FROM CAYCANH
 WHERE DonGiaChoThue < 50000
 GO
 
 -- Câu 2: Liệt kê những khách hàng có địa chỉ ở " Lien Chieu " mà có số điện thoại bắt đầu bằng 090 và những khách hàng có địa chỉ ở " Thanh Khê " mà có số điện thoại bắt đầu bằng 091
 
 SELECT * FROM KHACHHANG
 WHERE DiaChiKH = N'Lien Chieu' AND SoDienThoaiKH LIKE '090%' OR
       DiaChiKH = N'Thanh Khe'  AND SoDienThoaiKH  LIKE '091%'
 GO
 
 -- Câu 3: Liệt kê thông tin của các kháng hàng có họ ( trong họ tên ) là Bui
 
 SELECT * FROM KHACHHANG
 WHERE HoTenKH LIKE N'[Bui]%'
 GO
 
 -- Câu 4: Liệt kê thông tin của toàn bộ các cây cảnh, yêu cầu sắp xếp giảm dần theo Mota và giảm dần theo DonGiaChoTHuw
 
 SELECT *FROM CAYCANH
 ORDER BY MoTa DESC , DonGiaChoThue DESC
 GO
  
-- Câu 5: Liệt kê các hợp đồng cho thuê có trạng thai " Da ket thuc " hoặc xưa xác định ( có giá trị NULL )

SELECT * FROM HOPDONGCHOTHUE
WHERE TrangThaiHopDong = 'Da ket thuc ' OR TrangThaiHopDong IS NULL
GO

-- Câu 6: Liệt kê toàn bộ HoTenKH với yên cầu mỗi Hoten chỉ được liệt kê một lần duy nhất

SELECT DISTINCT HoTenKH FROM KHACHHANG
GO

-- Câu 7: Liệt kê MaHopDong, MaKH, TrangThaiHopDong, MaCayCanh của tấc cả các hợp đồng có trạng thái " Dang cho thue "

SELECT  HOPDONGCHOTHUE.MaHopDong , MaKH, TrangThaiHopDong , MaCayCanh, SoLuong
FROM CHITIETHOPDONG
      INNER JOIN HOPDONGCHOTHUE ON CHITIETHOPDONG.MaHopDong = HOPDONGCHOTHUE.MaHopDong
WHERE TrangThaiHopDong = 'Dang cho thue'
GO

/* Câu 8: Liệt kê MaHopDong, MaKH,TrangThaiHopDong,MaCayCanh, SoLuong của tất cả hợp đồng 
với yêu cầu những hợp đồng nào chưa có một chi tiế hợp đồng nào thì phải liệt lê thông tin của hợp đồng đó ra */

SELECT  HOPDONGCHOTHUE.MaHopDong , MaKH, TrangThaiHopDong , MaCayCanh, SoLuong
FROM    CHITIETHOPDONG
        FULL OUTER JOIN HOPDONGCHOTHUE ON CHITIETHOPDONG.MaHopDong = HOPDONGCHOTHUE.MaHopDong
      
GO

/* Câu 9: Liệt kê thông tin của các khách hàng ở địa chỉ là " Hai Chau " đã từng thuê cây cảnh thuộc loại cây cảnh 
 có mô tả là " Chung o phong khach " hoặc các khách hàng từng thuê cây cảnh với thời gian bắt đầu thuê là "11-12-2017" */
 
 SELECT KHACHHANG.MaKH, HoTenKH, HOPDONGCHOTHUE.MaHopDong, DiaChiKH, MotaLoaiCC,NgayBatDauChoThue
 FROM KHACHHANG
      INNER JOIN HOPDONGCHOTHUE ON KHACHHANG.MaKH = HOPDONGCHOTHUE.MaKH
      INNER JOIN CHITIETHOPDONG ON HOPDONGCHOTHUE.MaHopDong = CHITIETHOPDONG.MaHopDong
      INNER JOIN CAYCANH ON CHITIETHOPDONG.MaCayCanh = CAYCANH.MaCayCanh 
      INNER JOIN LOAICAYCANH ON CAYCANH.MaLoaiCC = LOAICAYCANH.MaLoaiCC
 WHERE DiaChiKH IN ('Hai Chau') AND MoTaLoaiCC = 'Chung o phong khach' OR
       NgayBatDauChoThue = '2017-12-11'      
 GROUP BY KHACHHANG.MaKH, HoTenKH, HOPDONGCHOTHUE.MaHopDong, DiaChiKH, MotaLoaiCC,NgayBatDauChoThue
 GO
 
   
-- Câu 10: Liệt kê thông tin của các khách hàng chưa từng thuê cây một lần nào

SELECT KHACHHANG.MaKH, HoTenKH, HOPDONGCHOTHUE.MaHopDong, TrangThaiHopDong
FROM   KHACHHANG
       FULL OUTER JOIN HOPDONGCHOTHUE ON KHACHHANG.MaKH = HOPDONGCHOTHUE.MaKH
WHERE TrangThaiHopDong IS NULL
GO

-- Câu 11: Liệt kê thông tin của những khách hàng đã từng thuê cây cảnh vào năm 2016 nhưng chưa từng thuê vào năm 2017

SELECT KHACHHANG.MaKH , HoTenKH, DiaChiKH, CHITIETHOPDONG.MaHopDong ,NgayBatDauChoThue
FROM KHACHHANG
     INNER JOIN HOPDONGCHOTHUE ON KHACHHANG.MaKH = HOPDONGCHOTHUE.MaKH
     INNER JOIN CHITIETHOPDONG ON HOPDONGCHOTHUE.MaHopDong = CHITIETHOPDONG.MaHopDong
WHERE KHACHHANG.MaKH IN (SELECT MaKH FROM HOPDONGCHOTHUE WHERE YEAR(NgayBatDauChoThue) = '2016')
  AND KHACHHANG.MaKH NOT IN (SELECT MaKH FROM HOPDONGCHOTHUE WHERE YEAR(NgayBatDauChoThue) = '2017')
GO

      
/* Câu 12: Hiển thị MaCayCanh, MaLoaiCC của những cây cảnh từng được thuê với số lượng lớn hơn 10 trong một hợp đồng bất kỳ nào đó. 
 Kết quả hiển thị cần phải xóa bớt dữ liệu bị trùng lặp.*/
 
 SELECT CAYCANH.MaCayCanh, CAYCANH.MaLoaiCC  -- DICTINCT -- 
 FROM CAYCANH
      INNER JOIN CHITIETHOPDONG ON CAYCANH.MaCayCanh = CHITIETHOPDONG.MaCayCanh
 WHERE SoLuong > 10
 GROUP BY CAYCANH.MaCayCanh, CAYCANH.MaLoaiCC
 GO
 
 
/* Câu 13: Đếm tổng số khách hàng đã thuê cây cảnh trong năm 2016 với yêu cầu chỉ thực hiện tính đối với những khách hàng 
 đã từng thuê ít nhất 2 lần ( có từ 2 hợp đồng khác nhau với công ty trở lên) vào năm 2016 */


SELECT HOPDONGCHOTHUE.MaKH, HOPDONGCHOTHUE.MaHopDong , COUNT(HOPDONGCHOTHUE.MaKH)  AS N'Số lượng KH'
FROM   HOPDONGCHOTHUE
       INNER JOIN CHITIETHOPDONG ON HOPDONGCHOTHUE.MaHopDong = CHITIETHOPDONG.MaHopDong
WHERE HOPDONGCHOTHUE.MaHopDong >= 2 AND YEAR(NgayBatDauChoThue) = '2016'
GROUP BY HOPDONGCHOTHUE.MaKH, HOPDONGCHOTHUE.MaHopDong
GO

/* Câu 14: Liệt kê những khách hàng chỉ mới thuê một lần duy nhất ( Chỉ có 1 hợp đồng duy nhất đối với công ty) 
 và chỉ thuê 1 nhóm cây cảnh duy nhất trong năm 2017, kết quả được sách xếp giảm dần theo MaKhachHang */
 
 SELECT KHACHHANG.MaKH, HoTenKH
 FROM KHACHHANG
      INNER JOIN HOPDONGCHOTHUE ON KHACHHANG.MaKH = HOPDONGCHOTHUE.MaKH
      INNER JOIN CHITIETHOPDONG ON HOPDONGCHOTHUE.MaHopDong = CHITIETHOPDONG.MaHopDong
      
 WHERE HOPDONGCHOTHUE.MaHopDong IN ( SELECT HOPDONGCHOTHUE.MaHopDong FROM HOPDONGCHOTHUE 
       INNER JOIN CHITIETHOPDONG ON HOPDONGCHOTHUE.MaHopDong = CHITIETHOPDONG.MaHopDong
        
 WHERE YEAR(NgayBatDauChoThue) = '2017'
 GROUP BY HOPDONGCHOTHUE.MaHopDong
 
 HAVING   COUNT (HOPDONGCHOTHUE.MaHopDong) = 1 AND COUNT (CHITIETHOPDONG.MaLoaiDV) = 1 )  
 ORDER BY KHACHHANG.MaKH DESC
 GO
 


/* Câu 15: Cập nhật TrangThaiHopDong trong bảng HOPDONGCHOTHUE thành giá trị 'Bi huy' đối với những hợp đồng có TrangThaiHopDong 
la 'Chua bat dau' và có SoTienDatCoc la 0 VND */

UPDATE HOPDONGCHOTHUE
SET TrangThaiHopDong = 'Bi huy'
WHERE TrangThaiHopDong = 'Chua Bat Dau' AND SoTienDatCoc = 0 ;
GO

SELECT * FROM HOPDONGCHOTHUE
GO

-- Câu 16: Xóa những loại dịch vụ chưa từng được sử dụng trong bất kỳ một hợp đồng nào.

DELETE FROM LOAIDICHVU
WHERE NOT EXISTS ( SELECT MaLoaiDV FROM CHITIETHOPDONG
                   WHERE MaLoaiDV = LOAIDICHVU.MaLoaiDV )
GO

SELECT * FROM LOAIDICHVU
GO


-- Câu 17: Cho biết thông tin khách hàng đã sử dụng dich vụ 'Chung Tet'

SELECT DISTINCT KHACHHANG.MaKH, HoTenKH, DiaChiKH, MoTaLoaiDV
FROM KHACHHANG
     INNER JOIN HOPDONGCHOTHUE ON KHACHHANG.MaKH = HOPDONGCHOTHUE.MaKH
     INNER JOIN CHITIETHOPDONG ON HOPDONGCHOTHUE.MaHopDong = CHITIETHOPDONG.MaHopDong
     INNER JOIN LOAIDICHVU ON CHITIETHOPDONG.MaLoaiDV = LOAIDICHVU.MaLoaiDV
WHERE MoTaLoaiDV = 'Chung Tet'
GO

-- Câu 18: Hiển thị chi tiết thông tin của hợp đồng mà có đơn giá cho thuê dưới 50.000 và có khách hàng ở 'Hai Chau' thuê

SELECT CHITIETHOPDONG.MaHopDong, CHITIETHOPDONG.MaCayCanh, SoLuong, MaLoaiDV, NgayBatDauChoThue, NgayKetThucChoThue
FROM CAYCANH
     INNER JOIN CHITIETHOPDONG ON CAYCANH.MaCayCanh = CHITIETHOPDONG.MaCayCanh
     INNER JOIN HOPDONGCHOTHUE ON CHITIETHOPDONG.MaHopDong = HOPDONGCHOTHUE.MaHopDong
     INNER JOIN KHACHHANG ON HOPDONGCHOTHUE.MaKH = KHACHHANG.MaKH

WHERE DonGiaChoThue < 50000  AND (DiaChiKH = 'Hai Chau') 
GO

-- Câu 19: Tính tổng số tiền được giảm giá của tất cả hợp đồng

SELECT SUM(SoTienDuocGiamGia) AS N'Tổng tiền được giảm giá'
FROM HOPDONGCHOTHUE 
GO

-- Câu 20: Thống kê khách hàng và số ngày thuê cây của khách hàng

SELECT KHACHHANG.MaKH, HoTenKH, SUM( DAY(NgayKetThucChoThue) - DAY(NgayBatDauChoThue)) AS N'Tổng ngày thuê cây cảnh'
FROM KHACHHANG
     INNER JOIN HOPDONGCHOTHUE ON KHACHHANG.MaKH = HOPDONGCHOTHUE.MaKH
     INNER JOIN CHITIETHOPDONG ON HOPDONGCHOTHUE.MaHopDong = CHITIETHOPDONG.MaHopDong
GROUP BY KHACHHANG.MaKH , HoTenKH
GO

-- Câu 21: Mã loại cây cảnh nào được thuê nhiều nhất?

SELECT TOP 1 MaCayCanh
FROM CHITIETHOPDONG

ORDER BY SoLuong DESC
GO

-- Câu 22: Thống kê số lượng hợp đồng của mỗi khách hàng. Khách hàng chưa bao giờ thuê cũng được thống kê.

SELECT KHACHHANG.MaKH , COUNT(MaHopDong) AS N'Số lượng HĐ'
FROM   KHACHHANG
       FULL OUTER JOIN HOPDONGCHOTHUE ON KHACHHANG.MaKH = HOPDONGCHOTHUE.MaKH
GROUP BY KHACHHANG.MaKH
GO

-- Câu 23: Cho biết 2 khách hàng có số lần thuê cây ít nhất

SELECT TOP 2 KHACHHANG.MaKH ,COUNT(MaHopDong) AS Số_lượng_HĐ
FROM   KHACHHANG
       FULL OUTER JOIN HOPDONGCHOTHUE ON KHACHHANG.MaKH = HOPDONGCHOTHUE.MaKH
GROUP BY KHACHHANG.MaKH
ORDER BY Số_lượng_HĐ
GO

