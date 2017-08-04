class Distance < ActiveRecord::Base
  attr_reader :distance, :duration
  attr_accessor :origin_address, :destination_address, :units

  def initialize(args)
    self.origin_address = args.fetch(:origin_address)
    self.destination_address = args.fetch(:destination_address)
    self.units = args.fetch(:units, "imperial")
  end

  def random
    uri = URI.parse("https://maps.googleapis.com/maps/api/distancematrix/json")
    uri.query = "origins=#{origin}"
    uri.query += "&destinations=#{destination}"
    uri.query += "&units=imperial"

    json = JSON.parse(json_string)
    results = json["rows"][0]["elements"][0]

    self.origin_address = json["origin_address"]
    self.destination_address = json["destination_address"]

    self.distance = results["distance"]["value"]
    self.duration = results["duration"]["value"]
  end


  def distance
    if self.units == "imperial"
      (self.distance / 1609.344).to_f
    else
      (self.distance / 1000).to_f
    end
  end

  def duration


  end



end
