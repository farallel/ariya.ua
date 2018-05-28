<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
	<!-- Custom CSS -->
	<link rel="stylesheet" href="/static/css/style.css">
	<link rel="shorcut icon" href="/static/img/icon/favicon.ico">
	<title>ООО Ария</title>
</head>
<body class="login-page-background">

	<div class="login-form-wrapper">
		<div class="login-form-container">
			<div class="logo-container">
				<img src="../static/img/logo.png">
			</div>
			<form method="post" action="/login">
				<div class="login-form-field-case">
					<div class="login-form-icon"><img src="../static/img/icon/person.png"></div>
					<input type="text" placeholder="Введите имя..." name="username" required/>
				</div>
				<div class="login-form-field-case">
					<div class="login-form-icon"><img src="../static/img/icon/lock.png"></div>
					<input type="password" placeholder="Введите пароль..." name="password" required/>
				</div>
				<input type="hidden" name="_csrf" value="${_csrf.token}" />
				<button type="submit">Войти</button>
			</form>
		</div>
	</div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

</body>
</html>


