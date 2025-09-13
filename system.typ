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
    font: "Times New Roman", // Fallback to common serif
    size: 11pt,
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

  // Style for emphasized text (rules, important info)
  show emph: it => [
    #set text(style: "italic", fill: rgb("#8b4513"))
    #it
  ]

  // Strong text styling
  show strong: it => [
    #set text(weight: "bold", fill: rgb("#5d2a0a"))
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
    mira: "d6",
    cavalcata: "d6", 
    sopravvivenza: "d6",
    durezza: "d6",
    accortezza: "d6",
    parlantina: "d6"
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
    #if name != "" [#name] else [Nome del Personaggio: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_]
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
        [*Archetipo:*], 
        if archetype != "" [#archetype] else [\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_]
      )
      
      #v(0.3em)
      
      // Gunslinger points
      #grid(
        columns: (auto, 1fr),
        [*Punti Pistolero:*], 
        [#gunslinger-points / #gunslinger-points]
      )
      
      #v(0.5em)
      
      // Abilities section
      #set text(weight: "bold", size: 11pt, fill: rgb("#5d2a0a"))
      #align(center)[*ABILITÀ*]
      
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
      
      #ability-row("Mira", abilities.mira)
      #ability-row("Cavalcata", abilities.cavalcata)
      #ability-row("Sopravvivenza", abilities.sopravvivenza)
      #ability-row("Durezza", abilities.durezza)
      #ability-row("Accortezza", abilities.accortezza)
      #ability-row("Parlantina", abilities.parlantina)
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
      #align(center)[*CONDIZIONI*]
      
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
      
      #health-level("Incolume", active: true)
      #health-level("Ferito")
      #health-level("Gravemente Ferito")
      #health-level("Morente")
      #health-level("Morto")
      
      #v(0.5em)
      
      // Notes section
      #set text(weight: "bold", size: 11pt, fill: rgb("#5d2a0a"))
      #align(center)[*NOTE*]
      
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
    #align(center)[*EQUIPAGGIAMENTO*]
    
    #set text(weight: "regular", size: 10pt)
    #v(0.3em)
    
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 15pt,
      
      // Weapons
      [
        *Armi:*
        #v(0.2em)
        #for i in range(4) [
          #line(length: 100%, stroke: 0.5pt + rgb("#8b4513"))
          #v(0.3em)
        ]
      ],
      
      // Other gear
      [
        *Altro Equipaggiamento:*
        #v(0.2em)
        #for i in range(4) [
          #line(length: 100%, stroke: 0.5pt + rgb("#8b4513"))
          #v(0.3em)
        ]
      ]
    )
  ]
}

#let emtpy_sheet = character-sheet(
  abilities: (
    mira: "",
    cavalcata: "",
    sopravvivenza: "", 
    durezza: "",
    accortezza: "",
    parlantina: ""
  ),
  gunslinger-points: "  "
)

// Usage example - replace this with your actual content
#show: western-theme.with(title: "Gumslingers")

= Gumslingers

== Sistema

=== Sistema di Risoluzione

Il sistema è un roll-over basato sulle Abilità. Ogni personaggio ha 6 abilità (vedi sotto).

#rule-box(title: [Assegnare le Abilità])[
  La base di abilità si traccia con l'incremento della dimensione del dado. Il punto di partenza per tutte le abilità è il d6.

  In base alla scelta del personaggio, i punteggi base delle abilità possono cambiare. È possibile quindi che, ad esempio, un ottimo tiratore abbia un d8 od un d10 a mira, invece del solito d6. Allo stesso modo, è possibile che un bifolco parta con un d4 in parlantina.
  
  _$ "d4" <- "d6" -> "d8" -> "d10" -> "d12" $_
]

#rule-box(title: [Punti Pistolero e Spinte])[
  Ogni personaggio ha una pool di punti Pistolero. Questi possono essere usati per _spingere_ il tiro, cioè aumentare la dimensione del dado di una taglia, seguendo la solita successione:

  _$ "d4" -> "d6" -> "d8" -> "d10" -> "d12" $_

  Oltre al d12, ogni punto Pistolero diviene un +1. A partire da un d12 (anche se spinto) possono essere usati 4 punti per tirare un d20, privo di ogni modificatore. Oltre ai 4 punti, si torna ad aggiungere un modificatore di +1 al d20 per ogni punto pistolero speso.
]

È possibile raddoppiare l'effetto di una spinta (col consenso del GM) introducendo una complicazione.

Generalmente le CD sono:
- *Semplice:* 5+
- *Moderata:* 7+ 
- *Difficile:* 9+
- *Leggendaria:* 11+

È possibile che circostanze favorevoli conferiscano *vantaggi* o *svantaggi*.

#rule-box(title: [Vantaggi e Svantaggi])[
  Vantaggio: Aggiungi un dado di identica taglia a quello che deve essere tirato—dopo eventuali spinte—. Prendi il risultato più alto. _Un vantaggio può essere convertito in un +1 fino a taglia d8, +2 fino a d12, e +4 a d20_

  Svantaggio: Aggiungi un dado di identica taglia a quello che deve essere tirato—dopo eventuali spinte—. Prendi il risultato più basso.
]

Come nella touchstone principale del sistema—Gumshoe—si presume che i personaggi siano _competenti_. Non sono necessari tiri per attività che qualunque avventore del vecchio West sarebbe stato in grado di fare. Inoltre, con l'alzarsi del livello dell'abilità, si alza anche questo baseline minimo di successo.

==== Fallimenti

Quando si fallisce un tiro, il GM presenta delle conseguenze a cui si può reagire a propria volta. La scelta nell'abilità con cui reagire dipende dalla situazione.

#rule-box(title: "Esempio")[Bob ha un d8 a mira e prova a colpire l'NPC Alice. Alice è una rapinatrice ricercata in 20 città, e quindi ha una CD leggendaria di 11. Sapendo ciò, Bob spende due punti Pistolero per spingere il suo tiro ad un d12. Per sua sfortuna, esce un 6. Alice a questo punto ha modo di sparargli addosso. Bob tira su accortezza per cercare un posto dove ripararsi per mitigare il danno. Tira con un d6 contro una CD semplice perchè sono in un saloon pieno di barili: è un 6, e quindi riesce a moderare i propri danni. Esce incolume dalla situazione, ma ora è messo all'angolo da Alice. Come procederà?

Bob potrebbe invece scegliere di reagire con la durezza. Prende eroicamente il proiettile nella spalla, tira il suo d10 in durezza contro una CD leggendaria di 11. Usa un punto gunslinger e riesce a superare la prova tirando un 11. Prima o poi dovrà fermarsi (ha pur sempre del piombo nella spalla), ma per ora non cede terreno.]

È ragionevole per il GM di infliggere svantaggio a tiri di reazione che usano la stessa abilità che ha appena fallito (salvo circostanze particolari).

In una reazione è possibile compiere azioni rapide che conferiscono un vantaggio qualora presentino una complicazione. 

#rule-box(title: "Esempio 2")[Alice sta fuggendo dalla polizia, quando vede un uomo riconoscerla dall'altro lato della strada. Gli si avvicina per convincerlo a non chiamare _la legge_, ma la sua parlantina non è in giornata (ha tirato un 3). L'uomo ora scappa verso lo sceriffo. Alice reagisce usando nuovamente la sua parlantina, tirando però con svantaggio. Alice potrebbe annullare il suo svantaggio tirando fuori la pistola e puntandola contro l'uomo per spaventarlo. Naturalmente, si trova in paese e ci sono persone attorno. Il gioco potrebbe non valere la candela.]



=== Danni

Ci sono 5 livelli di danno:
- Incolume
- Ferito
- Gravemente Ferito
- Morente
- Morto

Quando si riceve danno, in base al risultato della risposta, si può passare da un grado all'altro.

== Abilità
Le sei abilità sono:

- Mira
- Cavalcata
- Sopravvivenza
- Tempra/Durezza (capacità di "stringere i denti". Determina ad esempio quanto si resiste al dolore)
- Accortezza (capacità di osservare, attivamente o passivamente, i propri dintorni. Abilità di tracciare)
- Parlantina

== Creazione del Personaggio

*Si hanno a propria disposizione 8 punti pistolero.* Possono essere tenuti interamente (questo vuol dire che ad ogni riposo si avranno a disposizione 8 punti pistolero), o possono essere investiti in incrementi permanenti. I punti possono essere investiti solamente durante la creazione del personaggio, o tramite forti giustificazioni narrative (poichè i punti pistolero divengono una risorsa ricaricabile una volta che si inizia a giocare).

#rule-box(title: [Investire i Punti Pistolero])[
  Il costo di aumentare un'abilità in modo permanente è:
  - 1 punto $"d6" -> "d8"$
  - 2 punti $"d8" -> "d10"$
  - 3 punti $"d10" -> "d12"$

*È possibile abbassare un'abilità ad un d4 per poter guadagnare un punto pistolero.*
]

#rule-box(title: [Punti Rimanenti])[I punti rimanenti formano il *limite di punti pistolero* del personaggio. Ci sono diversi modi per ricaricare i punti pistolero, ma non potranno mai superare il limite (a meno che non sia esplicitamente detto dall'effetto).]


=== Recuperare i punti Pistolero

I punti Pistolero si ricaricano interamente dopo i riposi lunghi (es: notte intera). Possono anche essere recuperati parzialmente (1-2 punti) anche mangiando, bevendo o fumando. Perchè si ricarichino mangiando, è necessario dedicarci del tempo. Per ogni punto ricaricato fumando o bevendo, si faccia un tiro semplice di abilità. Se fallisce, quell'abilità è abbassata di una taglia fino al prossimo riposo, pasto completo o per le prossime 24 ore (qualunque viene prima).

=== Archetipi

Sotto delle specie di classi che nulla sono se non combinazioni legali di quanto scritto sopra.

- *Pistolero*
- *Ranger*: Cavalli, pianure
- *Contrabbandiere*: "doganiere le giuro che non so come sia entrato nella mia borsa"
- *Sopravvissuto*: Dopo aver navigato una vita difficile, sceglie di affidarsi più all'esperienza che alle persone o al fato.

Le schede per questi si trovano in fondo al documento

#emtpy_sheet

#character-sheet(
  abilities: (
    mira: "d8",
    cavalcata: "d6",
    sopravvivenza: "d6", 
    durezza: "d8",
    accortezza: "d6",
    parlantina: "d6"
),
  archetype: "Pistolero",
  gunslinger-points: 6,
)

#character-sheet(
  abilities: (
    mira: "d6",
    cavalcata: "d8",
    sopravvivenza: "d8", 
    durezza: "d8",
    accortezza: "d8",
    parlantina: "d6"
),
  archetype: "Ranger",
  gunslinger-points: 5,
)

#character-sheet(
  abilities: (
    mira: "d6",
    cavalcata: "d8",
    sopravvivenza: "d6",
    durezza: "d4",
    accortezza: "d8",
    parlantina: "d10"
),
  archetype: "Contrabbandiere",
  gunslinger-points: 4,
)

#character-sheet(
  abilities: (
    mira: "d6",
    cavalcata: "d8",
    sopravvivenza: "d10",
    durezza: "d10",
    accortezza: "d8",
    parlantina: "d4"
),
  archetype: "Sopravvissuto",
  gunslinger-points: 2,
)
