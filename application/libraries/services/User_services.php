<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class User_services{
    function __construct(){

    }

    public function __get($var)
  	{
  		return get_instance()->$var;
  	}

    public $name = [
      'id',
      'username',
      'email',
      'password',
      'first_name',
      'last_name',
      'active',
      'group_id'
    ];

    public $label =  [
      'id' => 'User Id',
      'username'  => 'Username',
      'email' => 'Email User',
      'password' => 'Password',
      'first_name' => 'Nama Depan',
      'last_name' => 'Nama Belakang',
      'active' => 'Status',
      'group_id' => 'Grup User',
      'group_name' => 'Grup User',

    ];

    public $type =  [
      'id' => 'number',
      'username'  => 'text',
      'email' => 'email',
      'password'  => 'password',
      'first_name' => 'text',
      'last_name' => 'text',
      'active' => 'select',
      'group_id' => 'select',
    ];

    public function validation_config($type=null){
        $arr_con = [];
        $email = ($type!='edit') ? 'trim|required|is_unique[table_users.email]' : 'trim|required';

        foreach ($this->name as $key => $value) {
          if($value!='id'){
            switch ($value) {
              case 'email':
                $arr = array(
                  'field' => $value,
                  'label' => $this->label[$value],
                  'rules' =>  $email,
                  'errors' => array(
                              'required'      => 'Field %s tidak boleh kosong.',
                              'is_unique'      => 'Email %s telah di gunakan.',
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
        }

    		return $arr_con;
  	}

    public function form_data($form_value=null, $param=null){
        $this->load->model('m_group');
        $group = $this->m_group->get();

        foreach ($group as $k => $v) {
          $select['group_id'][$v->id] = $v->name;
        }

        $select['active'] = ['Non Active','Active'];

    		foreach ($this->name as $key => $value) {
          if($form_value!=null){
            if(isset($form_value->{$value})&&$form_value->{$value}!=null){
              $val = $form_value->{$value};
            }else{
              $val = $this->form_validation->set_value($value);
            }
          }else{
            $val = $this->form_validation->set_value($value);
          }

          switch ($this->type[$value]) {
            case 'select':
              $data[$value] = array(
                'name' => $value,
                'label' => $value,
                'id' => $value,
                'type' => $this->type[$value],
                'placeholder' => $this->label[$value],
                'option' => $select[$value],
                'class' => 'form-control show-tick',
                'value' => $val,
              );
              break;

            default:
              $data[$value] = array(
                'name' => $value,
                'label' => $value,
                'id' => $value,
                'type' => $this->type[$value],
                'placeholder' => $this->label[$value],
                'class' => 'form-control',
                'value' => $val,
              );
              break;
          }

        };
        unset($data['id']);
    		return $data;
  	}

    public function tabel_header($arr){
      $label = [];
      foreach ($arr as $key => $value) {
        $label[$value] = $this->label[$value];
      }
      if(isset($label['id'])) unset($label['id']);
      return $label;
    }

}
?>
