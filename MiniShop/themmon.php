<?php 
	include "connect.php";
	$iddanhmuc = $_POST['madanhmuc'];
	$tenmon	= $_POST['tenmon'];
    $hinhmon	= $_POST['hinhanhmon'];
	$mota = $_POST['mota'];
	$gia	= $_POST['gia'];
    if(strlen($hinhmon)>0){
        $encodedImage = $_POST['file'];
        $decodedImage = base64_decode($encodedImage);
        $uploadDirectory = "mon/";
        $currentTime = time();
        $imageName = $currentTime . ".jpg";
        $hinhmon=$imageName;
        $imagePath = $uploadDirectory . $imageName;
        file_put_contents($imagePath, $decodedImage);
    }
	$query = "INSERT INTO mon(id, madanhmuc, tenmon, hinhmon, gia, mota) VALUES
    (null, '$iddanhmuc', '$tenmon', '$hinhmon', '$gia', '$mota')";
	$data = mysqli_query($conn, $query);
	if($data){
		echo "Done";
	} 
	else{
		echo "Error";
	}
?>