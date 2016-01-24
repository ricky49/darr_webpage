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
			  		{{ getenv('PAGE_TITLE') }}
			  	</span>

				<div class="nav-collapse collapse navbar-inverse-collapse">
				
					<ul class="nav pull-right">

						<li><a href="/sign-up">
							Sign Up
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
				<div class="module module-login span4 offset4">
					<form class="form-vertical" method="POST" action="/login">
						<div class="module-head">
							<h3>Sign In</h3>
						</div>
						<div class="module-body">
							<div class="control-group">
								<div class="controls row-fluid">
									<input class="span12" type="text" id="inputEmail" placeholder="Username" name="username" required>
								</div>
							</div>
							<div class="control-group">
								<div class="controls row-fluid">
									<input class="span12" type="password" id="inputPassword" placeholder="Password"  name="password" required>
								</div>
							</div>
						</div>
						<div class="module-foot">
							<div class="control-group">
								<div class="controls clearfix">
									<button type="submit" class="btn btn-primary pull-right">Login</button>
									<!-- <label class="checkbox">
										<input type="checkbox"> Remember me
									</label> -->
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	<!-- <div class="footer">
		<div class="container">
			 

			<b class="copyright">Ars project, from home
		</div>
	</div> -->
	<script src="/extra/scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="/extra/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="/extra/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</body>