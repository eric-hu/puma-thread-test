require 'sinatra'

class App < Sinatra::Base
  get '/' do
    Thread.current[:calls] ||= 0
    Thread.current[:calls] +=1

    puts "Current number of calls received: #{Thread.current[:calls]}"
    puts "Current request_id: #{Thread.current[:request_id]}"
    puts "-----"

    'Hello world!'
  end
end
