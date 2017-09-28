<?php
    $conn = mysqli_connect('localhost','root','root','school');
        
    if(!$conn){
        die('Could not connect to the database.....' . mysqli_error($conn));
    }

    mysqli_select_db($conn, "school");
    
    $result1 = mysqli_query($conn, "SELECT * FROM school.chat ORDER BY id DESC");

    while($ex = mysqli_fetch_array($result1)){
        echo $ex['name'] . ": " . $ex['message'] . "<br>";
        
        
    }
?>