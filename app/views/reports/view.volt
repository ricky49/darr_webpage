{% extends "layouts/base.volt" %}
{% block content %}
{{this.flash.output()}}
<div class="col-md-9">
<div id="generalTabContent" class="tab-content">
    <form  class="form-horizontal">
      <div>     
        <div style="display: inline-block;"></div>
        <div style="display: inline-block; float: right; margin-right: 1%;">
            <a href="/reports/history">
                <button type="button" class="btn btn-warning">Reports history</button>
            </a>
        </div>                             
      </div>
        <div class="form-group"><label class="col-sm-3 control-label">Pacient Name</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" name="pacient_name" placeholder="Pacient Name" class="form-control" value="{{report.pacient_name}}" readonly=""/></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Insurance</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                    <input type="text" name="insurance_name"  placeholder="Ars" class="form-control" readonly="" value="{{report.insurance_name}}" />
                    </div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">NSS</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" placeholder="Security Social Number" name="nss"  class="form-control" readonly="" value="{{report.nss}}"/></div>
                </div>
            </div>
        </div>
          <div class="form-group"><label class="col-sm-3 control-label">Plate</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="number" placeholder="Plate id" name="bandeja_id"  class="form-control" readonly="" value="{{report.bandeja_id}}"/></div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Surgery Date</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                    <input type="text" placeholder="Surgery Date" name="date"    class="form-control" readonly="" value="{{report.date}}"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Center Name</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                   <input type="text" placeholder="Surgery Date" name="date" default="now"   class="form-control" readonly="" value="{{(report.center_name is defined) ? report.center_name : ""}}"/>
                    </div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Doctor Name</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       
                    <input type="text" placeholder="Doctor Name" name="doctor"  class="form-control" readonly="" value="{{report.doctor}}"/>
                    </div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Surgeon Name</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       
                    <input type="text" placeholder="Surgeon Name" name="surgeon_name"  class="form-control" readonly="" value="{{report.surgeon_name}}"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Observations</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       
                    <textarea type="text" readonly="" placeholder="Observations" name="observations"  class="form-control" required>{{report.observations}}</textarea>
                    </div>
                </div>
            </div>
        </div>
        <hr/>
        
        <button type="submit" class="btn btn-green btn-block">Create</button>
    </form>
</div>
</div>
</div>

{% endblock %}
      
