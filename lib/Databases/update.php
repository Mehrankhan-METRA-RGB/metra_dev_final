<?php
require("connection.php");

       $name = $_POST["name"];
       $information = $_POST["information"];
     $makeQuery="UPDATE Info  SET Name='".$name."',Information='".$information."' WHERE Id=1";
     $statement=$connection->prepare($makeQuery);
     $statement->execute();
     echo json_encode("updated!!!!!");


?>