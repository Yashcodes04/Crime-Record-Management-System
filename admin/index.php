<?php 
include('header.php');
include('dbconnect.php');

// Fetch the total number of cases from case_count table
$totalCasesResult = mysqli_query($dbcon, "SELECT total_cases FROM case_count LIMIT 1");
$totalCases = 0;
if ($row = mysqli_fetch_assoc($totalCasesResult)) {
    $totalCases = $row['total_cases'];
}
?>

<div class="container-fluid" style="margin-top: 80px;">
    <?php include('menubar.php') ?>
    <div class="col-md-1"></div>
</div>

<div class="container-fluid">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <div class="panel panel-inverse">
            <div class="panel-body">
                <h2>BANGALORE POLICE SERVICE</h2>
                <!-- Display the total number of cases -->
                <h4>Total Cases: <?php echo $totalCases; ?></h4>
            </div>
        </div>
    </div>
    <div class="col-md-2"></div>
</div>

<?php include('scripts.php'); ?>
</body>
</html>
