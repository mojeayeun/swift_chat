<?php
$servername = "localhost";
$username = "root";
$password = "root";



// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}else{
//    echo "Connected successfully";
    
}


$sql = "SELECT * FROM school.chat order by id desc";
$result = $conn->query($sql);

$myArr = array();

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
//        echo "id: " . $row["studentid"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
//        
        $myObj->id = $row["id"];
        $myObj->name = $row["name"];
        $myObj->message = $row["message"];
        $myObj->datetime = $row["datetime"];
        
        array_push($myArr, $myObj);
        $myObj = "";
    }
} else {
    echo "0 results";
}

$myJSON = json_encode($myArr);
echo $myJSON;

$conn->close();


?>
