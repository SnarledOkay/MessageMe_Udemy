class CreateMembership < ActiveRecord::Migration[8.1]
  def change
    create_table :memberships do |t|
      t.references :chatroom, foreign_key: true
      t.references :user, foreign_key: true
      t.string :role, default: "member"
      t.datetime :last_read_at 
      t.timestamps
    end
  end
end
