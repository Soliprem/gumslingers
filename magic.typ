#import "./generic-theme.typ": *

#show: stylised-theme.with(
  title: "Magic System",
  paper: "a4",
)
#main-title()[Magic System]

= Objectives
This magic system aims to give players the freedom to handle magic as they wish by being flexible, but sufficiently limiting so that it doesn't get out of hand.

The main tool to achieve this is the metacurrency: *Mana*. As in Vagabond#footnote[which is a major touchstone, alongside SWADE, for this magic system], Mana can be used to modify or enhance spells.

The second element is *skills.* Magic relies on stats, as in many other systems. Depending on the setting, you may want to change which skills are tied to magic.

Investing metacurrency into magic-tied skills will, as with any other skill, make you better at the kind of magic tied to it, which we can represent by raising the baseline for automatic success, and giving access to more spells of that category.

= Mana

Beyond the standard uses for Mana in rolling (it's still the system's metacurrency), there's a few uses for Mana in the system:
#columns(2)[
- Changing the shape of a spell
- Increasing the range of a spell
#colbreak()
- Increasing the area of effect of a spell
- Combining spells
]

= Base Spells
- *Slime:* Coat a target in sticky slime. #footnote[Targets for coating must be at most of around your size, e.g. a creature of your size, or a small area of around your own surface area.]
- *Slide:* Coat a target in slippery stuff.
- *Acid:* Coat a target in corrosive acid.
- *Bolt:* Throw a bolt of any Element or Energy at a target, dealing damage.
- *Manipulate:* Manipulate any Element or Energy.
- *Telekinesis:* Move things as if they weren't at a distance. #footnote[using your magic skill instead of your otherwise more appropriate skill for moving stuff]
- *Telepathy:* Talk to other beings at a distance, silently. They can answer.
- *Mind-reading:* Read minds. Might be spotted.

This is a non-exhaustive list. If your setting needs more spells, feel free to add them.

== Elements and Energies

There's 4 default elements and 4 default energies.

#columns(2)[
=== Elements
- *Fire*
- *Water*
- *Air*
- *Earth*
#colbreak()
=== Energies
- *Electricity*
- *Heat*
- *Sound*
- *Light*
]

== Possible groupings

These spells should be tied to one or more skills, depending on the level of granularity of the magic system in the setting. If we have one skill, the grouping is trivial. In this document, we'll have 4 groups: *Coating*, *Elemental*, *Energetic*, *Mental*. Elemental and Energetic might look small, but note that *Bolt* and *Manipulate* are _very_ flexible spells.

#table(columns: (auto, auto, auto, auto))[
*Coating*][*Elemental*][*Energetic*][*Mental*][
 Slime\ Slide \ Acid ][ Manipulate Element\ Bolt of Element ][Manipulate Energy\ Bolt of Energy][Telekinesis\ Telepathy\ Mind Reading]

== Combining Spells

You can use *Mana* to combine the effect of spells you know. These *Composite Spells* will share in the effects of their sources. For example, you might combine *Slime* + *Manipulate Fire* to get a persistent, adhesive burn. Or you might combine *Telepathy* with *Manipulate Light* or *Manipulate Sound* to temporarily blind or deafen a guard without actually emitting light or sound. Or you might combine *Slime* or *Slide* with *Telepathy* to make a thought particularly slippery, or sticky in one's mind.
