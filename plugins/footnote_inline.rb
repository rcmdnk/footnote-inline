# encoding: utf-8

module Jekyll
  class FootNoteInline < Liquid::Block
    def initialize(name, markup, tokens)
      super
    end

    def render(context)
      context['page']['fnin_count'] =\
        (context['page'].key?('fnin_count')?\
           context['page']['fnin_count'] : 0
        ) + 1
      note = "#{super} <a href='#fninref:#{context['page']['fnin_count']}' rel='reference'>&#8617;</a>"
      if context['site.markdown'] == 'kramdown'
        note = Kramdown::Document.new(note).to_html
      elsif context['site.markdown'] == 'rdiscount'
        note = RDiscount.new(note).to_html
      elsif context['site.markdown'] == 'maruku'
        note = Maruku.new(note).to_html
      else
        warn "WARNING: site.markdown=#{context['site.markdown']} is unkown."
        warn "         Use RubyPanths' method"
        note = RubyPants.new(note).to_html
      end
      context['page']['fnin_notes'] =\
        (context['page'].key?('fnin_notes')?\
           context['page']['fnin_notes'] : "") +\
        "<li id='fnin:#{context['page']['fnin_count']}'>#{note}</li>"
      "<sup id='fninref:#{context['page']['fnin_count']}'><a href='#fnin:#{context['page']['fnin_count']}' rel='footnote'>#{context['page']['fnin_count']}</a></sup>"
    end
  end

  class FootNoteListInline < Liquid::Tag
    def initialize(name, markup, tokens)
      super
    end

    def render(context)
      fnin_notes =\
        (context['page'].key?('fnin_notes')?
          "<div class=\"footnotes\"><ol>#{context['page']['fnin_notes']}</ol></div>"\
          : "")
      context['page']['fnin_notes'] = ""
      fnin_notes
    end
  end
end

Liquid::Template.register_tag('fnin', Jekyll::FootNoteInline)
Liquid::Template.register_tag('footnote_inline', Jekyll::FootNoteInline)
Liquid::Template.register_tag('footnotes_inline', Jekyll::FootNoteListInline)
Liquid::Template.register_tag('footnotes_list_inline', Jekyll::FootNoteListInline)
