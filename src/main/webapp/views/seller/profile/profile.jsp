<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<style>
/* Tổng quan */
body {
    background-color: #121212; /* Nền tối */
    color: #e0e0e0; /* Chữ sáng */
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    padding: 0;
}

/* Khung thông tin người bán */
.seller-profile {
    padding: 20px;
    border: 1px solid #333;
    border-radius: 10px; /* Bo tròn mềm mại */
    font-size: 18px;
    margin: 40px auto;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: flex-start;
    background-color: #1e1e1e; /* Nền chính */
    max-width: 1000px; /* Giới hạn chiều rộng */
    box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.7);
    transition: transform 0.3s, box-shadow 0.3s; /* Hiệu ứng chuyển đổi */
}

.seller-profile:hover {
    transform: scale(1.02); /* Phóng to nhẹ khi hover */
    box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.9);
}

/* Thông tin chi tiết */
.seller-info p {
    margin-bottom: 20px;
    font-size: 16px;
    line-height: 1.5;
}

.seller-info strong {
    color: #bb86fc; /* Nhấn nhá bằng màu tím nhạt */
}

.seller-info {
    width: 65%;
}

/* Hình ảnh và nút chỉnh sửa */
.seller-avt {
    width: 30%;
    flex-direction: column;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 0;
    text-align: center;
}

.seller-profile img {
    width: 150px;
    height: 150px;
    object-fit: cover;
    border-radius: 50%;
    border: 3px solid #444;
    transition: box-shadow 0.3s;
}

.seller-profile img:hover {
    box-shadow: 0px 4px 12px rgba(187, 134, 252, 0.8); /* Hiệu ứng khi hover ảnh */
}

.seller-avt label {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin-top: 15px;
    color: #e0e0e0;
    cursor: pointer;
    transition: color 0.3s;
}

.seller-avt label:hover {
    color: #bb86fc; /* Đổi màu tím khi hover */
}

/* Nút bấm */
button, .seller-btn {
    padding: 10px 20px;
    width: 130px;
    background-color: #333;
    color: #e0e0e0;
    border: 1px solid #555;
    border-radius: 10px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s, color 0.3s;
}

button:hover, .seller-btn:hover {
    background-color: #555;
    color: #ffffff;
    border: 1px solid #777;
}

/* Nút riêng cho "Cập nhật" và "Đổi mật khẩu" */
.update-pass {
    margin-left: 30px;
    width: 200px !important;
}

a {
    text-decoration: none;
    display: inline-block;
    margin-top: 15px;
}

a button {
    margin-top: 5px;
}

/* Ẩn input file */
.hind {
    visibility: hidden;
    position: absolute;
}

/* Responsive */
@media (max-width: 768px) {
    .seller-profile {
        flex-direction: column;
        align-items: center;
        padding: 20px;
    }
    .seller-info {
        width: 100%;
        margin-bottom: 20px;
    }
    .seller-avt {
        width: 100%;
    }
    button, .seller-btn {
        width: 100px;
    }
}
</style>



<div class="seller-profile">
	<div class="seller-info">
		<p>
			<strong>Họ tên:</strong> ${user.lastName} ${user.firstName}
		</p>
		<p>
			<strong>Địa chỉ:</strong> ${user.address}
		</p>
		<p>
			<strong>Số điện thoại:</strong> ${user.phone}
		</p>
		<p>
			<strong>Email:</strong> ${user.email}
		</p>
		<p>
			<strong>Giới tính:</strong> ${user.gender==1?'Nữ':'Nam'}
		</p>
		<p>
			<strong>Căn cước công dân:</strong> ${user.cid}
		</p>
		<p>
			<strong>Ngày sinh:</strong>
			<fmt:formatDate value="${user.dob}" pattern="dd/MM/yyyy" />
		</p>
		<div id="paragraphContainer"></div>
		<a href="sellerUpdateInfor">
			<button class="update">Cập nhật</button>
		</a>
		<a href="sellerUpdatePass">
			<button class="update-pass">Đổi mật khẩu</button>
		</a>
	</div>
	<div class="seller-avt">
		<img src="${user.avatar}" id="myImage" alt="User Image">
		<input class="hind" type="file" id="imageInput" accept="image/*"> 
		<label class="seller-btn seller-button-img" for="imageInput">Sửa ảnh</label>
	</div>
</div>
<script>
	// JavaScript để xử lý sự kiện khi giá trị của input file thay đổi
	document.getElementById('imageInput').addEventListener('change',
			function(e) {
				// Đối tượng hình ảnh

				var formData = new FormData();
				formData.append('image', $('#imageInput')[0].files[0]);

				$.ajax({
					type : 'POST',
					url : 'sellerUpdateAvatar',
					data : formData,
					processData : false,
					contentType : false,
					success : function(response) {
						console.log('POST thành công!', response);
						window.location.href = 'sellerInfor';
					},
					error : function(error) {
						console.error('Lỗi POST:', error);
					}
				});
				//window.location.href = 'seller-info'
			});
</script>