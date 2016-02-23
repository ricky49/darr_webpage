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
                                    <!-- <img src="pdf_styles/bak.jpg" style="width:100%; max-width:300px;"> -->
                                    <span style="width:100%; max-width:300px;">DARR PROJECT</span><br>
                                    <span style="font-size: 20px;">Cotizacion</span>
                                </td>
                                
                                <!-- <td>
                                    Invoice #: 123<br>
                                    Created: January 1, 2015<br>
                                    Due: February 1, 2015
                                </td> -->
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr class="information">
                    <td colspan="2">
                        <table>
                            <tr>
                                <td>
                                    {{user.name}}<br>
                                    {{date("Y-m-d",time())}}<br>
                                    {{user.rol}}<br>
                                </td>
                                
                             <!--    <td>
                                    d<br>
                                    829-917-3445<br>
                                    N/A<br>
                                    Dr. <br>
                                </td> -->
                            </tr>
                        </table>
                    </td>
                </tr>
                </table>
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
                        Codigo
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
                    $total += $product->PRECIO;
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
        </div>
    </body>
</html>