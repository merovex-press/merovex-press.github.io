---
layout: default
permalink: /posts/
---

<article class="visual">
  <ul class="posts">
    {% for post in site.posts %}
    <li class='flex three'>
      <time class='one-third' datetime="{{ post.date | date: "%Y-%m-%e" }}">
        {{ post.date | date: "%e %B %Y" }}
      </time>
      <a class='two-third' href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </li>
    {% endfor %}
    </ul>
</article>
