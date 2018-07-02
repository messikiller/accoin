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
        <li class="nav-item">
            <a class="nav-link" href="index.php">首页</a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="user.php">用户 <span class="sr-only">(current)</span></a>
        </li>
    </ul>
</nav>
<div class="container">
    <div class="row">
        <div class="col-md-12" style="margin: 15px 0;">
            <div class="card">
                <div class="card-header">
                    <span>个人信息</span>
                </div>
                <div class="card-body">
                    <form action="#" method="post">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend"><span class="input-group-text">银行卡号：</span></div>
                            <input type="text" class="form-control">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend"><span class="input-group-text">持卡人姓名：</span></div>
                            <input type="text" class="form-control">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend"><span class="input-group-text">银行名字：</span></div>
                            <input type="text" class="form-control">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend"><span class="input-group-text">开户支行：</span></div>
                            <input type="text" class="form-control">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend"><span class="input-group-text">电话号码：</span></div>
                            <input type="text" class="form-control">
                        </div>
                        <div class="input-group mb-3">
                            <button type="submit" class="btn btn-primary btn-block">提交</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="node_modules/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
