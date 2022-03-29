#!/usr/bin/env ruby
# Id$ nonnax 2022-03-01 15:28:55 +0800
require_relative 'view'

module Routes
  module_function
  @routes = {'GET'=>[], 'POST'=>[]}
  def self.routes() @routes end
end

class Router
  def call(env)
    headers={'Content-type'=>'text/html; charset=utf-8'}
    route = ::Routes.routes[env["REQUEST_METHOD"]]
            .detect{|r| r[:path].match?(env["PATH_INFO"]) }
    if route
      body = View.new(route[:block], visit_count: parse_cookies(env)).render rescue nil
    end
    return [200, headers, [body]] if body
    [404, headers, ['Not Found']]
  end

  def parse_cookies(env) Rack::Utils.parse_cookies(env)["session_count"]  end
end

#allow global access
# include Routes

module Kernel
  def route(path, symbol) ::Routes.routes['GET']<<{path:, block: symbol.to_sym }  end
  def routes() ::Routes.routes end

  %i[GET POST].each do |v|
    define_method(v.downcase) do |path, &block|
      ::Routes.routes[v.to_s] << {path:, block: block.call}
    end
  end
end
