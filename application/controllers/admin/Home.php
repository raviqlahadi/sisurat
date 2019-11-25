<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends Admin_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model(array('m_count'));
		
	}
	public function index()
	{
		
		$this->data['count_words'] = $this->m_count->counts('table_menus');
		$this->data['count_languages'] = $this->m_count->counts('table_users');
		// $this->data['count_sliders'] = $this->m_count->counts('table_sliders');
		// $this->data['count_phonelists'] = $this->m_count->counts('table_phonelists');
		$this->data[ "page_title" ] = "Beranda";
		$this->render( "admin/dashboard/content" );
	}
}
