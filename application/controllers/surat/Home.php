<?php
    
    defined('BASEPATH') OR exit('No direct script access allowed');
    
    class Home extends Admin_Controller {
    
        public function index()
        {
            redirect('surat/surat_masuk');
        }
    
    }
    
    /* End of file Home`.php */
    

?>