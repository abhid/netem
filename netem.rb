require 'sinatra'
require "sinatra/reloader" if development?
require 'json'

get '/' do
  @interfaces = JSON.parse %x(ip -j address)
  @qdisc = JSON.parse %x(tc -j qdisc show).gsub(/\"options\":({[^"}]*})/, "\"options\":\"\\1\"")
  erb :index
end
