<?php
class Template {
  protected $_ci;
  function __construct() {
    $this->_ci = &get_instance();
  }
  function home($template = NULL, $data = NULL) {
      $data['head'] = $this->_ci->load->view('templates/head', $data, TRUE);
      $data['header'] = $this->_ci->load->view('templates/header', $data, TRUE);
      $data['footer'] = $this->_ci->load->view('templates/footer', $data, TRUE);
      $data['theme'] = $this->_ci->load->view('templates/theme', $data, TRUE);
      $data['js'] = $this->_ci->load->view('templates/js', $data, TRUE);
      $this->_ci->load->view('content/v_index', $data);
  }

  function login($template = NULL, $data = NULL) {
      $data['head'] = $this->_ci->load->view('templates/head', $data, TRUE);
      $data['header'] = $this->_ci->load->view('templates/header', $data, TRUE);
      $data['footer'] = $this->_ci->load->view('templates/footer', $data, TRUE);
      $data['theme'] = $this->_ci->load->view('templates/theme', $data, TRUE);
      $data['js'] = $this->_ci->load->view('templates/js', $data, TRUE);
      $this->_ci->load->view('content/v_login', $data);
  }

  function Lupa_password($template = NULL, $data = NULL) {
      $data['head'] = $this->_ci->load->view('templates/head', $data, TRUE);
      $data['header'] = $this->_ci->load->view('templates/header', $data, TRUE);
      $data['footer'] = $this->_ci->load->view('templates/footer', $data, TRUE);
      $data['theme'] = $this->_ci->load->view('templates/theme', $data, TRUE);
      $data['js'] = $this->_ci->load->view('templates/js', $data, TRUE);
      $this->_ci->load->view('content/v_lupa_password', $data);
  }
}
 ?>
