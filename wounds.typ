#import "./generic-theme.typ": *

#show: stylised-theme.with(
  title: "Damage System",
  paper: "a4",
)
#main-title()[Wound System]

= Why use wounds
Wounds make for very dynamic damage systems, with damage having instantaneous effect on the characters. This can give better immersion, where hp create some dissonance because a character is as effective at 1 hp as they are at 200.

= Wound System

There's many ways to get hurt in a given setting. The more you get hurt, the more you are wounded. This is represented with different wounded *levels*. In the example Western System, there's 5 levels of wounded, from _unharmed_ to _dead_.

== Grit
The metacurrency, (called *Grit* in this subsystem) allows you to fight your wounds, or to recover.
- you can spend 1 Grit to reduce the damage you take by 1 level.
- you can spend 1 Grit to heal 1 level of wound.
The GM might decide that one might need to roll an ability for the effect to apply in particularly gritty settings (as in the case of the example Western system). This should be clearly communicated to the players.

== Wound levels
There are 5 wound levels by default: *Unharmed*, *Wounded*, *Badly Wounded*, *Dying*, *Dead*.

For each level, the PC incurs a mechanical penalty. In this document, I'll reduce their ability die sizes. How many die sizes to detract per wound level is the GM's choice, but I'll provide a couple of examples below.

#block(breakable: false)[
=== Example 1
The 5 levels are:
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
  [All abilities reduced by 3 die sizes. You fall unconscious and cannot act unless spending Grit to briefly regain consciousness for one action by _pushing._],
  [You're at death's door. Your vision fades, strength leaves you, and staying conscious requires tremendous effort.],

  [Dead],
  [Character dies, but may make one final action with any ability at -4 die size before expiring (eg dump all Grit into one final shot).],
  [Your time has come. In your last moments, you might manage one desperate act of will before the darkness takes you.],
)

When taking damage, you can move from one level to another. Strong results, like strong failures in getting out of the way of a bullet, might also move the PC by two levels. (eg unharmed $->$ badly wounded)

In this variant, healing requires expending two Grit.

Note to GMs: this system gets _very_ lethal _very quickly._ Pay careful attention to telegraph potentially game-ending encounters.
]
#block(breakable: false)[
=== Example 2

Example 1 is pulled 1 for 1 from Gumslingers, and that system was very lethal. This alternative is a bit more heroic.

#table(
  columns: (auto, auto, auto),
  align: left,
  [*Condition*], [*Mechanical Effect*], [*Description*],

  [Unharmed],
  [No penalties],
  [You're in fighting shape, ready for whatever comes next.],

  [Wounded],
  [One ability of you or the GM's choice is reduced by 1 die size],
  [You're hurt but functional. That bullet graze or knife cut is slowing you down, but you can still act.],

  [Badly Wounded],
  [One ability of you or the GM's choice is reduced by 1 die size. Some abilities may become unusable (GM discretion).],
  [You're in serious trouble. Blood loss, broken bones, or severe trauma make even basic actions difficult.],

  [Dying],
  [One ability of you or the GM's choice is reduced by 1 die size. You fall unconscious and cannot act unless spending Grit regain consciousness by _pushing_, or being woken up.],
  [You're at death's door. Your vision fades, strength leaves you, and staying conscious requires tremendous effort.],

  [Dead],
  [Character dies, but may make one final action with any ability before expiring (eg dump all Grit into one final shot).],
  [Your time has come. In your last moments, you might manage one desperate act of will before the darkness takes you.],
)


When taking damage, you can move from one level to another. Strong results, like strong failures in getting out of the way of a bullet, might also move the PC by two levels. (eg unharmed $->$ badly wounded)

The same ability *can* be reduced more than once. Ideally, player and GM will agree on which ability should be reduced, with the player proposing and ability and the GM accepting it. The GM, however, can overrule the player's proposal.
]
