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
           <a href="/cart">
                <button type="button" class="btn btn-info">Ver Carrito</button>
            </a>
            &nbsp;
        </div>
    </div>
    <div class="clearfix">
    </div>
</div>


<div class="page-content">
<!--BEGIN CONTENT-->
{{this.flash.output()}}
<div id="tab-general">
	<div class="row mbl">
		<div class="col-lg-12">
			<div class="col-md-12">
				<div id="area-chart-spline" style="width: 100%; height: 300px; display: none;">
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="page-content">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel">
							<div class="panel-body">
								<div id="grid-layout-table-1" class="box jplist"> <div style="display: inline-block; float: right; margin-right: 1%;">
            
        </div> 
									<div class="jplist-ios-button"><i class="fa fa-sort"></i>Acciones</div>
									<div class="jplist-panel box panel-top">
										<button type="button" data-control-type="reset" data-control-name="reset" data-control-action="reset" class="jplist-reset-btn btn btn-default">Resetear<i class="fa fa-share mls"></i></button>
										<div data-control-type="drop-down" data-control-name="paging" data-control-action="paging" class="jplist-drop-down form-control">
											<ul class="dropdown-menu">
												<li><span data-number="3"> 3 por pagina</span></li>
												<li><span data-number="5"> 5 por pagina</span></li>
												<li><span data-number="10" data-default="true"> 10 por pagina</span></li>
												<li><span data-number="all"> ver todo</span></li>
											</ul>
										</div>
										<div data-control-type="drop-down" data-control-name="sort" data-control-action="sort" data-datetime-format="{month}/{day}/{year}" class="jplist-drop-down form-control">
											<ul class="dropdown-menu">
												<li><span data-path="default">Ordenar por</span></li>
												<li><span data-path=".title" data-order="asc" data-type="text">Titulo A-Z</span></li>
												<li><span data-path=".title" data-order="desc" data-type="text">Titulo Z-A</span></li>
												<li><span data-path=".desc" data-order="asc" data-type="text">Descripcion A-Z</span></li>
												<li><span data-path=".desc" data-order="desc" data-type="text">Descripcion Z-A</span></li>
												<li><span data-path=".like" data-order="asc" data-type="number" data-default="true">Precio asc</span></li>
												<li><span data-path=".like" data-order="desc" data-type="number">Precio desc</span></li>
												<!-- <li><span data-path=".date" data-order="asc" data-type="datetime">Date asc</span></li> -->
												<!-- <li><span data-path=".date" data-order="desc" data-type="datetime">Date desc</span></li> -->
											</ul>
										</div>
										<div class="text-filter-box">
											<div class="input-group"><span class="input-group-addon"><i class="fa fa-search"></i></span><input data-path=".title" type="text" value="" placeholder="Filtrar por Producto" data-control-type="textbox" data-control-name="title-filter" data-control-action="filter" class="form-control"/></div>
										</div>
										<div class="text-filter-box">
											<div class="input-group"><span class="input-group-addon"><i class="fa fa-search"></i></span><input data-path=".desc" type="text" value="" placeholder="Filtrar por Descripcion" data-control-type="textbox" data-control-name="desc-filter" data-control-action="filter" class="form-control"/></div>
										</div>
										<div data-type="Page {current} of {pages}" data-control-type="pagination-info" data-control-name="paging" data-control-action="paging" class="jplist-label btn btn-default"></div>
											<div data-control-type="pagination" data-control-name="paging" data-control-action="paging" class="jplist-pagination"></div>
									</div>
									<div class="box text-shadow">

									<table class="demo-tbl"><!--<item>1</item>-->
	
									{% for product in products %}
										<tr class="tbl-item"><!--<img/>-->
											<!-- <td class="img">
												<img src="images/thumbs/arch-1.jpg" alt="" title=""/>
											</td> -->
											<!--<data></data>-->
											<td class="td-block">
												<form action="/add-cart-item" method="post" class="date">
													<input type="number" name="quantity" placeholder="Cantidad" class="form-control" style="display: inline !important; width: 50% !important;"  min="1" required>
													<input type="hidden" name="product_id" value="{{product._id}}">
													<button type="submit" class="btn btn-warning">
                                                        Agregar al carrito
                                                    </button>
                                                    <!-- <p style="float:right; margin-right:19%; color:#b1b1b1"><i>Actualmente tienes: </i><b>3 </b><i>Items</i></p> -->
                                                </form>
												<p class="title">{{ product.DETALLE}}</p>
												<p class="desc">{{ product.CODIGO}}</p>
												<p class="like">$ {{number_format(product.PRECIO, 2)}}</p>
											</td>
										</tr>
									{% endfor %}
									</table>
									</div>
									<div class="box jplist-no-results text-shadow align-center"><p>No hay productos que mostrar</p></div>
									<div class="jplist-ios-button"><i class="fa fa-sort"></i>Acciones</div>
									<div class="jplist-panel box panel-bottom">
									<div data-control-type="drop-down" data-control-name="paging" data-control-action="paging" data-control-animate-to-top="true" class="jplist-drop-down form-control">
									<ul class="dropdown-menu">
									<li><span data-number="3"> 3 por pagina</span></li>
									<li><span data-number="5"> 5 por pagina</span></li>
									<li><span data-number="10" data-default="true"> 10 por pagina</span></li>
									<li><span data-number="all"> Ver todo</span></li>
									</ul>
									</div>
									<div data-control-type="drop-down" data-control-name="sort" data-control-action="sort" data-control-animate-to-top="true" data-datetime-format="{month}/{day}/{year}" class="jplist-drop-down form-control">
									<ul class="dropdown-menu">
									<li><span data-path="default">Ordenar por</span></li>
									<li><span data-path=".title" data-order="asc" data-type="text">Producto A-Z</span></li>
									<li><span data-path=".title" data-order="desc" data-type="text">Producto Z-A</span></li>
									<li><span data-path=".desc" data-order="asc" data-type="text">Descripcion A-Z</span></li>
									<li><span data-path=".desc" data-order="desc" data-type="text">Descripcion Z-A</span></li>
									<li><span data-path=".like" data-order="asc" data-type="number" data-default="true">Precio asc</span></li>
									<li><span data-path=".like" data-order="desc" data-type="number">Precio desc</span></li>
									<!-- <li><span data-path=".date" data-order="asc" data-type="datetime">Date asc</span></li> -->
									<!-- <li><span data-path=".date" data-order="desc" data-type="datetime">Date desc</span></li> -->
									</ul>
									</div>
									<div data-type="{start} - {end} of {all}" data-control-type="pagination-info" data-control-name="paging" data-control-action="paging" class="jplist-label btn btn-default"></div>
									<div data-control-type="pagination" data-control-name="paging" data-control-action="paging" data-control-animate-to-top="true" class="jplist-pagination"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--END CONTENT-->
{% endblock %}

