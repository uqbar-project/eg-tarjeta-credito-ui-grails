<!DOCTYPE html>
<html>
<head>
	<title>B&uacute;squeda de clientes</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<asset:stylesheet href="application.css"/>
	<asset:javascript src="application.js"/>
	<g:layoutHead/>
</head>
<body>
	<div id="spinner" class="spinner" style="display: none;">
		<img src="${resource(dir:'images',file:'spinner.gif')}"
			alt="${message(code:'spinner.alt',default:'Loading...')}" />
	</div>
	<g:layoutBody />
</body>
</html>