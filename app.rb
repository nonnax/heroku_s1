#!/usr/bin/env ruby
# Id$ nonnax 2022-03-01 15:24:22 +0800
require_relative 'lib/router'

class App<Router; end

# get('/'){ :index }
get('/movie'){ :movie }
get('/tv'){ :tv }
post('/tvs'){:tvs }

# route GET paths
route '/',       :index

p routes
