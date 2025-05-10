CREATE DATABASE QLTV
ON PRIMARY (NAME=QLTV_DATA, FILENAME = 'D:\QLTV\QLTV_data.mdf')
LOG ON (NAME = QLBH_LOG, FILENAME='D:\QLTV\QLTV_Log.ldf')
USE QLTV

CREATE TABLE TAILIEU
(   MATL VARCHAR(10) PRIMARY KEY,
    TENTL NVARCHAR(200),
    LOAITL NVARCHAR(50)
)

CREATE TABLE TACGIA 
(   MATG VARCHAR(10) PRIMARY KEY,
    TENTG NVARCHAR(100),
    NAMSINH INT
)

CREATE TABLE SACH 
(   MATL VARCHAR(10),
    STT INT,
    LANXB INT,
    TINHTRANG NVARCHAR(100),
    MATG VARCHAR(10),
    PRIMARY KEY (MATL, STT),
    FOREIGN KEY (MATL) REFERENCES TAILIEU(MATL),
    FOREIGN KEY (MATG) REFERENCES TACGIA(MATG),
)

CREATE TABLE BAO_TAPCHI 
(   MATL VARCHAR(10) PRIMARY KEY,
    KYXB VARCHAR(10),
    NAMPHATHANH INT,
    DINHKY NVARCHAR(50),
    NXB NVARCHAR(100),
    FOREIGN KEY (MATL) REFERENCES TAILIEU(MATL)
)

CREATE TABLE XB_SACH 
(   MATL VARCHAR(10),
    LANXB INT,
	STT INT,
    NAMXB INT,
    KHOGIAY NVARCHAR(50),
    SOTRANG INT,
    NHAXB NVARCHAR(100),
    GIA MONEY,
    DIACD NVARCHAR(20),
    PRIMARY KEY (MATL, LANXB, STT),
    FOREIGN KEY (MATL, STT) REFERENCES SACH(MATL,STT)
)

CREATE TABLE XB_BAOTAPCHI 
(   MATL VARCHAR(10),
    KYXB VARCHAR(10),
    SLNHAP INT,
    SLMUON INT,
    SLCONLAI AS (SLNHAP-SLMUON),
    PRIMARY KEY (MATL, KYXB),
    FOREIGN KEY (MATL) REFERENCES BAO_TAPCHI(MATL)
)

CREATE TABLE DOCGIA 
(   SOTHE VARCHAR(10) PRIMARY KEY,
    NGAYCAPTHE DATE,
    TENDG NVARCHAR(60),
    PHAI NVARCHAR(10),
    NGHENGHIEP NVARCHAR(100)
)

CREATE TABLE MUON 
(   SOTHE VARCHAR(10),
    MATL VARCHAR(10),
    LANXB INT,
    STT INT,
    KYXB VARCHAR(10),
    NGAYMUON DATE,
    NGAYTRA DATE,
    PRIMARY KEY (SOTHE, MATL),
    FOREIGN KEY (SOTHE) REFERENCES DOCGIA(SOTHE),
	FOREIGN KEY (MATL) REFERENCES TAILIEU(MATL)
)
INSERT INTO TAILIEU (MATL, TENTL, LOAITL) VALUES
('TL01', N'Sách Lập trình C cơ bản', N'Sách'),
('TL02', N'Sách Marketing thời đại số', N'Sách'),
('TL03', N'Sách Hành trình kinh doanh', N'Sách'),
('TL04', N'Sách Nghệ thuật lãnh đạo', N'Sách'),
('TL05', N'Sách Tâm lý học ứng dụng', N'Sách'),
('TL06', N'Báo Khoa học trẻ', N'Báo/Tạp chí'),
('TL07', N'Tạp chí Công nghệ mới', N'Báo/Tạp chí'),
('TL08', N'Báo Kinh tế tuần', N'Báo/Tạp chí'),
('TL09', N'Tạp chí Văn hóa Việt', N'Báo/Tạp chí'),
('TL10', N'Báo Môi trường xanh', N'Báo/Tạp chí')

INSERT INTO TACGIA VALUES
('TG01', N'Phạm Trần Kim Ngân', 1970),
('TG02', N'Nguyễn Lê Anh Thư', 1980),
('TG03', N'Nguyễn Hoàng Nam', 1975),
('TG04', N'Đào Hoàng Phi', 1990),
('TG05', N'Lục Văn Chương', 1982)

INSERT INTO SACH (MATL, STT, LANXB, TINHTRANG, MATG) VALUES
('TL01', 1, 1, N'Tốt', 'TG01'),
('TL02', 2, 1, N'Rách', 'TG02'),
('TL03', 1, 2, N'Mất trang', 'TG03'),
('TL04', 3, 1, N'Tốt', 'TG04'),
('TL05', 2, 2, N'Rách', 'TG05')

INSERT INTO BAO_TAPCHI (MATL, KYXB, NAMPHATHANH, DINHKY, NXB) VALUES
('TL06', '1', 2023, N'Tháng', N'NXB Khoa học VN'),
('TL07', '2', 2022, N'Quý', N'NXB Công nghệ cao'),
('TL08', '3', 2021, N'Tháng', N'NXB Kinh tế quốc dân'),
('TL09', '4', 2024, N'Năm', N'NXB Văn hóa Việt Nam'),
('TL10', '1', 2024, N'Quý', N'NXB Môi trường xanh');

INSERT INTO XB_SACH (MATL, LANXB, STT, NAMXB, KHOGIAY, SOTRANG, NHAXB, GIA, DIACD) VALUES
('TL01', 1, 1, 2023, N'A4', 250, N'NXB Giáo dục', 45000, N'Có'),
('TL02', 1, 2, 2022, N'A5', 300, N'NXB Thời đại', 50000, N'Không'),
('TL03', 2, 1, 2024, N'B5', 200, N'NXB Lao động', 60000, N'Có'),
('TL04', 1, 3, 2021, N'C5', 320, N'NXB Trí thức', 55000, N'Không'),
('TL05', 2, 2, 2023, N'A4', 280, N'NXB Đại học Quốc gia', 40000, N'Có')

INSERT INTO XB_BAOTAPCHI (MATL, KYXB, SLNHAP, SLMUON) VALUES
('TL06', '1', 3, 2),
('TL07', '2', 2, 2),
('TL08', '3', 2, 1),
('TL09', '4', 1, 1),
('TL10', '1', 1, 1)

INSERT INTO DOCGIA (SOTHE, NGAYCAPTHE, TENDG, PHAI, NGHENGHIEP) VALUES
('DG01', '2025-01-10', N'Trần Minh Tuấn', N'Nam', N'Sinh viên'),
('DG02', '2025-02-15', N'Lê Thị Hồng', N'Nữ', N'Nhân viên văn phòng'),
('DG03', '2025-03-05', N'Nguyễn Quốc Huy', N'Nam', N'Giảng viên'),
('DG04', '2025-04-01', N'Hồ Anh Thư', N'Nữ', N'Kỹ sư'),
('DG05', '2025-01-25', N'Phạm Văn Tài', N'Nam', N'Sinh viên')
-- 5 sách
INSERT INTO MUON (SOTHE, MATL, LANXB, STT, KYXB, NGAYMUON, NGAYTRA) VALUES
('DG01', 'TL01', 1, 1, NULL, '2025-01-15', '2025-02-10'),
('DG02', 'TL02', 1, 2, NULL, '2025-02-20', NULL),
('DG03', 'TL03', 2, 1, NULL, '2025-03-01', '2025-03-20'),
('DG04', 'TL04', 1, 3, NULL, '2025-04-05', NULL),
('DG05', 'TL05', 2, 2, NULL, '2025-04-20', '2025-05-05'),
('DG01', 'TL06', NULL, NULL, '1', '2025-01-20', '2025-02-05'),
('DG01', 'TL07', NULL, NULL, '2', '2025-02-25', '2025-03-10'),
('DG02', 'TL08', NULL, NULL, '3', '2025-03-10', NULL),
('DG03', 'TL09', NULL, NULL, '4', '2025-04-15', '2025-04-30'),
('DG04', 'TL10', NULL, NULL, '1', '2025-04-25', NULL),
('DG05', 'TL06', NULL, NULL, '1', '2025-01-30', '2025-02-15'),
('DG05', 'TL07', NULL, NULL, '2', '2025-02-05', NULL)


