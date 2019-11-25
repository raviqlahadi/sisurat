<?php defined('BASEPATH') OR exit('No direct script access allowed');

class MY_Controller extends CI_Controller {

    protected $data = array();

    public function __construct(){
       parent::__construct();
    }

    protected function render($the_view = NULL, $template = NULL){
    		if($template == 'json' || $this->input->is_ajax_request()){
    			header('Content-Type: application/json');
    			echo json_encode($this->data);
    		}
    		elseif(is_null($template)){
    			$this->load->view($the_view, $this->data );
    		}else{
    			$this->data['the_view_content'] = (is_null($the_view)) ? '' : $this->load->view($the_view, $this->data, TRUE);
    			$this->load->view('templates/V_' . $template . '', $this->data);
    		}
		 }

	public function setPagination($pagination){
		$config['base_url'] = $pagination['base_url'];
		$config['total_rows'] = $pagination['total_records'];
		$config['per_page'] = $pagination['limit_per_page'];
		$config["uri_segment"] = $pagination['uri_segment'];

		// custom paging configuration
		$config['num_links'] = 5;
		$config['use_page_numbers'] = TRUE;
		$config['reuse_query_string'] = TRUE;

		$config['full_tag_open'] = '<ul class="pagination">';
		$config['full_tag_close'] = '</ul>';
		$config['first_link'] = 'Awal';
		$config['last_link'] = 'Akhir';
		$config['first_tag_open'] = '<li>';
		$config['first_tag_close'] = '</li>';
		$config['prev_link'] = '&laquo';
		$config['prev_tag_open'] = '<li class="prev">';
		$config['prev_tag_close'] = '</li>';
		$config['next_link'] = '&raquo';
		$config['next_tag_open'] = '<li>';
		$config['next_tag_close'] = '</li>';
		$config['last_tag_open'] = '<li>';
		$config['last_tag_close'] = '</li>';
		$config['cur_tag_open'] = '<li class="active"><a href="#">';
		$config['cur_tag_close'] = '</a></li>';
		$config['num_tag_open'] = '<li>';
		$config['num_tag_close'] = '</li>';

		$this->pagination->initialize($config);

		// build paging links
		return $this->pagination->create_links();
	}

	public function setBreadcrumb(){
		$uri_string = uri_string();
		$uri_string = explode('/',$uri_string);
		$bc =  '  <ol class="breadcrumb" style="padding:0!important">';
		$url = '';
		foreach ($uri_string as $key => $value) {
			if($value!='index'&&!is_numeric($value)){
				if($key!==sizeof($uri_string)-1){
					$url = $url.$value.'/'; 
					$bc = $bc.'<li><a href="'.site_url($url).'">'.str_replace("_"," ",$value).'</a></li>';
				}else{
					$bc =  $bc.'<li class="active">'.str_replace("_"," ",$value).'</li>'; 
				}
			};
		}	         
		 $bc = $bc.'</ol>';
		 return $bc;
	}

    public function errorValidation($error){
      $alert = str_replace('<p>','<li>',$error);
      $alert = str_replace('</p>','</li>',$alert);
      $alert = "<ul>".$alert."</ul>";
      return $alert;
    }

    public function getMenu(){
      $this->load->model(array('m_menu','m_group_access'));
      $group = $this->session->userdata('group_id');
      $menu = [];
      $access = $this->m_group_access->getWhere(array('group_id'=>$group));
	  //var_dump($access);
      foreach ($access as $key => $value) {
		
        array_push($menu, $this->m_menu->getWhere(array('id'=>$value->menu_id,'status'=>1))[0]);
      }
      foreach ($menu as $km => $vm) {
        $vm->submenu = $this->m_menu->getWhere(array('parent_id'=>$vm->id,'status'=>1));
      }
      return $menu;
    }

}

class User_Controller extends MY_Controller{

    public function __construct(){
	     parent::__construct();
  	   if( !$this->ion_auth->logged_in()){
		     $this->session->set_flashdata('alert', $this->alert->set_alert( Alert::DANGER,  $this->lang->line('login_not_login')  ) );
		     redirect(site_url('/auth/login'));
  	   }
    }

    protected function render($the_view = NULL, $template = 'user_master'){
  		parent::render($the_view, $template);
  	}

}

class Admin_Controller extends MY_Controller{
    public function __construct(){
      parent::__construct();
    	if($this->session->is_login!=true){
    		$this->session->set_flashdata('alert', $this->alert->set_alert( Alert::DANGER, $this->lang->line('login_must_admin') ) );
    		redirect(site_url('/auth/login'));
    	}else{
        $this->data['menu'] = parent::getMenu();
      }
    }

    protected function render($the_view = NULL, $template = 'admin_master'){
  		parent::render($the_view, $template);
  	}

}

class Public_Controller extends MY_Controller{

  function __construct(){
		parent::__construct();
  }

  protected function render($the_view = NULL, $template = 'public_master'){
		parent::render($the_view, $template);
	}

}
