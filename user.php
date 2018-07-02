<?php

session_start();

$db = require_once('inc/db.inc.php');

if (empty($_SESSION['user'])) {
    header('location:login.html');
    exit();
}

$user = $_SESSION['user'];
$uid  = $user['id'];

$banks = $db->getAll("select * from system_bank");
$member_data = $db->getRow("select * from system_member_data where user_id={$uid}");

require_once(__DIR__.'/tpl/user.tpl');
