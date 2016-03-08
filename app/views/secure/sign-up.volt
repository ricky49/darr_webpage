<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>{{ getenv('PAGE_TITLE') }}</title>
	<link type="text/css" href="/extra/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="/extra/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="/extra/css/theme.css" rel="stylesheet">
	<link type="text/css" href="/extra/images/icons/css/font-awesome.css" rel="stylesheet">
</head>
<body>

	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
					<i class="icon-reorder shaded"></i>
				</a>

			  	<span class="brand" >
			  		<img src="/images/logo.png" width="100px" style="margin-bottom: -27px; margin-top: -21px;">
			  	</span>

				<div class="nav-collapse collapse navbar-inverse-collapse">
				
					<ul class="nav pull-right">

						<li><a href="/login">
							Login
						</a></li>

						

						<!-- <li><a href="/remind-password">
							Forgot your password?
						</a></li> -->
					</ul>
				</div><!-- /.nav-collapse -->
			</div>
		</div><!-- /navbar-inner -->
	</div><!-- /navbar -->
	<div class="wrapper">
		<div class="container">
			<div class="row">
			{{this.flash.output()}}
			<div style=" position: relative;   left: 45%;    margin: 78px 6px -81px;">
				<img src="/images/logo.png" style="    width: 140px;" alt="">
			</div>
				<div class="module module-login span4 offset4">
					<form class="form-vertical" method="post" action="/register">
						<div class="module-head">
							<h3>Registrarse</h3>
						</div>
						<div class="module-body">
							<div class="control-group">
								<div class="controls row-fluid">
									<input class="span12" type="text"  placeholder="Primer nombre" name="name" required>
								</div>
							</div>
							<div class="control-group">
								<div class="controls row-fluid">
									<input class="span12" type="text"  placeholder="Apellidos" name="lastname" required>
								</div>
							</div>
							<div class="control-group">
								<div class="controls row-fluid">
									<input class="span12" type="text"  placeholder="Usuario" name="user" required>
								</div>
							</div>
							<div class="control-group">
								<div class="controls row-fluid">
									<input class="span12" type="email"  placeholder="Email" name="mail" required>
								</div>
							</div>
							<div class="control-group">
								<div class="controls row-fluid">
									<input class="span12" type="text"  placeholder="Documento" name="document" required>
								</div>
							</div>
							<div class="control-group">
								<div class="controls row-fluid">
									<select class="span12"   name="rol" required>
									<option value="pacient">Paciente</option>
									</select>
								</div>
							</div>
							<div class="control-group">
								<div class="controls row-fluid">
									<input class="span12" type="password" id="inputPassword" placeholder="Password" name="pass" required>
								</div>
							</div>
							<div class="control-group">
								<div class="controls row-fluid">
									<input class="span12" type="password" id="inputPassword" placeholder="Confirm Password" name="pass_confirm" required>
								</div>
							</div>
						</div>
						<div class="module-foot">
							<div class="control-group">
								<div class="controls clearfix">
									<button type="submit" class="btn btn-primary pull-right">Registrarse</button>
									
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div><!--/.wrapper-->

	<div class="footer">
		<div class="container">
			 

			<!-- <b class="copyright">Darr web -->
		</div>
	</div>
	<script src="/extra/scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="/extra/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="/extra/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</body>