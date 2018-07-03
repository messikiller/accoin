<?php

session_start();
$db = require_once('inc/db.inc.php');

if (empty($_SESSION['user'])) {
    header('location:login.html');
    exit();
}

$uid = $_SESSION['user']['id'];

$user = $db->getRow("select * from system_member where id='{$uid}'");

require_once(__DIR__.'/tpl/index.tpl');
