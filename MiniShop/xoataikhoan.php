<?php 
	include "connect.php";
	$id = $_POST['id'];

	$query = "DELETE FROM taikhoan WHERE id = $id";
	$data = mysqli_query($conn, $query);
	if($data){
		echo "Done";
	} 
	else{
		echo "Error";
	}
?>