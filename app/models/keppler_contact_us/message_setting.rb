#Generado por keppler
module KepplerContactUs
  class MessageSetting < ActiveRecord::Base
    include CloneRecord

    # Fields for the search form in the navbar
    def self.search_field
      :mailer_to_or_recaptcha_pv_or_recaptcha_pb_cont
    end
  end
  #MessageSetting.import
end
