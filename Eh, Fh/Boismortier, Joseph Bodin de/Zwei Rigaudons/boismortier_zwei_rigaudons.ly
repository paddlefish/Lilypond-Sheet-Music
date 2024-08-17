\version "2.24.0"
\include "deutsch.ly"

#(set-global-staff-size 21.75)

\header {
  title     = \markup \bold \italic "Zwei Rigaudons"
  composer  = "Joseph Bodin de Boismortier"
  arranger  = "(1691-1765)"
  enteredby = "cellist (2014-08-10)"
}

voiceconsts = {
  \compressEmptyMeasures
  % Set default beaming for all staves
  %\set Timing.beamExceptions = #'()
  %\set Timing.baseMoment     = #(ly:make-moment 1/4)
  %\set Timing.beatStructure  = 1,1,1
}

mihi = "english horn"
milo = "french horn"
%mihi = "bright acoustic"
%milo = "acoustic bass"

introa = {        \tempo "Nr. 1 " 4=120 \key g \major \time 2/2 \partial 4 }
introb = { \break \tempo "Nr. 2 " 4=100 \key g \minor }

\include "v1.ily"
\include "v2.ily"

music = \new StaffGroup <<
      \new Staff {
        \set Staff.midiInstrument = \mihi
        \set Staff.instrumentName = \markup \center-column { "English" "horn" }
        \transposition f
        \transpose g c { \va }
      }

      \new Staff {
        \set Staff.midiInstrument = \milo
        \set Staff.instrumentName = \markup \center-column { "French" "horn" }
        \transposition f
        \transpose g c' { \vb }
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
