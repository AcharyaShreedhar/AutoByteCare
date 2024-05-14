<?php

// GroupName : TechCraft
// ProjectName: AutoByteCare
// DatabaseName:autobytecare
// Members :  Shree Dhar Acharya : 8899288
//            Rishab Abbhi : 8874858
//            Rohit Rana : 8874589

header("Access-Control-Allow-Origin: *"); 
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
        $this->Cell(0, 10, 'Invoice Report', 0, 1, 'C');
        $this->Ln(20);
    }

    function Footer() {
        $this->SetY(-15);
        $this->SetFont('Arial', 'I', 8);
        $this->SetFillColor(247, 247, 247); // Update background color
        $this->SetTextColor(51, 51, 51); 
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
$pdf->SetFont('Arial', 'B', 14);

// Retrieve invoice data from the database
$sql = "SELECT i.*, c.first_name, c.last_name, w.labor_hours, w.total_cost AS work_order_cost, 
               p.part_name, p.description AS part_description, p.price AS part_price
        FROM invoices i
        LEFT JOIN customers c ON i.customer_id = c.customer_id
        LEFT JOIN work_orders w ON i.work_order_id = w.work_order_id
        LEFT JOIN parts p ON w.part_id = p.part_id";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $pdf->SetFont('Arial', 'B', 14);
        $pdf->SetFillColor(255); // Reset background color
        $pdf->SetTextColor(51, 51, 51); // Reset text color
        $pdf->Cell(0, 10, 'Invoice ID: ' . $row['invoice_id'], 0, 1, 'L');
        $pdf->SetFont('Arial', 'B', 12);
        $pdf->SetFillColor(255); // Reset background color
        $pdf->SetTextColor(51, 51, 51); // Reset text color
        $pdf->Cell(0, 10, 'Date: ' . $row['date'], 0, 1, 'R');
        $pdf->Cell(0, 10, 'Customer: ' . $row['first_name'] . ' ' . $row['last_name'], 0, 1, 'L');
        $pdf->Ln(10);
        
        $pdf->SetFont('Arial', '', 12);
        $pdf->SetFillColor(255); // Reset background color
        $pdf->SetTextColor(51, 51, 51); // Reset text color
        $pdf->Cell(0, 10, 'Work Order Details', 0, 1, 'L');
        $pdf->SetFont('Arial', '', 12);
        $pdf->SetFillColor(255); // Reset background color
        $pdf->SetTextColor(51, 51, 51); // Reset text color
        $pdf->Cell(0, 10, 'Labor Hours: ' . $row['labor_hours'], 0, 1, 'L');
        $pdf->Cell(0, 10, 'Work Order Cost: $' . $row['work_order_cost'], 0, 1, 'L');
        

        $pdf->SetX(10); // Move to the right column
        $pdf->SetFillColor(255); // Reset background color
        $pdf->SetTextColor(51, 51, 51); // Reset text color
        $pdf->Cell(0, 10, 'Part Details', 0, 1, 'L');
        $pdf->SetFont('Arial', '', 12);
        $pdf->SetFillColor(255); // Reset background color
        $pdf->SetTextColor(51, 51, 51); // Reset text color
        $pdf->Cell(0, 10, 'Part Name: ' . $row['part_name'], 0, 1, 'L');
        $pdf->Cell(0, 10, 'Part Description: ' . $row['part_description'], 0, 1, 'L');
        $pdf->Cell(0, 10, 'Part Price: $' . $row['part_price'], 0, 1, 'L');
        $pdf->Ln(20);

        $pdf->SetLineWidth(0.5);
        $pdf->Line(10, $pdf->GetY(), 200, $pdf->GetY());
        $pdf->Ln(10); // Add spacing after the line
    }
} else {
    $pdf->SetFont('Arial', 'B', 14);
    $pdf->SetFillColor(255); // Reset background color
    $pdf->SetTextColor(51, 51, 51); // Reset text color
    $pdf->Cell(0, 10, 'No invoices found.', 0, 1, 'C');
}

// Output PDF to browser or save to a file
$pdf->Output();
$conn->close();
?>
