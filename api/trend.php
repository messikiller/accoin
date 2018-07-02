<?php
$db = require_once(__DIR__ . '/../inc/db.inc.php');

$duration = intval($_GET['duration']);

$now = time();
$since = $now - $duration * 24 * 3600;

$list = $db->getAll("select * from system_k_line where show_time between {$since} and {$now} order by show_time asc");

if (empty($list)) {
    echo json_encode([
        'code' => 500,
        'data' => [],
        'msg'  => ''
    ]);
    exit();
}

$points = $prices = [];

foreach ($list as $item) {
    $points[] = date('Y-m-d', $item['show_time']);
    $prices[] = $item['price'];
}

echo json_encode([
    'code' => 200,
    'data' => [
        'points' => $points,
        'prices' => $prices
    ],
    'msg'  => ''
]);
exit();
