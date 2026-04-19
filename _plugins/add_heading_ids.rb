# _plugins/add_heading_ids.rb
require 'nokogiri'

Jekyll::Hooks.register :documents, :post_convert do |doc|
  next unless doc.output_ext == ".html"

  parsed = Nokogiri::HTML::DocumentFragment.parse(doc.content)
  counter = 0

  parsed.css('h1, h2, h3, h4, h5, h6').each do |heading|
    next if heading['id'] && !heading['id'].empty?
    counter += 1
    heading['id'] = "h-#{counter}"
  end

  doc.content = parsed.to_html
end
