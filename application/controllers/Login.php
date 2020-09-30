<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('m_login');
	}

	public function index(){
      $this->template->login('v_login');
	}

	function auth(){
        $username=htmlspecialchars($this->input->post('tm_login_username',TRUE),ENT_QUOTES);
        $password=htmlspecialchars($this->input->post('tm_login_password',TRUE),ENT_QUOTES);

        $cek_login=$this->m_login->auth_mahasiswa($username,$password);

        if($cek_login->num_rows() > 0){ //jika login sebagai mahasiswa
						$data=$cek_login->row_array();
        		$this->session->set_userdata('masuk',TRUE);
		         if($data['tm_user_access_id']=='2'){
		            $this->session->set_userdata('id',$data['tm_login_id']);
		            redirect('student');
        }else{  // jika username dan password tidak ditemukan atau salah
							$url=base_url();
							echo $this->session->set_flashdata('msg','Username Atau Password Salah');
							redirect($url);
					}
    	 }
		}

    function logout(){
        $this->session->sess_destroy();
        $url=base_url('');
        redirect($url);
    }
}
