# Agregar datos de configuración
KepplerContactUs.setup do |config|
  #config.mailer_to = "<Email receptor>"
  #config.mailer_from = "<Email emisor>"
  #config.name_web = "Inyxtech"
  #Route redirection after send
  config.redirection = "/"

  # Agregar keys de google recaptcha
  #Recaptcha.configure do |config|
  #  config.public_key  = "6LcigfgSAAAAAIPoJOj57Myb8qn7H8p2X7n7S6R9"
  #  config.private_key = "6LcigfgSAAAAAFJvjSSYaL2RyiEukdthGTrNZvVy"
  #end
end