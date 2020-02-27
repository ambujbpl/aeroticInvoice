<!DOCTYPE html>
<html lang="en">
<?php
  include("config/connection.php");
  session_start();
  if(isset($_GET['msg']))$errorMessage = $_GET['msg']
?>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <meta name="description" content="Speed Governor, Saniya Enterprises, Aerotic India Pvt Ltd">
  <meta name="author" content="Ambuj Dubey">
  <link rel="icon" type="image/x-icon" href="./images/logoNew.png" >
  <title>Registration Page</title>
  <link rel="stylesheet" href="plugins/bootstrap-4.0.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/index.css">
</head>

<body>	
  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Sign In</h5>
            <div class="form-error">
              <div class="errorDiv" id="errorDiv"></div>
            </div>
    		<form class="form-signin" id="registrationForm" action="" method="post">
    			<div class="row">
    				<div class="col-xs-6 col-sm-6 col-md-6">
    					<div class="form-group">
                			<input type="text" name="first_name" id="first_name" class="form-control input-sm" placeholder="First Name">
    					</div>
    				</div>
    				<div class="col-xs-6 col-sm-6 col-md-6">
    					<div class="form-group">
    						<input type="text" name="last_name" id="last_name" class="form-control input-sm" placeholder="Last Name">
    					</div>
    				</div>
    			</div>
    			<div class="form-group">
    				<input type="email" name="email" id="email" class="form-control input-sm" placeholder="Email Address">
    			</div>
    			<div class="row">
    				<div class="col-xs-6 col-sm-6 col-md-6">
    					<div class="form-group">
    						<input type="number" name="mobile" id="mobile" class="form-control input-sm" placeholder="Mobile Number">
    					</div>
    				</div>
    				<div class="col-xs-6 col-sm-6 col-md-6">
    					<div class="form-group">
    						<input type="text" name="user_id" id="user_id" class="form-control input-sm" placeholder="User Id">
    					</div>
    				</div>
    			</div>
    			<div class="row">
    				<div class="col-xs-6 col-sm-6 col-md-6">
    					<div class="form-group">
    						<input type="password" name="password" id="password" class="form-control input-sm" placeholder="Password">
    					</div>
    				</div>
    			<div class="col-xs-6 col-sm-6 col-md-6">
    					<div class="form-group">
    						<input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-sm" placeholder="Confirm Password">
    					</div>
    				</div>
    			</div>
    			<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" name="submit">Register</button>    		
    		</form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
<script type="text/javascript" src="plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="plugins/popper/popper.min.js"></script>
<script type="text/javascript" src="plugins/bootstrap-4.0.0/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="plugins/jquery-validation-1.19.1/dist/jquery.validate.js"></script>
<script type="text/javascript" src="plugins/notify/notify.js"></script>
<script type="text/javascript" src="js/registration.js"></script>
</html>

