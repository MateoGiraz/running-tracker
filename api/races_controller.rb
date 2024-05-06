require_relative '../services/jwt'
require_relative '../serializers/race_serializer'

class RacesController < Sinatra::Base
  races = DB.from(:races)

  get '/races/:id' do
    raw_race = races.where(id: params[:id]).first
    RaceSerializer.serialize(raw_race)
  end

  get '/runners/:id/races' do
    raw_races = races.where(runner_id: params[:id])
    RaceSerializer.serialize_each(raw_races)
  end

  post '/runners/:id/races' do
    authorization_header = request.env['HTTP_AUTHORIZATION']
    current_user = Jwt.decode(authorization_header)[0]

    if current_user['id'].to_s != params[:id]
      halt 401
    end

    race = JSON.parse request.body.read
    races.insert(time: race['time'], distance: race['distance'], runner_id: params[:id])
  end
end