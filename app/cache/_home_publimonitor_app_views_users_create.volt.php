    <section id="main-content">
        <section class="wrapper site-min-height">
            
<div class="row mt">

    <div class="col-lg-12">
        <p><?php echo $this->flash->output(); ?></p>
        <div class="form-panel">
            <div>
                <div style="display: inline-block;">
                    <h4 class="mb"><i class="fa fa-angle-right"></i> Create User</h4>
                </div>
                <div style="display: inline-block; float: right; margin-right: 1%;">
                    <a href="/users">
                        <button type="button" class="btn btn-warning">Users List</button>
                    </a>
                </div>
            </div>

            <form class="form-horizontal style-form" method="post" action="/users/create">
                
                <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">First Name</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="firstname">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Last Name</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="lastname" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Display Name</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="display_name" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Email</label>
                    <div class="col-sm-6">
                        <input type="email" class="form-control" name="email" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Status</label>
                    <div class="col-sm-6">
                        <select class="form-control" name="status_id">
                                  <option value="1">Active</option>
                                  <option value="4">Inactive</option>
                                 
                        </select>
                    </div>
                </div>
                <div>
                    <div style="display: inline-block; height:30px;"></div>
                    <div style="display: inline-block; float: right; margin-right: 1%; ">
                        <button type="submit" class="btn btn-success">Create</button>
                    </div>
                </div>
               
            </form>
        </div>
    </div><!-- col-lg-12-->      	
</div><!-- /row -->

		</section>
	</section>
