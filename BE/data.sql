USE [Dental Clinic Booking]
GO
INSERT [dbo].[role] ([id], [role_name]) VALUES (N'ROLE_ADMIN', N'ROLE_ADMIN')
INSERT [dbo].[role] ([id], [role_name]) VALUES (N'ROLE_USER', N'ROLE_USER')
INSERT [dbo].[status] ([id], [status_name]) VALUES (N'ACEPT', N'ACEPT')
INSERT [dbo].[status] ([id], [status_name]) VALUES (N'ACTIVE', N'ACTIVE')
INSERT [dbo].[status] ([id], [status_name]) VALUES (N'CANCEL', N'CANCEL')
INSERT [dbo].[status] ([id], [status_name]) VALUES (N'DEACTIVE', N'DEACTIVE')
INSERT [dbo].[status] ([id], [status_name]) VALUES (N'DENY', N'DENY')
INSERT [dbo].[status] ([id], [status_name]) VALUES (N'DONE', N'DONE')
INSERT [dbo].[account] ([phone], [birthday], [email], [fullname], [image], [password], [role_id], [status_id], [token]) VALUES (N'0906881041', N'02/12/2000', N'abc@gmail.com', N'Thanh Hiep', NULL, N'$2a$10$1rK2ekBgYk40eF6tcwxuUuQBNsZ1zpMU7YZ6NjczG0SU.C5sVqeni', N'ROLE_USER', N'ACTIVE', N'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIwOTA2ODgxMDQxIiwiaWF0IjoxNjI1NTgxNzQwLCJleHAiOjE2MjY0NDU3NDB9.oA0jHZTm0m5PqDc2TG-3qLGUN__cIq9YonlqOJF57ZX5wrpQ5wiJUMIR-lhC47BwRDZuayn4T_-C2nGxTL5CFg')
INSERT [dbo].[dentistry] ([address], [email], [image], [kilometer], [name], [phone], [rating]) VALUES (N' 472 Lê Hồng Phong, Phường 1, Quận 1', NULL, NULL, NULL, N'Nha Khoa Trồng Răng SG', N' 028 6686 9386', 5)
INSERT [dbo].[dentistry] ([address], [email], [image], [kilometer], [name], [phone], [rating]) VALUES (N'181 Nguyễn Thị Minh Khai, Phường Phạm Ngũ Lão, Quận 1', N'marketingonline.dainam@gmail.com', NULL, NULL, N'Nha Khoa Đại Nam', N'096 444 49 99', 4.8)
INSERT [dbo].[dentistry] ([address], [email], [image], [kilometer], [name], [phone], [rating]) VALUES (N'199 Nguyễn Thị Minh Khai, Phường Nguyễn Cư Trinh, Quận 1', NULL, NULL, NULL, N'Trung tâm Nha Khoa Minh Khai', N'1800 2080', 4.4)
INSERT [dbo].[dentistry] ([address], [email], [image], [kilometer], [name], [phone], [rating]) VALUES (N'265 D Hai Bà Trưng, Tân Định, Quận 1', NULL, NULL, NULL, N'Nha Khoa Thái Dương', N' 090 757 06 68', 5)
INSERT [dbo].[dentistry] ([address], [email], [image], [kilometer], [name], [phone], [rating]) VALUES (N'30-36 Đường Phan Bội Châu, Phường Bến Thành, Quận 1', N'info@dentalrose.net', NULL, NULL, N'The East Rose Dental', N'0908321455', 4.5)
INSERT [dbo].[dentistry] ([address], [email], [image], [kilometer], [name], [phone], [rating]) VALUES (N'49 Đường 3/2, Phường 11, Quận 10', NULL, NULL, NULL, N'Nha khoa thẩm mỹ Sunshine Sài Gòn', N' 0765 176 888', 5)
INSERT [dbo].[dentistry] ([address], [email], [image], [kilometer], [name], [phone], [rating]) VALUES (N'4B Đ. Trần Hưng Đạo, Phường Phạm Ngũ Lão, Quận 1', N'', NULL, NULL, N'Cam Tu Dental Clinic', N'028 3821 8807', 4.7)
INSERT [dbo].[doctor] ([id], [dentistry_address], [doctor_name], [phone], [status_id], [email], [gender], [address_doctor]) VALUES (N'56e90222-3c17-4464-85a6-128356c00efd', N'181 Nguyễn Thị Minh Khai, Phường Phạm Ngũ Lão, Quận 1', N'Nguyễn Tấn Trung', N'	0937851037', N'ACTIVE', N'123tan@gmail.com', N'Nam', N' 472 Lê Hồng Phong, Phường 1, Quận 1')
INSERT [dbo].[doctor] ([id], [dentistry_address], [doctor_name], [phone], [status_id], [email], [gender], [address_doctor]) VALUES (N'7676b6e7-a238-450f-8b70-22c40bc75867', N'30-36 Đường Phan Bội Châu, Phường Bến Thành, Quận 1', N'Võ Trường', N'	0937851037', N'ACTIVE', N'123tan@gmail.com', N'Nam', N'200 Trần Quốc Thảo, Quận 3, Hồ Chí Minh')
INSERT [dbo].[doctor] ([id], [dentistry_address], [doctor_name], [phone], [status_id], [email], [gender], [address_doctor]) VALUES (N'62bf21dc-e296-4771-bc3c-53bf05bcb109', N'199 Nguyễn Thị Minh Khai, Phường Nguyễn Cư Trinh, Quận 1', N'Nguyễn Anh Tuấn', N'	0937851037', N'ACTIVE', N'123tan@gmail.com', N'Nam', N'9C Nguyễn Đình Chiểu, Quận 3, Hồ Chí Minh')
INSERT [dbo].[doctor] ([id], [dentistry_address], [doctor_name], [phone], [status_id], [email], [gender], [address_doctor]) VALUES (N'dc931083-8ba0-47bf-be48-7a1720f40a39', N'4B Đ. Trần Hưng Đạo, Phường Phạm Ngũ Lão, Quận 1', N'Trần Khả Ái', N'0937851037', N'ACTIVE', N'123tan@gmail.com', N'Nữ', N'155-157 Trần Quốc Thảo, Quận 3, Hồ Chí Minh')
INSERT [dbo].[doctor] ([id], [dentistry_address], [doctor_name], [phone], [status_id], [email], [gender], [address_doctor]) VALUES (N'87beae98-5941-486f-91af-a4f327e5e967', N' 472 Lê Hồng Phong, Phường 1, Quận 1', N'Trần Trúc An', N'	0937851037', N'ACTIVE', N'123tan@gmail.com', N'Nữ', N'	Số 3 Hòa Bình, Phường 3, Quận 11, Hồ Chí Minh')
