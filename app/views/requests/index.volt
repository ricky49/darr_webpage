{% extends "layouts/base.volt" %}
{% block content %}
{{this.flash.output()}}
<div class="col-md-9">
<div id="generalTabContent" class="tab-content">
    <form action="/requests/create" method="POST" class="form-horizontal">
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
                    <div class="col-xs-9"><input type="text" name="pacient_name" placeholder="Pacient Name" class="form-control" required/></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Document</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="number" name="document"  placeholder="Document" class="form-control" required/></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Pacient Tel.</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="number" name="pacient_tel"  placeholder="Pacient Tel" class="form-control" required/></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">ARS</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                        <select name="insurance_name"  class="form-control" required>
                            <option value="ARS Humano  ">ARS Humano  </option>
                            <option value="Palic Salud">Palic Salud</option>
                            <option value="Universal ">Universal </option>
                            <option value="SeNaSa">SeNaSa</option>
                            <option value="Renacer ">Renacer </option>
                            <option value="Constitución">Constitución</option>
                            <option value="Semma ">Semma </option>
                            <option value="Simag ">Simag </option>
                            <option value="Salud Segura">Salud Segura</option>
                            <option value="GMA">GMA</option>
                            <option value="ARS-CMD">ARS-CMD</option>
                            <option value="Monumental">Monumental</option>
                            <option value="MetaSalud">MetaSalud</option>
                            <option value="Futuro">Futuro</option>
                            <option value="Reservas">Reservas</option>
                            <option value="Administradora de Riesgos de Salud de las Fuerzas Armadas">Administradora de Riesgos de Salud de las Fuerzas Armadas</option>
                            <option value="Bupa Dominicana, S.A.">Bupa Dominicana, S.A.</option>
                            <option value="Plan Salud Banco Central">Plan Salud Banco Central</option>
                            <option value="Pladent">Pladent</option>
                            <option value="Asemap">Asemap</option>
                            <option value="PN">PN</option>
                            <option value="Serena Salud">Serena Salud</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Authorization</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9"><input type="number" placeholder="Authorization" name="authorization"  class="form-control" required/></div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Procedure Name</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       
                    <input type="text" placeholder="Procedure Name" name="procedure_name"  class="form-control" required/>
                    </div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Surgery Date</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                    <input type="date" placeholder="Surgery Date" name="surgery_date" default="now"  value="<?php echo date('Y-m-d'); ?>" class="form-control" required/>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Center Name</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                   <select type="text" name="center_name"  class="form-control" required>
                        {% for center in centers %}
                            <option value="{{center.center_name}}">{{center.center_name}}</option>
                        {% endfor %}
                        </select>  
                    </div>
                </div>
            </div>
        </div>
         <div class="form-group"><label class="col-sm-3 control-label">Surgeon Name</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       
                    <input type="text" placeholder="Surgeon Name" name="surgeon_name"  class="form-control" required/>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group"><label class="col-sm-3 control-label">Products</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       
                    <textarea type="text" placeholder="Products" name="item_manuales"  class="form-control" required></textarea>
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
      
