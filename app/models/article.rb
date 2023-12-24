class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 1000}
  validates :about, presence: true, length: { maximum: 255 }
end
