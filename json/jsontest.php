<?php

$myArr = array();

$myObj1->first_name = "He Sun";
$myObj1->last_name = "Kim";
$myObj1->id = "H001";
$myObj1->email = "kimhesun@gmail.com";
array_push($myArr, $myObj1);

$myObj2->first_name = "Tea Hee";
$myObj2->last_name = "Kim";
$myObj2->id = "H002";
$myObj2->email = "kimteahee@gmail.com";
array_push($myArr, $myObj2);


$myObj3->first_name = "Gil Dong";
$myObj3->last_name = "Hong";
$myObj3->id = "H003";
$myObj3->email = "honggildong@gmail.com";
array_push($myArr, $myObj3);


$myJSON = json_encode($myArr);
echo $myJSON;


?>