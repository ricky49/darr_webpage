{% extends "layouts/base.volt" %}
{% block content %}
{{this.flash.output()}}
<div class="col-md-9">
<div id="generalTabContent" class="tab-content">
    <div  class="form-horizontal">
      <div>
        <div style="display: inline-block;"></div>
        <div style="display: inline-block; float: right; margin-right: 1%;">
            <!-- <a href="/requests/history"> -->
                <!-- <button type="button" class="btn btn-warning">Requests history</button> -->
            <!-- </a> -->
        </div>                             
      </div>
        <div class="form-group"><label class="col-sm-3 control-label">Paciente</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><span type="text" name="pacient_name" placeholder="Nombre de paciente" class="form-control">{{req.pacient_name}}</span></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Documento</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><span type="text" name="document"  placeholder="Document" class="form-control"  >{{req.document}}</span></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Tel. Paciente</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><span type="text" name="pacient_tel"  placeholder="Pacient Tel" class="form-control"  >{{req.pacient_tel}}</span></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">ARS</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       <span type="text" name="insurance_name"  placeholder="Ars" class="form-control"   >{{req.insurance_name}}</span>
                    </div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Autorizacion</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><span type="text" placeholder="Authorization" name="authorization"  class="form-control" >{{req.authorization}}</span></div>
                </div>
            </div>
        </div>
      
         <div class="form-group"><label class="col-sm-3 control-label">Fecha de cirugia</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                    <span type="text" placeholder="Surgery Date" name="surgery_date" default="now"  class="form-control"  >{{req.surgery_date}}</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Centro</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                   <span type="text" placeholder="Surgery Date" name="center_name" default="now"  class="form-control"  >{{req.center_name}}</span>
                    </div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Cirujano</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       
                    <span type="text" placeholder="Surgeon Name" name="surgeon_name"  class="form-control" >{{req.surgeon_name}}</span>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="form-group"><label class="col-sm-3 control-label">Procedimiento</label>
            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                        <span type="text" placeholder="Procedure Name" name="procedure_name" class="form-control"  >{{req.procedure_name}} </span>   
                    </div>
                </div>
            </div>
        </div>
        
         {% set total =  0 %}
       <?php foreach ($items as $key=>$item) {
        ?>

            <div class="form-group"><label class="col-sm-3 control-label">Producto: {{key+1}}</label>
                <div class="col-sm-9 controls">
                    <div class="row">
                        <div class="col-xs-9">
                        <span class="form-control">{{item.DETALLE}}</span>
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
                       
                    <span class="form-control" >   <?php echo "$ ".number_format($total,2); ?></span>
                    </div>
                </div>
            </div>
        </div>
        <hr/>
         <button type="buton" onclick="window.location='/requests'"class="btn btn-orange btn-block">Cancelar</button>
         <br>
         <form action="/requests/create" method="POST">
            <input type="hidden">
            <button type="submit" onclick="return confirm('Esta seguro de que quiere enviar la solicitud?')" class="btn btn-green btn-block">Confirmar</button>
         </form>
    </div>
</div>
</div>
</div>

{% endblock %}
      
