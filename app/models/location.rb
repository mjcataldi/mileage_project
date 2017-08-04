class Location < ActiveRecord::Base
  attr_accessor :address, :city, :state, :zip

  def initialize(args)
    self.address = args.fetch("address")
    self.city = args.fetch("city")
    self.state = args.fetch("state")
    self.zip = args.fetch("zip")
  end

  def to_s
    "#{self.address} #{self.city} #{self.state} #{self.zip}"
  end

  def to_query
    self.to_s.gsub(" ", "%20")
  end

end
