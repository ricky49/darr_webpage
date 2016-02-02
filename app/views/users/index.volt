{% extends "layouts/base.volt" %}
{% block content %}
	{{this.flash.output()}}

    <div class="panel panel-blue" style="background:#FFF; border:none;">
        <div class="panel-heading"></div>

        <div class="panel-body">
      <div>

        <div style="display: inline-block;">
       
        </div>
        <div style="display: inline-block; float: right; margin-right: 1%;">
            <a href="/users/create">
                <button type="button" class="btn btn-warning">Crear</button>
            </a>
        </div>                             
      </div>
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Usuario</th>
                    <th>Rol</th>
                    <th>Accion</th>
                </tr>
                </thead>
                <tbody>
                {% for index, user in users %}
                    <tr>
                        <td>{{index+1}}</td>
                        <td>{{user.name}}</td>
                        <td>{{user.rol}}</td>
                        <!-- <td><span class="label label-sm label-success">Approved</span></td> -->
                        <td>
                            <a href="/users/edit/{{user._id}}">
                                <button class="btn btn-primary btn-xs">
                                    <i class="fa fa-pencil"></i>
                                </button>
                            </a>
                            <a onclick="return confirm('Are you sure?')" href="/users/delete/{{user._id}}">
                                <button class="btn btn-danger btn-xs">
                                    <i class="fa fa-trash-o " ></i>
                                </button>
                            </a>
                      </td>
                    </tr>
                {% endfor %}
                </tbody>
            </table>
        </div>
    </div>
{% endblock %}
			
