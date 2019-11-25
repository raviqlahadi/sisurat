<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_count extends CI_Model{

  public function __construct()
  {
    parent::__construct();
    //Codeigniter : Write Less Do More
  }

  public function counts($table){
    if($table==null){
      return false;
    }

    $query = $this->db->count_all($table);
    return $query;

  }

}
