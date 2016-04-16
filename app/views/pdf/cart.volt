<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
    </head>
    <body >

        <div class="invoice-box">
            <table cellpadding="0" cellspacing="0">
                <tr class="top">
                    <td colspan="2">
                        <table>
                            <tr>
                                <td class="title">
                                    <img src="images/logo.png" style="width:30%; display: inline;max-width:300px; height:auto;">
                                </td>
                                <td valign="bottom">
                                    <br>
                                    <br>
                                    <br>
                                    <div style="font-size: 20px; margin-top:20px; font-weight: bold; color:#6B6B6B;">Cotización</div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr class="information">
                    <td colspan="2">
                        <table>
                        <tr height="1">
                            <td>
                                <table style="width:700px; ">
                                        <tr >
                                            <td height="1" style="width: 10%; white-space: nowrap;">USUARIO</td>
                                            <td  colspan="3" height="1" style="border-bottom: 1px solid #B4B5B0; padding-bottom: -1px !important; margin-bottom: 10px;">{{user.name}}</td>
                                        </tr>                                 
                                </table>


                            </td>
                        </tr>
                          <tr height="1">
                            <td>
                                <table style="width:700px; ">
                                        <tr >
                                            <td height="1" style="width: 10%; white-space: nowrap;">FECHA</td>
                                            <td  colspan="3" height="1" style="border-bottom: 1px solid #B4B5B0; padding-bottom: -1px !important; margin-bottom: 10px;">{{date("Y-m-d",time())}}</td>
                                        </tr>                                 
                                </table>
                            </td>
                        </tr>
                         <tr height="1">
                            <td>
                                <table style="width:700px; ">
                                        <tr >
                                            <td height="1" style="width: 10%; white-space: nowrap;">ENVIAR A:</td>
                                            <td  colspan="3" height="1" style="border-bottom: 1px solid #B4B5B0; padding-bottom: -1px !important; margin-bottom: 10px;">{{user.mail}}</td>
                                        </tr>                                 
                                </table>
                            </td>
                        </tr>
                           
                        </table>
                    </td>
                </tr>
            </table>  

            <br>
<table style="border: 0px; height:100% !important;">
 <tr>
 <td>
            <table cellpadding="0" cellspacing="0">
                <!--  <tr class="heading">
                    <td>
                        Payment Method
                    </td>
                    
                    <td>
                        Check #
                    </td>
                </tr> -->
                
                <!--  <tr class="details">
                    <td>
                        Check
                    </td>
                    
                    <td>
                        1000
                    </td>
                </tr> -->
                
                <tr class="heading">
                    <td>
                        Código
                    </td>
                    <td>
                        Cantidad
                    </td>
                    <td></td>
                    <td>
                        Descripcion
                    </td>
                    <td>
                        Precio
                    </td>
                </tr>
                
                {% if (cart|length > 0 ) %}
                    
                    <?php
                    $total = 0;
                    $total_cant = 0;
                    foreach ($cart as $key=>$item) {
                    $product = $this->sdk->getProduct($item->product_id);
                    $total += $product->PRECIO * $item->quantity;
                    $total_cant += $item->quantity;

                    ?>
                    <tr class="item">
                        <td>
                            {{product.CODIGO}}
                        </td>
                        
                        <td>
                            {{item.quantity}}
                        </td>
                        <td></td>
                        <td>
                            {{product.DETALLE}}
                        </td>
                        <td>
                            RD ${{number_format(product.PRECIO, 2)}}
                        </td>
                    </tr>
                    
                    <?php } ?>
                    <tr class="total">
                        <td><i>Total:</i></td>
                        <td>{{total_cant}}</td>
                        <td></td>
                        <td></td>
                        <td>
                            <b>RD ${{number_format(total, 2)}}</b>
                        </td>
                    </tr>
                {% else %}
                    <tr class="item">
                        <td colspan="3">
                            <i>No existen productos</i>
                        </td>
                    </tr>
                {% endif %}
                
                
                
            </table>
            <br>
            <hr>
            <!--  <table cellpadding="0" cellspacing="0">
                <tr class="heading">
                    <td colspan="2">
                        Cirujano
                    </td>
                </tr>
                <tr>
                    <td>
                        Dr. sd
                    </td>
                </tr>
            </table>
            <br>
            <hr>
            <table cellpadding="0" cellspacing="0">
                <tr class="heading">
                    <td colspan="2">
                        Asistente
                    </td>
                </tr>
                <tr>
                    <td>
                        Joan carrasco
                    </td>
                </tr>
            </table>
            <br>
            <hr>
            <table cellpadding="0" cellspacing="0">
                <tr class="heading">
                    <td colspan="2">
                        Observaciones
                    </td>
                </tr>
                <tr>
                    <td>
                        ds
                    </td>
                </tr>
            </table>
            <br>
            <hr> -->
            </td>
            </tr>
            <tr>
            <td style="  height:600px; width:500px; vertical-align: bottom;"  >
                <table>
                        <tr>
                            <td style=" text-align: center;border-style: solid;  border-top:1px;">Entregado por:</td>
                            <td >&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style= " text-align: center;border-style: solid; border-top: 1px;">Recibido por:</td>
                        </tr>
                </table>
            </td>
            </tr>
             <tr>
            <td style=" width:400px; vertical-align: bottom; text-align:center; font-size:10px;"  >
                   <i>Los precios detallados en esta Cotización, estan sujeto a cambios a partir de los treinta (30) dias. </i>
            </td>
            </tr>
    </table>
        </div>
    </body>
</html>