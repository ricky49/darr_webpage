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
                <button type="button" class="btn btn-warning">Hacer solicitud</button>
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
           
        </div>                             
      </div>
            <table class="table table-hover table table-hover-color">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Usuario</th>
                    <th>Paciente</th>
                    <th>Autorizacion</th>
                    <th>Fecha de cirugia</th>
                    <th>Cirujano</th>
                    <th>Estado</th>
                    <th>Accion</th>
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
                        <td>{{ (req.user is defined)?req.user:'--' }}</td>
                        <td>{{ (req.pacient_name is defined)?req.pacient_name:'--' }}</td>
                        <td>{{req.authorization is defined ? req.authorization:'--'}}</td>
                        <td>{{req.surgery_date is defined ? req.surgery_date :'--'}}</td>
                        <td>{{req.surgeon_name is defined ? req.surgeon_name :'--'}}</td>
                        <td>
                           
                            <div class="btn-group label-sm {{status_label}}" style="height: 23px; width: 110px;">
                                <button type="button" class="btn label label-sm {{status_label}}">{{req.status is defined ? ucfirst(req.status) :'--'}}</button>
                                <button style="height: 5px;     float: right; padding-top: 0px;" type="button" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true" class="btn btn-label label-sm {{status_label}}"><i class="fa fa-angle-down"></i></button>
                                <ul class="dropdown-menu" style="box-shadow: 3px 3px 3px #888888 !important;">
                                  
                                    <!-- <li class="divider"></li> -->
                                    <li><a href="/requests/status/{{req._id}}/1">   
                                    <span class="label label-info">Enviado
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     </span></a></li>
                                    <li><a href="/requests/status/{{req._id}}/2"><span class="label label-warning">En proceso
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </span></a></li>
                                    <li><a href="/requests/status/{{req._id}}/3"><span class="label label-success">
                                    Completado&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </span></a></li>
                                    <li><a href="/requests/status/{{req._id}}/4"> <span class="label label-danger">Cancelado&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
                                </ul>
                            </div>

                        </td>

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
			
