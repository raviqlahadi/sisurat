<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class SubMenu_services{
    function __construct(){

    }

    public function __get($var)
  	{
  		return get_instance()->$var;
  	}

    public $name = [
      'id',
      'name',
      'link',
      'icon',
      'status',
      'attribute',
      'position',
      'description',
      'menu_id'
    ];

    public $label =  [
      'id' => 'Id Menu',
      'name'=> 'Nama Sub Menu',
      'link' => 'Link',
      'icon' => 'Icon',
      'status' => 'Status',
      'attribute' => 'Atribut',
      'position' => 'Posisi',
      'description' => 'Deskripsi',
      'menu_id' => 'Parent Menu'
    ];

    public $type =  [
      'id' => 'number',
      'name'=> 'text',
      'link' => 'text',
      'icon' => 'text',
      'status' => 'select',
      'attribute' => 'text',
      'position' => 'number',
      'description' => 'textarea',
      'menu_id' => 'hidden'
    ];

    public function validation_config(){
        $arr_con = [];
        foreach ($this->name as $key => $value) {
          if($value!='id'){
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
        }

    		return $arr_con;
  	}

    public function form_data($form_value=null, $param=null){
        $select['status'] = array('Non-Active','Active');

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
