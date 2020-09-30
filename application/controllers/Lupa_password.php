<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Lupa_password extends CI_Controller {

	function __construct(){
		parent::__construct();
	}

	public function index(){
      $this->template->Lupa_password('v_lupa_password');
	}

}
