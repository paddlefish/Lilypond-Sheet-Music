\version "2.24.0"
\include "deutsch.ly"

#(set-global-staff-size 25)

\header {
  title     = \markup \bold \italic "Menuett"
  composer  = "Willem de Fesch"
  arranger  = "(1687-1761)"
  enteredby = "cellist (2014-08-10)"
}

voiceconsts = {
  \key f \major
  \time 3/4
  \tempo "Allegro " 4=120
  %\numericTimeSignature
  \compressEmptyMeasures
  \tupletSpan 4
  % Set default beaming for all staves
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment     = #(ly:make-moment 1/4)
  \set Timing.beatStructure  = 1,1,1
}

mihi = "english horn"
milo = "french horn"
%mihi = "bright acoustic"
%milo = "acoustic bass"

\include "v1.ily"
\include "v2.ily"

music = \new StaffGroup <<
      \new Staff {
        \transposition f
        \set Staff.midiInstrument = \mihi
        \set Staff.instrumentName = \markup \center-column { "English" "horn" }
        \transpose fis a, { \va }
      }

      \new Staff {
        \transposition f
        \set Staff.midiInstrument = \milo
        \set Staff.instrumentName = \markup \center-column { "French" "horn" }
        \transpose fis a { \vb }
      }
>>

\book {
  \score {
   \music
    \layout {}
  }

  \score {
    \unfoldRepeats \music

    \midi {
      \context {
        \Score
      }
    }
  }
}
