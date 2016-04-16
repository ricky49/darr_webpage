<li class="dropdown topbar-user">
    <a data-hover="dropdown" href="#" class="dropdown-toggle">
        <img src="/images/avatar/48.jpg" alt="" class="img-responsive img-circle"/>&nbsp;
        <span class="hidden-xs">
          {{this.session.user_data.name}}
        </span>&nbsp;
        <span class="caret"></span>
    </a>
    <ul class="dropdown-menu dropdown-user pull-right">
        <li>
            <a href="/cart">
                <i class="fa fa-shopping-cart"></i>
               Carrito
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="/logout">
                <i class="fa fa-key"></i>
                Cerrar Sesión
            </a>
        </li>
    </ul>
</li>