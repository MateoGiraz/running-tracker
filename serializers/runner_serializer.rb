class RunnerSerializer
  def self.serialize(runner)
    {
      name: runner[:name],
      id: runner[:id],
      email: runner[:email] 
    }.to_json
  end

  def self.serialize_each(runners)
    runners.map do |runner| 
      {
        name: runner[:name],
        id: runner[:id],
        email: runner[:email] 
      }
    end.to_json
  end
end