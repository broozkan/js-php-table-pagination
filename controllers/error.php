<?php
/**
*
*/
class Error extends Controller
{

  function __construct()
  {
    parent::__construct();

    $this->view->render('Error/');
  }

}

?>
