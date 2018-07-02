<?php

session_start();

$db = require_once('inc/db.inc.php');

$username = $_POST['username'];
$password = $_POST['password'];

if (empty($username) || empty($password)) {
    header('location:login.html');
    exit();
}

$user = $db->getRow("select * from system_member where username='{$username}'");

if ($user['password'] != md5(md5($password))) {
    header('location:login.html');
    exit();
}

$_SESSION['user'] = $user;

header('location:index.php');
exit();
