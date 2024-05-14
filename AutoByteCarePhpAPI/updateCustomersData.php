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

// Get form data
$user_name = $_POST['user_name'];
$first_name = $_POST['first_name'];
$last_name = $_POST['last_name'];
$email = $_POST['email'];
$phone_number = $_POST['phone_number'];
$primary_address = $_POST['primary_address'];
$secondary_address = $_POST['secondary_address'];
$city = $_POST['city'];
$state = $_POST['state'];
$country = $_POST['country'];
$postal_code = $_POST['postal_code'];

try {
    // Fetch customer_id associated with the provided user_name
    $fetchCustomerIdQuery = "SELECT customer_id FROM customers WHERE user_name = ?";
    $stmt = $conn->prepare($fetchCustomerIdQuery);
    $stmt->bind_param("s", $user_name);
    $stmt->execute();
    $customer_id = $stmt->get_result()->fetch_row()[0];

    if (!$customer_id) {
        $response = array('success' => false, 'message' => 'User not found');
    } else {
        // Update customer data
        $updateCustomerQuery = "UPDATE customers
                                SET first_name = ?, last_name = ?, email = ?, phone_number = ?
                                WHERE customer_id = ?";
        $stmt = $conn->prepare($updateCustomerQuery);
        $stmt->bind_param("sssss", $first_name,$last_name,$email,$phone_number,$customer_id);
        $stmt->execute();

        // Update address data
        $updateAddressQuery = "UPDATE address
                               SET primary_address = ?, secondary_address = ?,
                                   city = ?, state = ?, country = ?, postal_code = ?
                               WHERE address_id = (SELECT address_id FROM customers WHERE customer_id = ?)";
        $stmt = $conn->prepare($updateAddressQuery);
        $stmt->bind_param("sssssss", $primary_address,$secondary_address,$city,$state,$country,$postal_code,$customer_id);
        
        $stmt->execute();

        $response = array('success' => true, 'message' => 'Data updated successfully');
    }
} catch (PDOException $e) {
    $response = array('success' => false, 'message' => 'Error updating data: ' . $e->getMessage());
}

header('Content-Type: application/json');
echo json_encode($response);
?>

