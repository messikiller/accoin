<?php

session_start();

$db = require_once('inc/db.inc.php');

if (empty($_SESSION['user'])) {
    header('location:login.html');
    exit();
}

$uid = $_SESSION['user']['id'];

if (empty($_POST['bank_id']) || empty($_POST['bank_name']) || empty($_POST['name'])
    || empty($_POST['card_number']) || empty($_POST['bank_address'])
) {
    header('location:user.php');
    exit();
}

$update = [
    'bank_id' => intval($_POST['bank_id']),
    'user_id' => $uid,
    'bank_name' => strval($_POST['bank_name']),
    'name' => strval($_POST['name']),
    'card_number' => strval($_POST['card_number']),
    'bank_address' => strval($_POST['bank_address']),
];

$data = $db->getRow("select * from system_member_data where user_id='{$uid}'");

if (empty($data)) {
    $update['add_time'] = time();
    $db->insert('system_member_data', $update);
} else {
    $db->update('system_member_data', $update, "user_id={$uid}");
}

header('location:user.php');
exit();