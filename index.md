---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
title: Ben Wilson, Author
---
<section id='hero'>
{% assign books = site.books | sort: 'series' %}
{%- for book in books -%}
{%- if book.featured -%}
{% include book-summary.html %}
{%- endif -%}
{%- endfor -%}
</section>

<article id='books'>
  {% assign books = site.books | sort: 'series' %}
  {%- for book in books -%}
  {%- unless book.hidden -%}
  {% include book-summary.html %}
  {%- endunless -%}
  {%- endfor -%}
</article>
