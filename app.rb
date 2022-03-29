#!/usr/bin/env ruby
# Id$ nonnax 2022-03-01 15:24:22 +0800
<<<<<<< HEAD
require_relative 'lib/router'

class App<Router; end

get  '/',      :index 
get  '/movie', :movie 
get  '/tv',    :tv 
post '/tvs',   :tvs 

p routes
=======
require_relative 'lib/mrouter'

get('/'){ :index }
get('/movie'){ :movie }
get('/tv'){ :tv }
>>>>>>> e26d7a745ba4ceb52511e73ebd9a88610d73b501
