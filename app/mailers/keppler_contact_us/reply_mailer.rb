module KepplerContactUs
  class ReplyMailer < ActionMailer::Base
    def contact(client, to)
      @client = client
      mailer_from = KepplerContactUs::MessageSetting.first.mailer_from
      mail(
        from: mailer_from,
        to: to,
        subject: @client.subject
      )
    end
  end
end
