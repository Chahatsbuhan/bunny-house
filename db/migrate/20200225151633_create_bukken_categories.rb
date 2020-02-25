class CreateBukkenCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :bukken_categories do |t|
      t.integer :bukken_id
      t.integer :category_id 
    end
  end
end
