---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
title: Ben Wilson, Author
---
<div id='hero'>
{%- assign books = site.books | sort: 'series' -%}
{%- for book in books -%}
{%- if book.featured -%}
{% include book-summary.html %}
{%- endif -%}
{%- endfor -%}
</div>

<div class="visual" id='books'>
  {%- assign books = site.books | sort: 'series' -%}
  {%- for book in books -%}
  {%- unless book.hidden -%}
  {% include book-summary.html %}
  {%- endunless -%}
  {%- endfor -%}
</div>
