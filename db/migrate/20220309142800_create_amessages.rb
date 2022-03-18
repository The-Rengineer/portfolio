class CreateAmessages < ActiveRecord::Migration[5.0]
  def change
    create_table :amessages do |t|
      t.text :message_content
      t.integer :from_user_id
      t.integer :to_user_id
      t.timestamps
    end
  end
end
