<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends Public_Controller{

  public function __construct()
  {
    parent::__construct();
    $this->load->model(array('m_user','m_group'));
    $this->load->library(array('form_validation'));
    //Codeigniter : Write Less Do More

  }

  function index()
  {
    $this->login();
  }

  public function login(){
    $ses = $this->session->is_login;
    $status = $this->session->flashdata('status');
    if(!isset($ses)){
      if(isset($status)){
        $data['status'] = $status;
      }
      $data['content'] = 'auth/login';
      $this->render("auth/login",'auth_master');
    }else{
      $dash = $this->m_group->getWhere(array('id'=>$this->session->userdata('group_id')))[0]->name;
      redirect(site_url('/admin '), 'refresh'); // use redirects instead of loading views for compatibility with MY_Controller libraries
    }

  }

  public function register(){
    $status = $this->session->flashdata('status');
    if(isset($status)){
      $data['status'] = $status;
    }
    $data['content'] = 'auth/register';
    $this->load->view('index', $data);
  }

  public function regis_user(){
    $arr_name = ['user_name','user_password','user_email','user_phone'];
    $w_email['user_email'] = $this->input->post('user_email');
    $cek_email = $this->m_user->getWhere($w_email);
    if(!empty($cek_email)){
      $this->session->set_flashdata('status', 'Email yang di masukan telah terdaftar');
      redirect('auth/register');
    }
    foreach ($arr_name as $a) {
      if($a=='user_password'){
        $data[$a] = md5($this->input->post($a));
      }else {
        $data[$a] = $this->input->post($a);
      }
    }
    $data['user_level'] = 'user';
    $res = $this->m_user->add($data);
    if($res){
      $this->session->set_flashdata('status', 'Register berhasil, silahkan login untuk melanjutkkan');
      redirect('auth/login');
    }
  }

  public function cek_user(){
    $this->form_validation->set_rules('email', 'Email', 'required');
    $this->form_validation->set_rules('password', 'Password', 'trim|required');
    if ($this->form_validation->run() == true) {
      $data['email'] = $this->input->post('email');
      $data['password'] = md5($this->input->post('password'));

      $res = $this->m_user->getWhere($data);
      $res = ($res!=null) ? $res[0] : false;

      if(!$res){
        $this->session->set_flashdata('alert', $this->alert->set_alert(Alert::DANGER, 'Email atau password salah'));
        redirect('auth/login');
      }else{
        $data = [
                  'id' => $res->id,
                  'user_name' => $res->username,
                  'user_email' => $res->email,
                  'group_id' => $res->group_id,
                  'is_login' => true

                ];
        $this->session->set_userdata($data);
        $dash = $this->m_group->getWhere(array('id'=>$this->session->userdata('group_id')))[0]->name;
        redirect(site_url('/admin/home'), 'refresh'); // use redirects instead of loading views for compatibility with MY_Controller libraries
      }

    }else{
          $this->session->set_flashdata('alert', $this->alert->set_alert(Alert::DANGER, $this->errorValidation(validation_errors())));
          redirect('auth/login');
    }

  }

  public function logout(){
    $this->session->sess_destroy();
    redirect(base_url());
  }


}
