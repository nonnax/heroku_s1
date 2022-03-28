#!/usr/bin/env ruby
# Id$ nonnax 2022-03-01 15:28:55 +0800
require_relative 'view'

module Routes
  @@routes = {}
  def routes = @@routes
  
  %i[GET POST].each do |v|
    define_method(v.downcase) do |pathrx, &block|
      @@routes[pathrx]=block.call
    end  
  end
end

class Router
  attr :route
  def initialize(env)
    @route=routes[env["PATH_INFO"]] if env["REQUEST_METHOD"] == "GET"
  end
end

class App
  def call(env)
    headers={'Content-type'=>'text/html'}
    route = Router.new(env).route
    if route
      body = View.new(route, visit_count: parse_cookies(env)).render rescue nil
    end
    return [200, headers, [body]] if body
    [404, headers, ['Not Found']]
  end

  def parse_cookies(env)
    Rack::Utils.parse_cookies(env)["session_count"]
  end
end

#allow global access
include Routes
