<?php
/**
 *
 */
class App
{

  function __construct()
  {

    @$url = $_GET["url"];
    $url = rtrim($url, '/');
    $url = explode("/",$url);
    if (!$url[0]) {
      $url[0] = "demo";
    }
    $file = "./controllers/".$url[0].".php";

    if(file_exists($file)){
      require $file;
    }
    
    $url = str_replace("-","",$url);

    $controller = new $url[0];
    if(isset($url[2])){
      $controller->{$url[1]}($url[2]);
    }else {
      if (isset($url[1])) {
        $controller->{$url[1]}();
      }
    }
  }
}
