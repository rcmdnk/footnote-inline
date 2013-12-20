footnote-inline
===============

Footnote plugin for Octopress (Jekyll).

This plugin can live with
[footnote-octopress](https://github.com/fcy/footnote-octopress).
JavaScript was forked from this plugin.

[footnote-extra](https://github.com/rcmdnk/footnote-extra)
has same scss/JavaScript. You can use these files if you already have.

Although you can't use footnote-octopress and footnote-inline
in the same post,
you can use each plugin in different posts in the same blog.

# Installation at Octopress

1. Copy `plugins/footnote_inline`
   to your `plugins` directory.

1. Install JavaScript.
   If you have already installed footnote-octopress,
   you may already have `source/javascripts/footnote.js`.

   Otherwise, copy `source/javascripts/footnote.js` to your
   `source/javascripts/` directory,
   and add a line:

    `<script src="{{root_url}}/javascripts/footnote.js"></script>`

   to `source/_includes/custom/head.html`.

1. Install SCSS.
   As same as JavaScript,
   you may already have `sass/plugins/_footnote.scss`,
   or `source/custom/footnote.js`.

   Otherwise, copy `sass/plugins/_footnote.scss`
   to your `sass/plugins/` directory.

   If you have old octopress
   (if your `sass/screen.scss` doesn't have `@import "plugins/**/*";`),
   you may need to add

    `@import "footnote"`

   to `sass/plugins/_plugins.scss`.

Done!

# Usage
You can use footnote-inline like Latex's `footnote`.

Write `{%fnin%}`-`{%endfnin%}` or `{%footnote_inline%}`-`{%endfootnote_inline%}`
at where you want to add a footnote.

e.g.)

    This is a footnote test{%fnin%}This is footnote.{%endfnin%}.

You can also use code syntax with indent:

    This is a footnote test with code
    {%fnin%}Code test:
    
        This is a code.
    
    This is a normal line.
    
    And `inline code`.
    {%endfnin%}.

Reference numbers for each footnote are assigned automatically,
so that you don't need to fix numbers by yourself
when you want to insert new footnote before other footnotes.

In the post for which you want to use footnote-inline,
do not use any footnote-octopress tags or PHP Markdown Extra's
footnote syntax.

Finally, add a following line in the end of the post:

    {%footnotes_inline%}

or

    {%footnotes_list_inline%}

It is useful to add

    post.puts "{%footnotes_inline%}"

to the end of `new_post` task in Rake file.

`{%footnotes_inline%}` does nothing if there is no
`{%fnin%}`(`{%footnote_inline%}`)
in the post.

In this case, it is no probrem even if there is footnote-octopress tag 
or PHP Markdown Exra footnote syntax in the post.

# Options
Change footnote styles in `sass/plugins/_footnote.scss` as you like.
footnote-extra's `_footnote.scss` may be useful
even if you already have `_footnote.scss` from footnote-octopress.

This plugin is valid for parsers of RDiscount, Kramdown and Maruku.

If you use different parser, you can modify
line:

    if context['site.markdown'] == 'kramdown'
      note = Kramdown::Document.new(note).to_html

to

    if context['site.markdown'] == 'your_parser'
      note = YourParser_to_html_method(note)




[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/rcmdnk/footnote-inline/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

