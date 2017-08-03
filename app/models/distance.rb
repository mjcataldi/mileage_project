class Distance < ActiveRecord::Base
  validates :origin, presence: true
  validates :destination, presence: true

end
