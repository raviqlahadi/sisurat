<?php
    
    defined('BASEPATH') OR exit('No direct script access allowed');
    
    class Home extends CI_Controller {
    
       
        public function index(){
            
            redirect('setting/user','refresh');
            
        }
    
    }
    
    /* End of file Home.php */
    
?>