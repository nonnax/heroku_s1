#!/usr/bin/env ruby
# Id$ nonnax 2022-03-01 15:27:49 +0800
class View
  def initialize(page, **data)
    @data = data
    file = File.join(
      File.dirname(__FILE__), 
      "../public/views/#{page}.erb"
    )
    @template = File.read(file)
  end

  def visit_count
    @data[:visit_count]
  end

  def render
    ERB.new(@template).result(binding)
  end
end
