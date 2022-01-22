<?php
require("connection.php");
$makeQuery="SELECT * FROM Info";
$statement=$connection->prepare($makeQuery);
$statement->execute();
$myarray=array();
while($resultFrom=$statement->fetch()){
array_push($myarray,array(
"Id"=>$resultFrom['Id'],
"Name"=>$resultFrom['Name'],
"Information"=>$resultFrom['Information']

));
}
echo json_encode($myarray);

?>

/*

  To improve compile-time type safety, package:http 0.13.0 introduced breaking changes that made all functions that previously accepted Uris or Strings now accept only Uris instead.

  You will need to use Uri.parse to convert a String into a Uri:

  await http.post(
    Uri.parse("https://api.instagram.com/oauth/access_token"),
    body: {
      "client_id": clientID,
      "redirect_uri": redirectUri,
      "client_secret": appSecret,
      "code": authorizationCode,
      "grant_type": "authorization_code",
    });*/