<?php 
	include "connect.php";
    $id = $_POST['id'];
	$tenkhachhang = $_POST['tenkhachhang'];
	$sdt	= $_POST['sdt'];
	$email = $_POST['email'];

	$query = "UPDATE taikhoan 
    SET tenkhachhang = '$tenkhachhang', sdt = '$sdt', email = '$email' 
    WHERE id = $id;
    ";
	$data = mysqli_query($conn, $query);
	if($data){
		echo "Done";
	} 
	else{
		echo "Error";
	}
?>