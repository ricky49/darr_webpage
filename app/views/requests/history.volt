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
            <a href="/requests">
                <button type="button" class="btn btn-warning">Realizar Solicitud</button>
            </a>
            &nbsp;
        </div>
    </div>
    <div class="clearfix">
    </div>
</div>


<div class="page-content">
	{{this.flash.output()}}

    <div class="panel panel-blue" style="background:#FFF; border:none;">
        <div class="panel-heading"></div>

        <div class="panel-body">
      <div>

        <div style="display: inline-block;">
       
        </div>
        <div style="display: inline-block; float: right; margin-right: 1%;">
           <!--  <a href="/requests">
                <button type="button" class="btn btn-warning">Hacer solicitud</button>
            </a> -->
        </div>                             
      </div>
            <table class="table table-hover table table-hover-color">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Paciente</th>
                    <th>Fecha de cirugía</th>
                    <th>Cirujano</th>
                    <th>Estado</th>
                    <th>Acción</th>
                </tr>
                </thead>
                <tbody>
                {% for index, req in requests %}
                    {% if req.status == 'enviado' %}
                        {% set status_label = 'label-info'  %}
                    {% elseif req.status == 'en progreso' %}
                        {% set status_label = 'label-warning'  %}
                    {% elseif req.status == 'completado' %}
                        {% set status_label = 'label-success'  %}
                    {% elseif req.status == 'cancelado' %}
                        {% set status_label = 'label-danger'  %}
                    {% endif %}
                    <tr>

                        <td>{{index+1}}</td>
                        <td>{{req.pacient_name}}</td>
                        <td>{{req.surgery_date}}</td>
                        <td>{{req.surgeon_name}}</td>
                        <td><span class="label label-sm {{status_label}}">{{req.status is defined ? ucfirst(req.status) :'--'}}</span></td>
                        <td>
                            <a href="/requests/view/{{req._id}}">
                                <button class="btn btn-danger btn-xs">
                                    <i class="fa fa-eye"></i>
                                </button>
                            </a>
                           <!--  <a onclick="return confirm('Are you sure?')" href="/users/delete/{{user._id}}">
                                <button class="btn btn-danger btn-xs">
                                    <i class="fa fa-trash-o " ></i>
                                </button>
                            </a> -->
                      </td>
                    </tr>
                {% endfor %}
                </tbody>
            </table>
        </div>
    </div>
{% endblock %}
			
