<?php
// GroupName : TechCraft
// ProjectName: AutoByteCare
// DatabaseName:autobytecare
// Members :  Shree Dhar Acharya : 8899288
//            Rishab Abbhi : 8874858
//            Rohit Rana : 8874589
error_reporting(E_ALL);
ini_set('display_errors', 1);
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve customer data from the registration form
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $user_name = $_POST['user_name'];
    $userPassword = $_POST['password']; // Renamed for clarity
    $email = $_POST['email'];
    $phone_number = $_POST['phone_number'];
    $primary_address = $_POST['primary_address'];
    $secondary_address = $_POST['secondary_address'];
    $city = $_POST['city'];
    $state = $_POST['state'];
    $country = $_POST['country'];
    $postal_code = $_POST['postal_code'];

    // Database configuration
    $hostname = 'localhost';
    $username = 'root';
    $dbPassword = ''; 
    $database = 'autobytecare';

    // Create database connection
    $conn = new mysqli($hostname, $username, $dbPassword, $database);

    // Check connection
    if ($conn->connect_error) {
        $response = array("status" => "error", "message" => "Connection failed: " . $conn->connect_error);
        echo json_encode($response);
        exit();
    }

    // Insert into address table
    $sql = "INSERT INTO address (primary_address, secondary_address, city, state, country, postal_code) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssss", $primary_address, $secondary_address, $city, $state, $country, $postal_code);

    if (!$stmt->execute()) {
        $response = array("success" => false, "message" => "Error inserting data into address table: " . $stmt->error);
        echo json_encode($response);
        $stmt->close();
        $conn->close();
        exit();
    }

    $addressId = $stmt->insert_id;
    $stmt->close();

    // Insert into customers table
    $sql = "INSERT INTO customers (first_name, last_name, user_name, password, email, phone_number, address_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssssi", $first_name, $last_name, $user_name, $userPassword, $email, $phone_number, $addressId);

    if ($stmt->execute()) {
        $response = array("success" => true); // Registration successful
    } else {
        $response = array("success" => false, "message" => "Error inserting data into customers table: " . $stmt->error);
    }

    $stmt->close();
    // Close database connection
    $conn->close();
    
    // Set the appropriate content type header
    header("Content-Type: application/json");
    echo json_encode($response);
}
?>
