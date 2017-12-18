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
     p "#{infoarr}"
    #erb :raw_data, locals: {list:list}
end    

<<<<<<< HEAD
# get '/' do   
#     list = get_file() 
#      x = CSV.read("myresults.csv")
#         # p "#{x}"
#     erb :first_daft, locals: {x:x, list:list}
=======
# get '/' do    
#      x = CSV.read("employees.csv")
#         p "#{x}"
#     erb :first_daft, locals: {x:x}
>>>>>>> 5066e4d7a70ec71ca1b87b674dafbebee6116eb3
     
# end

get '/' do 
        
    erb :second_darft
     
end
  

