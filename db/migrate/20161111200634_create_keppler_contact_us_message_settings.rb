class CreateKepplerContactUsMessageSettings < ActiveRecord::Migration
  def change
    create_table :keppler_contact_us_message_settings do |t|
      t.string :mailer_to
      t.string :recaptcha_pv
      t.string :recaptcha_pb

      t.timestamps null: false
    end
  end
end
