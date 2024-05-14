<?php
// GroupName : TechCraft
// ProjectName: AutoByteCare
// DatabaseName:autobytecare
// Members :  Shree Dhar Acharya : 8899288
//            Rishab Abbhi : 8874858
//            Rohit Rana : 8874589
// Database connection details
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

$host = 'localhost';
$dbname = 'autobytecare';
$username = 'root';
$password = '';

// Create a database connection
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Error: " . $e->getMessage());
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve user credentials from the login form
    $user_name = $_POST['user_name'];
    $password = $_POST['password'];

    // Prepare and execute the SQL query to check user credentials
    $query = "SELECT * FROM customers WHERE user_name = :user_name AND password = :password";
    try {
        $stmt = $pdo->prepare($query);
        $stmt->bindParam(':user_name', $user_name);
        $stmt->bindParam(':password', $password);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            // User credentials are valid
            $response = array("success" => true, "message" => "Login successful");
        } else {
            // Invalid credentials
            $response = array("success" => false, "message" => "Invalid username or password");
        }

        // Return the result as JSON
        echo json_encode($response);
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>
