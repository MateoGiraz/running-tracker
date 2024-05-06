require_relative '../services/time_formatter'

class RaceSerializer
  def self.serialize(race)
    {
      distance: race[:distance],
      time: TimeFormatter.call(race[:time]),
      time_in_seconds: race[:time],
      id: race[:id] 
    }.to_json
  end

  def self.serialize_each(races)
    races.map do |race| 
      {
        distance: race[:distance],
        time: TimeFormatter.call(race[:time]),
        time_in_seconds: race[:time],
        id: race[:id] 
      }
    end.to_json
  end
end