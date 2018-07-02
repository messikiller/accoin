<?php
$db = require_once('db.inc.php');

$username = $_POST['username'];
$password = $_POST['password'];

$user = $db->getOne("select password form system_member where username='{$username}'");

if (empty($user)) {
    echo json_encode([
        'code' => 500,
        'data' => [],
        'msg'  => ''
    ]);
    exit();
}

if (md5(md5($password)) != $user['password']) {
    echo json_encode([
        'code' => 500,
        'data' => [],
        'msg'  => ''
    ]);
    exit();
}

echo json_encode([
    'code' => 200,
    'data' => [],
    'msg'  => ''
]);
exit();
