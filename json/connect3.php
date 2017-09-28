<?php

  $myObj->first_name = "Gil Dong";
  $myObj->last_name = "Kim";
  $myObj->id = "1";
        

$myJSON = json_encode($myObj);
echo $myJSON;


?>