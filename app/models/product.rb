class Product < ActiveRecord::Base
  mount_uploader :thumbnail, ImageUploader
  has_many :good_reads, dependent: :destroy
  belongs_to :category
end
