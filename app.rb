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

<<<<<<< HEAD
# get '/d3_isbn_chart/employees.csv' do
#     a = []
#     x = CSV.read("employees.csv")
#     CSV.parse(x) do |row|
#         a << row
#     end
#     "#{a}"
    
    
    # arr_of_arrs = CSV.read("employees.csv")
    # a = 
    # p  "#{arr_of_arrs}"
    # arr_of_arrs
    # x = ["returnthis"]
    # x = arr_of_arrs.to_a.flatten
    # p  "#{x}"
    # "#{x}"
    # erb :raw_data, locals: {x:x}
    
    
    # x = []
    # CSV.open("employees.csv", "wb") do |csv|
    #     CSV.parse("employees.csv,data,String") do |row|
    #         x << row
    #     end    
    # end    
    # p  "#{x}"
#end    
=======
  
>>>>>>> a749594e5fdcd1a19208ff881e4e91a2027e520b

