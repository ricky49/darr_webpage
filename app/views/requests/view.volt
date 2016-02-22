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
                <button type="button" class="btn btn-warning">Historial de solicitudes</button>
            </a>
        </div>                             
      </div>
        <div class="form-group"><label class="col-sm-3 control-label">Paciente</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" name="pacient_name" placeholder="Pacient Name" class="form-control" value="{{req.pacient_name  is defined ? req.pacient_name:'--'}}" readonly="" /></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Documento</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" name="document"  placeholder="Document" class="form-control" readonly="" value="{{req.document is defined ? req.document:'--' }}"/></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Tel. Paciente</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" name="pacient_tel"  placeholder="Pacient Tel" class="form-control" readonly="" value="{{req.pacient_tel is defined ? req.pacient_tel:'--' }}" /></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">ARS</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       <input type="text" name="insurance_name"  placeholder="Ars" class="form-control" readonly="" 
                       value="{{req.insurance_name is defined ? req.insurance_name:'--'  }}" />
                    </div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Autorizacion</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="text" placeholder="Authorization" name="authorization"  class="form-control" readonly="" value="{{req.authorization is defined ? req.authorization:'--'  }}"/></div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Fecha de cirugia</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                    <input type="text" placeholder="Surgery Date" name="surgery_date" default="now"  
                    value="{{req.surgery_date is defined ? req.surgery_date:'--'  }}" class="form-control" readonly="" />
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Centro</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                   <input type="text" placeholder="Surgery Date" name="center_name" default="now"  value="{{req.center_name is defined ? req.center_name:'--' }}" class="form-control" readonly="" />
                    </div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Cirujano</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       
                    <input type="text" placeholder="Surgeon Name" name="surgeon_name"  class="form-control" readonly="" 
                    value="{{req.surgeon_name is defined ? req.surgeon_name:'--' }}"/>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="form-group"><label class="col-sm-3 control-label">Procedimiento</label>
            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                        <span type="text" placeholder="Procedure Name" readonly name="procedure_name" class="form-control"  >
                        {{req.procedure_name_label  is defined ? req.procedure_name_label:'--' }} </span>   
                    </div>
                </div>
            </div>
        </div>
        <hr>
         {% set total =  0 %}
      <?php foreach ($items as $key=>$item) {
        ?>

            <div class="form-group"><label class="col-sm-3 control-label">Producto: {{key+1}}</label>
                <div class="col-sm-9 controls">
                    <div class="row">
                        <div class="col-xs-9">
                          <input type="text" placeholder="Surgeon Name" name="surgeon_name"  class="form-control" readonly="" 
                    value="{{item.DETALLE}}"/>
                        </div>
                    </div>
                </div>
            </div>

        <?php
         $total += (isset($item->PRECIO)) ? $item->PRECIO:0;
        
       } ?>
        <hr/>
           <div class="form-group"><label class="col-sm-3 control-label">Total</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       
                    <span class="form-control" readonly="" >   <?php echo "$ ".number_format($total,2); ?></span>
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
      
