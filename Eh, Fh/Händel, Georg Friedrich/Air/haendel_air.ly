\version "2.24.0"
\include "deutsch.ly"

#(set-global-staff-size 23)

\header {
  title     = \markup \bold \italic "Air"
  composer  = "Georg Friedrich Händel"
  arranger  = "(1685-1759)"
  enteredby = "cellist (2014-08-09)"
}

voiceconsts = {
  \key f \major
  \time 2/4
  \tempo "Moderato " 4=80
  %\numericTimeSignature
  \compressEmptyMeasures
  %\tupletSpan 4
  % Set default beaming for all staves
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment     = #(ly:make-moment 1/2)
  \set Timing.beatStructure  = #'(1)
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
        \transpose f c { \va }
      }

      \new Staff {
        \transposition f
        \set Staff.midiInstrument = \milo
        \set Staff.instrumentName = \markup \center-column { "French" "horn" }
        \transpose f c' { \vb }
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
