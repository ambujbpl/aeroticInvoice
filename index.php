<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <meta name="description" content="Speed Governor, Saniya Enterprises, Aerotic India Pvt Ltd">
  <meta name="author" content="Ambuj Dubey">
  <link rel="icon" type="image/x-icon" href="./images/logoNew.png" >
  <title>Login Page</title>
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
            <form class="form-signin" id="loginForm" action="" method="post">
              <div class="form-label-group">
                <input type="text" id="inputUserID" name="inputUserID" class="form-control" placeholder="User ID"  autofocus>
                <label for="inputUserID">User ID</label>
              </div>

              <div class="form-label-group">
                <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Password" >
                <label for="inputPassword">Password</label>
              </div>

              <div class="custom-control custom-checkbox mb-3">
                <div class="row">
                  <div class="col-sm-6">
                    <input type="checkbox" class="custom-control-input" id="customCheck1">              
                    <label class="custom-control-label" for="customCheck1">Remember password</label>    
                  </div>
                  <div class="col-sm-6">
                    <a class="goToRegistrationPage" href="registration.php">New Registration</a>
                  </div>
                </div>
              </div>
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" name="submit">Sign in</button>
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
<script type="text/javascript" src="js/index.js"></script>

<!-- <?php 
// if(isset($_POST["submit"])){
//   $user = $_POST['inputUserID'];
//   $pass = $_POST['inputPassword'];
//   // echo $user ," ", $pass; 
//   $query = "select * from users where userid='$user' && password='$pass'";
//   $data = mysqli_query($connection,$query);
//   $total = mysqli_num_rows($data);
//   if($total == 1){
//     $_SESSION['un'] = $user; 
//     header('location:viewInvoice.php');
//   }else{
//     $msg = "Login Fail! Please check credential.";
//     header("Location:index.php?msg=$msg");
//   }
// }
 ?> -->

</html>
