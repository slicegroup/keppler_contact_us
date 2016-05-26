require "keppler_contact_us/engine"

module KepplerContactUs

	mattr_accessor :redirection, :mailer_from, :mailer_to, :name_web

	# Default way to setup ContactUs. Run rake contact_us:install to create
	# a fresh initializer with all configuration values.
	def self.setup
		yield self
	end
end
