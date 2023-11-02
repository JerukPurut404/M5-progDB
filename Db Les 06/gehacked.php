<?php 
error_reporting(E_ALL ^ E_NOTICE); 

require_once 'dbdata.php';

$search = $_GET['search'];
$conn = mysqli_connect($envSettings['DB_HOST'], $envSettings['DB_USER'], $envSettings['DB_PASSWORD'], $envSettings['DB_NAME']);

if (!$conn) {
    die("Databaseverbinding mislukt: " . mysqli_connect_error());
}

$query = "SELECT * FROM leerlingen WHERE naam = '". $search ."'";
$result = mysqli_query($conn, $query);

if ($result) {
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {  
            echo "Leerling: " . $row['naam'] . "<br>";
        }
    } else {
        echo "No results found.";
    }
} else {
    echo "Query fout: " . mysqli_error($conn);
}


mysqli_close($conn);
?>