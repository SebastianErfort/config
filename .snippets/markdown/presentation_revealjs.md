---
date: today
tags:
title: Fancy Presentations from Markdown with Pandoc and reveal.js
author: The Author
affiliation: The Institute
---
<!--
%% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%% Addtional stuff
%% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%% For local clone of reveal.js (else it's fetched from the internet)
revealjs-url: reveal.js
theme: night
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

## Slide with a different background image {background-image="/path/to/bg2.img"}

A horizontal rule
<hr>

<small>Small text</small>

## Transitions for elements: fragments
<ul>
    <li class="fragment fade-in">This item will fade in.</li>
    <li class="fragment highlight-blue">This will be highlighted blue.</li>
    <li class="fragment highlight-red">All available transitions are documented [here](https://github.com/hakimel/reveal.js/#fragments).</li>
</ul>

##
or use the fenced div syntax (Pandoc)

::: incremental
- this
- is
- a
- list
:::

## use a pause

first content

. . .

later content

Mind the empty lines and spaces between periods.

## Speaker Notes
audience won't see these

::: notes
Totally bs-ing here, don't let them know
:::

## Columns
Use HTML div's
<div style="display: flex; justify-content: space-between">
<div style="width: 30%">
Column 1
</div>
<div style="width: 70%">
Column 2
</div>
</div>

<hr>

or Pandoc syntax
```markdown
:::::::::::::: {.columns}
::: {.column width="30%"}
Column 1
:::
::: {.column width="70%"}
Column 2
:::
::::::::::::::
```

## Tables

| Title | Project | *Priority* | Due-date | Assignee(s) | Progress | Summary |
|-------|---------|----------|----------|-------------|----------|---------|
| Improve/rethink usage of issues and boards | backlog | High | January | LWP | 20% - Initiated | Can we Kanban? |

This also works

--------------------------------------------------------------------
             *Drugs*         *Alcohol*           *Tobacco*
----------   -------------   -----------------   --------------------
    Monday     3 Xanax        2 pints             3 cigars,  
                                                  1 hr at hookah bar
   Tuesday    14 Adderall     1 Boone's Farm,     1 packet Drum
                              2 Thunderbird
 Wednesday    2 aspirin       Tall glass water    (can't remember)
---------------------------------------------------------------------

## Links

Inline picture
[![](https://file-examples.com/storage/fe2879c03363c669a9ef954/2017/10/file_example_PNG_500kB.png)](https://file-examples.com/)
