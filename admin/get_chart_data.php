<?php
include('dbconnect.php');

// Run nested query to fetch data
$query = "
    SELECT staffid, crime_type, COUNT(*) as case_count 
    FROM case_table 
    INNER JOIN crime_type ON case_table.case_type = crime_type.des 
    GROUP BY staffid, crime_type
";

$result = mysqli_query($dbcon, $query);
$data = [];

if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = [
            'staffid' => $row['staffid'],
            'crime_type' => $row['crime_type'],
            'case_count' => $row['case_count']
        ];
    }
} else {
    $data = ['error' => 'Query failed: ' . mysqli_error($dbcon)];
}

// Return the data in JSON format
header('Content-Type: application/json');
echo json_encode($data);
?>
