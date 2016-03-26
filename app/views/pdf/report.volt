<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- <link rel="stylesheet" type="text/css" href="/pdf_styles/style.css"> -->
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
                                    <div style="font-size: 20px; margin-top:20px; font-weight: bold; color:#6B6B6B;">REPORTE QUIRURGICO</div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                
    <tr class="information" style="" >
        <td colspan="2" style="">
            <table>
                <tr height="1">
                    <td>
                        <table style="width:700px; ">
                                <tr >
                                    <td height="1" style="width: 10%; white-space: nowrap;">PACIENTE</td>
                                    <td  colspan="3" height="1" style="border-bottom: 1px solid #B4B5B0; padding-bottom: -1px !important; margin-bottom: 10px;">{{report.pacient_name}}</td>
                                </tr>                                 
                        </table>


                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width:700px; ">
                                <tr >
                                    <td height="1" style="width: 14%; white-space: nowrap;">ASEGURADORA</td>
                                    <td  colspan="3" height="1" style="border-bottom: 1px solid #B4B5B0; padding-bottom: -1px !important; margin-bottom: 10px;">{{report.insurance_name}}</td>

                                    <td height="1" style="width: 9%; white-space: nowrap;">CENTRO</td>  <td  colspan="3" height="1" style="border-bottom: 1px solid #B4B5B0; padding-bottom: -1px !important; margin-bottom: 10px;">{{report.center_name}}</td>
                                </tr>                                 
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width:700px; ">
                                <tr >
                                    <td height="1" style="width: 5%; white-space: nowrap;">NSS</td>
                                    <td  colspan="3" height="1" style="width: 110px; border-bottom: 1px solid #B4B5B0; padding-bottom: -1px !important; margin-bottom: 10px;">{{report.nss}}</td>

                                    <td height="1" style="width: 7%; white-space: nowrap;">FECHA</td>  <td  colspan="3" height="1" style="border-bottom: 1px solid #B4B5B0; padding-bottom: -1px !important; margin-bottom: 10px;">{{report.date}}</td>
                                </tr>                                 
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width:700px; ">
                                <tr >
                                    <td height="1" style="width: 9%; white-space: nowrap;">DOCTOR</td>
                                    <td  colspan="3" height="1" style="border-bottom: 1px solid #B4B5B0; padding-bottom: -1px !important; margin-bottom: 10px;">{{report.doctor}}</td>
                                </tr>                                 
                        </table>


                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<br>
<br>


        <table cellpadding="0" cellspacing="0" width="">
                <tr class="heading">
                    <td>
                        CODIGO
                    </td>

                    <td>
                        CANTIDAD
                    </td>
                    <td></td>
                    <td>
                        DESCRIPCION
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
                          <i>NO EXISTEN PRODUCTOS</i>
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
            <br>
    



        <!--     <table cellpadding="0" cellspacing="0">
                <tr class="heading">
                    <td colspan="2">
                        CIRUJANO
                    </td>
                </tr>
                <tr>
                    <td>
                       DR. {#report.surgeon_name#}
                    </td>
                </tr>
            </table>
            <br>
            <hr> -->
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
<!-- 
            <table cellpadding="0" cellspacing="0">
                <tr class="heading">
                    <td colspan="2">
                        Observaciones
                    </td>
                </tr>
                <tr>
                    <td>
                        {#report.observations#}
                    </td>
                </tr>
            </table>
            <br>
            <hr> -->

            <!-- footer -->
<table>
    <tr class="information footer" style="position:relative; bottom:0;" >
        <td colspan="2" style="">
            <table>
                <tr>
                    <td>
                        <table style="width:700px; ">
                                <tr >
                                    <td height="1" style="width: 9%; white-space: nowrap;">CIRUJANO</td>
                                    <td  colspan="3" height="1" style="border-bottom: 1px solid #B4B5B0; padding-bottom: -1px !important; margin-bottom: 10px;">{{report.doctor}}</td>
                                </tr>                                 
                        </table>


                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width:700px; ">
                                <tr >
                                    <td height="1" style="width: 14%; white-space: nowrap;">OBSERVACIONES</td>
                                    <td  colspan="3" height="1" style="border-bottom: 1px solid #B4B5B0; padding-bottom: -1px !important; margin-bottom: 10px;">{{report.observations}}</td>
                                </tr>                                 
                        </table>


                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width:700px; ">
                                <tr >
                                    <td  colspan="3" height="3" style="border-bottom: 1px solid #B4B5B0; padding-bottom: -1px !important; margin-bottom: 10px;">&nbsp;</td>
                                </tr>                                 
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width:700px; ">
                                <tr >
                                    <td  colspan="3" height="3" style="border-bottom: 1px solid #B4B5B0; padding-bottom: -1px !important; margin-bottom: 10px;">&nbsp;</td>
                                </tr>                                 
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width:700px; ">
                                <tr >
                                    <td  colspan="3" height="3" style="border-bottom: 1px solid #B4B5B0; padding-bottom: -1px !important; margin-bottom: 10px;">&nbsp;</td>
                                </tr>                                 
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width:700px; ">
                                <tr >
                                    <td  colspan="3" height="3" style="border-bottom: 1px solid #B4B5B0; padding-bottom: -1px !important; margin-bottom: 10px;">&nbsp;</td>
                                </tr>                                 
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<!-- footer end -->


        </div>
    </body>
</html>