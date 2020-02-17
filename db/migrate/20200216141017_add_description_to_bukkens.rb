class AddDescriptionToBukkens < ActiveRecord::Migration[5.2]
  def change
    add_column :bukkens, :description, :text
    add_column :bukkens, :created_at, :datetime
    add_column :bukkens, :updated_at, :datetime
  end
end
