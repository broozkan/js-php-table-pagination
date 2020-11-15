<?php
/**
*
*/
class Model extends Controller
{



  function __construct()
  {
    parent::__construct();
    try {


      require $_SERVER["DOCUMENT_ROOT"].'/config/config.php';
      $config = new Config();
      $dbInformations = $config->getDbInformation();

      $this->dbh = new PDO('mysql:host='.$dbInformations["db_address"].';dbname='.$dbInformations["db_name"].';charset=utf8', $dbInformations["db_username"], $dbInformations["db_password"]);
    } catch (PDOException $e) {
      echo "Hata! :".$e->getMessage()."";
      die();
    }


  }

}

?>
