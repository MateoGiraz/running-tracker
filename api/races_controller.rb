class RacesController < Sinatra::Base
  races = DB.from(:races)

  get '/races/:id' do
    races.where(id: params[:id]).first.to_json
  end

  get '/runners/:id/races' do
    races.where(runner_id: params[:id]).all.to_json
  end

  post '/runners/:id/races' do
    runner_id = params[:id]
    race = JSON.parse request.body.read
    races.insert(time: race['time'], distance: race['distance'], runner_id: runner_id)
  end
end