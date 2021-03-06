class CreateKepplerContactUsMessageSettings < ActiveRecord::Migration
  def change
    create_table :keppler_contact_us_message_settings do |t|
      t.string :mailer_to, default: 'info@keppler.com'
      t.string :mailer_from, default: 'info@keppler.com'

      t.timestamps null: false
    end
    KepplerContactUs::MessageSetting.create(mailer_from: '', mailer_to: '')
  end
end
