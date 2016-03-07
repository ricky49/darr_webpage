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
           <!--  <a href="/reports/history">
                <button type="button" class="btn btn-warning">Historial de reportes</button>
            </a> -->
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
    <form action="/reports/savep/{{report_id}}" method="POST" class="form-horizontal">

    <div  class="form-horizontal">
      <div>
        <div style="display: inline-block;"></div>
        <div style="display: inline-block; float: right; margin-right: 1%;">
            <!-- <a href="/requests/history"> -->
                <!-- <button type="button" class="btn btn-warning">Requests history</button> -->
            <!-- </a> -->
        </div>                             
      </div>
        <div style="margin-left:30px; float:right;">
            <label for="">Cantidad</label>
        </div>
      
      <hr>
         {% set total =  0 %}
       <?php foreach ($products as $key=>$item) {
            $product = $this->sdk->getProduct($item->product_id);
        ?>
            <div class="form-group"><label class="col-sm-3 control-label">Producto: {{key+1}}</label>
                <div class="col-sm-9 controls">
                    <div class="row">
                        <div class="col-xs-19">
                           <div class="col-xs-9">
                            <span class="form-control">{{product.DETALLE}}</span> 
                               
                           </div>
                           <div style="display: inline; float: right; width: 86px;">
                            <input type="hidden" name="product[]" value="{{item.product_id}}" >
                            <input type="hidden" name="repoProduct[]" value="{{item._id}}" >
                            <input type="number" name="quantity[]"min="1" value="1"class="form-control" >
                               
                           </div>
                        </div>
                    </div>
                </div>
            </div>
        <?php } ?>
        <hr/>
           <!-- <div class="form-group"><label class="col-sm-3 control-label">Total</label>

            <div class="col-sm-9 controls">
                <div class="row">
                    <div class="col-xs-9">
                       
                    <span class="form-control" >   <?php echo "$ ".number_format($total,2); ?></span>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- <hr/> -->
         <!-- <button type="buton" onclick="window.location='/requests'"class="btn btn-orange btn-block">Cancelar</button> -->
         <br>
         <form action="/requests/create" method="POST">
            <input type="hidden">
            <button type="submit" class="btn btn-green btn-block">Confirmar</button>
         </form>
    </div>
</div>
</div>
</div>

{% endblock %}
      
