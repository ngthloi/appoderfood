<?php 
	include "connect.php";
    $id = $_POST['id'];
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
	$query = (strlen($hinhmon)>0)?"UPDATE mon 
    SET madanhmuc = '$iddanhmuc', tenmon = '$tenmon',hinhmon='$hinhmon', mota = '$mota' ,gia=$gia 
    WHERE id = $id;":"UPDATE mon 
    SET madanhmuc = '$iddanhmuc', tenmon = '$tenmon', mota = '$mota' ,gia=$gia 
    WHERE id = $id;";
	$data = mysqli_query($conn, $query);
	if($data){
		echo "$hinhmon";
	} 
	else{
		echo "Error";
	}
?>