<?php

require_once 'dbdata.php';

$connection = mysqli_connect($envSettings['DB_HOST'], $envSettings['DB_USER'], $envSettings['DB_PASSWORD'], $envSettings['DB_NAME']);

if(mysqli_connect_errno()) {
    die("Databaseverbinding mislukt: " . mysqli_connect_error());
}

$query = "SELECT * FROM users";
$result = mysqli_query($connection, $query);


if(mysqli_num_rows($result) > 0) {
    while($row = mysqli_fetch_assoc($result)) {
  
      echo "Veld 1: " . $row['user_id'] . "<br>";
      echo "Veld 2: " . $row['username'] . "<br>";
    }
} else {
    echo "Geen resultaten gevonden.";
}

mysqli_close($connection);
?>