require_relative 'instance'

def create_tables
  DB.create_table :runners do
    primary_key :id
    String :email
    String :name
    String :password
  end

  DB.create_table :races do
    primary_key :id
    foreign_key :runner_id, :runners
    String :time
    String :distance
  end
end

def populate_sample_data
  runners = DB[:runners]
  races = DB[:races]
  
  runners.insert(name: 'Pacho', email: 'pacho@gmail.com', password: '123456')
  runners.insert(name: 'Pablo', email: 'pablo@gmail.com', password: '123456')

  races.insert(runner_id: 1, time: '600', distance: '1000')
  races.insert(runner_id: 1, time: '1200', distance: '1300')

  races.insert(runner_id: 2, time: '2400', distance: '2000')
  races.insert(runner_id: 2, time: '1000', distance: '1100')
end
