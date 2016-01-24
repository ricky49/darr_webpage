
	<?php echo $this->flash->output(); ?>

    <div class="panel panel-blue" style="background:#FFF; border:none;">
        <div class="panel-heading"></div>

        <div class="panel-body">
      <div>

        <div style="display: inline-block;">
       
        </div>
        <div style="display: inline-block; float: right; margin-right: 1%;">
            <a href="/users/create">
                <button type="button" class="btn btn-warning">Create</button>
            </a>
        </div>                             
      </div>
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>#</th>
                    <th>User</th>
                    <th>Role</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($users as $index => $user) { ?>
                    <tr>
                        <td><?php echo $index + 1; ?></td>
                        <td><?php echo $user->name; ?></td>
                        <td><?php echo $user->rol; ?></td>
                        <!-- <td><span class="label label-sm label-success">Approved</span></td> -->
                        <td>
                            <a href="/users/edit/<?php echo $user->_id; ?>">
                                <button class="btn btn-primary btn-xs">
                                    <i class="fa fa-pencil"></i>
                                </button>
                            </a>
                            <a onclick="return confirm('Are you sure?')" href="/users/delete/<?php echo $user->_id; ?>">
                                <button class="btn btn-danger btn-xs">
                                    <i class="fa fa-trash-o " ></i>
                                </button>
                            </a>
                      </td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </div>

	
