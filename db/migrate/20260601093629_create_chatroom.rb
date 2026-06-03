class CreateChatroom < ActiveRecord::Migration[8.1]
  def change
    create_table :chatrooms do |t|
      t.string :chatroom_type, default: "chat"
      t.string :name
      t.string :theme, default: "lightgrey"
      t.references :admin_id, foreign_key: { to_table: :users}
      t.timestamps
    end
  end
end
