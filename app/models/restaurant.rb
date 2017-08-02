class Restaurant < ActiveRecord::Base
  validates :owner_id, :name, :cuisine, :address, :city, :state, :zip, presence: true
  validates :zip, numericality:true


  belongs_to :owner, class_name: 'User'
  has_many :reviews

end
