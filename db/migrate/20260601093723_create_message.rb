class CreateMessage < ActiveRecord::Migration[8.1]
  def change
    create_table :messages do |t|
      t.references :chatroom, foreign_key: true
      t.references :user 
      t.text :content 
      t.string :message_type, default: "user"
      t.boolean :deleted, default: false
      t.timestamps
    end
  end
end
