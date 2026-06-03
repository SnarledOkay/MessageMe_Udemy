class FixChatroomAdminColumn < ActiveRecord::Migration[8.1]
  def change
    rename_column :chatrooms, :admin_id_id, :admin_id
  end
end
