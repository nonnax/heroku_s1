#!/usr/bin/env ruby
# Id$ nonnax 2022-03-01 15:24:22 +0800
require_relative 'lib/router'
require 'json'

class App < Router; end

get  '/',      :index 
get  '/movie', :movie 
get  '/tv',    :tv 
post '/tvs',   :tvs 

puts JSON.pretty_generate routes
