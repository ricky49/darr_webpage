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
           <a href="/reports/history">
                <button type="button" class="btn btn-warning">Historial de reportes</button>
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
<div id="generalTabContent" class="tab-content">
    <form  class="form-horizontal">
      <div>     
        <div style="display: inline-block;"></div>
        <div style="display: inline-block; float: right; margin-right: 1%;">
            <!-- <a href="/reports/history">
                <button type="button" class="btn btn-warning">Historial de reportes</button>
            </a> -->
        </div>                             
      </div>
        <div class="form-group"><label class="col-sm-3 control-label">Paciente</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" name="pacient_name" placeholder="Pacient Name" class="form-control" value="{{report.pacient_name}}" readonly=""/></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Seguro</label>

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
          <div class="form-group"><label class="col-sm-3 control-label">Bandeja</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="number" placeholder="Plate id" name="bandeja_id"  class="form-control" readonly="" value="{{report.bandeja_id}}"/></div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Fecha de cirujia</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                    <input type="text" placeholder="Surgery Date" name="date"    class="form-control" readonly="" value="{{report.date}}"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Centro</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                   <input type="text" placeholder="Surgery Date" name="date" default="now"   class="form-control" readonly="" value="{{(report.center_name is defined) ? report.center_name : ""}}"/>
                    </div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Doctor</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       
                    <input type="text" placeholder="Doctor Name" name="doctor"  class="form-control" readonly="" value="{{report.doctor}}"/>
                    </div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Cirujano</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       
                    <input type="text" placeholder="Surgeon Name" name="surgeon_name"  class="form-control" readonly="" value="{{report.surgeon_name}}"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Observaciones</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       
                    <textarea type="text" readonly="" placeholder="Observations" name="observations"  class="form-control" required>{{report.observations}}</textarea>
                    </div>
                </div>
            </div>
        </div>
       {% if (products|length > 0 ) %}
            <div style="margin-left:30px; float:right;">
                <label for="">Cantidad</label>
            </div>
          
            <hr>
         
           <?php foreach ($products as $key=>$item) {
                $product = $this->sdk->getProduct($item->product_id);
            ?>
                <div class="form-group"><label class="col-sm-3 control-label">Producto: {{key+1}}</label>
                    <div class="col-sm-9 controls">
                        <div class="row">
                            <div class="col-xs-19">
                               <div class="col-xs-9">
                                <span class="form-control" readonly>{{product.DETALLE}}</span> 
                                   
                               </div>
                               <div style="display: inline; float: right; width: 86px;">
                                <input type="hidden" name="product[]" value="{{item.product_id}}" >
                                <input type="hidden" name="repoProduct[]" value="{{item._id}}" >
                                <input type="number" readonly name="quantity[]"min="1" value="{{item.quantity}}"class="form-control" >
                                   
                               </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php } ?>
            <hr/>
        {% else %}
        <i>Reporte sin productos</i>
        {% endif %}
        <!-- <button type="submit" class="btn btn-green btn-block">Crear</button> -->
    </form>
</div>
</div>
</div>

{% endblock %}
      
