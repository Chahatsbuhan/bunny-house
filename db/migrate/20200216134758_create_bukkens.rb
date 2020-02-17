class CreateBukkens < ActiveRecord::Migration[5.2]
  def change
    create_table :bukkens do |t|
      t.string :title
    end
  end
end
