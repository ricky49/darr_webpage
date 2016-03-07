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
       
            <a href="/delete-cart">
                <button type="button" class="btn btn-danger" onclick="return confirm('Esta a punto de eliminar su carrito?')" >Limpiar carrito</button>
            </a> &nbsp;
            <a target="_blank" href="/cart/pdf">
                <button type="button" class="btn btn-warning">Generar cotizacion</button>
            </a> &nbsp;
            <a href="/">
                <button type="button" class="btn btn-info">Productos</button>
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

      </div>
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Producto</th>
                    <th>Codigo</th>
                    <th>Precio/Producto</th>
                    <th>Cantidad</th>
                    <th>Total</th>
                    <th>Accion</th>
                </tr>
                </thead>
                <tbody>
                <?php $total = 0; ?>
                {% for index, cart in carts %}
                    {% set product = this.sdk.getProduct(cart.product_id) %}
                    <tr>

                        <td>{{index+1}}</td>
                        <td>{{product.DETALLE}}</td>
                        <td>{{product.CODIGO}}</td>
                        <td>$ {{number_format(product.PRECIO, 2)}}</td>
                        <td>
                            <form action="/add-cart-item" method="post">
                                <input type="number" name="quantity" class="form-control"  min='1'style="width:50% !important; " value="{{cart.quantity}}"></td>
                        <td>$ {{ number_format((product.PRECIO * cart.quantity),2)}}</td>
                        <td>
                                <input type="hidden" name="product_id" value="{{product._id}}">
                                <input type="hidden" name="source" value="list">
                                <button type="submit"class="btn btn-success btn-xs">
                                    <i class="fa fa-save"></i>
                                </button>
                                </form>
                            <a onclick="return confirm('Esta seguro?')" href="/cart-delete/{{cart._id}}">
                                <button class="btn btn-danger btn-xs">
                                    <i class="fa fa-trash-o " ></i>
                                </button>
                            </a>

                        </td>
                       
                    </tr>
                     {% set total += (product.PRECIO * cart.quantity)  %}
                {% endfor %}
                
                </tbody>
            </table>
            <hr style="border: solid 1px;">
            <table class="table table-hover table-striped">
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td align="right">
                            <b>Total General: </b>
                            <i>$ {{number_format(total,2)}}</i>
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
{% endblock %}
			
