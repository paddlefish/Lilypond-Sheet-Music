\version "2.24.0"
\include "deutsch.ly"

#(set-global-staff-size 23)

\header {
  title     = \markup \bold \italic "Sarabande"
  composer  = "Johann Christian Schickhardt"
  arranger  = "(1682-1762)"
  enteredby = "cellist (2014-08-09)"
}

voiceconsts = {
  \key c \major
  \time 3/2
  \tempo "Adagio " 2=70
  %\numericTimeSignature
  \compressEmptyMeasures
  %\tupletSpan 4
  % Set default beaming for all staves
  %\set Timing.beamExceptions = #'()
  %\set Timing.baseMoment     = #(ly:make-moment 1/2)
  %\set Timing.beatStructure  = 1,1,1
}

mihi = "english horn"
milo = "french horn"
%mihi = "bright acoustic"
%milo = "acoustic bass"

\include "v1.ily"
\include "v2.ily"

music = \new StaffGroup <<
      \new Staff {
        \set Staff.midiInstrument = \mihi
        \set Staff.instrumentName = \markup \center-column { "English" "horn" }
        \transpose c g { \va }
      }

      \new Staff {
        \set Staff.midiInstrument = \milo
        \set Staff.instrumentName = \markup \center-column { "French" "horn" }
        \transpose c g' { \vb }
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
