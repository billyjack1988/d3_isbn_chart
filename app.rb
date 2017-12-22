require 'sinatra'
require_relative 'databasefunc.rb'
require_relative 'functions.rb'
require "csv"
require 'rubygems'
require 'pg'
load './local_env.rb' if File.exist?('./local_env.rb')
enable :sessions

get '/' do
    check_connection()
    info = getinfo()
    # list = get_file()
    # validated = gettingvalid(list)
    # validcount = howmanyvalid(validated)
    # invalidcount = howmanyinvalid(validated)
    # infoarr = joinscounts(validcount,invalidcount)
    p "#{info}"
    # erb :first_daft, locals: {}
end    

post '/second_darft' do
    erb :second_darft
  end

  post '/offthewall' do
    erb :raw_data 
  end

  post '/yup' do
    erb :try_it
  end

  post '/usamap' do
    erb :usa_map
  end

  post '/ld_page' do
    erb :ld_page
end

post '/coffee' do 
  erb :coffee
end 





