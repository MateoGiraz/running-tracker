require_relative '../serializers/runner_serializer'

class RunnersController < Sinatra::Base
  runners = DB.from(:runners)

  get '/runners' do
    RunnerSerializer.serialize_each(runners.all)
  end

  post '/runners' do
    runner = JSON.parse request.body.read
    runners.insert(name: runner['name'], password: runner['password'], email: runner['email'])
  end
end
