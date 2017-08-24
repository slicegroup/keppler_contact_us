# Agregar datos de configuración
KepplerContactUs.setup do |config|
  config.mailer_from = "no-reply@example.com"
	#Route redirection after send
  config.redirection = "/"
end
