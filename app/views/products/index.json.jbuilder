json.array!(@products) do |product|
  json.extract! product, :id, :name, :title, :thumbnail, :promotion_price, :cost_price, :producing_area, :net_content, :factory, :alcoholic_strength, :specification, :specification_box, :store_condition, :flavour_type, :brand, :materials, :description
  json.url product_url(product, format: :json)
end
