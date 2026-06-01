class CreateFriendship < ActiveRecord::Migration[8.1]
  def change
    create_table :friendships do |t|
      t.references :sender, null: false, foreign_key: { to_table: :users}
      t.references :receiver, null: false, foreign_key: { to_table: :users}
      t.string :status, default: "pending", null: false
      t.timestamps
    end
  end
end
