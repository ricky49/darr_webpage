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
                                    <span style="font-size: 20px;">Reporte quirurjico</span>
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
                                    {{report.pacient_name}}<br>
                                    {{report.insurance_name}}<br>
                                    {{report.center_name}}<br>
                                    NSS: {{report.nss}}<br>
                                </td>
                                
                                <td>
                                    {{report.date}}<br>
                                    829-917-3445<br>
                                    N/A<br>
                                    Dr. {{report.doctor}}<br>
                                </td>
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
                </tr>
            {% if (products|length > 0 ) %}

                <?php foreach ($products as $key=>$item) {
                    $product = $this->sdk->getProduct($item->product_id);
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
                    </tr>
                <?php } ?>

                 {% else %}
                <tr class="item">
                        <td colspan="3">
                          <i>No existen productos</i>
                        </td>
                    </tr>
            {% endif %}
               
                
               
                
                
               <!--  <tr class="total">
                    <td></td>
                    <td></td>
                    <td>
                        Total: $385.00
                    </td>
                </tr> -->
                </table>

            <br>
            <hr>
            <table cellpadding="0" cellspacing="0">
                <tr class="heading">
                    <td colspan="2">
                        Cirujano
                    </td>
                </tr>
                <tr>
                    <td>
                       Dr. {{report.surgeon_name}}
                    </td>
                </tr>
            </table>
            <br>
            <hr>
            <!-- <table cellpadding="0" cellspacing="0">
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
            <hr>-->

            <table cellpadding="0" cellspacing="0">
                <tr class="heading">
                    <td colspan="2">
                        Observaciones
                    </td>
                </tr>
                <tr>
                    <td>
                        {{report.observations}}
                    </td>
                </tr>
            </table>
            <br>
            <hr>
        </div>
    </body>
</html>