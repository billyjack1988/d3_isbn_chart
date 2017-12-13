require 'sinatra'
require_relative 'bucket_func.rb'
require "csv"
require 'rubygems'
require 'aws-sdk'
load './local_env.rb' if File.exist?('./local_env.rb')
enable :sessions

get '/' do
    list = get_file()
    erb :layout, locals:{list:list}
end    
