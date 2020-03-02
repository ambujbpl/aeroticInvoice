<script type="text/javascript">
  var name = "<?php echo $_SESSION['user_id'];?>"
  console.log("name : ",name);
</script>
<?php
  session_start();
  echo $_SESSION["user_id"];
  if (!isset($_SESSION["user_id"])) {
    header("Location: web/login.html");
  }else{
    header("Location: web/dashboard.html");
  }
?>
