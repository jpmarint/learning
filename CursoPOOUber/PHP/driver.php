<?php

require_once("Account.php");
class Driver extends Account{
    public function __construct($name, $document, $email, $password){
        parent::__construct($name, $document, $email, $password);
    }
    
    public function printDataDriver()
    {
        echo "Driver";
        echo "<br>";
        echo "Name: $this->name Document: $this->document email: $this->email password: $this->password";
        echo "<br>";
    }
}

?>