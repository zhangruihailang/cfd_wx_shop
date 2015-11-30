class CreateGoodReads < ActiveRecord::Migration
  def change
    create_table :good_reads do |t|
      t.references :product, index: true

      t.timestamps null: false
    end
    add_foreign_key :good_reads, :products
  end
end
