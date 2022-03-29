#!/usr/bin/env ruby
# Id$ nonnax 2022-03-01 15:27:49 +0800
class View
  attr :data
  def initialize(page, **data)
    @data = data
<<<<<<< HEAD
    @template, @layout = [page, :layout].map do |f|
      File.expand_path("../public/views/#{f}.erb", __dir__ ).then{ |f| IO.read(f) }
    end
=======
    @template, @layout = [page, :layout].map do |f|      
      File.expand_path("../public/views/#{f}.erb", __dir__ ).then{|f| File.read(f) }
    end
  end
  def _render(text)
    ERB.new(text).result(binding)
  end
  def render
    [@template, @layout].inject{|text, t | _render(t){text}}
  end
  def visit_count
    @data[:visit_count]
>>>>>>> e26d7a745ba4ceb52511e73ebd9a88610d73b501
  end
  def render() [@template, @layout].reduce{ |text, t| _render(t){text} } end
  def _render(text) ERB.new(text).result(binding) end
  def visit_count() data[:visit_count] end
end
