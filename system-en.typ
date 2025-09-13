#let western-theme(title: "Gumslingers", body) = {
  // Set document properties
  set document(title: title, author: "Your Name")
  
  // Page setup with margins
  set page(
    paper: "us-letter",
    margin: (x: 1.2in, y: 1in),
    background: {
      // Subtle parchment-like background with aging effect
      place(
        dx: 0pt, dy: 0pt,
        rect(
          width: 100%, height: 100%,
          fill: gradient.radial(
            rgb("#f4f1e8"), rgb("#ede6d3"), rgb("#e8dcc0"),
            center: (30%, 20%), radius: 120%
          )
        )
      )
      // Add some subtle texture spots
      place(dx: 20%, dy: 15%, 
        circle(radius: 40pt, fill: rgb("#e8dcc0").transparentize(80%)))
      place(dx: 70%, dy: 60%, 
        circle(radius: 30pt, fill: rgb("#d4c4a0").transparentize(85%)))
      place(dx: 15%, dy: 75%, 
        circle(radius: 25pt, fill: rgb("#e8dcc0").transparentize(75%)))
    }
  )

  // Font settings
  set text(
    font: ("Courier New", "Times New Roman"), // Fallback to common serif
    size: 10pt,
    fill: rgb("#2d1810") // Dark brown text
  )

  // Heading styles with western feel
  show heading.where(level: 1): it => [
    #set text(
      size: 24pt, 
      weight: "bold",
      font: ("Courier New", "Georgia", "Times New Roman"),
      fill: rgb("#5d2a0a")
    )
    #set align(center)
    #block(
      width: 100%, 
      inset: (y: 0.5em),
      stroke: (bottom: 3pt + rgb("#8b4513")),
      [#it.body]
    )
    #v(0.3em)
  ]

  show heading.where(level: 2): it => [
    #set text(
      size: 16pt, 
      weight: "bold",
      font: ("Courier New", "Georgia", "Times New Roman"),
      fill: rgb("#5d2a0a")
    )
    #block(
      inset: (top: 0.8em, bottom: 0.3em),
      stroke: (bottom: 1.5pt + rgb("#8b4513")),
      [#it.body]
    )
  ]

  show heading.where(level: 3): it => [
    #set text(
      size: 14pt, 
      weight: "bold",
      style: "italic",
      fill: rgb("#8b4513")
    )
    #block(inset: (top: 0.6em, bottom: 0.2em))[#it.body]
  ]

  show heading.where(level: 4): it => [
    #set text(
      size: 12pt, 
      weight: "bold",
      style: "italic",
      fill: rgb("#8b4513")
    )
    #block(inset: (top: 0.6em, bottom: 0.2em))[#it.body]
  ]

  // Style for emphasized text (rules, important info)
  show emph: it => [
    #set text(fill: rgb("#8b4513"))
    #it
  ]

  // Strong text styling
  show strong: it => [
    #set text(fill: rgb("#5d2a0a"))
    #it
  ]

  // List styling
  set list(indent: 1em, marker: [•])
  show list: it => [
    #set text(fill: rgb("#2d1810"))
    #it
  ]
  
  body
}

// Custom box for rules or callouts - defined outside the theme function
#let rule-box(title: none, body) = {
  let title-text = if title != none { 
    heading(level: 3)[#title] 
  } else { 
    v(0em) 
  }
  
  block(
    width: 100%,
    inset: 12pt,
    radius: 4pt,
    fill: rgb("#f0e6d2").transparentize(20%),
    stroke: 2pt + rgb("#8b4513").transparentize(30%),
  )[
    #title-text
    #body
  ]
}

#let character-sheet(
  name: "",
  archetype: "",
  gunslinger-points: 8,
  abilities: (
    aim: "d6",
    ride: "d6", 
    survival: "d6",
    grit: "d6",
    awareness: "d6",
    fast-talk: "d6"
  ),
  notes: ""
) = {
  
  pagebreak()
  // Character name header
  block(
    width: 100%,
    inset: 15pt,
    radius: 6pt,
    fill: rgb("#8b4513").transparentize(80%),
    stroke: 3pt + rgb("#5d2a0a"),
  )[
    #set text(size: 20pt, weight: "bold", fill: rgb("#5d2a0a"))
    #set align(center)
    #if name != "" [#name] else [Character Name: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_]
  ]
  
  v(0.5em)
  
  // Main character info
  grid(
    columns: (1fr, 1fr),
    column-gutter: 20pt,
    
    // Left column - Basic info and abilities
    block(
      width: 100%,
      inset: 12pt,
      radius: 4pt,
      fill: rgb("#f0e6d2").transparentize(40%),
      stroke: 2pt + rgb("#8b4513").transparentize(50%),
    )[
      #set text(size: 10pt)
      
      // Archetype
      #grid(
        columns: (auto, 1fr),
        [*Archetype:*], 
        if archetype != "" [#archetype] else [\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_]
      )
      
      #v(0.3em)
      
      // Gunslinger points
      #grid(
        columns: (auto, 1fr),
        [*Gunslinger Points:*], 
        [#gunslinger-points / #gunslinger-points]
      )
      
      #v(0.5em)
      
      // Abilities section
      #set text(weight: "bold", size: 11pt, fill: rgb("#5d2a0a"))
      #align(center)[*ABILITIES*]
      
      #set text(weight: "regular", size: 10pt, fill: rgb("#2d1810"))
      #v(0.2em)
      
      #let ability-row(name, value) = {
        grid(
          columns: (1fr, auto, auto),
          column-gutter: 5pt,
          [#name:], 
          rect(
            width: 30pt, height: 20pt,
            inset: 2pt,
            stroke: 1pt + rgb("#8b4513"),
            fill: rgb("#ffffff").transparentize(20%),
            align(center + horizon)[#text(size: 9pt, weight: "bold")[#value]]
          ),
          []
        )
        v(0.2em)
      }
      
      #ability-row("Aim", abilities.aim)
      #ability-row("Ride", abilities.ride)
      #ability-row("Survival", abilities.survival)
      #ability-row("Grit", abilities.grit)
      #ability-row("Awareness", abilities.awareness)
      #ability-row("Gift of the Gab", abilities.fast-talk)
    ],
    
    // Right column - Health and notes
    block(
      width: 100%,
      inset: 12pt,
      radius: 4pt,
      fill: rgb("#f0e6d2").transparentize(40%),
      stroke: 2pt + rgb("#8b4513").transparentize(50%),
    )[
      #set text(size: 10pt)
      
      // Health status
      #set text(weight: "bold", size: 11pt, fill: rgb("#5d2a0a"))
      #align(center)[*CONDITIONS*]
      
      #set text(weight: "regular", size: 10pt)
      #v(0.3em)
      
      #let health-level(level, active: false) = {
        let fill-color = if active { rgb("#8b4513").transparentize(60%) } else { rgb("#ffffff").transparentize(20%) }
        grid(
          columns: (auto, 1fr),
          column-gutter: 8pt,
          rect(
            width: 15pt, height: 15pt,
            stroke: 1.5pt + rgb("#8b4513"),
            fill: fill-color,
          ),
          [#level]
        )
        v(0.15em)
      }
      
      #health-level("Unharmed", active: true)
      #health-level("Wounded")
      #health-level("Badly Wounded")
      #health-level("Dying")
      #health-level("Dead")
      
      #v(0.5em)
      
      // Notes section
      #set text(weight: "bold", size: 11pt, fill: rgb("#5d2a0a"))
      #align(center)[*NOTES*]
      
      #set text(weight: "regular", size: 9pt)
      #v(0.2em)
      
      #rect(
        width: 100%,
        height: 80pt,
        inset: 8pt,
        stroke: 1pt + rgb("#8b4513"),
        fill: rgb("#ffffff").transparentize(30%),
      )[
        #if notes != "" [#notes] else [#v(1fr)]
      ]
    ]
  )
  
  v(0.5em)
  
  // Equipment/gear section
  block(
    width: 100%,
    inset: 12pt,
    radius: 4pt,
    fill: rgb("#f0e6d2").transparentize(40%),
    stroke: 2pt + rgb("#8b4513").transparentize(50%),
  )[
    #set text(weight: "bold", size: 11pt, fill: rgb("#5d2a0a"))
    #align(center)[*EQUIPMENT*]
    
    #set text(weight: "regular", size: 10pt)
    #v(0.3em)
    
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 15pt,
      
      // Weapons
      [
        *Weapons:*
        #v(0.2em)
        #for i in range(4) [
          #line(length: 100%, stroke: 0.5pt + rgb("#8b4513"))
          #v(0.3em)
        ]
      ],
      
      // Other gear
      [
        *Other Equipment:*
        #v(0.2em)
        #for i in range(4) [
          #line(length: 100%, stroke: 0.5pt + rgb("#8b4513"))
          #v(0.3em)
        ]
      ]
    )
  ]
}

#let empty_sheet = character-sheet(
  abilities: (
    aim: "",
    ride: "",
    survival: "", 
    grit: "",
    awareness: "",
    fast-talk: ""
  ),
  gunslinger-points: "  "
)

// Usage example - replace this with your actual content
#show: western-theme.with(title: "Gumslingers")

= Gumslingers

== System

=== Resolution System

The system uses a roll-over mechanic based on Abilities. Each character has 6 abilities (see below).

#rule-box(title: [Assigning Abilities])[
  Ability scores are tracked by increasing die size. The starting point for all abilities is d6.

  Based on character creation choices, base ability scores can change. For example, an excellent marksman might start with a d8 or d10 in Aim instead of the usual d6. Conversely, a simple farmhand might start with a d4 in Gift of the Gab.
  
  _$ "d4" <- "d6" -> "d8" -> "d10" -> "d12" $_
]

#rule-box(title: [Gunslinger Points and Pushes])[
  Each character has a pool of Gunslinger Points. These can be used to _push_ rolls, increasing the die size by one step following the usual progression:

  _$ "d4" -> "d6" -> "d8" -> "d10" -> "d12" $_

  Beyond d12, each Gunslinger Point becomes a +1. Starting from a d12 (even if pushed), 4 points can be spent to roll a d20 with no modifiers. Beyond those 4 points, you add a +1 modifier to the d20 for each additional Gunslinger Point spent.
]

You can double the effect of a push (with GM consent) by introducing a complication. Instead of a complication, the World can tally a due.

The World (personified in the GM) can keep a tally of the PC's dues. A sort of symbol of the unfair luck they might have had, or of the favours fate handed them. Fate, however, doesn't do gifts, and luck turns around.

#rule-box(title: "Dues")[
  Dues—accumulated within Bargains with Fate—are tokens the GM gets to spend to insert world or NPC moves while outside of the timing defined by the normal resolution system.

  #quote()[_Run, cowboy, try your best. I'll be on the other side. This check has your  signature on it, and I fully intend to cash it._]
]

Generally, Difficulty Classes are:

- *Easy:* 3+
- *Simple:* 5+
- *Moderate:* 7+ 
- *Hard:* 9+
- *Legendary:* 11+

Favorable circumstances may grant *advantages* or *disadvantages*.

#rule-box(title: [Advantages and Disadvantages])[
  Advantage: Add a die of identical size to the one being rolled—after any pushes. Take the higher result. _An advantage can be converted to +1 up to d8, +2 up to d12, and +4 for d20_

  Disadvantage: Add a die of identical size to the one being rolled—after any pushes. Take the lower result.
]

As with the main touchstone of this system—Gumshoe—characters are presumed to be _competent_. No rolls are needed for activities that any denizen of the Old West would be able to do. Additionally, as ability levels increase, this minimum baseline for success also rises.

==== Failures

When you fail a roll, the GM presents consequences that you can react to in turn. The choice of which ability to use in your reaction depends on the situation.

#rule-box(title: "Example")[Bob has a d8 in Aim and tries to hit NPC Alice. Alice is a bandit wanted in 20 towns, so she has a legendary DC of 11. Knowing this, Bob spends two Gunslinger Points to push his roll to a d12. Unfortunately, he rolls a 6. Alice now gets to shoot back at him. Bob rolls Awareness to try to find cover to mitigate the damage. He rolls his d6 against a simple DC because they're in a saloon full of barrels: it's a 6, so he manages to moderate his damage. He emerges unscathed from the situation, but is now cornered by Alice. How will he proceed?

Bob could instead choose to react with Grit. He heroically takes the bullet in the shoulder, rolling his d10 in Grit against a legendary DC of 11. He uses a Gunslinger Point and manages to succeed by rolling an 11. Eventually he'll have to stop (he does have lead in his shoulder), but for now he doesn't give ground.]

It's reasonable for the GM to impose disadvantage on reaction rolls using the same ability that just failed (barring special circumstances).

In a reaction, you can perform quick actions that grant advantage if they present a complication.

#rule-box(title: "Example 2")[Alice is fleeing from the police when she sees a man recognize her from across the street. She approaches him to convince him not to call _the law_, but her Gift of the Gab isn't working (she rolled a 3). The man now runs toward the sheriff. Alice reacts using her Gift of the Gab again, but rolling with disadvantage. Alice could cancel her disadvantage by drawing her gun and pointing it at the man to frighten him. Naturally, she's in town and there's people around. It might just not be worth it.]

=== Damage

There are 5 damage levels:
- Unharmed
- Wounded
- Badly Wounded
- Dying
- Dead

When taking damage, based on the result of your response, you can move from one level to another.

== Abilities
The six abilities are:

- Aim
- Ride
- Survival
- Grit (ability to "grit your teeth." Determines resistance to pain, for example)
- Awareness (ability to observe surroundings, actively or passively. Tracking skills)
- Gift of the Gab

== Character Creation

*You have 8 Gunslinger Points at your disposal.* They can be kept entirely (meaning you'll have 8 Gunslinger Points available after each rest), or they can be invested in permanent improvements. Points can only be invested during character creation, or through strong narrative justification (since Gunslinger Points become a rechargeable resource once you start playing).

#rule-box(title: [Investing Gunslinger Points])[
  The cost to permanently increase an ability is:
  - 1 point $"d6" -> "d8"$
  - 2 points $"d8" -> "d10"$
  - 3 points $"d10" -> "d12"$

*You can lower an ability to d4 to gain one Gunslinger Point.*
]

#rule-box(title: [Remaining Points])[The remaining points form the character's *Gunslinger Point limit*. There are various ways to recharge Gunslinger Points, but they can never exceed the limit (unless explicitly stated by an effect).]

=== Recovering Gunslinger Points

Gunslinger Points fully recharge after long rests (e.g., a full night). They can also be partially recovered (1-2 points) by eating, drinking, or smoking. To recharge by eating, you must dedicate time to it. For each point recharged by smoking or drinking, make a simple ability roll. If it fails, that ability is reduced by one die size until the next rest, full meal, or for the next 24 hours (whichever comes first).

=== Archetypes

These are essentially classes that are nothing more than legal combinations of what's written above.

- *Marksman*: shooty thingies
- *Ranger*: Horses, plains
- *Smuggler*: "Officer, I swear I don't know how that got in my bag"
- *Survivor*: After navigating a difficult life, chooses to rely more on experience than on people or fate.

The sheets for these can be found at the end of the document

#empty_sheet

#character-sheet(
  abilities: (
    aim: "d8",
    ride: "d6",
    survival: "d6", 
    grit: "d8",
    awareness: "d6",
    fast-talk: "d6"
),
  archetype: "Marksman",
  gunslinger-points: 6,
)

#character-sheet(
  abilities: (
    aim: "d6",
    ride: "d8",
    survival: "d8", 
    grit: "d8",
    awareness: "d8",
    fast-talk: "d6"
),
  archetype: "Ranger",
  gunslinger-points: 5,
)

#character-sheet(
  abilities: (
    aim: "d6",
    ride: "d8",
    survival: "d6",
    grit: "d4",
    awareness: "d8",
    fast-talk: "d10"
),
  archetype: "Smuggler",
  gunslinger-points: 4,
)

#character-sheet(
  abilities: (
    aim: "d6",
    ride: "d8",
    survival: "d10",
    grit: "d10",
    awareness: "d8",
    fast-talk: "d4"
),
  archetype: "Survivor",
  gunslinger-points: 2,
)
