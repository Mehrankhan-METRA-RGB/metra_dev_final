<?php
require("connection.php");
     $name = $_POST["name"];
     $information = $_POST["information"];
     $makeQuery="INSERT INTO Info (Name,Information) VALUES('".$name."','".information."')";
     $statement=$connection->prepare($makeQuery);
     $statement->execute();
     echo json_encode("Inserted!!!!!");
?>