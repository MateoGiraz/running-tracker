class TimeFormatter
  def self.call(seconds)
    seconds = seconds.to_i
    
    hours = seconds / 3600
    minutes = (seconds % 3600) / 60
    seconds = (seconds % 3600) % 60

    "#{format('%02d', hours)}:#{format('%02d', minutes)}:#{format('%02d', seconds)}"
  end
end
