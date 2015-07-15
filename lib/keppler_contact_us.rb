require "keppler_contact_us/engine"

module KepplerContactUs
	ROUTE_SIDEBAR = true
	#Route redirection after send
	mattr_accessor :redirection
	# Dirección de correo electronico que recibirá
	mattr_accessor :mailer_from
	# Dirección de correo electronico que enviará
	mattr_accessor :mailer_to

	# Ubicación de la gema
	mattr_accessor :name_web
	# Default way to setup ContactUs. Run rake contact_us:install to create
	# a fresh initializer with all configuration values.
	def self.setup
		yield self
	end
end
