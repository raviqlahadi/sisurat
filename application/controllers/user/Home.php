<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends User_Controller {

	public function index()
	{
		// TODO : halaman dashbord untuk user yang sudah terdaftar 
		$this->data[ "page_title" ] = "User";
		$this->render( "user/dashboard/content" );
	}
}