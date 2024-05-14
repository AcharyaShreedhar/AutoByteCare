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
header("Content-Type: application/json");

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

// Get user_name from query parameter
$userName = $_GET['user_name'];

// Fetch customer data from the database along with related address information
$sql = "SELECT c.*, a.primary_address, a.secondary_address, a.city, a.state, a.country, a.postal_code
        FROM customers c
        JOIN address a ON c.address_id = a.address_id
        WHERE c.user_name = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $userName);

if (!$stmt->execute()) {
    $response = array("status" => "error", "message" => "Error fetching customer data: " . $stmt->error);
    echo json_encode($response);
    $stmt->close();
    $conn->close();
    exit();
}

$result = $stmt->get_result();
$customerData = $result->fetch_assoc();
$stmt->close();
$conn->close();

// Return the customer data with address information as JSON response
echo json_encode($customerData);
?>
