#!/usr/bin/env ruby
# Id$ nonnax 2022-03-01 15:28:55 +0800
# path to erb route mapper
require_relative 'view'

module Routes
  @routes = {'GET'=>[], 'POST'=>[]}
  def self.routes() @routes end
  def self.detect(env) @routes[env["REQUEST_METHOD"]].detect{|r| r[:path].match?(env["PATH_INFO"]) } end
end

class Router
  attr :req, :res
  def call(env)
    @req=Rack::Request.new(env)
    @res=Rack::Response.new
    # headers={'Content-type'=>'text/html; charset=utf-8'}
    match = ::Routes.detect(env)
    puts match, visit_count: parse_cookies(env) if match
    return res.finish unless res.empty?
    not_found 
  end
  def parse_cookies(env) Rack::Utils.parse_cookies(env)["session_count"]  end
  def puts(route, **data) res.write( ::View.render(route[:erb], **data) ) end
  
  def not_found
    res.status=404
    res.write 'Not Found'
    res.finish
  end
  
end

#global access
module Kernel
  def routes() ::Routes.routes end
  def get(path,  sym) ::Routes.routes['GET']  << {path:, erb: sym} end
  def post(path, sym) ::Routes.routes['POST'] << {path:, erb: sym} end
end
