// #import "@preview/peace-of-posters:0.4.0" as pop
#import "./peace-of-posters/lib.typ" as pop
#import "@preview/physica:0.9.3" : *

#let k2 = [(#text(red)[$k_2$]) ]


#let custom_layout = pop._default-layout + (
    "spacing": 1.2em,
    "paper":            "a0",
    "size":             (841mm, 1188mm),
    "body-size":        33pt,
    "heading-size":     50pt,
    "title-size":       75pt,
    "subtitle-size":    60pt,
    "authors-size":     50pt,
    "keywords-size":    40pt,
)


//#show: pop.poster-layout(pop.layout-a0)
//
#show: pop.a0-poster

#let iibo-theme = (
    "body-box-args": (
        inset: 0.6em,
        width: 100%,
    ),
    "body-text-args": (:),
    "heading-box-args": (
        inset: 0.6em,
        width: 100%,
        fill: rgb("#8a3d97"),
        stroke: rgb("#1d154d"),
    ),
    "heading-text-args": (
        fill: white,
    ),
)
// #show: pop.iibo-poster


#pop.set-theme(iibo-theme)


#set page(
  width: 80cm,
  height: 110cm,
)


#set text(lang: "es")
#let uni_dark_blue = rgb("#0F5A5A")
#let colred(x) = text(fill: red, $#x$)

#let text-args = (weight:"medium",fill:white)

#let autores = [#underline[Javier Roberto Rubalcava Cortés]#super[1],
                Eliezer Flores Garza#super[2],
                Elisa Domínguez Hüttinger#super[3].]

#let afiliaciones = [
#super[1] Departamento de Matemáticas, Facultad de
Ciencias, Universidad Nacional Autónoma de México, Ciudad Universitaria, 04510,
Ciudad de México, México \
#super[2] Departamento de Bioingeniería, Imperial College London, South
Kensington Campus, London SW7 2AZ, Reino Unido. \
#super[3] Departamento de Biología Molecular y Biotecnología, Instituto de
Investigaciones Biomédicas, Universidad Nacional Autónoma de México, Ciudad
Universitaria, 04510, Ciudad de México, México.
]

#let modelo_eq = $ 
  dot(M) &=& M_f k_6 - M/k_(16) #colred[$k_2$] (1 + M_f k_(13) k_(17)) 
  - M k_1 - M_T k_9 \
  dot(M_f) &=& M T/k_(16) #colred[$k_2$] (1 + M_f k_(13) k_(17)) - M_f k_3 - M_f (T k_(10) + k_(14) T_f)
  - M_f k_5 - M_f k_(13)\
  dot(T) &=& k_8 T (1 - T/k_(15)) + M_f k_(13) k_(16)
  - M T/k_(16) #colred[$k_2$] (1 + M_f k_(13) k_(17))\
 dot(T_f) &=& k_(12) T_f (1 - T_f/(1 + k_(15) M_f)) + M T/k_(16)
  #colred[$k_2$] (1 + M_f k_(13) k_(17))- M_f T_f k_4.$

#stack(dir: ltr, 
          // spacing:10%,
      figure(image("./Logo-FC-Color.jpg", width:20%)),
      figure(image("./Logo-feria-black.svg", width: 20%)),
      // figure(image("./Logo-feria-purple.svg", width: 20%)),
      figure(image("./Logo-SysBio.png", width: 20%)),
      figure(image("./Logo-IIBO.png", width: 20%)), 
    )

#pop.title-box(
  "Diseño y optimización de intervenciones para tuberculosis con métodos computacionales",
  authors: autores,
  institutes: afiliaciones,
  // keywords: "Awesome, Posters, Science",
  authors-size: 25pt
)


#pop.column-box()[
	#set par(justify: true)
	// #set align(center)
La tuberculosis es una enfermedad infecciosa grave que afecta principalmente a
  los pulmones y puede ser mortal si no se trata adecuadamente. La emergencia
  de cepas resistentes a los tratamientos convencionales subraya la urgencia de
  diseñar nuevas terapias. 
  // En trabajos previos  se
  // propuso y validó un modelo de la interacción entre
  // bacterias y macrófagos durante la infección, y se realizó un análisis de
  // bifurcación para identificar parámetros críticos en la dinámica del sistema.
  // En este trabajo, nos enfocamos en proponer intervenciones para la enfermedad
  // utilizando dicho modelo. Realizamos simulaciones con pacientes virtuales,
  // los cuales reciben una intervención de tiempo limitado con el 
  // objetivo de frenar el crecimiento de la infección. Empleando
  // métodos de teoría de control, diseñamos y optimizamos estrategias de
  // intervención para controlar la infección, utilizando evolución diferencial
  // para ajustar el tiempo y la intensidad de las intervenciones. 
  //
]



#columns(2,[

  #pop.column-box(heading: "Objetivos del trabajo.",heading-text-args:text-args)[
    - Usar una combinación de teoría de control y sistemas dinámicos para proponer
      nuevos regímenes de tratamiento.
    - Optimizar las intervenciones propuestas. 
  ]

  #pop.column-box(heading: "Análisis de bifurcación y selección de parámetro.",
    heading-text-args:text-args)[

     - Previamente se realizo un análisis de bifurcación del modelo
       @flores2023bifurcation en el cual se identificaron distintos parámetros 
       que bifurcan el sistema. 
     - A partir de una revisión de la literatura de 
       tratamientos de tuberculosis, decidimos enfocarnos en plantear intervenciones 
       sobre la tasa de fagocitosis (#text(red)[$k_2$]) .
  ]
  // #pop.column-box()[
  //   #figure(
  //       image("./images/bif2.jpg", height:8%),
  //     caption:[
  //     Cuando la tasa de fagocitosis supera el umbral $P$ entonces el 
  //     sistema pasa de mono estabilidad a be estabilidad.
  //   ]
  //   )
  // ]

  #pop.column-box(heading: [El éxito de las intervenciones depende de la intensidad y duración.],
  stretch-to-next:true, 
  heading-text-args:text-args)[
      #v(2em)
		#figure(stack(dir: ttb,
			box([
                #image("./images/tratemiento_fallido.svg", width: 60.5%)
                #place(top+right,
                  dx: 10pt,
                  dy: 10pt,
                  rect(text("A", fill: white),
                  fill: uni_dark_blue, inset: 10pt))
            ]),
            box(width: 1%),
			box([
                #image("./images/tratemiento_exitoso.svg",width: 60.5%)
                #place(top+right,
                  dx: 10pt,
                  dy: 10pt,
                  rect(text("B", fill: white),
                  fill: uni_dark_blue,
                  inset: 10pt))
                ])
	    ), caption: [
                  Comportamiento del sistema con distintas intervenciones.
      El tratamiento *A* no es lo suficientemente 
      prolongado para alejar el sistema del equilibrio, mientras que el tratamiento 
      *B* logra revertir la dinámica del sistema.
		])
	]
  

  

  #colbreak()

  #pop.column-box(heading: "Modelo matemático.",
    stretch-to-next: false,
  heading-text-args:text-args)[
  El modelo mecanístico propuesto previamente en @Flores-Garza2022MathematicalTuberculosis : \

    #modelo_eq

  El modelo divide la progresión de la enfermedad en tres etapas, además 
    presenta un comportamiento de "todo o nada".
  ]


  #pop.column-box(heading: [Simulación de intervenciones.],
    heading-text-args:text-args)[
		#figure(image("./images/figura_concepto.svg"),

      caption: [
                  Nuestro acercamiento consiste en perturbar la 
      tasa de fagocitosis #k2 durante un breve intervalo de tiempo. Con el objetivo 
      de forzar al sistema a que entre a un estado de bi estabilidad, donde es posible revertir 
      la tendencia de la infección.
		])
	]


  #pop.column-box(heading: "Optimización de tratamientos.", 
  heading-text-args:text-args)[
    Propusimos una función de costo para plantear un problema de 
    optimización: // usando:
    #set math.equation(numbering: "(1)")
    #let phistar = $phi^* $
    #let tstar = $t^*$
    #let Ttot = $op("Ttot")$

    $
    C( phistar, tstar) = underbrace( phistar dot tstar, "Intensidad del \n tratamiento")
    + underbrace(integral_(0)^(70) Ttot(t) dd(t), "Promedio de \n bacterias.")
    $ 

    Posteriormente utilizamos métodos de optimización de caja negra
    @Feldt2018 para optimizar los parámetros de la intervención $phistar, tstar$.
  ]

#pop.column-box(heading: "Siguientes pasos del proyecto.",
  heading-text-args:text-args)[
   #columns(2, gutter: 11pt)[
   #set par(justify: true)
    - Extender el modelo para considerar antibióticos.
    - Utilizar intervenciones combinadas.
    #colbreak()
    - Explorar distintos métodos de optimización.
    - Utilizar optimización multiobjetivo.
 ]
  ]
])


  
  #pop.column-box(heading: "Referencias.", stretch-to-next: false,
 heading-text-args:text-args)[
    #set text(size: 24pt,lang:"es")
    #bibliography("./references.bib",
    title: none)
  ]
//
// #pop.bottom-box()[
// Grupo de investigación de Biología de Sistemas
// ] 
