<?php
/**
 *
 */
class View extends Controller
{

  function __construct()
  {

  }

  public function render($name)
  {
      require 'views/'.$name.'/index.php';

  }
}
