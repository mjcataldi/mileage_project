class Distance < ActiveRecord::Base
  has_many :users

  validates :origin, presence: true
  validates :destination, presence: true

end
