<?php
	include "connect.php";
	$size = $_POST['size'];
	$query = "SELECT * FROM taikhoan ORDER BY id DESC";
	$data = mysqli_query($conn, $query);
	$result = array();

	while ($row = mysqli_fetch_assoc($data)) {
		$result[] = ($row);
		//code...
	}
	foreach ($result as $key => $item) {
		if ($item['sdt'] == '0999999999') {
			unset($result[$key]);
		}
	}
	$limitedResult = array_slice($result, $size, (($size+10)>count($result))?count($result):($size+10));
	if (!empty($limitedResult)) {
		$arr = [
			'success' => true,
			'message' => "Thành công",
			'result' => $limitedResult
		];
	} else {
		$arr = [
			'success' => false,
			'message' => "Thất bại!",
			'result' => $limitedResult
		];
	}
	print_r(json_encode($arr));
?>