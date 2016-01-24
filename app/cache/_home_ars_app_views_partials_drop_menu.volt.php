<li class="dropdown topbar-user">
    <a data-hover="dropdown" href="#" class="dropdown-toggle">
        <img src="/images/avatar/48.jpg" alt="" class="img-responsive img-circle"/>&nbsp;
        <span class="hidden-xs">
          <?php echo $this->session->user_data->name; ?>
        </span>&nbsp;
        <span class="caret"></span>
    </a>
    <ul class="dropdown-menu dropdown-user pull-right">
        <li>
            <a href="/account">
                <i class="fa fa-user"></i>
                My Profile
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="/logout">
                <i class="fa fa-key"></i>
                Log Out
            </a>
        </li>
    </ul>
</li>