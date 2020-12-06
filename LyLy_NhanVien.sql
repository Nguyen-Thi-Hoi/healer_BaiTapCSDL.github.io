create database QLNhanVien
go
use QLNhanVien
go

--Tạo các bảng
create table PHONGBAN
(
	MaPB varchar(20),
	TenPB nvarchar(255),
	TruongPB varchar(20),
	NgayNhanChuc date,
	constraint pk_PHONGBAN PRIMARY KEY(MaPB)
)

create table DIADIEM
(
	MaPB varchar(20),
	DiaDiem varchar(20)
	constraint pk_DIADIEM primary key(MaPB, DiaDiem)
)

create table NHANVIEN
(
	MaNV varchar(20),
	TenNV nvarchar(255),
	HoNV nvarchar(255),
	NgaySinh date,
	DiaChi nvarchar(255),
	Phai nvarchar(255),
	Luong money,
	Ma_NQLi varchar(20),
	Phg varchar(20),
	constraint pk_NHANVIEN primary key(MaNV)
)

create table DEAN
(
	MaDA varchar(20),
	TenDA nvarchar(255),
	Phong varchar(20),
	DiaDiemDA Varchar(20),
	constraint pk_DEAN primary key(MaDA)

)

create table THANNHAN
(
	MaNV varchar(20),
	TenTN nvarchar(255),
	Phai nvarchar(255),
	NgaySinh date,
	QuanHe nvarchar(255)
	constraint pk_THANNHAN primary key(MaNV, TenTN)
)

create table PHANCONG
(
	MaNV varchar(20),
	SoDA varchar(20),
	ThoiGianBatDau date,
	ThoiGian int,
	constraint pk_PHANCONG primary key(MaNV, SoDA)
)



--Tạo khóa ngoại
--	ALTER TALBE Tên_bảng_thêm_khóa_ngoại
--	ADD CONSTRAINT FK_Tên_khóa_ngoại
--          FOREIGN KEY (thuộc tính làm khóa ngoại)
 --         REFERENCES Bảng_Khóa_chính ( thuộc tính khóa chính);
 alter table DIADIEM 
 add constraint fk_DIADIEM_PHONGBAN foreign key (MaPB) references PHONGBAN (MaPB)

 alter table NHANVIEN 
 add constraint fk_NHANVIEN_PHONGBAN foreign key (Phg) references PHONGBAN (MaPB)

 alter table PHONGBAN 
 add constraint fk_PHONGBAN_NHANVIEN foreign key (TruongPB) references NHANVIEN (MaNV)

 alter table THANNHAN 
 add constraint fk_THANNHAN_NHANVIEN foreign key (MaNV) references NHANVIEN (MaNV)

 alter table PHANCONG 
 add constraint fk_PHANCONG_NHANVIEN foreign key (MaNV) references NHANVIEN (MaNV)

 alter table PHANCONG
 add constraint fk_PHANCONG_DEAN foreign key (SoDA) references DEAN (MaDA)

 alter table NHANVIEN 
 add constraint fk_NHANVIEN_NHANVIEN foreign key (Ma_NQLi) references NHANVIEN (MaNV)

 --Nhập dữ liệu cho bảng.
 insert into NHANVIEN (MaNV, TenNV, HoNV, NgaySinh, DiaChi, Phai, Luong, Ma_NQLi, Phg)
 values ('NV01', 'Tung', 'Nguyen', '08/20/2000', 'Hai Chau Da Nang', 'Nam', '2000000', 'NV02', '01')

 insert into NHANVIEN (MaNV, TenNV, HoNV, NgaySinh, DiaChi, Phai, Luong, Ma_NQLi, Phg)
 values ('NV02', 'Ly', 'Huynh', '10/24/2000', 'Nui Thanh Quang Nam', 'Nu', '5000000', 'NV01', '03')

 insert into NHANVIEN (MaNV, TenNV, HoNV, NgaySinh, DiaChi, Phai, Luong, Ma_NQLi, Phg)
 values ('NV03', 'Trung', 'Huynh', '10/30/2000', 'Ngu Hanh Son Da Nang', 'Nam', '2500000', 'NV02', '01')

 insert into NHANVIEN (MaNV, TenNV, HoNV, NgaySinh, DiaChi, Phai, Luong, Ma_NQLi, Phg)
 values ('NV04', 'Trieu', 'Pham', '10/30/2000', 'Tam ky Quang Nam', 'Nam', '1900000', 'NV03', '04')

 insert into NHANVIEN (MaNV, TenNV, HoNV, NgaySinh, DiaChi, Phai, Luong, Ma_NQLi, Phg)
 values ('NV05', 'Thao', 'Tran', '04/20/2000', 'Hai Chau Da Nang', 'Nu', '20000000', 'NV01', '02')

 insert into NHANVIEN (MaNV, TenNV, HoNV, NgaySinh, DiaChi, Phai, Luong, Ma_NQLi, Phg)
 values ('NV06', 'Luan', 'Dinh', '08/20/2000', 'Binh Dinh', 'Nam', '20000000', 'NV03', '02')

 insert into NHANVIEN (MaNV, TenNV, HoNV, NgaySinh, DiaChi, Phai, Luong, Ma_NQLi, Phg)
 values ('NV07', 'Tuan', 'Nguyen', '02/28/2000', 'Quang Nam', 'Nam', '30000000', 'NV01', '04')

 insert into NHANVIEN (MaNV, TenNV, HoNV, NgaySinh, DiaChi, Phai, Luong, Ma_NQLi, Phg)
 values ('NV08', 'Thuong', 'Hua', '10/24/2000', 'Dai Loc Quang Nam', 'Nam', '10000000', 'NV05', '03')

 insert into NHANVIEN (MaNV, TenNV, HoNV, NgaySinh, DiaChi, Phai, Luong, Ma_NQLi, Phg)
 values ('NV09', 'Linh', 'Pham', '07/28/2000', 'Nui Thanh Quang Nam', 'Nu', '15000000', 'NV02', '03')

 insert into NHANVIEN (MaNV, TenNV, HoNV, NgaySinh, DiaChi, Phai, Luong, Ma_NQLi, Phg)
 values ('NV01', 'Huyen', 'Nguyen', '07/20/2000', 'Tam Xuan Quang Nam', 'Nu', '2200000', 'NV03', '04')

-- Nhập dữ liệu cho bảng phòng ban
 insert into PHONGBAN (MaPB, TenPB, TruongPB, NgayNhanChuc)
 VALUES ('01', N'Quan li', 'NV02', '01/01/2020')

  insert into PHONGBAN (MaPB, TenPB, TruongPB, NgayNhanChuc)
 VALUES ('02', N'To Chuc', 'NV01', '01/02/2020')

  insert into PHONGBAN (MaPB, TenPB, TruongPB, NgayNhanChuc)
 VALUES ('03', N'Dieu Hanh', 'NV03', '01/05/2020')

  insert into PHONGBAN (MaPB, TenPB, TruongPB, NgayNhanChuc)
 VALUES ('04', N'Nghien Cuu', 'NV04', '01/01/2020')

 --Nhập dữ liệu cho bảng dịa điểm 
 insert into DIADIEM (MaPB, DiaDiem)
 values ('01', 'Vung Tau')

 insert into DIADIEM (MaPB, DiaDiem)
 values ('02', 'Ho Chi Minh')

 insert into DIADIEM (MaPB, DiaDiem)
 values ('03', 'Nha Trang')

 insert into DIADIEM (MaPB, DiaDiem)
 values ('04', 'Ha Noi')
 
 --Nhập dữ liệu cho bảng đề án
 insert into DEAN (MaDA, TenDA, Phong, DiaDiemDA)
 values ('DA01', 'San pham X', '02', 'Nha Trang')

 insert into DEAN (MaDA, TenDA, Phong, DiaDiemDA)
 values ('DA02', 'San pham Y', '01', 'Ho Chi Minh')

  insert into DEAN (MaDA, TenDA, Phong, DiaDiemDA)
 values ('DA03', 'San pham Z', '02', 'Ha Noi')

  insert into DEAN (MaDA, TenDA, Phong, DiaDiemDA)
 values ('DA04', 'Tin hoc hoa', '01', 'Bien Hoa')

 --Nhập dữ liệu cho bảng phân công
 insert into PHANCONG (MaNV, SoDA, ThoiGianBatDau, ThoiGian)
 values ('NV01', 'DA01', '01/20/2019', '10')

 insert into PHANCONG (MaNV, SoDA, ThoiGianBatDau, ThoiGian)
 values ('NV01', 'DA02', '01/20/2019', '15')

 insert into PHANCONG (MaNV, SoDA, ThoiGianBatDau, ThoiGian)
 values ('NV02', 'DA03', '02/23/2018', '7')

 insert into PHANCONG (MaNV, SoDA, ThoiGianBatDau, ThoiGian)
 values ('NV04', 'DA04', '01/20/2017', '20')

 insert into PHANCONG (MaNV, SoDA, ThoiGianBatDau, ThoiGian)
 values ('NV05', 'DA01', '09/20/2019', '15')

 insert into PHANCONG (MaNV, SoDA, ThoiGianBatDau, ThoiGian)
 values ('NV03', 'DA04', '03/20/2019', '30')

 --Nhập dữ liệu cho bảng thân nhân
 insert into THANNHAN (MaNV, TenTN, Phai, NgaySinh, QuanHe)
 VALUES ('NV01', 'Ngoc Phi', 'Nu', '10/25/1973', 'Me')

 insert into THANNHAN (MaNV, TenTN, Phai, NgaySinh, QuanHe)
 VALUES ('NV02', 'Hue', 'Nu', '10/25/1975', 'Me')

 insert into THANNHAN (MaNV, TenTN, Phai, NgaySinh, QuanHe)
 VALUES ('NV03', 'Duc', 'Nam', '09/05/1995', 'Anh')

 insert into THANNHAN (MaNV, TenTN, Phai, NgaySinh, QuanHe)
 VALUES ('NV08', 'Toan', 'Nam', '07/15/1975', 'Cha')

 --Truy vấn
 --2.Với những đề án ở ‘Ha Noi’, cho biết mã đề án, mã phòng ban chủ trì đề án, họ tên trưởng phòng cùng với 
 --ngày sinh và địa chỉ của người ấy.
 select MaDA, MaPB, TruongPB, HoNV, TenNV, NgaySinh, DiaChi
 from DEAN
 inner join PHANCONG on DEAN.MaDA = PHANCONG.SoDA
 inner join NHANVIEN on PHANCONG.MaNV = NHANVIEN.MaNV
 inner join PHONGBAN on NHANVIEN.MaNV = PHONGBAN.TruongPB
 where DiaDiemDA like '%Ha Noi%'
 go

 --3. Tìm họ tên của nhân viên phòng số 5 có tham gia vào đề án “Sản phẩm X” với số giờ làm việc trên 10 giờ.
 SELECT HoNV, TenNV, ThoiGian
FROM DEAN 
INNER JOIN PHANCONG ON PHANCONG.SoDA = DEAN.MaDA
INNER JOIN NHANVIEN ON NHANVIEN.MaNV = PHANCONG.MaNV
WHERE Phg = '05' AND TenDA = 'San pham X' 
AND THOIGIAN > 10


 --4. Tìm họ tên của những nhân viên được “Tung” phụ trách trực tiếp
 
 select NV1.HoNV, NV1.TenNV, NV1.Ma_NQLi, NV2.HoNV as HoNQL, NV2.TenNV as TenNQL, NV2.MaNV 
 from NHANVIEN NV1, NHANVIEN NV2
 where NV1.Ma_NQLi = NV2.MaNV and
 NV2.TenNV like '%Tung'

 --5. Cho biết các mã đề án có:
--Nhân viên với họ là ‘Nguyen’ tham gia hoặc,
--Trưởng phòng chủ trì đề án đó với họ là ‘Nguyen’

SELECT SoDA
FROM PHANCONG INNER JOIN NHANVIEN ON NHANVIEN.MaNV = PHANCONG.MaNV
WHERE HoNV = 'Nguyen'
UNION
SELECT MADA 
FROM DEAN INNER JOIN PHONGBAN ON PHONGBAN.MaPB = DEAN.Phong
INNER JOIN dbo.NHANVIEN ON NHANVIEN.MaNV = PHONGBAN.TruongPB
WHERE HoNV = 'Nguyen'

--6.Tìm nhân viên có người thân cùng tên và cùng giới tính
SELECT NHANVIEN.MaNV
FROM NHANVIEN INNER JOIN THANNHAN ON THANNHAN.MaNV = NHANVIEN.MANV
WHERE TENNV = TENTN
INTERSECT
SELECT DISTINCT NHANVIEN.MANV 
FROM NHANVIEN 
INNER JOIN dbo.THANNHAN ON THANNHAN.MaNV = NHANVIEN.MaNV
WHERE THANNHAN.Phai = NHANVIEN.Phai

--7.Tìm những nhân viên không có thân nhân nào
SELECT *
FROM NHANVIEN
WHERE MaNV NOT in (SELECT MaNV FROM THANNHAN )

--c2
select MaNV
from NHANVIEN
except
select MaNV
from THANNHAN

--8.Tìm những nhân viên có lương lớn hơn lương của ít nhất một nhân viên phòng 4
SELECT * 
FROM NHANVIEN
WHERE LUONG > (SELECT MIN(Luong) FROM NHANVIEN
WHERE PHG = '04')

--9.Tìm những nhân viên có lương lớn hơn lương của tất cả nhân viên phòng 4
SELECT * 
FROM NHANVIEN
WHERE Luong > (SELECT SUM(Luong) FROM NHANVIEN
WHERE PHG = '4')

--10.Tìm những trưởng phòng có tối thiểu một thân nhân
SELECT * 
FROM NHANVIEN
WHERE MaNV IN (SELECT TruongPB FROM PHONGBAN)
AND MaNV IN (SELECT MaNV FROM THANNHAN)

--c2
select TruongPB 
from PHONGBAN join thannhan on  PHONGBAN.TruongPB = THANNHAN.MaNV
group by TruongPB having count(TruongPB) >=1 

--11.Tìm tên các nhân viên được phân công làm tất cả các đề án
SELECT * 
FROM NHANVIEN
WHERE MANV IN(SELECT MaNV FROM PHANCONG A
				GROUP BY A.MaNV
				HAVING COUNT(A.SoDA)=(SELECT COUNT(DEAN.MaDA) FROM DEAN))

--12. Tìm tổng lương, lương cao nhất, lương thấp nhất và lương trung bình của các nhân viên
SELECT SUM(Luong) AS Luong, MAX(Luong) AS caoNhat,MIN(Luong) AS thapNhat, AVG(Luong) AS TB 
FROM NHANVIEN 

--13.Cho biết số lượng nhân viên và lương trung bình của phòng ‘Nghien cuu’
SELECT COUNT(MaNV) AS N'Số Nhân Viên',AVG(Luong)AS N'Lương TB' 
FROM  NHANVIEN INNER JOIN PHONGBAN ON PHONGBAN.MaPB = NHANVIEN.Phg
WHERE TenPB = N'Nghien Cuu'

--14.Cho biết số lượng nhân viên của từng phòng ban. Xuất ra tên phòng và số lượng.
SELECT Phg, COUNT(MaNV) AS N'Số lượng nhân viên'
FROM NHANVIEN 
GROUP BY Phg

--15.Với mỗi nhân viên cho biết mã số, họ tên, số lượng đề án và tổng thời gian mà họ tham gia
select NHANVIEN.MaNV, TenNV, HoNV, count(SoDA) as N'Số lượng đề án', sum(ThoiGian) as N'Tổng thời gian'
from NHANVIEN full join PHANCONG on NHANVIEN.MaNV = PHANCONG.MaNV
group by NHANVIEN.MaNV, HoNV, TenNV

--16.Cho biết những nhân viên tham gia từ 2 đề án trở lên
SELECT NHANVIEN.MaNV, TenNV, HoNV, count(SoDA) as N'số đề án'
from NHANVIEN inner join PHANCONG on NHANVIEN.MaNV = PHANCONG.MaNV
group by NHANVIEN.MaNV, TenNV, HoNV
having count(SoDA) >=2

--17.Cho biết những phòng ban (TENPHG) có lương trung bình của các nhân viên lớn lơn 20000
select TenPB, avg(Luong) as N'Lương TB'
from PHONGBAN inner join NHANVIEN on PHONGBAN.MaPB = NHANVIEN.Phg
group by TenPB
having avg(Luong) > 20000

--18. Tìm những phòng ban có lương trung bình cao nhất
SELECT TOP 1 TenPB, AVG(Luong) AS N'Lương Tb'
FROM NHANVIEN INNER JOIN PHONGBAN ON PHONGBAN.MaPB = NHANVIEN.Phg  
GROUP BY TenPB 
ORDER BY  AVG(Luong) DESC

--19.Tìm 3 nhân viên có lương cao nhất
select top 3 TenNV
from NHANVIEN
order by Luong desc

--20.Tìm mã và tên các nhân viên làm việc tại phòng ‘Nghien cuu’
select MaNV, TenNV
from NHANVIEN inner join PHONGBAN on NHANVIEN.Phg = PHONGBAN.MaPB
where TenPB = N'Nghien Cuu'

--21. Tìm họ tên các nhân viên và tên các đề án nhân viên tham gia nếu có
SELECT HONV + ' ' + TENNV AS 'HoTen', TenDA 
FROM NHANVIEN 
LEFT JOIN PHANCONG ON PHANCONG.MaNV = NHANVIEN.MaNV
LEFT JOIN DEAN ON DEAN.MADA = PHANCONG.SODA

--22.Cho biết họ tên các nhân viên và tuổi về hưu của họ (nam 60 tuổi, nữ 55 tuổi)
SELECT HONV + ' ' + TENNV AS 'HoTen', CASE Phai
WHEN 'Nam' THEN  N'60 Tuổi' 
WHEN 'Nu' THEN N'55 Tuổi'
END AS TuoiVeHuu
FROM dbo.NHANVIEN 

--23.Cho biết họ tên các nhân viên và năm về hưu
SELECT HONV + ' ' + TENNV AS 'HoTen',  CASE Phai
WHEN 'Nam' THEN DATEADD(YEAR,60,NgaySinh)
WHEN 'Nu' THEN DATEADD(YEAR,55,NgaySinh)
END AS N'Năm về hưu'
FROM NHANVIEN 

--24.Xóa đi những nhân viên ở phòng ‘Nghien cuu’
DELETE FROM NHANVIEN 
WHERE Phg IN (SELECT MaPB FROM PHONGBAN WHERE TenPB = N'Nghien Cuu' )

--25. Với đề án có mã số 10, hãy thay đổi nơi thực hiện đề án thành ‘Vung Tau’ và phòng ban phụ trách là phòng 5
UPDATE DEAN 
SET DiaDiemDA = N'Vũng Tàu' , Phong = '05' 
WHERE MADA = 'DA010'
SELECT * FROM dbo.DEAN

--26.Tạo khung nhìn hiển thị danh sách họ tên các nhân viên ở Đà Nẵng mà tham gia ít nhất một đề án trong năm 2017.

CREATE VIEW Cau26 AS
SELECT DISTINCT HONV + ' ' + TENNV AS 'HoTen' FROM dbo.NHANVIEN INNER JOIN dbo.PHANCONG ON PHANCONG.MaNV = NHANVIEN.MANV 
WHERE DiaChi LIKE '%Da Nang' AND YEAR(ThoiGianBatDau) = 2017

select *
from Cau26
go

--27.Tạo khung nhìn hiển thị các đề án vừa có nhân viên nam vừa có nhân viên nữ tham gia do phòng 'Nghien cuu' chủ trì trong năm ba
--tháng cuối năm 2019.



--28. Với mỗi phòng ban cho biết tên phòng ban và địa điểm phòng ban
select TenPB, DiaDiem
from PHONGBAN
inner join DIADIEM on PHONGBAN.MaPB = DIADIEM.MaPB

--29. yc1. Tìm tên những người trưởng phòng của từng phòng ban
select MaPB, TenPB, TruongPB, HoNV +' '+ TenNV as N'Họ tên trưởng phòng' 
from PHONGBAN inner join NHANVIEN on PHONGBAN.TruongPB = NHANVIEN.MaNV

--yc2 Cho biết họ tên và địa điểm của các nhân viên sống ở Quảng Nam, sắp xế tăng dần theo tên
select HoNV, TenNV, DiaChi
from NHANVIEN
where DiaChi like '%Quang Nam'
order by TenNV asc

--30 yc1. cho biết họ tên và mức lương các nhân viên trên 20 tuổi, sắp xếp tăng dần theo lươngg
select HoNV, TenNV, Luong, year(getdate())-Year(NgaySinh) as N'Tuổi'
from NHANVIEN
where year(getdate())-Year(NgaySinh) >= 20
order by Luong asc

--yc2. cho biết MaNV có người thân hay có tham gia đề án
select MaNV
from THANNHAN
union
select MaNV
from PHANCONG

-- yc3. cho biết những nhân viên có mức lương trên 25000 ở phòng số 4 hoặc có mức lương trên 30000 ở phòng số 3
select *
from NHANVIEN
where (Luong > 25000 and Phg = '04') or (Luong > 30000 and Phg = '03')
