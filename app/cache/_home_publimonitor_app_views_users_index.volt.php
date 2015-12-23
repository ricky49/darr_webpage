    <section id="main-content">
        <section class="wrapper site-min-height">
            
	
              <div class="row mt">
                  <div class="col-md-12">
                    <p><?php echo $this->flash->output(); ?></p>
                      <div class="content-panel">
                          <table class="table table-striped table-advance table-hover">
                          <div>

                            <div style="display: inline-block;">
                              <h4><i class="fa fa-angle-right"></i> Users List</h4>
                            </div>
                            <div style="display: inline-block; float: right; margin-right: 1%;">
                                <a href="/users/create">
                                    <button type="button" class="btn btn-warning">Create</button>
                                </a>
                            </div>                             
                          </div>
                           
                            <hr>
                              <thead>
                              <tr>
                                  <th><i class="fa fa-user"></i> Name</th>
                                  <th class="hidden-phone"><i class="fa fa-envelope"></i> Email</th>
                                  <th><i class="fa fa-bookmark"></i> Status</th>
                                  <th><i class=" fa fa-edit"></i> Action</th>
                                  
                              </tr>
                              </thead>
                              <tbody>
                              <?php foreach ($users as $user) { ?>
                              <tr>
                                <td>
                                    <a>
                                        <?php echo $user->display_name; ?>
                                    </a>
                                </td>
                                <td class="hidden-phone"><?php echo $user->email; ?></td>
                                <td>
                                    <span class="label <?php echo $this->generalHelper->statusColor($user->status_id); ?> label-mini">
                                        <?php echo $user->status->name; ?>
                                    </span>
                                </td>
                                  <td>
                                      <!-- <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button> -->
                                    <a  href="/users/edit/<?php echo $user->id; ?>">
                                        <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                                    </a>
                                    <a onclick="return confirm('Are you sure?')" href="/users/delete/<?php echo $user->id; ?>">
                                        <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o " ></i></button>
                                    </a>
                                  </td>
                              </tr>
                              <?php } ?>
                             
                    
                            
                              </tbody>
                          </table>
                      </div><!-- /content-panel -->
                  </div><!-- /col-md-12 -->
              </div><!-- /row -->


		</section>
	</section>
