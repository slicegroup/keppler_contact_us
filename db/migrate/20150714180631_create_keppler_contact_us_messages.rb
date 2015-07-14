class CreateKepplerContactUsMessages < ActiveRecord::Migration
  def change
    create_table :keppler_contact_us_messages do |t|
      t.string :name
      t.string :subject
      t.string :email
      t.text :content
      t.boolean :read

      t.timestamps null: false
    end
  end
end
