\version "2.24.0"
\include "deutsch.ly"

#(set-global-staff-size 20)

\header {
  title     = \markup \bold \italic "Hornpipe"
  composer  = "Willem de Fesch"
  arranger  = "(1687-1761)"
  enteredby = "cellist (2014-08-10)"
}

voiceconsts = {
  \key c \major
  \time 3/2
  \tempo "Allegro " 4=130
  %\numericTimeSignature
  \compressEmptyMeasures
  %\tupletSpan 4
  % Set default beaming for all staves
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment     = #(ly:make-moment 1/4)
  \set Timing.beatStructure  = 1,1,1,1,1,1
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
        \transpose d g, { \va }
      }

      \new Staff {
        \transposition f
        \set Staff.midiInstrument = \milo
        \set Staff.instrumentName = \markup \center-column { "French" "horn" }
        \transpose d g { \vb }
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
