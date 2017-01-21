class Post < ActiveRecord::Base
  validates :title, presence: true, length: {maximum: 100, minimum: 3}
  validates :description, presence: true, length: {maximum: 300, minimum: 3}
  has_many :comments
end
