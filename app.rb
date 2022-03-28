#!/usr/bin/env ruby
# Id$ nonnax 2022-03-01 15:24:22 +0800
require_relative 'lib/mrouter'

get('/'){ :index }
get('/movie'){ :movie }
get('/tv'){ :tv }
