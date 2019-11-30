---
layout: default
permalink: /posts/
---

<div class="visual">
  <ul class="posts">
    {% for post in site.posts %}
    <li class='flex three'>
      <time class='one-third' datetime="{{ post.date | date: "%Y-%m-%e" }}">
        {{ post.date | date: "%e %B %Y" }}
      </time>
      <a class='two-third' href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </li>
      <!-- <article class="post">
        <a href="{{ site.baseurl }}{{ post.url }}">
          <h1>{{ post.title }}</h1>

          <div>
            <p class="post_date">{{ post.date | date: "%B %e, %Y" }}</p>
          </div>
        </a>
        <div class="entry">
          {{ post.excerpt }}
        </div>

        <a href="{{ site.baseurl }}{{ post.url }}" class="read-more">Read More</a>
      </article> -->
    {% endfor %}
    </ul>
</div>
