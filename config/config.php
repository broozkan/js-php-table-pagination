<?php

  /*
   * includes your db and special informations
   */

  class Config extends Controller
  {

    public $dbAddress = '89.252.187.152';
    public $dbName = 'brosoftc_bro-jsphp-table';
    public $dbUsername = 'brosoftc_bro-jsphp-table';
    public $dbPassword = 'sfrSFR135.';


    public function getDbInformation()
    {
      return array(
        'db_address'=>$this->dbAddress,
        'db_name'=>$this->dbName,
        'db_username'=>$this->dbUsername,
        'db_password'=>$this->dbPassword
      );
    }



  }



?>
