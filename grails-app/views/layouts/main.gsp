<!DOCTYPE html>
<html>
<head>
	<title>B&uacute;squeda de libros</title>
	<link href="${resource(dir:'css',file:'bootstrap.min.css')}" rel="stylesheet" media="screen">
	<link href="${resource(dir:'css',file:'bootstrap-responsive.min.css')}" rel="stylesheet" media="screen">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="http://code.jquery.com/jquery.js"></script>
	<g:javascript library="bootstrap.min" />
	<g:javascript library="application" />
</head>
<body>
	<div id="spinner" class="spinner" style="display: none;">
		<img src="${resource(dir:'images',file:'spinner.gif')}"
			alt="${message(code:'spinner.alt',default:'Loading...')}" />
	</div>
	<g:layoutBody />
</body>
</html>