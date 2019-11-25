<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Menu extends Admin_Controller {

    private $name = null;
    private $parent_page = 'setting';
    private $current_page = 'setting/menu';
    private $form_data = null;
    private $data_type = null;
    private $label = null;
    private $block_header='menu management';

    public function __construct(){
        parent::__construct();
        $this->name = $this->attribute();
        $this->data_type = $this->data_type();
        $this->label = $this->label();
        $this->form_data = $this->form_data();
        $this->label = $this->label();
        $this->load->model(array('m_menu'));
        
    }


    public function index(){
        //basic variable
        $key = $this->input->get('key');
        $limit = $this->input->get('limit');
        $page = ($this->uri->segment(4)) ? ($this->uri->segment(4) - 1) : 0;
        $tabel_cell =  ['id','icon','name','link','description','status'];
        //pagination parameter
        $pagination['base_url'] = base_url($this->current_page) .'/index';
        $pagination['limit_per_page'] = ($limit!=null&&$limit!='') ? $limit : 10;
        $pagination['start_record'] = $page*$pagination['limit_per_page'];
        $pagination['uri_segment'] = 4;
        


        //fetch data from database
       //fetch data from database
        $fetch['select'] = ['id','name','link','icon','description','status','parent_id'];
        $fetch['select_join'] = ['m.name as parent_name'];
        $fetch['join'] = [array('table'=>'table_menus m','id'=>'parent_id','join'=>'left','previx'=>'m')];
        $fetch['start'] = $pagination['start_record'];
        $fetch['limit'] = $pagination['limit_per_page'];
        $fetch['like'] = ($key!=null&&$key!='') ? array("name" => array('table_menus.name', 'table_menus.description'), "key" => $key) : null;
        $fetch['order'] = array("field"=>"table_menus.id","type"=>"ASC");
        $for_table = $this->m_menu->fetch($fetch);

        $pagination['total_records'] =  $this->m_menu->fetch($fetch, true);
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
        $this->data["table_header"] = $this->tabel_header($tabel_cell);
        $this->data["total_data"] = $pagination['total_records'];
        $this->data["number"] = $pagination['start_record'];
        $this->data['parent_page'] = $this->parent_page;
        $this->data["current_page"] = $this->current_page;
        $this->data["block_header"] = $this->block_header;
        $this->data["header"] = "table menu";
        $this->data["sub_header"] = 'klik tombol action untuk aksi lebih lanjut';
      

        $this->render( "setting/menu/content");
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
      $this->data["block_header"] = "menu management";
      $this->data["header"] = $this->block_header;
      $this->data["sub_header"] = 'tekan tombol simpan ketika selesai mengisi form';
      $this->render( "setting/menu/create");
    }

    public function insert($data) {
      $insert = $this->m_menu->add($data);
      return $insert;
    }

    public function edit($id=null){
      if($id==null){
        redirect($this->current_page);
      }
      $w['id'] = $id;
      $form_value = $this->m_menu->getWhere($w);
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
      $this->data["header"] = "ubah menu";
      $this->data["sub_header"] = 'silahkan ubah data yang ingin anda ganti';
      $this->render( "setting/menu/edit");
    }

    public function update($id, $data) {
      $insert = $this->m_menu->update($id, $data);
      return $insert;
    }


    public function detail($id=null){
      if($id==null){
        redirect($this->current_page);
      }
      $w['id'] = $id;
      $form_value = $this->m_menu->getWhere($w);
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
      $this->data["header"] = "detail menu";
      $this->data["sub_header"] = 'halaman ini hanya berisi informasi detail dari data';
      $this->render("setting/menu/detail");
    }

    public function delete($id) {
      if($id==null){
        redirect($this->current_page);
      }
      $w['id'] = $id;
      $delete = $this->m_menu->delete($w);
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
      "id", "parent_id", "name", "link", "icon", "status", "attribute", "description"
      ];
    }

    private function label(){
      $name = $this->name;
      $label = [
        "Id", "parent menu", "menu", "link", "icon", "status", "attribute",  "keterangan"
      ];
      $label_arr = array();
      foreach ($name as $key => $value) {
        $label_arr[$value] = $label[$key];
      }
      $label_arr['parent_name'] = 'Parent menu';
    
      return $label_arr;
    }

    private function data_type(){
      $name = $this->name;
      $type =   ["number", "select", "name", "link", "text", "select", "text", "text"];
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
              case 'link':
                  $unique = ($edit) ? null : '|is_unique[table_menus.link]';
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
        
        $select['parent_id'] = $this->getParent();
        $select['status'] = array('non-active','active');
        
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

   
    private function getParent(){
      $this->load->model(array('m_menu'));
      $all_type =  $this->m_menu->getWhere(['parent_id'=>0]);
      $arr[0] = 'menu Utama';
      foreach ($all_type as $key => $value) {
        $arr[$value->id] = $value->name;
      }
      return $arr;
    }

   

}