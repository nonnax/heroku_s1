# Id$ nonnax 2022-02-26 17:19:12 +0800
# frozen_string_literal: true

use Rack::Static,
    urls: ['/images', '/js', '/css'],
    root: 'public'

maps = {
  '/' => 'public/index.html',
  '/movies' => 'public/movies.html',
  '/tv' => 'public/tv.html'
}

maps.each do |k, v|
  map k do
    run lambda { |_env|
      [
        200,
        {
          'Content-Type' => 'text/html',
          'Cache-Control' => 'public, max-age=86400'
        },
        File.open(v, File::RDONLY)
      ]
    }
  end
end
