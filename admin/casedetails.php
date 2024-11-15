<?php 
// Include database connection and headers
include('dbconnect.php');
include('header.php');

// Retrieve case ID and status from the GET parameters
$get_id = $_GET['id'];
$status = $_GET['status'];

?>

<style>
.red { color: red; }
.green { color: green; }
</style>

<br />

<div class="container-fluid">
    <?php include('menubar.php');?>
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <a href="#" onClick="window_print()" class="btn btn-info" style="margin-bottom:20px"><i class="icon-print icon-large"></i> Print</a>
        <a href="investigation.php?edit=<?php echo $get_id; ?>" class="btn btn-info" style="margin-bottom:20px"><i class="icon-pencil icon-large"></i> Investigation Statement</a>
        <a href="assigncase.php?caseid=<?php echo $get_id; ?>" class="btn btn-info" style="margin-bottom:20px"><i class="icon-pencil icon-large"></i> <?php if($status == '' or $status == 'Not Yet'){ echo 'Assign This Case to CID Officer'; } else { echo 'Change CID Officer'; } ?></a>

        <div class="panel panel-success" id="outprint">
            <div class="panel-heading">
                <h3 class="panel-title">Case Details</h3>
            </div>
            <div class="panel-body">
                <?php
                $query = mysqli_query($dbcon, "SELECT * FROM case_table WHERE case_id='$get_id'");
                $row = mysqli_fetch_array($query);
                $highlightClass = htmlspecialchars($row['highlight']);
                ?>
                <table class="table">
                    <tr class="<?php echo $highlightClass; ?>">
                        <td>Case Number:</td><td><?php echo htmlspecialchars($row['case_id']); ?></td>
                    </tr>
                    <tr class="<?php echo $highlightClass; ?>">
                        <td>Crime Type:</td><td><?php echo htmlspecialchars($row['case_type']); ?></td>
                    </tr>
                    <tr>
                        <td>Time Reported:</td><td><?php echo htmlspecialchars($row['date_added']); ?></td>
                    </tr>
                    <tr>
                        <td>NCO:</td><td><?php echo htmlspecialchars($row['staffid']); ?></td>
                    </tr>
                    <tr>
                        <td>CID:</td><td><?php echo htmlspecialchars($row['cid']); ?></td>
                    </tr>
                    <tr class="<?php echo $highlightClass; ?>">
                        <td>Status:</td><td><?php echo htmlspecialchars($row['status']); ?></td>
                    </tr>
                </table>

                <!-- Additional details can be loaded here -->
            </div>
        </div>

        <center>
            <a href="caseview.php" class="btn btn-success">Return Home
                <span class="glyphicon glyphicon-backward" aria-hidden="true"></span>
            </a>
        </center>
    </div>
    <div class="col-md-2"></div>
</div>

<?php include('scripts.php'); ?>

<script type="text/javascript">
    function window_print() {
        var _head = $('head').clone();
        var _print = $('#outprint').clone();
        var _html = $('<div>');
        _html.append("<head>" + _head.html() + "</head>");
        _html.append("<h3 class='text-center'>CRIME RECORDS MANAGEMENT SYSTEM</h3>");
        _html.append(_print);
        var nw = window.open("", "_blank", "width=900,height=800");
        nw.document.write(_html.html());
        nw.document.close();
        nw.print();
        setTimeout(() => { nw.close(); }, 500);
    }
</script>
</body>
</html>
