#let western-theme(title: "Gumslingers", body) = {
  // Set document properties
  set document(title: title, author: "Your Name")
  
  // Page setup with margins
  set page(
    paper: "a4",
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
    font: ("Courier Prime", "Times New Roman"), // Fallback to common serif
    size: 12pt,
    fill: rgb("#2d1810"), // Dark brown text
  )

  // Heading styles with western feel
  show heading.where(level: 1): it => [
    #set text(
      size: 24pt, 
      weight: "bold",
      font: ("Courier Prime", "Georgia", "Times New Roman"),
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
      size: 18pt, 
      weight: "bold",
      font: ("Courier Prime", "Georgia", "Times New Roman"),
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
      size: 16pt, 
      weight: "bold",
      style: "italic",
      fill: rgb("#8b4513")
    )
    #block(inset: (top: 0.6em, bottom: 0.2em))[#it.body]
  ]

  show heading.where(level: 4): it => [
    #set text(
      size: 14pt, 
      weight: "bold",
      style: "italic",
      fill: rgb("#8b4513")
    )
    #block(inset: (top: 0.4em, bottom: 0.15em))[#it.body]
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

  set table(
    stroke: none,
    fill: (x, y) => {
      if y == 0 { 
        rgb("#8b4513").transparentize(70%)
      } else if calc.odd(y) { 
        rgb("#f0e6d2").transparentize(60%)
      } else { 
        rgb("#ffffff").transparentize(30%) 
      }
    },
    inset: 8pt
  )

  show table: it => [
    #block(
      width: 100%,
      inset: 0pt,
      radius: 4pt,
      stroke: 2pt + rgb("#8b4513").transparentize(30%),
      clip: true,
    )[
      #it
    ]
  ]

  show table.cell: it => {
    if it.y == 0 {
      // Header cells
      set text(
        weight: "bold",
        fill: rgb("#2d1810"),
        size: 11pt
      )
      it
    } else {
      // Regular cells
      set text(
        fill: rgb("#2d1810"),
        size: 10pt
      )
      it
    }
  }

  
  body
}

#let western-toc(title: "Table of Contents") = {
  
  // Title styling
  block(
    width: 100%,
    inset: (y: 0.8em),
    stroke: (bottom: 3pt + rgb("#8b4513"), top: 3pt + rgb("#8b4513")),
    fill: rgb("#8b4513").transparentize(80%),
  )[
    #set text(
      size: 20pt,
      weight: "bold", 
      fill: rgb("#5d2a0a"),
      font: ("Courier Prime", "Georgia", "Times New Roman")
    )
    #align(center)[#title]
  ]
  
  v(0.8em)
  
  // TOC container with Western styling
  block(
    width: 100%,
    inset: 20pt,
    radius: 6pt,
    fill: rgb("#f0e6d2").transparentize(30%),
    stroke: 2pt + rgb("#8b4513").transparentize(30%),
  )[
    #outline(
      depth: 3,
      indent: auto,
    )
  ]
  pagebreak()
}

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

#let example-box(body) = {
  rule-box(title: "Example")[#body]
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
      
      // Sand points
      #grid(
        columns: (auto, 1fr),
        [*Sand Points:*], 
        [ #gunslinger-points / #gunslinger-points]
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
#western-toc()


== Resolution System

The system uses a 2-die roll-over mechanic based on Abilities. Each character has 6 abilities (see below).

Characters also have Sand Points (named after the "having sand" expression), which allows them to push themselves beyond their normal limits.

=== Main roll

The base roll is simple:
- Roll two dice of the indicated size
- Compare them with the DC:
  - If both succeed, it's a full success: you get what you want and nothing bad happens
  - If both fail, it's a full failure: get ready for consequences (most commonly in combat, the enemy gets to do something)
  - If one succeeds, it's a mixed success: you get what you want, but you suffer some consequence (meaning that both the success and failure effects take place)
- If the two dice have _the same value_, then it's a _strong_ result: whichever effect occurs, it's going to be amplified

=== Risk roll

Sometimes a PC might want to not care about contingencies and go straight for the metaphorical kill, even at their own risk. This is the _risk roll._ Roll 1 die (subject to advantage), and treat it as if it were a pair of dice for the purposes of the main roll's degrees of success: any result is automatically a _strong_ result, and there's no mixed success.

=== Ability dice

Ability scores are tracked by increasing die size. The starting point for all abilities is d6.

#rule-box(title: [Assigning Abilities])[

  Based on character creation choices, base ability scores can change. For example, an excellent marksman might start with a d8 or d10 in Aim instead of the usual d6. Conversely, a simple farmhand might start with a d4 in Gift of the Gab.
  
  _$ "d4" <- "d6" -> "d8" -> "d10" -> "d12" $_
]

#rule-box(title: [Sand Points and Pushes])[
  Each character has a pool of Sand Points. These can be used to _push oneself_, making for the character behave, *for a moment* (a single roll, a single action), as if they were better at the skill. This means, most notably, increasing the die size by one step following the usual progression:

  _$ "d4" -> "d6" -> "d8" -> "d10" -> "d12" $_

  Beyond d12, each Sand Point becomes a +1. Starting from a d12 (even if pushed), 4 points can be spent to roll a d20 with no modifiers. Beyond those 4 points, you add a +1 modifier to the d20 for each additional Sand Point spent.
]

You can double the effect of a push (with GM consent) by introducing a complication. Instead of a complication, the World can tally a due.

The World (personified in the GM) can keep a tally of the PC's dues. A sort of symbol of the unfair luck they might have had, or of the favours fate handed them. Fate, however, doesn't do gifts, and luck turns around.

#rule-box(title: "Dues")[
  Dues—accumulated within Bargains with Fate—are tokens the GM gets to spend to insert world or NPC moves while outside of the timing defined by the normal resolution system. For example, the GM might spend a token to:
  - add a complication to a scene
  - have an NPC interrupt a player turn / sequence of player turns

  #quote()[_Run, cowboy, try your best. I'll be on the other side. This check has your  signature on it, and I fully intend to cash it._]
]

Generally, Difficulty Classes are:

#table(
  columns: (1fr, auto, 2fr),
  [*Difficulty*], [*DC*], [*When to Use*],
  [Easy], [3+], [Simple tasks],
  [Simple], [5+], [Routine *challenges* for competent folk],
  [Moderate], [7+], [Significant obstacles],
  [Hard], [9+], [Expert-level tasks],
  [Legendary], [11+], [Heroic feats],
)

Favorable circumstances may grant *advantages* or *disadvantages.*

#rule-box(title: [Advantages and Disadvantages])[
  Advantage: Add a die of identical size to the one being rolled—after any pushes. Take the two highest results. _An advantage can be converted to +1 up to d8, +2 up to d12, and +4 for d20_

  Disadvantage: Add a die of identical size to the one being rolled—after any pushes. Take the two lowest results.
]

As with the main touchstone of this system—Gumshoe—characters are presumed to be _competent._ No rolls are needed for activities that any denizen of the Old West would be able to do. Additionally, as ability levels increase, this minimum baseline for success also rises.

=== Failures and Reactions

When you (partially or fully) fail a roll, the GM presents consequences that you can react to in turn. The choice of which ability to use in your reaction depends on the situation. It's common for reaction rolls to be _risk_ rolls (though not required).

#rule-box(title: "Example")[Bob has a d8 in Aim and tries to hit NPC Alice. Alice is a bandit wanted in 20 towns, so she has a legendary DC of 11. Knowing this, Bob spends two Sand Points to push his roll to a d12. Unfortunately, he rolls a 6 and a 10, thus taking a full failure. Alice now gets to shoot back at him. Bob rolls Awareness to try to find cover to mitigate the damage. He acts quickly, having no real alternatives, calling for a _risk roll._ He rolls his d6 against a simple DC of 5 because they're in a saloon full of barrels: it's a 6, so he manages to dive, taking no damage. He emerges unscathed from the situation, but is now cornered by Alice. How will he proceed?

Bob could instead choose to react with Grit. He heroically takes the bullet in the shoulder, _risk_ rolling his d10 in Grit against a legendary DC of 11. He uses a Sand Point and manages to succeed by rolling an 11. Eventually he'll have to stop (he does have lead in his shoulder), but for now he doesn't give ground.]

It's reasonable for the GM to impose disadvantage on reaction rolls using the same ability that just failed (barring special circumstances).

In a reaction, you can perform quick actions that grant advantage if they present a complication.

#rule-box(title: "Example 2")[Alice is fleeing from the police when she sees a man recognize her from across the street. She approaches him to convince him not to call _the law_, but her Gift of the Gab isn't working (she rolled a 3 and a 2). The man now runs toward the sheriff. Alice reacts using her Gift of the Gab again, but the GM rules that she's rolling with disadvantage. Alice could cancel her disadvantage by drawing her gun and pointing it at the man to frighten him. Naturally, she's in town and there's people around. It might just not be worth it.]

After the first exchange occurs, the player might be tempted to keep the chain of events going: as their reaction triggers a reaction from the NPC, and so forth. Other players _can_ and probably should intervene (unless it's fun for them to watch as their friend keeps digging their own grave with more and more complications. In that case, have fun!).

=== Damage

There are 5 damage levels:
#table(
  columns: (auto, auto, auto),
  align: left,
  [*Condition*], [*Mechanical Effect*], [*Description*],
  
  [Unharmed], 
  [No penalties], 
  [You're in fighting shape, ready for whatever comes next.],
  
  [Wounded], 
  [All abilities reduced by 1 die size], 
  [You're hurt but functional. That bullet graze or knife cut is slowing you down, but you can still act.],
  
  [Badly Wounded], 
  [All abilities reduced by 2 die sizes. Some abilities may become unusable (GM discretion).], 
  [You're in serious trouble. Blood loss, broken bones, or severe trauma make even basic actions difficult.],
  
  [Dying], 
  [All abilities reduced by 3 die sizes. You fall unconscious and cannot act unless spending Sand Points to briefly regain consciousness for one action by _pushing._], 
  [You're at death's door. Your vision fades, strength leaves you, and staying conscious requires tremendous effort.],
  
  [Dead], 
  [Character dies, but may make one final action with any ability at -4 die size before expiring (eg dump all Sand Points into one final shot).], 
  [Your time has come. In your last moments, you might manage one desperate act of will before the darkness takes you.],
)

When taking damage, based on the result of your response, you can move from one level to another. Strong results, like strong failures in getting out of the way of a bullet, might also move the PC by two levels. (eg unharmed $->$ badly wounded)

Note to GMs: this system gets _very_ lethal _very quickly._ Pay careful attention to telegraph potentially game-ending encounters.

== Abilities
The six abilities are:

#table(
  columns: (auto, 1fr),
  align: left,
  [*Ability*], [*Description*],
  
  [Aim], 
  [Shooting, throwing, and hitting targets. Combat accuracy and weapon handling.],
  
  [Ride], 
  [Horsemanship, animal handling, and mounted activities. Managing beasts of burden.],
  
  [Survival], 
  [Wilderness skills, following trails and physical signs, camping, and navigating harsh environments.],
  
  [Grit], 
  [Mental toughness, pain tolerance, and perseverance. "Gritting your teeth" through hardship.],
  
  [Awareness], 
  [Observation, perception, and noticing details. Reading people and situations, detecting ambushes.],
  
  [Gift of the Gab], 
  [Social skills, persuasion, deception, and verbal communication. Talking your way through problems.],
)


When abilities get stronger, so does the kind of thing the character can do become more and more impressive. This is handled via the DCs system. For example, _calling shots_ might raise the DC by 1. Shooting from a large distance might do the same. Combining the two might raise it by 2. This is sort of pre-tracked within the difficulty table above.

A d4 is a novice, or a person with a serious lack of talent, a d6 represents roughly amateurish-average skill. A d8 represents the level of a professional. A d10 is a virtuoso, and the d12 is the all-time-best in the field. When pushing with Sand Points, characters can attempt feats normally associated with higher ability levels.

#example-box()[A d6 Aim character might reliably hit targets at close range, while a d10 character could make precise shots at distance or under pressure. A d12 character operates at legendary levels of precision.]

== Character Creation

*You have 8 Sand Points at your disposal.* They can be kept entirely (meaning you'll have 8 Sand Points available after each rest), or they can be invested in permanent improvements. Points can only be invested during character creation, or through strong narrative justification (since Sand Points become a rechargeable resource once you start playing).

#rule-box(title: [Investing Sand Points])[
  The cost to permanently increase an ability is:
#table(
  columns: (auto, auto, 1fr),
  [*Die Step*], [*Cost*], [*Descriptors*],
  [d6 $->$ d4], [-1 point\*], [Not great],
  [d6 $->$ d8], [1 point], [Pretty great],
  [d8 $->$ d10], [2 points], [Incredible],
  [d10 $->$ d12], [3 points], [Peak human ability],
)

\*You can lower an ability to d4 to gain one Sand Point.
]

#rule-box(title: [Remaining Points])[The remaining points form the character's *Sand Point limit.* There are various ways to recharge Sand Points, but they can never exceed the limit (unless explicitly stated by an effect).]

=== Recovering Sand Points

Sand Points fully recharge after long rests (e.g., a full night). They can also be partially recovered (1-2 points) by eating, drinking, or smoking. To recharge by eating, you must dedicate time to it. For each point recharged by smoking or drinking, make a simple ability roll. If it fails, that ability is reduced by one die size until the next rest, full meal, or for the next 24 hours (whichever comes first).

=== Archetypes

These are essentially presets that are nothing more than combinations of what's written above.

- *Marksman*: Deadeye, a cigarette and a well-kept weapon
- *Ranger*: Horses, plains
- *Smuggler*: "Officer, I swear I don't know how that got in my bag"
- *Survivor*: After navigating a difficult life, chooses to rely more on experience than on people or fate.

The sheets for these can be found at the end of the document.

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

