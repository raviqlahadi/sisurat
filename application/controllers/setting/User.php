<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends Admin_Controller {

    private $name = null;
    private $parent_page = 'setting';
    private $current_page = 'setting/user';
    private $form_data = null;
    private $data_type = null;
    private $label = null;
    private $block_header = "user management";

    public function __construct(){
        parent::__construct();
        $this->name = $this->attribute();
        $this->data_type = $this->data_type();
        $this->label = $this->label();
        $this->form_data = $this->form_data();
        $this->label = $this->label();
        $this->load->model(array('m_user'));
      
    }


    public function index(){
        //basic variable
        $key = $this->input->get('key');
        $filter = $this->input->get('filter');
        
        $limit = $this->input->get('limit');
        $page = ($this->uri->segment(4)) ? ($this->uri->segment(4) - 1) : 0;
        $tabel_cell =  ['id','username','email','first_name','last_name','group_name'];
        //pagination parameter
        $pagination['base_url'] = base_url($this->current_page) .'/index';
        $pagination['limit_per_page'] = ($limit!=null&&$limit!='') ? $limit : 10;
        $pagination['start_record'] = $page*$pagination['limit_per_page'];
        $pagination['uri_segment'] = 4;
        
        
       //fetch data from database
        $fetch['select'] = ['id','username','email','first_name','last_name','group_id'];
        $fetch['select_join'] = ['table_groups.name as group_name'];
        $fetch['join'] = [array('table'=>'table_groups','id'=>'group_id','join'=>'left')];
        $fetch['start'] = $pagination['start_record'];
        $fetch['limit'] = $pagination['limit_per_page'];
        $fetch['like'] = ($key!=null&&$key!='') ? array("name" => array(
          'table_users.username', 
          'table_users.first_name',
          'table_users.last_name'
            ), "key" => $key) : null;
        $fetch['order'] = array("field"=>"table_users.id","type"=>"ASC");
        if($filter!=null&&$filter!='') $fetch['where'] = array('table_users.group_id'=>$filter);
        $for_table = $this->m_user->fetch($fetch);
        
        $pagination['total_records'] =  $this->m_user->fetch($fetch, true);
        //set pagination
        //var_dump($pagination);
        if ($pagination['total_records']>0) $this->data['links'] = $this->setPagination($pagination);

        //set breadcrumb
        $this->data['breadcrumb'] = $this->setBreadcrumb();

        //get flashdata
        $alert = $this->session->flashdata('alert');
        $this->data["key"] = ($key!=null&&$key!='') ? $key : false;
        $this->data["alert"] = (isset($alert)) ? $alert : NULL ;
        $this->data["for_table"] = $for_table;
        $this->data["total_data"] = $pagination['total_records'];
        $this->data["table_header"] = $this->tabel_header($tabel_cell);
        $this->data["number"] = $pagination['start_record'];
        $this->data['parent_page'] = $this->parent_page;
        $this->data["current_page"] = $this->current_page;
        $this->data["block_header"] = $this->block_header;
        $this->data["header"] = "tabel user";
        $this->data["sub_header"] = 'klik tombol aksi untuk melakukan melakukan aksi lain';

        $this->render( "setting/user/content");
    }


    public function create(){
      if($this->input->post()!=null){
        $this->form_validation->set_rules($this->validation_config());
        if($this->form_validation->run() === TRUE){
            $input_data = $this->input->post();
            $insert = $this->insert($input_data);
            if($insert){
              $this->session->set_flashdata('alert', $this->alert->set_alert(Alert::SUCCESS, 'Input data berhasil'));
              redirect($this->current_page);
            }else{
              $form = $this->form_data();
            }
        }else {
          $alert = $this->errorValidation(validation_errors());
          $this->data['alert'] = $this->alert->set_alert(Alert::WARNING, $alert);
          $form = $this->form_data();
        }
      }else{
        $form = $this->form_data;
      }
      $this->data['breadcrumb'] = $this->setBreadcrumb();
      $this->data['form_data'] = $form;
      $this->data['form_action'] = site_url($this->current_page.'/create');
      $this->data['name'] = $this->name;
      $this->data['parent_page'] = $this->current_page;
      $this->data["block_header"] = $this->block_header;
      $this->data["header"] = "tambah user";
      $this->data["sub_header"] = 'tekan tombol simpan ketika telah memasukan data';
      $this->render( "setting/user/create");
    }

    public function insert($data) {
      $insert = $this->m_user->add($data);
      return $insert;
    }

    public function edit($id=null){
      if($id==null){
        redirect($this->current_page);
      }
      $w['id'] = $id;
      $form_value = $this->m_user->getWhere($w);
      if($form_value==false){
        redirect($this->current_page);
      }else{
        $form_value = $form_value[0];
      }

      if($this->input->post()!=null){
        $this->form_validation->set_rules($this->validation_config(true));
        if($this->form_validation->run() === TRUE){
            $input_data = $this->input->post();
            $update = $this->update($id, $input_data);
            if($update){
              $this->session->set_flashdata('alert', $this->alert->set_alert(Alert::SUCCESS, 'Update data berhasil'));
              redirect($this->current_page);
            }else{
              $form = $this->form_data();
            }
        }else{
          $alert = $this->errorValidation(validation_errors());
          $this->data['alert'] = $this->alert->set_alert(Alert::WARNING, $alert);
          $form = $this->form_data();
        }
      }else{
        $form = $this->form_data($form_value);
      }

     
      $this->data['breadcrumb'] = $this->setBreadcrumb();
      $this->data['form_data'] = $form;
      $this->data['form_action'] = site_url($this->current_page.'/edit/'.$id);
      $this->data['name'] = $this->name;
      $this->data['parent_page'] = $this->current_page;
      $this->data["block_header"] = $this->block_header;
      $this->data["header"] = "ubah user";
      $this->data["sub_header"] = 'silahkan ubah data yang ingin anda ganti';
      $this->render( "setting/user/edit");
    }

    public function update($id, $data) {
      $insert = $this->m_user->update($id, $data);
      return $insert;
    }


    public function detail($id=null){
      if($id==null){
        redirect($this->current_page);
      }
      $w['id'] = $id;
      $form_value = $this->m_user->getWhere($w);
      if($form_value==false){
        redirect($this->current_page);
      }else{
        $form_value = $form_value[0];
      }

      $this->data['breadcrumb'] = $this->setBreadcrumb();
      $this->data['form_data'] = $this->form_data($form_value);
      $this->data['parent_page'] = $this->current_page;
      $this->data['name'] = $this->name;
      $this->data['detail'] = true;
      $this->data["block_header"] = $this->block_header;
      $this->data["header"] = "detail user";
      $this->data["sub_header"] = 'halaman Ini Hanya Berisi Informasi Detail Dari Data';
      $this->render("setting/user/detail");
    }

    public function delete($id) {
      if($id==null){
        redirect($this->current_page);
      }
      $w['id'] = $id;
      $delete = $this->m_user->delete($w);
      if($delete!=false){
        $this->session->set_flashdata('alert', $this->alert->set_alert(Alert::SUCCESS, 'Delete data berhasil'));
        redirect($this->current_page);
      }else{
        $this->session->set_flashdata('alert', $this->alert->set_alert(Alert::WARNING, 'Terjadi Kesalahan'));
        redirect($this->current_page);
      }

    }

    private function attribute(){
      return [
      "id", "username", "password", "email", "first_name", "last_name", "phone", "group_id"
      ];
    }

    private function label(){
      $name = $this->name;
      $label = [
        'id Kata',
        'user name',
        'password',
        'email',
        'nama depan',
        'nama belakang',
        'telepon',
        'grups user'
      ];
      $label_arr = array();
      foreach ($name as $key => $value) {
        $label_arr[$value] = $label[$key];
      }
      $label_arr['group_name'] = 'grup user';
      $label_arr['dialect_name'] = 'dialek';
    
      return $label_arr;
    }

    private function data_type(){
      $name = $this->name;
      $type = [
        'number',
        'text',
        'password',
        'email',
        'text',
        'text',
        'text',
        'select'
      ];
      $type_arr = array();
      foreach ($name as $key => $value) {
        $type_arr[$value] = $type[$key];
      }
      return $type_arr;
    }

    private function validation_config($edit=false){
        $arr_con = [];
        $name = $this->name;
        unset($name[0]);
        foreach ($name as $key => $value) {
            switch ($value) {
              case 'email':
                  $unique = ($edit) ? null : '|is_unique[table_users.email]';
                  $arr = array(
                      'field' => $value,
                      'label' => $this->label[$value],
                      'rules' =>  'trim|required'.$unique,
                      'errors' => array(
                                  'required' => 'Field %s tidak boleh kosong  .',
                          )
                    );
                break;
               case 'username':
                  $unique = ($edit) ? null : '|is_unique[table_users.username]';
                  $arr = array(
                      'field' => $value,
                      'label' => $this->label[$value],
                      'rules' =>  'trim|required'.$unique,
                      'errors' => array(
                                  'required' => 'Field %s tidak boleh kosong  .',
                          )
                    );
                break;
              
              default:
                 $arr = array(
                    'field' => $value,
                    'label' => $this->label[$value],
                    'rules' =>  'trim|required',
                    'errors' => array(
                                'required' => 'Field %s tidak boleh kosong  .',
                        )
                  );
                break;
            }
            array_push($arr_con, $arr);
        }

    		return $arr_con;
  	}

    private function form_data($form_value=null){
        
        $select['group_id'] = $this->getGroupUser();
        
        $name = $this->name; 
        unset($name[0]);
    		foreach ($name as $key => $value) {
          if($form_value!=null){
            $val = $form_value->{$value};
          }else{
            $val = $this->form_validation->set_value($value);
          }
          switch ($this->data_type[$value]) {
            case 'select':
              $data[$value] = array(
                'name' => $value,
                'label' => $value,
                'id' => $value,
                'type' => $this->data_type[$value],
                'placeholder' => $this->label[$value],
                'option' => $select[$value],
                'class' => 'form-control show-tick',
                'data-live-search' => "true",
                'value' => $val,
              );
              break;

            default:
              $data[$value] = array(
                'name' => $value,
                'label' => $value,
                'id' => $value,
                'type' => $this->data_type[$value],
                'placeholder' => $this->label[$value],
                'class' => 'form-control',
                'value' => $val,
              );
              break;
          }

        };


    		return $data;
  	}

    private function tabel_header($arr){
      $label = [];
      foreach ($arr as $key => $value) {
        $label[$value] = $this->label[$value];
      }
      if(isset($label['id'])) unset($label['id']);
      return $label;
    }

   
    private function getGroupUser(){
      $this->load->model(array('m_group'));
      $all_type =  $this->m_group->get();
      foreach ($all_type as $key => $value) {
        $arr[$value->id] = $value->name;
      }
      return $arr;
    }

   

}
