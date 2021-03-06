{% extends "layouts/base.volt" %}
{% block content %}

<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
    <div class="page-header pull-left">
        <div class="page-title">
        {{section_title}}
        </div>
    </div>
    <div class="page-header pull-right">
        <div class="page-toolbar">
            <a href="/users">
                <button type="button" class="btn btn-warning">Lista de Usuarios</button>
            </a>
            &nbsp;
        </div>
    </div>
    <div class="clearfix">
    </div>
</div>


<div class="page-content">

{{this.flash.output()}}
<div class="col-md-9">
{% include 'partials/blue_head.volt'%}
<div id="generalTabContent" class="tab-content">
    <form action="/users/create" method="POST" class="form-horizontal">
      <div>
        <div style="display: inline-block;"></div>
        <div style="display: inline-block; float: right; margin-right: 1%;">
            
        </div>                             
      </div>
        <div class="form-group"><label class="col-sm-3 control-label">Primer nombre</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" name="name" placeholder="Primer nombre" class="form-control" required/></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Apellidos</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" name="lastname"  placeholder="Apellidos" class="form-control" required/></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Email</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="email" name="email"  placeholder="email@yourcompany.com" class="form-control" required/></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Nombre de usuario</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" placeholder="Nombre de usuario" name="user"  class="form-control" required/></div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Documento</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" placeholder="Documento" name="document"  class="form-control" required/></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Rol</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                        <select type="text" name="rol"  class="form-control" required>
                            <option></option>
                           {% for role in roles %}
                            <option value="{{role.rol_name}}">{{role.rol_name}}</option>
                            {% endfor %}
                        </select>  
                    </div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Password</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" placeholder="Password" name="pass"   class="form-control" required/></div>
                </div>
            </div>
        </div>
        <hr/>
        
        <button type="submit" class="btn btn-green btn-block">Crear</button>
    </form>
</div>
</div>
</div>

{% endblock %}
      
