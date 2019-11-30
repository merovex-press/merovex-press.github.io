---
layout: default
permalink: /posts/
---

<article class="visual">
  <ul class="posts">
    {% for post in site.posts %}
    <li class='flex three-600 one-500 center'>
      <time class='one-third-600' datetime="{{ post.date | date: "%Y-%m-%e" }}">
        {{ post.date | date: "%e %B %Y" }}
      </time>
      <a class='two-third-600' href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </li>
    {% endfor %}
    </ul>
</article>
