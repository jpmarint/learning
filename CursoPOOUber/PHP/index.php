<?php

require_once('Car.php');
require_once('Account.php');
require_once('uberX.php');

$car = new Car("MWR244", new Account("Juan Pablo Marin", "1144211562"));
$car -> PrinCarData();

$uberX =  new UberX("MWR244", new Account("Juan Pablo Marin", "1144211562"), "Chevrolet", "Spark");
$uberX -> PrinCarData();


?>