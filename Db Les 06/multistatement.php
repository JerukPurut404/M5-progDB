<?php 

error_reporting(E_ALL ^ E_NOTICE); 

require_once 'dbdata.php';

$search = $_GET['search'];
$conn = mysqli_connect($envSettings['DB_HOST'], $envSettings['DB_USER'], $envSettings['DB_PASSWORD'], $envSettings['DB_NAME']);

if (!$conn) {
    die("Database connection failed: " . mysqli_connect_error());
}

$query = "SELECT * FROM leerlingen
          WHERE naam = '". $search ."'";
$conn->multi_query($query); 

do {
    if ($result = $conn->store_result()) {
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {  
                echo "Leerling: " . $row['naam'] . "<br>";
            }
        } else {
            echo "No results found.";
        }
        $result->free();
    }
} while ($conn->next_result());

mysqli_close($conn);
?>