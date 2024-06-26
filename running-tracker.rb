require 'sinatra/base'

require_relative 'db/instance'
require_relative 'db/seed'
require_relative 'api/runners_controller'
require_relative 'api/races_controller'
require_relative 'api/sessions_controller'

class MyApp < Sinatra::Base
  use RunnersController
  use RacesController
  use SessionsController

  create_tables
  populate_sample_data

  run! if app_file == $0
end