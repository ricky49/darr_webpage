{% extends "layouts/base.volt" %}
{% block content %}
{{this.flash.output()}}
<div class="col-md-9">
<div id="generalTabContent" class="tab-content">
    <form  class="form-horizontal">
      <div>
        <div style="display: inline-block;"></div>
        <div style="display: inline-block; float: right; margin-right: 1%;">
            <a href="/requests/history">
                <button type="button" class="btn btn-warning">Requests history</button>
            </a>
        </div>                             
      </div>
        <div class="form-group"><label class="col-sm-3 control-label">Pacient Name</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" name="pacient_name" placeholder="Pacient Name" class="form-control" value="{{req.pacient_name}}" readonly="" /></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Document</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" name="document"  placeholder="Document" class="form-control" readonly="" value="{{req.document}}"/></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Pacient Tel.</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" name="pacient_tel"  placeholder="Pacient Tel" class="form-control" readonly="" value="{{req.pacient_tel}}" /></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">ARS</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       <input type="text" name="insurance_name"  placeholder="Ars" class="form-control" readonly="" value="{{req.insurance_name}}" />
                    </div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Authorization</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" placeholder="Authorization" name="authorization"  class="form-control" readonly="" value="{{req.authorization}}"/></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Procedure Name</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       
                    <input type="text" placeholder="Procedure Name" name="procedure_name" value="{{req.procedure_name}}"  class="form-control" readonly="" />
                    </div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Surgery Date</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                    <input type="text" placeholder="Surgery Date" name="surgery_date" default="now"  value="{{req.surgery_date}}" class="form-control" readonly="" />
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Center Name</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                   <input type="text" placeholder="Surgery Date" name="center_name" default="now"  value="{{req.center_name}}" class="form-control" readonly="" />
                    </div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Surgeon Name</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       
                    <input type="text" placeholder="Surgeon Name" name="surgeon_name"  class="form-control" readonly="" value="{{req.surgeon_name}}"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Products</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       
                    <textarea type="text" placeholder="Products" name="item_manuales"  class="form-control" readonly="" >{{req.item_manuales}}</textarea>
                    </div>
                </div>
            </div>
        </div>
        <hr/>
        
    </form>
</div>
</div>
</div>

{% endblock %}
      
