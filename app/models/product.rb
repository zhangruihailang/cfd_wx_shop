class Product < ActiveRecord::Base
  mount_uploader :thumbnail, ImageUploader
  has_many :good_reads
  belongs_to :category
end
