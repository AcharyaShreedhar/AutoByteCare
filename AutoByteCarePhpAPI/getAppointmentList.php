<?php
// GroupName : TechCraft
// ProjectName: AutoByteCare
// DatabaseName:autobytecare
// Members :  Shree Dhar Acharya : 8899288
//            Rishab Abbhi : 8874858
//            Rohit Rana : 8874589
header("Access-Control-Allow-Origin: *"); // Replace * with your specific domain if needed
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
require('../fpdf186/fpdf.php'); 
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
        $this->Cell(0, 10, 'Appointments Report', 0, 1, 'C');
        $this->Ln(10);
        $this->Ln(10);
    }

    function Footer() {
        $this->SetY(-15);
        $this->SetFont('Arial', 'I', 8);
        $this->Cell(0, 10, 'Page ' . $this->PageNo(), 0, 0, 'C');
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

// Create PDF object
$pdf = new PDF();
$pdf->AddPage();
$pdf->SetFont('Arial', 'B', 12);

// Retrieve appointment data from the database
$sql = "SELECT a.*, c.first_name, c.last_name, s.service_name, au.manufacturer, au.model
        FROM appointments a
        LEFT JOIN customers c ON a.customer_id = c.customer_id
        LEFT JOIN services s ON a.service_id = s.service_id
        LEFT JOIN automobiles au ON a.automobile_id = au.automobile_id";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $pdf->Rect(10, $pdf->GetY(), 190, 60, 'D'); 
        $pdf->Cell(10, 10, 'ID: ' . $row['appointment_id']);
        $pdf->SetX(0); // Move to the middle column
        $pdf->Cell(120, 10, 'Date: ' . $row['date'], 0, 0, 'C');
        $pdf->SetX(120); // Move to the right column
        $pdf->Cell(10, 10, 'Customer: ' . $row['first_name'] . ' ' . $row['last_name'], 0, 1, 'L');
        $pdf->SetX(120);
        $pdf->Cell(0, 10, 'Service: ' . $row['service_name'], 0, 1, 'L');
        $pdf->SetX(120);
        $pdf->Cell(0, 10, 'Automobile: ' . $row['manufacturer'] . ' ' . $row['model'], 0, 1, 'L');
        $pdf->SetX(120);
        $pdf->Cell(0, 10, 'Status: ' . $row['status'], 0, 1, 'L');
        $pdf->SetX(120);
        $pdf->Cell(0, 10, 'Notes: ' . $row['notes'], 0, 1, 'L');
        $pdf->Ln(10);
    }
} else {
    $pdf->Cell(0, 10, 'No appointments found.', 0, 1, 'C');
}

// Output PDF to browser or save to a file
$pdf->Output();
$conn->close();


?>
