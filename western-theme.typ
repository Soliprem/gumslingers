#import "./generic-theme.typ": stylised-theme as generic-stylised-theme, main-title as generic-main-title, stylised-toc as generic-stylised-toc, rule-box as generic-rule-box, example-box as generic-example-box

#let western-heading-font = ("Courier New", "Georgia", "Times New Roman")
#let western-toc-heading-font = ("Courier Prime", "Georgia", "Times New Roman")
#let western-text-color = rgb("#2d1810")
#let western-accent-color = rgb("#8b4513")
#let western-accent-dark = rgb("#5d2a0a")
#let western-bg-color = rgb("#f4f1e8")
#let western-bg-accent-color = rgb("#e8dcc0")
#let western-bg-spots = (
  (dx: 20%, dy: 15%, radius: 40pt, color: rgb("#e8dcc0").transparentize(80%)),
  (dx: 70%, dy: 60%, radius: 30pt, color: rgb("#d4c4a0").transparentize(85%)),
  (dx: 15%, dy: 75%, radius: 25pt, color: rgb("#e8dcc0").transparentize(75%)),
)

#let stylised-theme = generic-stylised-theme.with(
  title: "Gumslingers",
  paper: "us-letter",
  text-font: "Times New Roman",
  heading-font: western-heading-font,
  text-size: 11pt,
  text-color: western-text-color,
  bg-color: western-bg-color,
  bg-accent-color: western-bg-accent-color,
  bg-spots: western-bg-spots,
  accent-color: western-accent-color,
  accent-dark: western-accent-dark,
  accent-mid: western-accent-color,
  main-title-size: 24pt,
  main-title-rule-width: 3pt,
  main-title-align: center,
  h1-size: 16pt,
  h2-size: 14pt,
  h3-size: none,
  h4-size: none,
  h1-rule-width: 1.5pt,
  h2-rule-width: none,
  emph-style: none,
  strong-weight: none,
  show-table-style: false,
  margin: (x: 1.2in, y: 1in),
)

#let main-title = generic-main-title.with(
  heading-font: western-heading-font,
  accent-color: western-accent-color,
  accent-dark: western-accent-dark,
  size: 24pt,
  rule-width: 3pt,
  alignment: center,
)

#let stylised-toc = generic-stylised-toc.with(
  title: "Table of Contents",
  heading-font: western-toc-heading-font,
  accent-color: western-accent-color,
  accent-dark: western-accent-dark,
  bg-color: western-bg-color,
)

#let rule-box = generic-rule-box.with(
  fill: western-bg-accent-color.transparentize(20%),
  stroke: 2pt + western-accent-color.transparentize(30%),
  inset: 12pt,
  radius: 4pt,
)

#let example-box = generic-example-box.with(
  title: "Example",
  fill: western-bg-accent-color.transparentize(20%),
  stroke: 2pt + western-accent-color.transparentize(30%),
  inset: 12pt,
  radius: 4pt,
)
