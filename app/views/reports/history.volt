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
            <a href="/reports">
                <button type="button" class="btn btn-warning">Hacer reporte</button>
            </a>
        </div>                             
      </div>
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Paciente</th>
                    <th>Seguro</th>
                    <th>Fecha de cirugia</th>
                    <th>Cirujano</th>
                    <th>Estado</th>
                    <th>Accion</th>
                </tr>
                </thead>
                <tbody>
                {% for index, report in reports %}
                    <tr>

                        <td>{{index+1}}</td>
                        <td>{{report.pacient_name}}</td>
                        <td>{{report.insurance_name}}</td>
                        <td>{{report.date}}</td>
                        <td>{{(report.surgeon_name is defined)? report.surgeon_name : ""}}</td>
                        <td><span class="label label-sm label-success">Completado</span></td>
                        <td>
                            <a href="/reports/view/{{report._id}}">
                                <button class="btn btn-danger btn-xs">
                                    <i class="fa fa-eye"></i>
                                </button>
                            </a>
                            <a target="_blank"href="/reports/pdf/{{report._id}}">
                                <button class="btn btn-violet btn-xs">
                                    <i class="fa fa-print"></i>
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
			
