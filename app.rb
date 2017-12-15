require 'sinatra'
require_relative 'bucket_func.rb'
require "csv"
require 'rubygems'
require 'aws-sdk'

load './local_env.rb' if File.exist?('./local_env.rb')
enable :sessions

get '/' do
    list = get_file()
    # p "#{list}"
    erb :raw_data, locals: {list:list}
end    

post "d3_look" do


end

get '/d3_isbn_chart/employees.csv' do
    arr_of_arrs = CSV.read("employees.csv")
    
    p  "#{arr_of_arrs}"
    erb :raw_data, locals: {arr_of_arrs:arr_of_arrs}
    
    
    
    # x = []
    # CSV.open("employees.csv", "wb") do |csv|
    #     CSV.parse("employees.csv,data,String") do |row|
    #         x << row
    #     end    
    # end    
    # p  "#{x}"
end    

