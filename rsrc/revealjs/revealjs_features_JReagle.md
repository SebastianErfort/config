---
title: Reveal.js test slides
author: Joseph Reagle
md_opts_: --presentation --bibliography
---

### Title: \
Subtitle

Joseph Reagle, Northeastern University

<https://reagle.org/talk>&nbsp;   [<i class="fa fa-volume-up"></i>](https://www.youtube.com/watch?v=hTvJoYnpeRQ)

## Equations

$motivation = \frac{expectancy \times value }{impulsiveness \times delay}$

Escaped dollar-sign: The \$19 investment is worth your \$\$\$ .

# First heading 1

Heading 1 now supports content via pandoc 2.7

## Subheading w/ speaker notes

::: notes
speaker notes test
:::

## Subheading w/ call out

- this is the first phrase
- and here is the second
- and here is the third
- and here is the fourth
- and here is the fifth

::: call
- Joseph thinks we should never go to the [moon](https://example.com/) again. There are aliens there, and we'll make them angry.
- Josie thinks we've never been to the moon in the first place.
- Josep thinks we should go to the moon ASAP for all the cheese.
- Jose hates cheese actually.
- Josepi loves cheese more than he should.
:::

# Second heading 1  {data-state="alert"}

## big text {.r-fit-text}

<!-- - [âš bug](https://revealjs.com/layout/#fit-text): pandoc adds r-fit-text to both `section` and `h1`, skewing the horizontal centering to the right. [issue#5965](https://github.com/jgm/pandoc/issues/5965#issuecomment-862314880) -->

# Auto-advance in 2 seconds {data-autoslide="2000"}

# Fonts & icons

## Font awesome

[]{.fas .fa-exclamation-triangle}

<i class="fas fa-bomb"></i>

<i class="fa-brands fa-instagram"></i> <i class="fa-brands fa-snapchat"></i>

# Quotes

## Godwin's Law

Why *shouldn't* Wikipedia work "in theory"?

> As an online discussion grows longer, the probability of a
> comparison involving Nazis or Hitler approaches one -- Godwin's Law
> of
> Nazi Analogies [@Wikipedia2013gl]

# Tables

<!-- also see test-tables.md -->

## Simple Table
<!-- âœ— ST4-TE -->

  Right     Left     Center     Default
-------     ------ ----------   -------
     12     12        12            12
    123     123       123          123
      1     1          1             1

: Sample simple table.

## Grid table
<!-- âœ” ST4-TE -->

: Sample grid table.

+---------+-------+--------------------+
|  Fruit  | Price |     Advantages     |
+=========+=======+====================+
| Bananas | $1.34 | - built-in wrapper |
|         |       | - bright color     |
+---------+-------+--------------------+
| Oranges | $2.10 | - cures scurvy     |
|         |       | - tasty            |
+---------+-------+--------------------+

## Column div

:::::::::::::: {.columns}
::: {.column width="40%"}
left column content
:::
::: {.column width="60%"}
right column content
:::
::::::::::::::

## Column count

:::: {style="column-count: 2;"}
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
::::

# Incremental

## using list prefixed by '`>`'

> - the Web
> - Wikipedia

## using div incremental class

::: {.incremental}

- the Web
- Wikipedia

:::

## disabling incremental for blockquote

> ::: foobar
> - someone else's item 1
> - and item 2 being quoted
> :::

[As long as the list isn't a direct child of the blockquote, the blockquote will just be a blockquote.](https://github.com/jgm/pandoc/issues/7916#issuecomment-1037354473)

## Fragment styles HTML

:::::::::::::: {.columns}
::: {.column width="50%"}
<p class="fragment fade-out">fade-out</p>
<p class="fragment fade-up">fade-up</p>
<p class="fragment fade-down">fade-down</p>
<p class="fragment fade-left">fade-left</p>
<p class="fragment fade-right">fade-right</p>
<p class="fragment fade-in-then-out">fade-in-then-out</p>
<p class="fragment fade-in-then-semi-out">fade-in-then-semi-out</p>
<p class="fragment grow">grow</p>
:::
::: {.column width="50%"}
<p class="fragment semi-fade-out">semi-fade-out</p>
<p class="fragment shrink">shrink</p>
<p class="fragment strike">strike</p>
<p>
    <span class="fragment highlight-red">highlight-red</span>
    <span class="fragment highlight-green">highlight-green</span>
    <span class="fragment highlight-blue">highlight-blue</span>
</p>
<p class="fragment highlight-current-red">highlight-current-red</p>
<p class="fragment highlight-current-green">highlight-current-green</p>
<p class="fragment highlight-current-blue">highlight-current-blue</p>
:::
::::::::::::::

## Fragment styles Markdown

<!-- BUG: the fade-directions needs to be in p; pandoc creates p/span -->

:::::::::::::: {.columns .incremental}
::: {.column width="50%"}
[fade-out]{.fragment .fade-out}

[fade-up]{.fragment .fade-up} [[âš bug]](https://github.com/hakimel/reveal.js/issues/3108)

::::{.fragment .fade-up}
testing [jgm suggestion](https://github.com/jgm/pandoc/issues/8180#issuecomment-1185310886)
::::

[fade-down]{.fragment .fade-down} [[âš bug]](https://github.com/hakimel/reveal.js/issues/3108)

[fade-left]{.fragment .fade-left} [[âš bug]](https://github.com/hakimel/reveal.js/issues/3108)

[fade-right]{.fragment .fade-right} [[âš bug]](https://github.com/hakimel/reveal.js/issues/3108)

[fade-in-then-out]{.fragment .fade-in-then-out}

[fade-in-then-semi-out]{.fragment .fade-in-then-semi-out}

[grow]{.fragment .grow} <!-- https://github.com/hakimel/reveal.js/issues/2126 -->

:::
::: {.column width="50%"}

[semi-fade-out]{.fragment .semi-fade-out}

[shrink]{.fragment .shrink} <!-- https://github.com/hakimel/reveal.js/issues/2126 -->

[strike]{.fragment .strike}

[highlight-red]{.fragment .highlight-red} [highlight-green]{.fragment .highlight-green} [highlight-blue]{.fragment .highlight-blue}

[highlight-current-red]{.fragment .highlight-current-red} [highlight-current-green]{.fragment .highlight-current-green} [highlight-current-blue]{.fragment .highlight-current-blue}
:::
::::::::::::::

## List fragment style

- Blah blah blah
    - [bebop do wap]{.fragment}
- Blah blah blah
    - [bebop do wap]{.fragment}

## r-stack

::: {.r-stack}
![](https://placekitten.com/450/300){.fragment}

![](https://placekitten.com/300/450){.fragment} 

![](https://placekitten.com/400/400){.fragment}
:::

# Polls

<!-- https://www.polleverywhere.com/activities?folder=13999668 -->

## "PollEV page"

\[âš bug\]: though I'm using the activity specific results embed, if I want people to use https://PollEv.com/reagle for this slide, I must manually activate this specific activity on their site

<iframe src="https://embed.polleverywhere.com/multiple_choice_polls/Ur0afqAWHm0DObvhZ4z2e?controls=none&short_poll=true" width="500px" height="300px"></iframe>

## PollEV "Response Link"

\[âš bug\]: the URL 
https://PollEv.com/multiple_choice_polls/KsWWIb0CTOsKCCAwo7C3J/respond
is specific, but hard to type -- and the PollEV in the iframe below still points to the activated

<iframe src="https://embed.polleverywhere.com/multiple_choice_polls/Ix3nlPR7EmitdEsUcscfj?controls=none&short_poll=true" width="500px" height="300px"></iframe>

## Strawpoll #1

<!-- https://strawpoll.com/polls/e6Z2ejMdXgN -->

<div class="strawpoll-embed" id="strawpoll_e6Z2ejMdXgN" style="height: 480px; max-width: 640px; width: 100%; margin: 0 auto; display: flex; flex-direction: column;"><iframe title="StrawPoll Embed" id="strawpoll_iframe_e6Z2ejMdXgN" src="https://strawpoll.com/embed/polls/e6Z2ejMdXgN" style="position: static; visibility: visible; display: block; width: 100%; flex-grow: 1;" frameborder="0" allowfullscreen allowtransparency>Loading...</iframe><script async src="https://cdn.strawpoll.com/dist/widgets.js" charset="utf-8"></script></div>

## Strawpoll #2

<div class="strawpoll-embed" id="strawpoll_e6Z2e12v5gN" style="height: 480px; max-width: 640px; width: 100%; margin: 0 auto; display: flex; flex-direction: column;"><iframe title="StrawPoll Embed" id="strawpoll_iframe_e6Z2e12v5gN" src="https://strawpoll.com/embed/polls/e6Z2e12v5gN" style="position: static; visibility: visible; display: block; width: 100%; flex-grow: 1;" frameborder="0" allowfullscreen allowtransparency>Loading...</iframe><script async src="https://cdn.strawpoll.com/dist/widgets.js" charset="utf-8"></script></div>

## Other poll services

- [PollUnit](https://pollunit.com/en): embedding is a premium feature, making embeds hard to test
- [PollJunkie](http://www.polljunkie.com/): two `script` tags don't render well
- [EasyPoll](https://www.easypolls.net/#/): `div` and `script` tag don't render well

# Images {data-background="media/pixabay-arctic-139396_1280.jpg" data-background-size="cover"}
<!-- contain, cover, auto, length, percentage -->

## Local, html & r-stretch

![](media/nounproject-dog.png){.r-stretch}

## Wikicommons

<a title="By Inductiveload (Own work  Based on File:Emblem-ohno.svg) [LGPL (https://www.gnu.org/licenses/lgpl.html)], via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File%3ANuvola_emoticon_-_happy.svg"><img alt="Nuvola emoticon - happy" src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Nuvola_emoticon_-_happy.svg/200px-Nuvola_emoticon_-_happy.svg.png"/></a>

## flickr

<a href="https://www.flickr.com/photos/hades2k/7001927337/" title="The Cathedral &amp; The Bazaar by Hades2k, on Flickr"><img src="https://farm8.staticflickr.com/7276/7001927337_f1b079b8a2.jpg" alt="The Cathedral &amp; The Bazaar"></a>

## Unsplash

[![yorkie](https://images.unsplash.com/photo-1443806798002-651c462956ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2552&q=80)](https://unsplash.com/photos/jx_kpR7cvDc)

## Caption & link hack

![[caption](https://example.com)](https://images.unsplash.com/photo-1443806798002-651c462956ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2552&q=80){height="280px"}

- [âš hack]: when `img` is in `a` link, [pandoc does not create `figure` or `figcaption`](https://pandoc.org/MANUAL.html#extension-implicit_figures); 
[link the caption rather than the image](https://github.com/jgm/pandoc/issues/5965#issuecomment-1006839400)

## Caption float left {.img_left}

![caption](https://images.unsplash.com/photo-1443806798002-651c462956ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2552&q=80)

## Caption float right {.img_right}

![caption](https://images.unsplash.com/photo-1443806798002-651c462956ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2552&q=80)

<!-- ## roll-in image

<p class="fragment roll-in">![](media/pixabay-dog-100683_640.jpg)</p>
 -->

## Left float {.img_left}

<a href="https://www.flickr.com/photos/hades2k/7001927337/" title="The Cathedral &amp; The Bazaar by Hades2k, on Flickr"><img  style="float: left" src="https://farm8.staticflickr.com/7276/7001927337_f1b079b8a2.jpg" alt="The Cathedral &amp; The Bazaar"></a>

Happiness cordially one determine concluded fat. Plenty season beyond by hardly giving of. Consulted or acuteness dejection an smallness if. Outward general passage another as it. 

## Right float {.img_right}

<a href="https://www.flickr.com/photos/hades2k/7001927337/" title="The Cathedral &amp; The Bazaar by Hades2k, on Flickr"><img  style="float: right" src="https://farm8.staticflickr.com/7276/7001927337_f1b079b8a2.jpg" alt="The Cathedral &amp; The Bazaar"></a> 

> Happiness cordially one determine concluded fat. Plenty season
> beyond by hardly giving of. Consulted or acuteness dejection an
> smallness if. Outward general passage another as it.

## Left float w/ list {.img_left}

<a href="https://www.flickr.com/photos/hades2k/7001927337/" title="The Cathedral &amp; The Bazaar by Hades2k, on Flickr"><img src="https://farm8.staticflickr.com/7276/7001927337_f1b079b8a2.jpg" alt="The Cathedral &amp; The Bazaar"></a>

- Happiness cordially one determine concluded fat. Happiness cordially one determine concluded fat. 
- Plenty season beyond by hardly giving of. 
- Consulted or acuteness dejection an smallness if.
- Outward general passage another as it. 

## Left float w/ fragment list {.img_left}

<a href="https://www.flickr.com/photos/hades2k/7001927337/" title="The Cathedral &amp; The Bazaar by Hades2k, on Flickr"><img src="https://farm8.staticflickr.com/7276/7001927337_f1b079b8a2.jpg" alt="The Cathedral &amp; The Bazaar"></a>

. . .

- Plenty season beyond by hardly giving of. 
- Outward general passage another as it. 

[âš bug](https://github.com/hakimel/reveal.js/issues/3153): the image is no longer clickable after the fragment is revealed.

## Left float w/ numbered list {.img_left}

<a href="https://www.flickr.com/photos/hades2k/7001927337/" title="The Cathedral &amp; The Bazaar by Hades2k, on Flickr"><img src="https://farm8.staticflickr.com/7276/7001927337_f1b079b8a2.jpg" alt="The Cathedral &amp; The Bazaar"></a>

1. Happiness cordially one determine concluded fat. Happiness cordially one determine concluded fat. 
1. Plenty season beyond by hardly giving of. 
1. Consulted or acuteness dejection an smallness if.
1. Outward general passage another as it. 

## Right float w/ list {.img_right}

<a href="https://www.flickr.com/photos/hades2k/7001927337/" title="The Cathedral &amp; The Bazaar by Hades2k, on Flickr"><img src="https://farm8.staticflickr.com/7276/7001927337_f1b079b8a2.jpg" alt="The Cathedral &amp; The Bazaar"></a>

- Happiness cordially one determine concluded fat. Happiness cordially one determine concluded fat. 
- Plenty season beyond by hardly giving of. 
- Consulted or acuteness dejection an smallness if.
- Outward general passage another as it. 

## Right float w/ numbered list {.img_right}

<a href="https://www.flickr.com/photos/hades2k/7001927337/" title="The Cathedral &amp; The Bazaar by Hades2k, on Flickr"><img src="https://farm8.staticflickr.com/7276/7001927337_f1b079b8a2.jpg" alt="The Cathedral &amp; The Bazaar"></a>

1. Happiness cordially one determine concluded fat. Happiness cordially one determine concluded fat. 
1. Plenty season beyond by hardly giving of. 
1. Consulted or acuteness dejection an smallness if.
1. Outward general passage another as it. 

# Transitions

# H1 convex {data-transition="convex"}

## none {data-transition="none"}

Happiness cordially one determine concluded fat. Plenty season beyond by hardly giving of. Consulted or acuteness dejection an smallness if. Outward general passage another as it. 

## convex {data-transition="convex"}

Happiness cordially one determine concluded fat. Plenty season beyond by hardly giving of. Consulted or acuteness dejection an smallness if. Outward general passage another as it. 

## concave {data-transition="concave"}

Happiness cordially one determine concluded fat. Plenty season beyond by hardly giving of. Consulted or acuteness dejection an smallness if. Outward general passage another as it. 

## zoom {data-transition="zoom"}

Happiness cordially one determine concluded fat. Plenty season beyond by hardly giving of. Consulted or acuteness dejection an smallness if. Outward general passage another as it.

# Backgrounds

## Background transition {data-transition="slide" data-background="#b5533c" data-background-transition="zoom"}

## Background transition {data-transition="slide" data-background="rgb(32,32,32)" data-background-transition="zoom"}

## Iframe background 1 {data-background-iframe="https://revealjs.com"}

> Happiness cordially one determine concluded fat. Plenty season
> beyond by hardly giving of. Consulted or acuteness dejection an
> smallness if.

1. works
2. only on solid backgrounds

## Iframe background 2 {data-background-iframe="https://revealjs.com" class="blur_on_bg"}

<div style="font: black; background: rgba(0,0,0,0.25)">
> Happiness cordially one determine concluded fat. Plenty season
> beyond by hardly giving of. Consulted or acuteness dejection an
> smallness if.

`class="blur_on_bg"`

1. works
2. only on soft backgrounds
</div>

## Iframe background 3 {data-background-iframe="../../index.html" class="frame_on_bg"}

> Happiness cordially one determine concluded fat. Plenty season
> beyond by hardly giving of. Consulted or acuteness dejection an
> smallness if.

`class="frame_on_bg"`

1. list bullets/numbers within the framed area
1. not working

## data-background {data-background="../2013/media/pixabay-arctic-139396_1280.jpg"}

![](media/pixabay-dog-100683_640.jpg)

## data-background {data-background="../2013/media/pixabay-arctic-139396_1280.jpg"}

![](media/pixabay-dog-115078_640.jpg)

# Video

## Youtube iframe

<iframe width="640" height="360" src="https://www.youtube.com/embed/paqe3pQIiv0?autoplay=1"></iframe>

## Video tag

<video data-autoplay controls src="../2013/media/simpsons-worst-episode-ever.webm"></video>

## Video background {data-background="#000000" data-background-video="https://s3.amazonaws.com/static.slid.es/site/homepage/v1/homepage-video-editor.mp4,https://s3.amazonaws.com/static.slid.es/site/homepage/v1/homepage-video-editor.webm"}

## Youtube video background {data-background-iframe="https://www.youtube.com/embed/_rPw3wYgD-E?autoplay=1" data-background-size="contain" class="frame_on_bg"}

v3 only

# Conclusion
