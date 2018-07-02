<?php

session_start();

if (empty($_SESSION['user'])) {
    header('location:login.html');
    exit();
}

$user = $_SESSION['user'];

require_once('index.html');
