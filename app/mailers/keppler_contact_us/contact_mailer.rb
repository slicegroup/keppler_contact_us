module KepplerContactUs
  class ContactMailer < ApplicationMailer
  	def contact(client)
	    @client = client
	    mail(from: KepplerContactUs.mailer_from, to: KepplerContactUs.mailer_to, subject: @client[:subject])
	end
  end
end
