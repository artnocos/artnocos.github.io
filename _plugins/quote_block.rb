module Jekyll
  class QuoteBlock < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
      @title = markup.strip
    end

    def render(context)
      content = super
      if @title.empty?
        <<~HTML
          <figure class="quote-block">
            <blockquote>#{content}</blockquote>
          </figure>
        HTML
      else
        <<~HTML
          <figure class="quote-block">
            <figcaption>#{@title}</figcaption>
            <blockquote>#{content}</blockquote>
          </figure>
        HTML
      end
    end
  end
end

Liquid::Template.register_tag('quote', Jekyll::QuoteBlock)
