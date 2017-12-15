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

get '/' do    
     x = CSV.read("employees.csv").flatten
        p "#{x}"
    erb :first_daft, locals: {x:x}
     
end

  

