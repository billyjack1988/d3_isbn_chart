require 'rubygems'
require 'aws-sdk'
require 'csv'


load './local_env.rb' if File.exist?('./local_env.rb')
def connect_to_s3()
 Aws::S3::Client.new(
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: ENV['AWS_REGION'],
  )
  file = "myresults.csv" 
  bucket = 'isbnbucket14'
  s3 = Aws::S3::Resource.new(region: 'us-east-2')
  obj = s3.bucket(bucket).object(file)
# string data
obj.put(body: '"some code here to show something being added to the bucket."+ "\n"')
# push entire file 
File.open('myresults.csv', 'rb') do |file|
  obj.put(body: file)
end
end

def get_object()
   s3 = Aws::S3::Client.new
  resp = s3.get_object(bucket:'isbnbucket14', key:'myresults.csv')
  isbn = resp.body.read
    yup = isbn.split
    uknow = []
    yup.each do |item|
    item.gsub!(/"/, '')
    uknow << item
    end
  uknow
end

connect_to_s3()