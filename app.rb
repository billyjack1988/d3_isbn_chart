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
     erb :first_page, locals: {}
end    

#to second page with animated bar graph
post '/to_second_page' do
    erb :second_page
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
  post '/to_third_page' do
    erb :third_page
  end


#to the fourth page with a multi line chart  
  post '/to_fourth_page' do
    erb :fourth_page
  end

#to the fith page with a sidways bar chart the has tooltips
  post '/to_fith_page' do
    erb :fith_page
end

#to the intactive coffe chart
  post '/to_sixth_page' do
    erb :interactive_bar
  end

post '/fitbit' do
  erb :fitbit
end

  








