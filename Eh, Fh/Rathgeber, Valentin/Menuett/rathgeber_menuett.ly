\version "2.24.0"
\include "deutsch.ly"

#(set-global-staff-size 24)

\header {
  title     = \markup \bold \italic "Menuett"
  subtitle  = "- aus den \"kleinen Duetten\" -"
  composer  = "Valentin Rathgeber"
  arranger  = "(1682-1750)"
  enteredby = "cellist (2014-08-10)"
}

voiceconsts = {
  \key c \major
  \time 3/4
  \tempo "Allegretto " 4=120
  %\numericTimeSignature
  \compressEmptyMeasures
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
        \transpose d c { \va }
      }

      \new Staff {
        \transposition f
        \set Staff.midiInstrument = \milo
        \set Staff.instrumentName = \markup \center-column { "French" "horn" }
        \transpose d c' { \vb }
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
