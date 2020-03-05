<?php
function runCustomQuery($query){
	if($query){
		// echo $query;
		include('./../config/connection.php');
		$data = mysqli_query($connection,$query);
		$total = mysqli_num_rows($data);
		mysqli_close($connection);
		if($total >= 1 || $data){
			$data_array = array();
			if($total >= 1){		
				while($row = $data->fetch_assoc()){
					$data_array[] = $row;
				}	
			}
			mysqli_free_result($data);
			$resp = array('resCode' => 'Ok', 'message' => 'Query execute successfully', 'data' => $data_array) ;
			return json_encode($resp);
		}else{
			$resp = array('resCode' => 'Error', 'message' => "Sorry, Something went wrong.") ;
			return json_encode($resp);
		}
	}else{	
		$resp = array('resCode' => 'Error', 'message' => "query is required.") ;
		return json_encode($resp);
	}
}
?>