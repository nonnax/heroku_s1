#!/usr/bin/env ruby
# Id$ nonnax 2022-03-01 15:24:22 +0800
require 'rack'
require_relative 'lib/view'
require_relative 'lib/router'

class App
  def call(env)
    route = Route.new(env).route_name
    status = route.match?(/^\d+$/) ? 404 : 200
    response_body = View.new(route, visit_count: parse_cookies(env)).render

    [status, {}, [response_body]]
  end

  def parse_cookies(env)
    Rack::Utils.parse_cookies(env)["session_count"]
  end
end
