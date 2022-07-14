# frozen_string_literal: true

require_relative './app.rb'
require 'rack-request-id'

map '/' do
  use Rack::RequestId
  run App
end
