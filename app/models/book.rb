class Book < ApplicationRecord
  has_one_attached :image1
  belongs_to :user
end
