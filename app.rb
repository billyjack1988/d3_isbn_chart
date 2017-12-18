require 'sinatra'
require_relative 'bucket_func.rb'
require "csv"
require 'rubygems'
require 'aws-sdk'

load './local_env.rb' if File.exist?('./local_env.rb')
enable :sessions

# get '/' do
#     list = get_file()
#     # p "#{list}"
#     erb :raw_data, locals: {list:list}
# end    

# get '/' do   
#     list = get_file() 
#      x = CSV.read("myresults.csv")
#         # p "#{x}"
#     erb :first_daft, locals: {x:x, list:list}
     
# end

get '/' do 
        
    erb :second_darft
     
end
  

