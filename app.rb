require 'sinatra'

class App < Sinatra::Base
  get '/' do
    Thread.current[:calls] ||= 0
    Thread.current[:calls] +=1

    request_id = Thread.current[:calls]

    Thread.current[request_id.to_s] = 'foo'

    puts Thread.current.keys
    puts "-----"

    'Hello world!'
  end
end
