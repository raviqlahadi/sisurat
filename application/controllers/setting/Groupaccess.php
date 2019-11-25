<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Groupaccess extends Admin_Controller
{

  private $name = null;
  private $parent_page = 'setting';
  private $current_page = 'setting/groupaccess';
  private $form_data = null;
  private $data_type = null;
  private $label = null;
  private $block_header = "group access management";

  public function __construct()
  {
    parent::__construct();
    $this->name = $this->attribute();
    $this->data_type = $this->data_type();
    $this->label = $this->label();
    $this->form_data = $this->form_data();
    $this->label = $this->label();
    $this->load->model(array('m_group_access'));
  
  }


  public function index()
  {
    //basic variable
    $key = $this->input->get('key');
    $group_id = $this->input->get('group_id');
    if(!isset($group_id)||$group_id==null){
      redirect('setting/group');
    }else{
      $this->load->model('m_group');
      $group_data = $this->m_group->getWhere(array('id' => $group_id));
      if(sizeof($group_data)<1){
        
       redirect('setting/group');
      }else{
        $this->data['group_data'] = $group_data[0];
      }
    }
    $limit = $this->input->get('limit');
    $page = ($this->uri->segment(4)) ? ($this->uri->segment(4) - 1) : 0;
    $tabel_cell =  ['id', 'menu_name', 'position','c', 'r', 'u', 'd'];
    //pagination parameter
    $pagination['base_url'] = base_url($this->current_page) . '/index';
    $pagination['limit_per_page'] = ($limit != null && $limit != '') ? $limit : 10;
    $pagination['start_record'] = $page * $pagination['limit_per_page'];
    $pagination['uri_segment'] = 4;


    //fetch data from database
    $fetch['select'] = ['id', 'group_id','position','c', 'r', 'u', 'd', 's'];
    $fetch['select_join'] = ['table_menus.name as menu_name'];
    $fetch['join'] = [array('table' => 'table_menus', 'id' => 'menu_id', 'join' => 'left')];
    $fetch['start'] = $pagination['start_record'];
    $fetch['limit'] = $pagination['limit_per_page'];
    $fetch['like'] = ($key != null && $key != '') ? array("name" => array('table_group_access.name'), "key" => $key) : null;
    $fetch['order'] = array("field" => "table_group_access.id", "type" => "ASC");
    $fetch['where'] = array('table_group_access.group_id' => $group_id);
    $for_table = $this->m_group_access->fetch($fetch);

    $pagination['total_records'] =  $this->m_group_access->fetch($fetch, true);
    //set pagination
    //var_dump($pagination);
    if ($pagination['total_records'] > 0) $this->data['links'] = $this->setPagination($pagination);

    //set breadcrumb
    $this->data['breadcrumb'] = $this->setBreadcrumb();

    //get flashdata
    $alert = $this->session->flashdata('alert');
    $this->data['id'] = $group_id;
    $this->data["key"] = ($key != null && $key != '') ? $key : false;
    $this->data["alert"] = (isset($alert)) ? $alert : NULL;
    $this->data["for_table"] = $for_table;
    $this->data["total_data"] = $pagination['total_records'];
    $this->data["table_header"] = $this->tabel_header($tabel_cell);
    $this->data["number"] = $pagination['start_record'];
    $this->data['parent_page'] = $this->parent_page;
    $this->data["current_page"] = $this->current_page;
    $this->data["block_header"] = $this->block_header;
    $this->data["header"] = "tabel groupaccess";
    $this->data["sub_header"] = 'klik tombol aksi untuk melakukan melakukan aksi lain';

    $this->render("setting/groupaccess/content");
  }


  public function create($id)
  {
    
    if ($this->input->post() != null) {
      $this->form_validation->set_rules($this->validation_config());
      if ($this->form_validation->run() === TRUE) {
        $input_data = $this->input->post();
        $input_data['group_id'] = $id;
        $insert = $this->insert($input_data);
       
        if ($insert) {
          $this->session->set_flashdata('alert', $this->alert->set_alert(Alert::SUCCESS, 'Input data berhasil'));
          redirect($this->current_page . '?group_id=' . $id);
        } else {
          $form = $this->form_data();
        }
      } else {
        $alert = $this->errorValidation(validation_errors());
        $this->data['alert'] = $this->alert->set_alert(Alert::WARNING, $alert);
        $form = $this->form_data();
      }
    } else {
      $form = $this->form_data;
    }
    $this->data['breadcrumb'] = $this->setBreadcrumb();
    $this->data['form_data'] = $form;
    $this->data['form_action'] = site_url($this->current_page . '/create/'.$id);
    $this->data['name'] = $this->name;
    $this->data['parent_page'] = $this->current_page.'?group_id='.$id;
    $this->data["block_header"] = $this->block_header;
    $this->data["header"] = "tambah groupaccess";
    $this->data["sub_header"] = 'tekan tombol simpan ketika telah memasukan data';
    $this->render("setting/groupaccess/create");
  }

  public function insert($data)
  {
    $insert = $this->m_group_access->add($data);
    return $insert;
  }

  public function edit($id = null)
  {
    $group_id = $this->input->get('group_id');
    if ($id == null) {
      redirect($this->current_page . '?group_id=' . $id);
    }
    $w['id'] = $id;
    $form_value = $this->m_group_access->getWhere($w);
    if ($form_value == false) {
      redirect($this->current_page . '?group_id=' . $group_id);
    } else {
      $form_value = $form_value[0];
    }

    if ($this->input->post() != null) {
      $this->form_validation->set_rules($this->validation_config(true));
      if ($this->form_validation->run() === TRUE) {
        $input_data = $this->input->post();
        $update = $this->update($id, $input_data);
        if ($update) {
          $this->session->set_flashdata('alert', $this->alert->set_alert(Alert::SUCCESS, 'Update data berhasil'));
          redirect($this->current_page . '?group_id=' . $group_id);
        } else {
          $form = $this->form_data();
        }
      } else {
        $alert = $this->errorValidation(validation_errors());
        $this->data['alert'] = $this->alert->set_alert(Alert::WARNING, $alert);
        $form = $this->form_data();
      }
    } else {
      $form = $this->form_data($form_value);
    }


    $this->data['breadcrumb'] = $this->setBreadcrumb();
    $this->data['form_data'] = $form;
    $this->data['form_action'] = site_url($this->current_page . '/edit/' . $id . '?group_id=' . $group_id);
    $this->data['name'] = $this->name;
    $this->data['parent_page'] = $this->current_page . '?group_id=' . $group_id;
    $this->data["block_header"] = $this->block_header;
    $this->data["header"] = "ubah groupaccess";
    $this->data["sub_header"] = 'silahkan ubah data yang ingin anda ganti';
    $this->render("setting/groupaccess/edit");
  }

  public function update($id, $data)
  {
    $insert = $this->m_group_access->update($id, $data);
    return $insert;
  }


  public function detail($id = null)
  {
    if ($id == null) {
      redirect($this->current_page);
    }
    $w['id'] = $id;
    $form_value = $this->m_group_access->getWhere($w);
    if ($form_value == false) {
      redirect($this->current_page);
    } else {
      $form_value = $form_value[0];
    }

    $this->data['breadcrumb'] = $this->setBreadcrumb();
    $this->data['form_data'] = $this->form_data($form_value);
    $this->data['parent_page'] = $this->current_page;
    $this->data['name'] = $this->name;
    $this->data['detail'] = true;
    $this->data["block_header"] = $this->block_header;
    $this->data["header"] = "detail groupaccess";
    $this->data["sub_header"] = 'halaman Ini Hanya Berisi Informasi Detail Dari Data';
    $this->render("setting/groupaccess/detail");
  }

  public function delete($id)
  {
    $group_id = $this->input->get('group_id');
    if ($id == null) {
      redirect($this->current_page);
    }
    $w['id'] = $id;
    $delete = $this->m_group_access->delete($w);
    if ($delete != false) {
      $this->session->set_flashdata('alert', $this->alert->set_alert(Alert::SUCCESS, 'Delete data berhasil'));
      redirect($this->current_page . '?group_id=' . $group_id);
    } else {
      $this->session->set_flashdata('alert', $this->alert->set_alert(Alert::WARNING, 'Terjadi Kesalahan'));
      redirect($this->current_page . '?group_id=' . $group_id);
    }
  }

  private function attribute()
  {
    return [
      "id", "group_id", "menu_id", "position", "c", "r", "u", "d", "s"
    ];
  }

  private function label()
  {
    $name = $this->name;
    $label = [
      "id akses", "nama grup", "nama menu ", "posisi", "create", "read", "update", "delete", "status"
    ];
    $label_arr = array();
    foreach ($name as $key => $value) {
      $label_arr[$value] = $label[$key];
    }
    $label_arr['group_name'] = 'nama grup';
    $label_arr['menu_name'] = 'nama menu';

    return $label_arr;
  }

  private function data_type()
  {
    $name = $this->name;
    $type = [
      "number", "number", "select", "number", "select", "select", "select", "select", "select"
    ];
    $type_arr = array();
    foreach ($name as $key => $value) {
      $type_arr[$value] = $type[$key];
    }
    return $type_arr;
  }

  private function validation_config($edit = false)
  {
    $arr_con = [];
    $name = $this->name;
    unset($name[0],$name[1]);
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

  private function form_data($form_value = null)
  {
    $arr = array('no','yes');
    $select['menu_id'] = $this->getMenuList();
    $select['c'] = $arr;
    $select['r'] = $arr;
    $select['u'] = $arr;
    $select['d'] = $arr;
    $select['s'] = $arr;
    
    $name = $this->name;
    unset($name[0], $name[1]);
    foreach ($name as $key => $value) {
      if ($form_value != null) {
        $val = $form_value->{$value};
      } else {
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

  private function tabel_header($arr)
  {
    $label = [];
    foreach ($arr as $key => $value) {
      $label[$value] = $this->label[$value];
    }
    if (isset($label['id'])) unset($label['id']);
    return $label;
  }


  private function getMenuList()
  {
    $this->load->model(array('m_menu'));
    $all_type =  $this->m_menu->getWhere(array('status'=>1));
    foreach ($all_type as $key => $value) {
      $arr[$value->id] = $value->name;
    }
    return $arr;
  }
}
