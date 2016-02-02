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
            <a href="/requests">
                <button type="button" class="btn btn-warning">Make Request</button>
            </a>
        </div>                             
      </div>
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Pacient</th>
                    <th>Authorization</th>
                    <th>Surgery Date</th>
                    <th>Surgeon Name</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                {% for index, req in requests %}
                    <tr>

                        <td>{{index+1}}</td>
                        <td>{{ (req.pacient_name is defined)?req.pacient_name:'--' }}</td>
                        <td>{{req.authorization is defined ? req.authorization:'--'}}</td>
                        <td>{{req.surgery_date is defined ? req.surgery_date :'--'}}</td>
                        <td>{{req.surgeon_name is defined ? req.surgeon_name :'--'}}</td>
                        <td><span class="label label-sm label-warning">Pending</span></td>
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
			
