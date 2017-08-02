class Review < ActiveRecord::Base
  validates :reviewer, :restaurant, :body, :title, :rating, presence: true

  belongs_to :restaurant
  belongs_to :reviewer, class_name: 'User'
end
