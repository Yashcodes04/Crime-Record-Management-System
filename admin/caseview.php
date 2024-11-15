<?php 
include('dbconnect.php');
include('header.php');
?>

<style>
    .green-text { color: green; }
    .red-text { color: red; }
</style>

<br />

<div class="container-fluid">
    <?php include('menubar.php'); ?>
    <div class="col-md-1"></div>
    <div class="col-md-8">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">Case List</h3>
            </div>
            <div id="trans-table">
                <table id="myTable-trans" class="table table-bordered table-hover" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>S/N</th>
                            <th>Case Number</th>
                            <th><center>Crime Type</center></th>
                            <th><center>Time Reported</center></th>
                            <th><center>NCO</center></th>
                            <th><center>CID</center></th>
                            <th><center>Investigation Status</center></th>
                            <th><center>Action</center></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $sn = 0;
                        $query = mysqli_query($dbcon, "SELECT case_id, case_type, date_added, staffid, cid, status, highlight FROM case_table");
                        while ($row = mysqli_fetch_array($query)) {
                            $id = $row['case_id'];
                            $sn++;
                        ?>
                        <tr>
                            <td><?php echo $sn; ?></td>
                            <td><?php echo htmlspecialchars($row['case_id']); ?></td>
                            <td class="<?php echo ($row['highlight'] === 'red') ? 'red-text' : ''; ?>">
                                <?php echo htmlspecialchars($row['case_type']); ?>
                            </td>
                            <td><?php echo htmlspecialchars($row['date_added']); ?></td>
                            <td><?php echo htmlspecialchars($row['staffid']); ?></td>
                            <td><?php echo htmlspecialchars($row['cid']); ?></td>
                            <td class="<?php echo ($row['highlight'] === 'green') ? 'green-text' : ''; ?>">
                                <?php echo htmlspecialchars($row['status']); ?>
                            </td>
                            <td class="empty" width="">
                                <a data-placement="left" title="Click to view" id="view<?php echo $id; ?>" href="casedetails.php?id=<?php echo $id; ?>&status=<?php echo urlencode($row['status']); ?>" class="btn btn-success">Details<i class="icon-pencil icon-large"></i></a>
                            </td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-md-1"></div>
</div>

<!-- Chart Section -->
<div class="container">
    <canvas id="casesChart" width="400" height="50"></canvas>
</div>

<!-- Table Section Using Stored Procedure -->
<div class="container">
    <h3>Cases by Staff and Crime Type</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Staff ID</th>
                <th>Crime Type</th>
                <th>Case Count</th>
            </tr>
        </thead>
        <tbody>
            <?php
            // Call the stored procedure to get cases by staff and crime type
            if ($result = mysqli_query($dbcon, "CALL GetCasesByStaffAndCrimeType()")) {
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<tr>";
                    echo "<td>" . htmlspecialchars($row['staffid']) . "</td>";
                    echo "<td>" . htmlspecialchars($row['crime_type']) . "</td>";
                    echo "<td>" . htmlspecialchars($row['case_count']) . "</td>";
                    echo "</tr>";
                }
                mysqli_free_result($result);
                mysqli_next_result($dbcon); // Reset for additional queries
            } else {
                echo "<tr><td colspan='3'>Error: " . mysqli_error($dbcon) . "</td></tr>";
            }
            ?>
        </tbody>
    </table>
</div>



<!-- Chart Section -->
<div class="container">
    <h3>Number of Cases by Staff and Crime Type</h3>
    <canvas id="staffCrimeChart"></canvas>
</div>

<?php 
// Fetch data for the chart, grouping by staffid and crime type
$query = "
    SELECT staffid, ct.des AS crime_type, COUNT(c.case_id) AS case_count
    FROM case_table c
    JOIN crime_type ct ON c.case_type = ct.des
    GROUP BY staffid, ct.des";
$result = mysqli_query($dbcon, $query);

// Initialize arrays to store data
$staff_cases = [];
while ($row = mysqli_fetch_assoc($result)) {
    $staff_cases[$row['staffid']][$row['crime_type']] = $row['case_count'];
}

// Extract staff IDs, crime types, and counts
$staff_ids = array_keys($staff_cases);
$crime_types = array_unique(array_merge(...array_map('array_keys', $staff_cases)));
$chart_data = [];

foreach ($crime_types as $type) {
    $counts = [];
    foreach ($staff_ids as $staffid) {
        $counts[] = $staff_cases[$staffid][$type] ?? 0;
    }
    $chart_data[] = [
        'label' => $type,
        'data' => $counts,
        'backgroundColor' => 'rgba(' . rand(50,200) . ',' . rand(50,200) . ',' . rand(50,200) . ', 0.6)'
    ];
}

// Pass PHP data to JavaScript
?>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const staffIds = <?php echo json_encode($staff_ids); ?>;
    const chartData = <?php echo json_encode($chart_data); ?>;

    document.addEventListener("DOMContentLoaded", function() {
        const ctx = document.getElementById('staffCrimeChart').getContext('2d');
        const staffCrimeChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: staffIds,
                datasets: chartData
            },
            options: {
                scales: {
                    x: {
                        stacked: false
                    },
                    y: {
                        beginAtZero: true,
                        stacked: true
                    }
                },
                plugins: {
                    legend: {
                        display: true,
                        position: 'left'
                    },
                    title: {
                        display: true,
                        text: 'Number of Cases by Staff and Crime Type'
                    }
                }
            }
        });
    });
</script>

<?php include('scripts.php'); ?>

<script type="text/javascript">
$(document).ready(function() {
    $('#myTable-trans').DataTable();
});
</script>
</body>
</html>
