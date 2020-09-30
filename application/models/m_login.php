<?php
class m_login extends CI_Model{
	//cek nip dan password dosen
	// function auth_pegawai($username,$password){
	// 	$query=$this->db->query("SELECT * FROM dosen WHERE nip='$username' AND pass=MD5('$password') LIMIT 1");
	// 	return $query;
	// }

	//cek nim dan password mahasiswa
	function auth_mahasiswa($username,$password){
		$query=$this->db->query("SELECT * FROM tm_login WHERE tm_login_username='$username' AND tm_login_password='$password' ");
		return $query;
	}

}
