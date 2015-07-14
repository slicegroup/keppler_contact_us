# Agregar datos de configuración
KepplerContactUs.setup do |config|
	config.mailer_to = "luis.prz7@gmail.com"
	config.mailer_from = "no-reply@inyxtech.com"
	config.name_web = "Inyxtech"
	# Activar o Desactivar la ruta especificada ("messages/new")
	config.messages_new = true
	#Route redirection after send
	config.redirection = "/contact_us"


	# Agregar keys de google recaptcha
	Recaptcha.configure do |config|
	  config.public_key  = "6LcigfgSAAAAAIPoJOj57Myb8qn7H8p2X7n7S6R9"
	  config.private_key = "6LcigfgSAAAAAFJvjSSYaL2RyiEukdthGTrNZvVy"
	end
end