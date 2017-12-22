require 'pg'


load './local_env.rb' if File.exist?('./local_env.rb')
# db_params = {
#         host: ENV['host'],
#         port: ENV['port'],
#         dbname: ENV['dbname'],
#         user: ENV['user'],
#         password: ENV['password']
#     }
#     db= PG::Connection.new(db_params)

def check_connection()
    db_params = {
        host: ENV['host'],
        port: ENV['port'],
        dbname: ENV['dbname'],
        user: ENV['user'],
        password: ENV['password']
    }

    db= PG::Connection.new(db_params)
    p "connected"
    db.close
end    