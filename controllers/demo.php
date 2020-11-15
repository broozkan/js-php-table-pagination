<?php
/**
*
*/
class Demo extends Controller
{

  function __construct()
  {
    parent::__construct();

    $this->view->render('Demo/');
  }

}

?>
