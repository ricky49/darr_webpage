<!--BEGIN SIDEBAR MENU-->
  <nav id="sidebar" role="navigation" data-step="2" data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
      data-position="right" class="navbar-default navbar-static-side">
  <div class="sidebar-collapse menu-scroll">
      <ul id="side-menu" class="nav">
          
          <div class="clearfix"></div>
          {% if (this.session.user_data.rol != 'Instrumentista' ) %}
          <li class="">
            <a href="/">
                <i class="fa fa-tachometer fa-fw">
                    <div class="icon-bg bg-orange"></div>
                </i>
                <span class="menu-title">Inicio</span>
            </a>
          </li>
           {% endif %}
          {% if (this.session.user_data.rol == 'Admin') %}
          <li class="">
            <a href="/users">
                <i class="icon fa fa-group">
                    <div class="icon-bg bg-orange"></div>
                </i>
                <span class="menu-title">Usuarios</span>
            </a>
          </li>
           {% endif %}
          {% if (this.session.user_data.rol != 'Instrumentista' and this.session.user_data.rol != 'Vendedor')%}
           <li class="">
            <a href="/requests">
                <i class="icon fa fa-book">
                    <div class="icon-bg bg-orange"></div>
                </i>
                <span class="menu-title">Solicitudes</span>
            </a>  
          </li>
          {% endif %}
          {% if (this.session.user_data.rol == 'Admin' or this.session.user_data.rol == 'Instrumentista') %}
          <li class="">
            <a href="/reports">
                <i class="icon fa fa-file-text-o">
                    <div class="icon-bg bg-orange"></div>
                </i>
                <span class="menu-title">Reportes</span>
            </a>
          </li>
           {% endif %}

           {% if (this.session.user_data.rol == 'Admin') %}
          <li class="">
            <a href="/inbox">
                <i class="icon fa fa-inbox">
                    <div class="icon-bg bg-orange"></div>
                </i>
                <span class="menu-title">Bandeja de Entrada</span>
            </a>
          </li>
          {% endif %}
          {% if (this.session.user_data.rol != 'Instrumentista') %}
           <li class="">
            <a href="/cart">
                <i class="icon fa fa-shopping-cart">
                    <div class="icon-bg bg-orange"></div>
                </i>
                <span class="menu-title">Carrito</span>
            </a>
          </li>
         {% endif %}
          
      </ul>
  </div>
</nav>
  <!--END SIDEBAR MENU-->