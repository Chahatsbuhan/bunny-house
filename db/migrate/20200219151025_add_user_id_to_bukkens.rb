class AddUserIdToBukkens < ActiveRecord::Migration[5.2]
  def change
    add_column :bukkens, :user_id, :integer
  end
end
