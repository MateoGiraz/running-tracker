class RunnersController < Sinatra::Base
  runners = DB.from(:runners)

  get '/runners' do
    runners.all.to_json
  end

  post '/runners' do
    runner = JSON.parse request.body.read
    runners.insert(name: runner['name'])
  end
end
