<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Status extends Admin_Controller {

    private $name = null;
    private $parent_page = 'admin';
    private $current_page = 'admin/status';
    private $form_data = null;
    private $data_type = null;
    private $label = null;
    private $block_header = "status management";

    public function __construct(){
        parent::__construct();
        $this->name = $this->attribute();
        $this->data_type = $this->data_type();
        $this->label = $this->label();
        $this->form_data = $this->form_data();
        $this->label = $this->label();
        $this->load->model(array('m_status'));
        
    }


    public function index(){
        //basic variable
        $key = $this->input->get('key');
        $limit = $this->input->get('limit');
        $page = ($this->uri->segment(4)) ? ($this->uri->segment(4) - 1) : 0;
        $tabel_cell =  ['id','name','description','type','color'];
        //pagination parameter
        $pagination['base_url'] = base_url($this->current_page) .'/index';
        $pagination['limit_per_page'] = ($limit!=null&&$limit!='') ? $limit : 10;
        $pagination['start_record'] = $page*$pagination['limit_per_page'];
        $pagination['uri_segment'] = 4;
        


        //fetch data from database
       //fetch data from database
        $fetch['select'] = ['id','name','description','type','color'];
        $fetch['start'] = $pagination['start_record'];
        $fetch['limit'] = $pagination['limit_per_page'];
        $fetch['like'] = ($key!=null&&$key!='') ? array("name" => array('name', 'description'), "key" => $key) : null;
        $fetch['order'] = array("field"=>"type","type"=>"ASC");
        $for_table = $this->m_status->fetch($fetch);

        $pagination['total_records'] =  $this->m_status->fetch($fetch, true);
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
        $this->data["header"] = "TABLE GRUP";
        $this->data["sub_header"] = 'Klik Tombol Action Untuk Aksi Lebih Lanjut';
    

        $this->render( "admin/status/content");
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
      $this->data["header"] = "Tambah status";
      $this->data["sub_header"] = 'Tekan Tombol Simpan Ketika Selesai Mengisi Form';
      $this->render( "admin/status/create");
    }

    public function insert($data) {
      $insert = $this->m_status->add($data);
      return $insert;
    }

    public function edit($id=null){
      if($id==null){
        redirect($this->current_page);
      }
      $w['id'] = $id;
      $form_value = $this->m_status->getWhere($w);
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
      $this->data["header"] = "Ubah status";
      $this->data["sub_header"] = 'Silahkan ubah data yang ingin anda ganti';
      $this->render( "admin/status/edit");
    }

    public function update($id, $data) {
      $insert = $this->m_status->update($id, $data);
      return $insert;
    }


    public function detail($id=null){
      if($id==null){
        redirect($this->current_page);
      }
      $w['id'] = $id;
      $form_value = $this->m_status->getWhere($w);
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
      $this->data["header"] = "Detail status";
      $this->data["sub_header"] = 'Halaman Ini Hanya Berisi Informasi Detail Dari Data';
      $this->render("admin/status/detail");
    }

    public function delete($id) {
      if($id==null){
        redirect($this->current_page);
      }
      $w['id'] = $id;
      $delete = $this->m_status->delete($w);
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
      "id", "name", "description","type", "color"
      ];
    }

    private function label(){
      $name = $this->name;
      $label = [
        "id", "Nama Status", "Keterangan", "Tipe", "Warna"
      ];
      $label_arr = array();
      foreach ($name as $key => $value) {
        $label_arr[$value] = $label[$key];
      }
      return $label_arr;
    }

    private function data_type(){
      $name = $this->name;
      $type =   ["number", "text", "textarea","select", "select"];
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
        
        $select['type'] = array(
          "surat_masuk" => "Surat Masuk",
          "surat_keluar" => "Surat Keluar",
        );

        $select['color'] = array(
          "green" => "hijau",
          "blue" => "biru",
          "red" => "merah",
          "orange" => "jingga",
          "pink" => "merah muda",
          "cyan" => "biru muda",
          "teal" => "hijau muda",
          "purple" => "ungu",
      
        );
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


   

}