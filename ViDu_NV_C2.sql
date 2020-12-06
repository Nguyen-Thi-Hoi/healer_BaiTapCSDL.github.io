create database ViDu
go
use Vidu
go
create table NhanVien(
   MaNV nvarchar(50) not null,
   TenNV nvarchar(50),
   HoNV nvarchar(50),
   NgaySinh datetime,
   DiaChi nvarchar(50),
   Phai nvarchar(50),
   Luong nvarchar(50),
   MaNQL nvarchar(50) not null,
   Phong nvarchar(50),
   primary key (MaNV),
   foreign key (MaNQL) references NhanVien(MaNV)
)
create table PhongBan(
   MaPhong nvarchar(50) not null,
   TenPhong nvarchar(50),
   TruongPhong nvarchar(50) not null,
   NGNhanChuc nvarchar(50),
   primary key (MaPhong),
   foreign key (TruongPhong) references NhanVien(MaNV)
)
create table DiaDiem_Phong(
   MaPhong nvarchar(50) not null,
   DiaDiem nvarchar(50) not null,
   primary key (MaPhong,DiaDiem),
   foreign key (MaPhong) references PhongBan(MaPhong)
)
create table ThanNhan(
   Ma_NVien nvarchar(50) not null,
   TenTN nvarchar(50),
   Phai nvarchar(50),
   NgaySinh datetime,
   QuanHe nvarchar(50),
   primary key (Ma_NVien,TenTN),
   foreign key (Ma_NVien) references NhanVien(MaNV)
)
create table DeAn(
   TenDA nvarchar(50),
   MaDA nvarchar(50) not null,
   DiaDiem_DA nvarchar(50) not null,
   Phong nvarchar(50) not null,
   primary key (MaDA),
   foreign key (Phong) references PhongBan(MaPhong)
)
create table PhanCong(
   Ma_NVien nvarchar(50) not null,
   SoDA nvarchar(50) not null,
   ThoiGian datetime,
   primary key (Ma_NVien,SoDA),
   foreign key (Ma_NVien) references NhanVien(MaNV),
   foreign key (SoDA) references DeAn(MaDA)
)

insert into NhanVien
values ('NV001',N'A',N'Nguyễn','2000/01/02',N'Liên Chiểu',N'Nam',N'10 triệu',N'NV001',N'Phòng 01');
insert into NhanVien
values ('NV002',N'B',N'Nguyễn','2000/02/03',N'Thanh Khê',N'Nam',N'8 triệu',N'NV002',N'Phòng 02');
insert into NhanVien
values ('NV003',N'C',N'Trần','2000/03/04',N'Hải Châu',N'Nữ',N'7 triệu',N'NV003',N'Phòng 03');
insert into NhanVien
values ('NV004',N'D',N'Lê','2000/04/05',N'Liên Chiểu',N'Nữ',N'5 triệu',N'NV004',N'Phòng 04');
insert into NhanVien
values ('NV005',N'M',N'Lê','2000/06/07',N'Liên Chiểu',N'Nữ',N'5 triệu',N'NV005',N'Phòng 05');
select * from NhanVien

insert into PhongBan
values ('P001',N'Kế Toán',N'NV001',N'A');
insert into PhongBan
values ('P002',N'Tài Chính',N'NV002',N'B');
insert into PhongBan
values ('P003',N'Nhân Sự',N'NV003',N'C');
insert into PhongBan
values ('P004',N'Bảo Vệ',N'NV004',N'D');
select * from PhongBan

insert into DiaDiem_Phong
values ('P001',N'X');
insert into DiaDiem_Phong
values ('P002',N'Y');
insert into DiaDiem_Phong
values ('P003',N'Z');
insert into DiaDiem_Phong
values ('P004',N'Q');
select * from DiaDiem_Phong

insert into ThanNhan
values ('NV001',N'A1',N'Nam','1969/01/03',N'Ba');
insert into ThanNhan
values ('NV002',N'A2',N'Nam','1969/02/04',N'Ba');
insert into ThanNhan
values ('NV003',N'A3',N'Nữ','1969/04/06',N'Mẹ');
insert into ThanNhan
values ('NV004',N'A4',N'Nam','1969/07/09',N'Ba');
select * from ThanNhan

insert into DeAn
values (N'Toán',N'DA001',N'X',N'P001');
insert into DeAn
values (N'Lý',N'DA002',N'Y',N'P002');
insert into DeAn
values (N'Hóa',N'DA003',N'Z',N'P003');
insert into DeAn
values (N'Anh',N'DA004',N'Q',N'P004');
select * from DeAn

insert into PhanCong
values ('NV001',N'DA001','2020/01/02');
insert into PhanCong
values ('NV002',N'DA002','2020/03/04');
insert into PhanCong
values ('NV003',N'DA003','2020/05/06');
insert into PhanCong
values ('NV004',N'DA004','2020/07/08');
select * from PhanCong


-- câu 4:Cho biết mã nhân viên có tham gia đề án hoặc có thân nhân
SELECT ThanNhan.Ma_NVien  from ThanNhan
JOIN PhanCong ON ThanNhan.Ma_NVien = PhanCong.Ma_NVien 
JOIN DeAn ON PhanCong.SoDA = DeAn.MaDA 
UNION 
SELECT ThanNhan.Ma_NVien  from ThanNhan 
JOIN PhanCong ON ThanNhan.Ma_NVien = PhanCong.Ma_NVien 
JOIN DeAn ON PhanCong.SoDA = DeAn.MaDA 

--câu 5:Cho biết mã nhân viên có người thân và có tham gia đề án
SELECT Ma_NVien FROM PhanCong 
WHERE Ma_NVien IN ( SELECT Ma_NVien FROM ThanNhan) 

--câu 6:Cho biết mã nhân viên không có thân nhân nào
SELECT NhanVien.MaNV FROM NhanVien
EXCEPT
SELECT NhanVien.MaNV FROM NhanVien
FULL OUTER JOIN ThanNhan ON ThanNhan.MA_NVIEN = NhanVien.MaNV
WHERE TenTN IS NOT NULL
