#! /usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'

get '/' do
  "Hello from Sinatra on Heroku!!"
end
