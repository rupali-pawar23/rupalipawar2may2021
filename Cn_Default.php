<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Cn_Default extends CI_Controller {

  public function index()
{

    $this->load->view('form1');
}
  

public function incident()
{

$title = !empty($this->input->post('title')) ? $this->input->post('title') : '';
$fk_category_id = !empty($this->input->post('fk_category_id')) ? $this->input->post('fk_category_id') : '';
$comments = !empty($this->input->post('comments')) ? $this->input->post('comments') : '';
$latitude = !empty($this->input->post('latitude')) ? $this->input->post('latitude') : '';
$longitude = !empty($this->input->post('longitude')) ? $this->input->post('longitude') : '';
$incidenttime = !empty($this->input->post('incidenttime')) ? date('H:i:s',strtotime($this->input->post('incidenttime'))) : '';
$Arrayofpeople = !empty($this->input->post('people')) ? $this->input->post('people') : '';
$pk_id = !empty($this->input->post('pk_id')) ? $this->input->post('pk_id') : '';
$createdDate = !empty($this->input->post('createdDate')) ? $this->input->post('createdDate') : date('Y-m-d H:i:s');
$updateDate = !empty($this->input->post('updateDate')) ? $this->input->post('updateDate') : date('Y-m-d H:i:s');
// $Arrayofpeople = '[{"name": "rupali","type": "Staff"},{"name": "vishal","type": "Witness"}]';
$people_array = json_decode($Arrayofpeople);
if(!empty($fk_category_id)  && !empty($latitude) && !empty($longitude)  && !empty($incidenttime)){

if (empty($pk_id)) {
   $insert_data=array(

'title'=>$title,
'fk_category_id'=>$fk_category_id,
'comments'=>$comments,
'latitude'=>$latitude,
'longitude'=>$longitude,
'incidentDate'=>$incidenttime,
'createdDate'=>$createdDate,
'status'=>1,

);  

$res= $this->Md_database->insertData('incident', $insert_data);
 $incident_id=$this->db->insert_id();
 /*Start::Pepole array insert*/
if (!empty($people_array)) {
foreach ($people_array as $key => $value) {
$insert_data = array(
'fk_incident_id' => $incident_id,
'name' => $value->name,
'type' =>$value->type,
'status' => '1',
'createdDate'=>$createdDate,

);

$this->Md_database->insertData('category_people', $insert_data);
}
}
/*End::Pepole array insert*/
}else{
$update_data=array(

'title'=>$title,
'fk_category_id'=>$fk_category_id,
'comments'=>$comments,
'latitude'=>$latitude,
'longitude'=>$longitude,
'incidentDate'=>$incidenttime,
'modifyDate'=>$updateDate,
'status'=>1,

);  
$con=array('id'=>$pk_id);
$res= $this->Md_database->updateData('incident', $update_data,$con);

/*Start::Pepole array insert*/
if (!empty($people_array)) {

$con1=array('fk_incident_id'=>$pk_id);
$res= $this->Md_database->deleteData('category_people',$con1);

foreach ($people_array as $key => $value) {

$insert_data = array(
'fk_incident_id' => $pk_id,
'name' => $value->name,
'type' =>$value->type,
'status' => '1',
'createdDate'=>$createdDate,
'modifyDate'=>$updateDate,
);

$this->Md_database->insertData('category_people', $insert_data);

}
}
/*End::Pepole array insert*/
}

if (!empty($res)) {

$resultarray = array('error_code' => 200, 'msg' => "Sucess");
}else{
$resultarray = array('error_code' => 400, 'msg' => "Failed");
}
}else{
$resultarray = array('error_code' => 403, 'msg' => "Record empty");
}

echo json_encode($resultarray);
exit(); 
}



public function get_details()

{



$incident_id = !empty($this->input->GET('incident_id')) ? $this->input->GET('incident_id') : '';

// if(!empty($incident_id)){

// $resultarray = array('error_code' => 403,'message' => 'Required incident id');
// echo json_encode($resultarray);

// }

$incident_list=array();
$final_array=array();

$this->db->select('A.id,A.title,A.comments,A.latitude,A.longitude,A.incidentDate,A.createdDate,A.modifyDate,B.category as category name,A.fk_category_id as category');
$this->db->from('incident as A');
$this->db->where('A.status',1);
 if(!empty($incident_id)){
$this->db->where('A.id',$incident_id);
}
$this->db->join('master_category as B', 'B.id=A.fk_category_id');
$incident_list=$this->db->get()->result_array();
// print_r($incident_list);die();

 if(!empty($incident_list)){
foreach($incident_list as $row){


$this->db->select('A.latitude,A.longitude');
$this->db->from('incident as A');
$this->db->where('A.status',1);
$this->db->where('A.id',$row['id']);
$this->db->join('master_category as B', 'B.id=A.fk_category_id');
$location=$this->db->get()->result_array();

$row['location']=$location;

$this->db->select('A.name,A.type');
$this->db->from('category_people as A');
$this->db->where('A.status',1);
$this->db->where('A.fk_incident_id',$row['id']);
$category_people_data=$this->db->get()->result_array();
$row['people']=$category_people_data;
$final_array[]=$row;
}
}



// print_r($final);die();


if ($final_array) {


$resultarray = array('error_code' =>200,'message' =>'successfully','data'=>$final_array);

}else{

$resultarray = array('error_code' => 404,'message' => 'Not found');

}

echo json_encode($resultarray);

exit();

}

}
