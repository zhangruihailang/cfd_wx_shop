class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :title
      t.string :thumbnail
      t.integer :promotion_price
      t.integer :cost_price
      t.string :producing_area
      t.integer :net_content
      t.string :factory
      t.integer :alcoholic_strength
      t.string :specification
      t.string :specification_box
      t.string :store_condition
      t.string :flavour_type
      t.string :brand
      t.string :materials
      t.text :description

      t.timestamps null: false
    end
  end
end
