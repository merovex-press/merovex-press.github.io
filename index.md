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

<section class='main'>

<h2 id='about'>About</h2>

<strong>In about 50 characters.</strong> Ben Wilson is a science fiction writer, husband, father, project manager, lover of the divine, & human nature student.

<strong>A little Longer.</strong> Ben Wilson is a science fantasy writer. He’s into history, human nature and religious studies. He is the author of the Postal Marines Series. He served in the US Army through his 20s and got to meet some great people there. Now he does routine IT project management for customers who should know better; he pays the bills through their frustration. Ben lives in Northern Virginia with his wife, three of his four children, and two rabid attack cats. (The other child has a family of his own.)

<h3>Why I Write</h3>

> My life is about telling stories.
> <cite>Ben Wilson</cite>

When friends and co-workers find that I write novels, I explain that I am a poor writer of bad Science Fiction. I don’t pretend to write the Great American Novel, or even the most provocative. I just write and try to improve. I was raised by a storytelling father and served in a storytelling culture. I love telling stories, and I thought I should write a few of them down.

<h3>Who is my audience?</h3>

You are my audience. We are a lot alike. I spent my 20s in the Army, so I had my share of hurry-up-and-wait, make-work details, and time away from family. Even though I reenlisted a couple times, I counted every day until I separated. Now, I recall with nostalgia the good times and some friends who never made it to separation. Most my Facebook friends are former veterans I was honored to serve with. We are protectors, and we know there is more to this life than we're able to lead alone. We have (or want to have) families, and we are doing our best to lead them in an uncertain world. We both want fiction that feeds our need to serve.

<h3>What Others Say About My Novels</h3>

<blockquote>
I like Mondennio, but sometimes I want to slap some sense in him.
<cite>Dennis about Mondennio in Scintilla</cite>
</blockquote>

</section>