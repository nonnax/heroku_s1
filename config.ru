# Id$ nonnax 2022-02-26 17:19:12 +0800
# frozen_string_literal: true

use Rack::Static,
    urls: %w[/images /js /css],
    root: 'public'

require_relative 'app'

run App.new
