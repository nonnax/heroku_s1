#!/usr/bin/env ruby
# Id$ nonnax 2022-03-01 15:28:55 +0800
require_relative 'view'

module Routes
  @routes = {'GET'=>[], 'POST'=>[]}
  def self.routes() @routes end
  def self.detect(env) @routes[env["REQUEST_METHOD"]].detect{|r| r[:path].match?(env["PATH_INFO"]) } end
end

class Router
  def call(env)
    headers={'Content-type'=>'text/html; charset=utf-8'}
    route = ::Routes.detect(env)
    if route
      body = View.render(route[:erb], visit_count: parse_cookies(env)) rescue nil
      return [200, headers, [body]] if body
    end
    [404, headers, ['Not Found']]
  end
  def parse_cookies(env) Rack::Utils.parse_cookies(env)["session_count"]  end
end

#global access
module Kernel
  def routes() ::Routes.routes end
  def get(path,  sym) ::Routes.routes['GET']  << {path:, erb: sym} end
  def post(path, sym) ::Routes.routes['POST'] << {path:, erb: sym} end
end
