#!/usr/bin/env ruby
# Id$ nonnax 2022-03-01 15:24:22 +0800
require_relative 'lib/mapper'
require 'yaml'

class App<Mapper;end

file='map.yaml'

unless File.exist?(file)
  Map.get do
    tv '/tv'
    index '/'
    movie '/movie'
    movie '/mov' 
  end
  File.write file, Map.routes.to_yaml 
else
  puts 'loading map.yaml'
  p Map.routes=YAML.load(File.read(file))
end
