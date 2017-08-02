class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :reviewer, class_name: 'User'
end
