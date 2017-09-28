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
    //echo "Connected successfully";
    
}



$sql = "INSERT INTO school.student (firstname, lastname)
VALUES ('John', 'Doe')";

if ($conn->query($sql) === TRUE) {
   // echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}


$sql = "SELECT studentid, firstname, lastname FROM school.student";
$result = $conn->query($sql);

$myArr = array();

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
//        echo "id: " . $row["studentid"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
//        
        $myObj->first_name = $row["firstname"];
        $myObj->last_name = $row["lastname"];
        $myObj->id = $row["studentid"];
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
