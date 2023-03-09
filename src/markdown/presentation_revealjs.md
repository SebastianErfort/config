---
date: today
tags:
title: Example Presentation reveal.js
author: The Author
affiliation: The Institute
theme: night
header-includes: |
  <!-- Fontawesome icons
       Example:
       <i class="fa-brands fa-linux"></i> -->
  <link rel="stylesheet" href="font-awesome/css/all.css">
---
<!--
%% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%% Addtional stuff
%% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%% For local clone of reveal.js (else it's fetched from the internet)
revealjs-url: reveal.js
title-slide-attributes:
    data-background-image: /path/to/bg.img
    data-background-size: contain
parallaxBackgroundImage: /path/to/bg.img

%% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%% All the stuff I thought should work, but doesn't seem to
%% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%% These variables should be accessible through YAML frontmatter or CL variables, but don't have any
%% effect. See https://pandoc.org/MANUAL.html#variables-for-html and
%% `pandoc --print-default-data-file=templates/styles.html`
mainfont: Futura
fontsize: 12pt
linkcolor: green
backgroundcolor: green
css:
  - 'https://fonts.googleapis.com/css2?family=Oswald&display=swap'
header-includes: |
  <style>
  body {
      color: rgb(16, 229, 195);
      background-color: rgb(200, 200, 220);
  }
  blockquote {
    font-style: italic;
  }
  tr.even {
    background-color: #f0f0f0;
  }
  td, th {
    padding: 0.5em 2em 0.5em 0.5em;
  }
  tbody {
    border-bottom: none;
  }
  </style>
-->


## Slide with a different background image {background-image="/home/erfort/Downloads/smitsborg_bw.jpg"}

<div style="color: #ff9501; text-shadow: 0px 0px 10px white)">
A <font style="color: lime">lime</font> horizontal rule
<hr style="color: lime">

<div style="font-size: 200%">200% font-size text</div>
<small>small text</small>
</div>


## Lists: Form (Check Boxes)

<form>
  <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
  <label for="vehicle1"> I have a bike</label><br>
  <input type="checkbox" id="vehicle2" name="vehicle2" value="Car">
  <label for="vehicle2"> I have a car</label><br>
  <input type="checkbox" id="vehicle3" name="vehicle3" value="Boat">
  <label for="vehicle3"> I have a boat</label>
</form>

 
## Block Quotes

<div style="display: flex; justify-content: space-between; width: 100%">
<div style="width: 45%">
```markdown
> What he said.
```
</div>
<div style="width: 45%">
> What he said.
</div>
</div>


## Code Blocks

Markdown code blocks

<div style="display: flex; justify-content: space-between; width: 100%">
<div style="width: 45%">
~~~ { .markdown }
```bash
pandoc --from=markdown -t revealjs \
-s -o slides.html *.md \
--css=robot-lung.css \
-V theme=robot-lung
```
~~~
</div>
<div style="width: 45%">
```bash
pandoc --from=markdown -t revealjs \
-s -o slides.html *.md \
--css=robot-lung.css \
-V theme=robot-lung
```
</div>
</div>
<font style="color: rgba(255,255,255,0.75); font-size: 50%; font-style: italic">
reveal.js features such as line numbers don't work well with Pandoc atm without [external filters](https://github.com/pandoc/lua-filters/tree/master/revealjs-codeblock)
</font>


##

With [reveal.js](https://revealjs.com/code/)

<div style="display: flex; justify-content: space-between; width: 100%">
<div style="width: 30%">
<pre><code data-line-numbers="3,8-10">
<table>
  <tr>
    <td>Apples</td>
    <td>$1</td>
    <td>7</td>
  </tr>
  <tr>
    <td>Oranges</td>
    <td>$2</td>
    <td>18</td>
  </tr>
</table>
</code></pre>
<font style="color: rgba(255,255,255,0.75); font-size: 50%; font-style: italic">TODO: This should be raw HTML</font>
</div>
<div style="width: 65%">
<iframe src="https://revealjs.com/code/" width="600" height="500"></iframe>
</div>
</div>


##

With [Pandoc](https://pandoc.org/MANUAL.html#verbatim-code-blocks)

<div style="display: flex; justify-content: space-between; width: 100%">
<div style="width: 65%">
```markdown
~~~ { .python .number-lines startFrom="3" }
def main():
  print( "hello pan" )

if __name__ == '__main__:
  main()
~~~
```
</div>
<div style="width: 35%">
~~~ { .python .numberLines startFrom="3" }
def main():
  print( "hello pan" )

if __name__ == '__main__:
  main()
~~~
</div>
</div>


## Pandoc: Line Blocks

[Extension: `line_blocks`](https://pandoc.org/MANUAL.html#line-blocks)

line breaks and leading spaces are preserved

<div style="display: flex; justify-content: space-between; width: 100%">
<div style="width: 55%; font-size: 60%">
```{ .markdown .number-lines }
| The limerick packs laughs anatomical
| In space that is quite economical.
|    But the good ones I've seen
|    So seldom are clean
| And the clean ones so seldom are comical
```
</div>
<div style="width: 40%; font-size: 60%; text-align: left">
| The limerick packs laughs anatomical
| In space that is quite economical.
|    But the good ones I've seen
|    So seldom are clean
| And the clean ones so seldom are comical
</div>
</div>


## Transitions for elements: fragments
<ul>
    <li class="fragment fade-in">This item will fade in.</li>
    <li class="fragment highlight-blue">This will be highlighted blue.</li>
    <li class="fragment highlight-red">All available transitions are documented <a src="https://github.com/hakimel/reveal.js/#fragments">here</a>.</li>
</ul>


##

or use [Pandoc's fenced div syntax](https://pandoc.org/MANUAL.html#incremental-lists)

:::::::::::::: {.columns}
::: {.column width="50%"}
```markdown
::: incremental
- this
- is
- a
- list
:::
```
:::
::: {.column width="50%"}
::: incremental
- this
- is
- a
- list
:::
:::
::::::::::::::


## use a pause

<div style="display: flex; justify-content: space-between">
<div style="width: 45%">
```markdown
first content

. . .

<hr>
later content
```
Mind the empty lines and spaces between periods.
</div>
<div style="width: 45%">
first content

. . .

<hr>
later content
</div>
</div>


---

<section data-background-color="aquamarine">
  <h2>Sections: slides with vertical scroll</h2>
  <!-- ice cone emoji -->
  <h3>🍦</h3>
</section>
<section data-background-color="rgb(70, 70, 255)">
  <!-- cake piece emoji -->
  <h3>🍰</h3>
</section>


## Speaker Notes
Press <kbd style="font-style: italic;">s</kbd> to activate. Audience won't see these.

::: notes
Totally bs-ing here, don't let them know
:::


## Columns

<div style="display: flex; justify-content: space-between;">
  <div style="width: 45%">
  Use HTML div's

  ```html
  <div style="display: flex;
    justify-content: space-between">
  <div style="width: 50%">
  Column 1
  </div>
  <div style="width: 50%">
  Column 2
  </div>
  </div>
  ```
  </div>
  <div style="width: 45%">
  or [Pandoc syntax](https://pandoc.org/MANUAL.html#columns)

  ```{ .markdown font-size=20% }
  :::::::::::::: {.columns}
  ::: {.column width="30%"}
  Column 1
  :::
  ::: {.column width="70%"}
  Column 2
  :::
  ::::::::::::::
  ```
  </div>
</div>


## Flexible columns

:::: {style="column-count: 2;"}
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat.
::::


## Tables

| Title | Project | *Priority* | Due-date | Assignee(s) | Progress | Summary |
|-------|---------|------------|----------|-------------|----------|---------|
| Improve/rethink usage of issues and boards | backlog | High | January | LWP | 20% - Initiated | Can we Kanban? |

This also works (but not in Obsidian)

--------------------------------------------------------------------
             *Drugs*         *Alcohol*           *Tobacco*
----------   -------------   -----------------   --------------------
    Monday     3 Xanax        2 pints             3 cigars,
                                                  1 hr at hookah bar
   Tuesday    14 Adderall     1 Boone's Farm,     1 packet Drum
                              2 Thunderbird
 Wednesday    2 aspirin       Tall glass water    (can't remember)
---------------------------------------------------------------------

: You can add captions!


## Inline pictures

Using HTML
```html
<a href="link URL"><img src="image URL" style="width: 20%"/></a>
```
<a href='https://500px.com/photo/1060251686/a-calm-fall-evening-in-reine-by-daniel-gastager' alt='A Calm Fall Evening in Reine by Daniel Gastager on 500px.com'> <img src='https://drscdn.500px.org/photo/1060251686/m%3D900/v2?sig=bfa28810a6720723f6531e451a55c0a5583d539d7bb6130b96606f4748fc3eb1' alt='A Calm Fall Evening in Reine by Daniel Gastager on 500px.com' style="width: 40%"/> </a>

<hr>

Or Markdown
```markdown
[![Description|300](image URL)](link URL)
```
[![| 300](https://drscdn.500px.org/photo/1060251686/m%3D900/v2?sig=bfa28810a6720723f6531e451a55c0a5583d539d7bb6130b96606f4748fc3eb1)](https://500px.com/photo/1060251686/a-calm-fall-evening-in-reine-by-daniel-gastager)

<hr style="width: 25%"/>
<div style="font-size: 50%">Image by Daniel Gastager, 500px.com</div>


## reveal.js {background="#FF4081"}

`reveal.js` will read directives in curly braces, for example
```
## reveal.js {.slide: data-background="#FF4081"}
## reveal.js {.slide: background="#FF4081"}
## reveal.js {background="#FF4081"}
```
which are all equivalent


## Logo, header/footer

Add the following to the `.reveal` section of your (S)CSS theme
```css
.reveal {
  /* ... */
  background-image: url(logo.png);
  background-size: 20%;
  background-repeat: no-repeat;
  background-position: 5% 5%;
}
```

## Embed Media (Websites, Videos, ...)

<iframe title="reveal.js: Media" src="https://revealjs.com/media/" width="100%" height="500"></iframe>


##

```html
<section data-preload data-background-iframe="https://revealjs.com/media/">
</section>
```

<section data-preload data-background-iframe="https://revealjs.com/media/">
</section>


## Mermaid Graphs

Requires [Pandoc Mermaid filter]()

:::::::::::::: {.columns}
::: {.column width="50%"}
```markdown
~~~mermaid
sequenceDiagram
    Alice->>John: Hello John, how are you?
    John-->>Alice: Great!
~~~
```
:::
::: {.column width="50%"}
~~~mermaid
sequenceDiagram
    Alice->>John: Hello John, how are you?
    John-->>Alice: Great!
~~~
:::
:::::::::::::: {.columns}


## More

- [https://reagle.org/joseph/talks/2014/exemplar.md](https://reagle.org/joseph/talks/2014/exemplar.md)
