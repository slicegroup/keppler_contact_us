class CreateKepplerContactUsMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_contact_us_messages do |t|
      t.boolean :read
      t.integer :position
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :keppler_contact_us_messages, :deleted_at
  end
end
