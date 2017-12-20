require 'sinatra'
require_relative 'bucket_func.rb'
require_relative 'functions.rb'
require "csv"
require 'rubygems'
require 'aws-sdk'

load './local_env.rb' if File.exist?('./local_env.rb')
enable :sessions

get '/' do
    list = get_file()
    validated = gettingvalid(list)
    validcount = howmanyvalid(validated)
    invalidcount = howmanyinvalid(validated)
    infoarr = joinscounts(validcount,invalidcount)
    #  p "#{infoarr}"
    erb :first_daft, locals: {infoarr:infoarr}
end    

# get '/' do    
#      x = CSV.read("employees.csv")
#         # p "#{x}"
#     erb :second_darft, locals: {x:x}
     
# end

# get '/' do 
        
#     erb :second_darft
     
# end
  

