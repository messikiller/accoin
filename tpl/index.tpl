<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ACCOIN</title>
<link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="node_modules/highcharts/css/highcharts.css">
<link rel="stylesheet" href="node_modules/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="css/master.css">
</head>
<body class="login-bg">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <span class="navbar-brand">ACCOIN</span>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse"></div>
    <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
            <a class="nav-link" href="index.php">首页 <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="user.php">用户</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="logout.php">退出</a>
        </li>
    </ul>
</nav>
<div class="container">
    <div class="row">
        <div class="col-md-12" style="margin: 15px 0;">
            <div class="card">
                <div class="card-header">
                    <span>走势图</span>
                    <select class="float-right" id="trend-duration">
                        <option value="10">10天</option>
                        <option value="30">30天</option>
                    </select>
                </div>
                <div class="card-body">
                    <div id="trend"></div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <h5 class="card-header">我要买入</h5>
                <div class="card-body">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend"><span class="input-group-text">余额：</span></div>
                        <input type="text" class="form-control" placeholder="用户编号" disabled value="0.00">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend"><span class="input-group-text">购买价格：</span></div>
                        <input type="text" class="form-control" disabled id="latest_price_in">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend"><span class="input-group-text">购买数量：</span></div>
                        <input type="text" class="form-control">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend"><span class="input-group-text">支付金额：</span></div>
                        <input type="text" class="form-control" placeholder="用户编号" disabled value="0">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend"><span class="input-group-text">二级密码：</span></div>
                        <input type="text" class="form-control">
                    </div>
                    <div class="input-group mb-3">
                        <a href="#" class="btn btn-primary btn-block">AT1支付</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <h5 class="card-header">我要卖出</h5>
                <div class="card-body">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend"><span class="input-group-text">余额：</span></div>
                        <input type="text" class="form-control" placeholder="用户编号" disabled value="100.0">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend"><span class="input-group-text">卖出数量：</span></div>
                        <input type="text" class="form-control">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend"><span class="input-group-text">卖出价格：</span></div>
                        <input type="text" class="form-control" disabled id="latest_price_out">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend"><span class="input-group-text">收益：</span></div>
                        <input type="text" class="form-control" placeholder="用户编号" disabled value="0">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend"><span class="input-group-text">二级密码：</span></div>
                        <input type="text" class="form-control">
                    </div>
                    <div class="input-group mb-3">
                        <a href="#" class="btn btn-primary btn-block">确认提交</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="node_modules/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="node_modules/highcharts/highcharts.js"></script>
<script type="text/javascript">
function load_trend()
{
    var d = $('#trend-duration').val();
    $.getJSON('api/trend.php', {duration: d}, function (res) {
        if (res.code == 200) {
            var points = res.data.points;
            var prices = res.data.prices.map(function (item) {
                return parseFloat(item);
            });

            var len = prices.length;
            var latest_price = prices[len - 1] + '元/个';
            $('#latest_price_in').val(latest_price);
            $('#latest_price_out').val(latest_price);

            Highcharts.chart('trend', {
                chart: {
                    type: 'line'
                },
                title: {
                    text: false
                },
                xAxis: {
                    categories: points
                },
                yAxis: {
                    title: {
                        text: '币价格 (元)'
                    }
                },
                plotOptions: {
                    line: {
                        dataLabels: {
                            enabled: true
                        },
                        enableMouseTracking: false
                    }
                },
                series: [{
                    name: '币价格',
                    data: prices
                }]
            });
        }
    });
}

$(function () {
    load_trend();
    $('#trend-duration').on('change', function () {
        load_trend();
    });
});
</script>
</body>
</html>
