<?php
try{
$connection=new PDO('mysql:host=localhost;dbname=id16391220_metradb','id16391220_admin','@Qwerty1234567890');
$connection->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
//echo "connected";
}
catch(PDOException $ex){

echo $ex->getMessage();
die("couldnt connected");

}

?>