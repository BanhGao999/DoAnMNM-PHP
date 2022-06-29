 <?php
	session_start();
	include('../../../admincp/config/connect.php');
	if (isset($_GET['partnerCode'])) {
		$id_khachhang = $_SESSION['id_khachhang'];
		$code_order = $_GET['orderId'];
		$cart_pay = $_GET['orderInfo'];
		$insert_cart = "INSERT INTO tbl_giohang(id_khachhang,code_cart,cart_status,cart_payment) VALUE('" . $id_khachhang . "','" . $code_order . "',1,'" . $cart_pay . "')";
		$cart_query = mysqli_query($connect, $insert_cart);
		if ($cart_query) {
			//thêm giỏ hàng chi tiết
			foreach ($_SESSION['cart'] as $key => $value) {
				$id_sanpham = $value['id'];
				$soluong = $value['soluong'];

				$insert_order_details = "INSERT INTO tbl_cart_detail(id_sanpham,code_cart,soluongmua) VALUE('" . $id_sanpham . "','" . $code_order . "','" . $soluong . "')";
				mysqli_query($connect, $insert_order_details);
			}
		}
		echo "<h2>Cảm ơn bạn đã mua hàng thành công</h2><br>";
		echo "Thông tin đơn hàng như sau: " . "<br>";
		echo "Id khách hàng: " . $id_khachhang . "<br>";
		echo "Tên khách hàng: " . $_SESSION['dangky'] . "<br>";
		echo "Tổng tiền đã thanh toán: " . $_SESSION['tongtien'] . "<br>";
		echo "Phương thức thanh toán: " . $_GET['orderInfo'] . "<br>";
		echo "Loại thanh toán: " . $_GET['payType'] . "<br>";
		echo "Shop sẽ liên hệ qua sđt để xác thực đơn hàng trong 2 ngày.";
	} else {
		echo "Thanh toán thất bại";
	}
?>
<form action="../../../index.php">
	<input type="submit" value="Quay lại trang chủ" ></input>
</form>

