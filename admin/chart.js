<div class="container">
    <h3>Cases Assigned to Each Officer</h3>
    <canvas id="caseChart"></canvas>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const ctx = document.getElementById('caseChart').getContext('2d');

    const caseChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: officerNames,
            datasets: [{
                label: 'Number of Cases',
                data: caseCounts,
                backgroundColor: 'rgba(75, 192, 192, 0.6)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            plugins: {
                legend: {
                    display: true,
                    position: 'top'
                },
                title: {
                    display: true,
                    text: 'Number of Cases Assigned to Each Officer'
                }
            }
        }
    });
});
</script>
