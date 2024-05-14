<?php
// GroupName : TechCraft
// ProjectName: AutoByteCare
// DatabaseName:autobytecare
// Members :  Shree Dhar Acharya : 8899288
//            Rishab Abbhi : 8874858
//            Rohit Rana : 8874589
header("Access-Control-Allow-Origin: *"); // Replace * with your specific domain if needed
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
require('../fpdf186/fpdf.php'); // Adjust the path to FPDF if needed


class PDF extends FPDF {
    function Header() {
        $this->SetFont('Arial', 'B', 16);
        $this->SetFillColor(247, 247, 247); // Update background color
        $this->SetTextColor(51, 51, 51); 
        $logoPath = 'logo.png'; // Use just the logo file name
        $this->Image($logoPath, 10, 10, 40); // Adjust the image position as needed
        $this->SetXY(60, 15); // Adjust the X and Y positions as needed
        $this->Cell(0, 10, 'AutoByteCare', 0, 1, 'R');
        
        $this->SetLineWidth(0.5); // Set line width
        $this->SetDrawColor(0, 102, 204); // Set line color (blue)
        $this->Line(10, 50, 200, 50); // Draw a line
        $this->Cell(0, 15, 'AutoByteCare Customers Report', 0, 1, 'C');
        $this->Ln(10);
        $this->LN(10);
    }

    function Footer() {
        $this->SetY(-15);
        $this->SetFont('Arial', 'I', 10);
        $this->Cell(0, 10, 'Page ' . $this->PageNo(), 0, 0, 'C');
    }

    function CustomerTable($data) {
        $this->SetFont('Arial', 'B', 12);
        $this->SetFillColor(255); // Reset background color
        $this->SetTextColor(51, 51, 51); // Reset text color
    
        foreach ($data as $customer) {
            $this->Cell(190, 10, 'Customer Information', 1, 1, 'C', true); // Header cell
            foreach ($customer as $key => $value) {
                $this->SetFillColor(247, 247, 247); // Update background color for header
                $this->SetTextColor(51, 51, 51); 
                $this->Cell(50, 10, $key, 1, 0, 'L', true); // Label cell
                $this->Cell(0, 10, $value, 1, 1, 'L'); // Value cell
            }
            $this->Ln(10);
        }
    }
}

// Database configuration
$hostname = 'localhost';
$username = 'root';
$dbPassword = ''; 
$database = 'autobytecare';

// Create database connection
$conn = new mysqli($hostname, $username, $dbPassword, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve customer data from the database
$sql = "SELECT c.*, a.primary_address, a.secondary_address, a.city, a.state, a.country, a.postal_code FROM customers c
        LEFT JOIN address a ON c.address_id = a.address_id";
$result = $conn->query($sql);

$data = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $customerData = array(
            "Customer ID :" => $row['customer_id'],
            "Full Name :" => $row['first_name'] . ' ' . $row['last_name'],
            "Email Address :" => $row['email'],
            "Phone Number :" => $row['phone_number'],
            "Primary Address :" => $row['primary_address'],
            "Secondary Address :" => $row['secondary_address'],
            "City :" => $row['city'],
            "State :" => $row['state'],
            "Country :" => $row['country'],
            "Postal Code :" => $row['postal_code']
        );
        $data[] = $customerData;
    }
}

// Create PDF object
$pdf = new PDF();
$pdf->AddPage();
$pdf->CustomerTable($data);

// Output PDF to browser or save to a file
$pdf->Output();
$conn->close();
?>
