require 'sinatra'
require_relative 'databasefunc.rb'
require_relative 'functions.rb'
require_relative 'csvfunc.rb'
require "csv"
require 'rubygems'
require 'pg'
load './local_env.rb' if File.exist?('./local_env.rb')
enable :sessions

#goin to page one
get '/' do
    check_connection()
    info = getinfo()
    writecsv(info)
    # list = get_file()
    # validated = gettingvalid(list)
    # validcount = howmanyvalid(validated)
    # invalidcount = howmanyinvalid(validated)
    # infoarr = joinscounts(validcount,invalidcount)
    #p "#{info}"
     erb :first_daft, locals: {}
end    

#to second page with animated bar graph
post '/second_darft' do
    erb :second_darft
  end
  
#to usa map with all the counties  
  post '/usamap' do
    erb :usa_map
  end

#to the page that have the coffee info  
  post '/coffee' do 
    erb :coffee
  end 

#to the third page with the simple line graph  
  post '/offthewall' do
    erb :raw_data 
  end


#to the fourth page with a multi line chart  
  post '/yup' do
    erb :fourth_page
  end

#to the fith page with a sidways bar chart the has tooltips
  post '/to_fith_page' do
    erb :fith_page
end






