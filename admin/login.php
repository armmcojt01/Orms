<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Admin | Recruitment Management System</title>
<?php include('./header.php'); ?>
<?php include('./db_connect.php'); ?>
<?php 
session_start();
if(isset($_SESSION['login_id']))
header("location:index.php?page=home");
?>
</head>
<style>
	body {
		width: 100%;
	    height: calc(100%);
	}

	main#main {
		width: 100%;
		height: calc(100%);
		background: white;
	}

	#login-right {
		position: absolute;
		right: 0;
		width: 40%;
		height: calc(100%);
		background: white;
		display: flex;
		align-items: center;
	}

	#login-left {
		position: absolute;
		left: 0;
		width: 60%;
		height: calc(100%);
		background: #59b6ec61;
		display: flex;
		align-items: center;
		background: url(assets/img/recruitment-cover.png);
	    background-repeat: no-repeat;
	    background-size: cover;
	}

	#login-right .card {
		margin: auto;
		z-index: 1;
	}

	.logo-container {
		display: flex;
		align-items: center;
		margin-bottom: 20px;
	}

	.logo img {
		width: 120px;
		height: 120px;
		margin-right: 20px;
	}

	.content p {
		font-size: medium;
		margin: 0;
	}

	div#login-right::before {
	    content: "";
	    position: absolute;
	    top: 0;
	    left: 0;
	    width: calc(100%);
	    height: calc(100%);
	    background: #000000e0;
	}
</style>

<body>

<main id="main" class="bg-dark">
    <div id="login-left"></div>
    	<div id="login-right">
        <div class="card col-md-8">
			<div class="container">
				<div class="logo-container">
					<div class="logo">
						<img src="assets/img/armmcfinal.png" alt="ARMMC Logo">
					</div>
					<div class="content">
						<p>ARMMC Online Recruitment Management System</p>
					</div>
				</div>
            	<h2 class="text-center mt-4">Login your Admin Account</h2>

                <form id="login-form">
                    <div class="form-group">
                        <label for="username" class="control-label">Username</label>
                        <input type="text" id="username" name="username" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="password" class="control-label">Password</label>
                        <input type="password" id="password" name="password" class="form-control">
                    </div>
                    <center><button class="btn-sm btn-block btn-wave col-md-4 btn-primary">Login</button></center>
                </form>
                <footer class="main-footer" style="margin-left: 0px;">
                    <p>
                        <div class="text-center">
                            <strong style="font-size: smaller;">Copyright &copy; 2024 <a href="https://armmc.doh.gov.ph/">ORMS by IMISS</a>.
                            </strong>
                            <p style="font-size: smaller;">All rights reserved.</p>
                        </div>
                    </p>
                </footer>
            </div>
        </div>
    </div>
</main>

<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

</body>
<script>
	$('#login-form').submit(function(e){
		e.preventDefault();
		$('#login-form button[type="button"]').attr('disabled',true).html('Logging in...');
		if($(this).find('.alert-danger').length > 0 )
			$(this).find('.alert-danger').remove();
		$.ajax({
			url:'ajax.php?action=login',
			method:'POST',
			data:$(this).serialize(),
			error:err=>{
				console.log(err);
				$('#login-form button[type="button"]').removeAttr('disabled').html('Login');
			},
			success:function(resp){
				if(resp == 1){
					location.href ='index.php?page=home';
				}else if(resp == 2){
					location.href ='voting.php';
				}else{
					$('#login-form').prepend('<div class="alert alert-danger">Username or password is incorrect.</div>');
					$('#login-form button[type="button"]').removeAttr('disabled').html('Login');
				}
			}
		});
	});
</script>
</html>
