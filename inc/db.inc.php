<?php
require_once(__DIR__ .'/Mysql.class.php');

$config = require_once(__DIR__ .'/../config.php');

return Mysql::getInstance($config);
