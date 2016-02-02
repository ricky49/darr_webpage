{% extends "layouts/base.volt" %}
{% block content %}
{{this.flash.output()}}
<div class="col-md-9">
 <!-- <div class="col-md-12"><h2>Profile: {{user.name}}</h2> -->
<div id="generalTabContent" class="tab-content">

    <form action="/users/edit/{{user._id}}" method="POST" class="form-horizontal"> <div>
        <div style="display: inline-block;"></div>
        <div style="display: inline-block; float: right; margin-right: 1%;">
            <a href="/users">
                <button type="button" class="btn btn-warning">Users List</button>
            </a>
        </div>                             
      </div>

        <div class="form-group"><label class="col-sm-3 control-label">Primer nombre</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" name="name" value="{{user.name}}"placeholder="Name" class="form-control"/></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Apellidos</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" name="apellidos" value="{{user.lastname}}" placeholder="Last Name" class="form-control"/></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Email</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="email" name="mail" value="{{user.mail}}" placeholder="email@yourcompany.com" class="form-control"/></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Nombre de usuario</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" placeholder="Nombre de usuario" name="user" value="{{user.user}}"  class="form-control"/></div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Documento</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" placeholder="Documento" name="document"  class="form-control" value="{{user.document}}"required/></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Rol</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                        <select type="text" name="rol"  class="form-control" required>
                            <option>{{user.rol}}</option>
                           {% for role in roles %}
                            {% if role.rol_name != user.rol %}
                            <option value="{{role.rol_name}}">{{role.rol_name}}</option>
                            {% endif %}
                            {% endfor %}
                        </select>  
                    </div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Password</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" placeholder="Password" name="pass"   class="form-control" value="{{user.pass}}" /></div>
                </div>
            </div>
        </div>
        <hr/>
        
        <button type="submit" class="btn btn-green btn-block">Editar</button>
    </form>
</div>
</div>
</div>

{% endblock %}
      
