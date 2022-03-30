#!/usr/bin/env ruby
# Id$ nonnax 2022-03-01 15:27:49 +0800
class View
  attr :data, :template, :layout
  def self.render(page, **data)
    new(page, **data).render
  end
  def initialize(page, **data)
    @data = data
    @template, @layout = [page, :layout].map do |f|
      File.expand_path("../public/views/#{f}.erb", __dir__ ).then{ |f| IO.read(f) }
    end
  end
  def render() [template, layout].reduce{ |text, t| _render(t){text} } end
  def _render(text) ERB.new(text).result(binding) end
  def visit_count() data[:visit_count] end
end
