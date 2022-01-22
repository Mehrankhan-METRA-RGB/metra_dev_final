<?php
require("connection.php");

 $name = $_POST["name"];
       $information = $_POST["information"];
     $makeQuery="DELETE FROM Info WHERE Name='".$name."',Information='".$information."'";
     $statement=$connection->prepare($makeQuery);
     $statement->execute();
     echo json_encode("updated!!!!!");


?>