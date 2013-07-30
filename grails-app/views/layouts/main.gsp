<!DOCTYPE html>
<html>
<head>
	<title>B&uacute;squeda de clientes</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<r:require modules="jquery, bootstrap"/>
	<r:layoutResources/>
	<g:layoutHead/>
</head>
<body>
	<div id="spinner" class="spinner" style="display: none;">
		<img src="${resource(dir:'images',file:'spinner.gif')}"
			alt="${message(code:'spinner.alt',default:'Loading...')}" />
	</div>
	<r:layoutResources/>
	<g:layoutBody />
</body>
</html>