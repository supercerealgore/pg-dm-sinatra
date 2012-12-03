#!/usr/bin/env ruby

# Requirements: gem install dm-postgres-adapter, gem install data_mapper

require 'dm-core'

DB_REPOSITORY = ENV['RACK_ENV']

# Comment the upper line and uncomment the line below if you plan to use this module without Sinatra (app.rb).
# Make sure your database.yml file has correct credentials and db name.

# DB_REPOSITORY = 'development'

db_config   = YAML.load_file('config/database.yml')

db_adapter  = db_config[DB_REPOSITORY]["adapter"]
db_database = db_config[DB_REPOSITORY]["database"]
db_username = db_config[DB_REPOSITORY]["username"]
db_password = db_config[DB_REPOSITORY]["password"]
db_host     = db_config[DB_REPOSITORY]["host"]
db_port     = db_config[DB_REPOSITORY]["port"]
db_encoding = db_config[DB_REPOSITORY]["encoding"]

DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, {
  :adapter  => db_adapter,
  :database => db_database,
  :username => db_username,
  :password => db_password,
  :host     => db_host,
  :port   	=> db_port,
  :encoding => db_encoding  
})

# If you want to use this module for migrations, be sure to require 'dm-migrations'
