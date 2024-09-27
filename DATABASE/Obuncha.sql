CREATE DATABASE ObunchaHaNoi
ON PRIMARY (
    NAME = 'ObunchaHaNoi_Data',  -- Tên cho tệp dữ liệu
    FILENAME = 'C:\SQL_Advanced\Obuncha.mdf'
)
LOG ON (
    NAME = 'ObunchaHaNoi_Log',    -- Tên cho tệp log
    FILENAME = 'C:\SQL_Advanced\Obuncha_log.ldf'  -- Đường dẫn tệp log
);

CREATE TABLE NhaCungCap (
    NhaCungCapID INT PRIMARY KEY IDENTITY(1,1),  -- ID nhà cung cấp tự động tăng
    TenNhaCungCap NVARCHAR(100) NOT NULL,       -- Tên nhà cung cấp
    DiaChi NVARCHAR(255),                        -- Địa chỉ nhà cung cấp
    SoDienThoai NVARCHAR(15)                     -- Số điện thoại
);
INSERT INTO NhaCungCap (TenNhaCungCap, DiaChi, SoDienThoai)
VALUES 
('Công ty ABC', '123 Đường A, Quận 1, TP.HCM', '0123456789'),
('Công ty XYZ', '456 Đường B, Quận 2, TP.HCM', '0987654321'),
('Công ty 123', '789 Đường C, Quận 3, TP.HCM', '0112233445');

CREATE TABLE NhanSu (
    NhanSuID INT PRIMARY KEY IDENTITY(1,1),      -- ID nhân sự tự động tăng
    TenNhanSu NVARCHAR(100) NOT NULL,            -- Tên nhân sự
    ChucVu NVARCHAR(50),                         -- Chức vụ
    Email NVARCHAR(100)                          -- Địa chỉ email
);
INSERT INTO NhanSu (TenNhanSu, ChucVu, Email)
VALUES 
('Nguyễn Văn A', 'Giám đốc', 'vana@example.com'),
('Trần Thị B', 'Nhân viên', 'bth@example.com'),
('Lê Văn C', 'Kế toán', 'vanc@example.com');