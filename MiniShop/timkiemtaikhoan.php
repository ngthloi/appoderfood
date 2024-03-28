<?php
	include "connect.php";
	$tentaikhoan = $_POST['tentaikhoan'];

	$query = "SELECT * FROM taikhoan WHERE taikhoan.tenkhachhang LIKE '%$tentaikhoan%'";
	$data = mysqli_query($conn, $query);
	$result = array();

	while ($row = mysqli_fetch_assoc($data)) {
		$result[] = ($row);
		//code...
	}
	if (!empty($result)) {
		$arr = [
			'success' => true,
			'message' => "Thành công",
			'result' => $result
		];
	} else {
		$arr = [
			'success' => false,
			'message' => "Thất bại!",
			'result' => $result
		];
	}
	print_r(json_encode($arr));
?>