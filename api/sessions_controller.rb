require_relative '../services/jwt'

class SessionsController < Sinatra::Base
  runners = DB.from(:runners)

  post '/login' do
    credentials = JSON.parse request.body.read
    runner = runners.where(email: credentials['email']).first

    if runner && runner[:password] == credentials['password']
      { token: Jwt.encode(runner) }.to_json
    else
      halt 401
    end
  end
end
