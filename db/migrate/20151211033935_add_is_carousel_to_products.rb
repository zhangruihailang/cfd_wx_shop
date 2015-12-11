class AddIsCarouselToProducts < ActiveRecord::Migration
  def change
    add_column :products, :is_carousel, :boolean, :default => 0  
  end
end
