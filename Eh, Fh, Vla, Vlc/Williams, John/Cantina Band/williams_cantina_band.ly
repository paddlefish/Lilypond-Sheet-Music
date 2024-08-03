\version "2.24.0"
\include "deutsch.ly"
  
#(set-global-staff-size 20)

\header {
  title     = \markup \bold \italic "Cantina Band"
  subtitle  = "- \"Star Wars: Episode IV - A New Hope\" -"
  composer  = "John Towner Williams"
  arranger  = "(*1932)"
  enteredby = "cellist (2017-04-18) and Andrew Rahn 2024-08-03"
  piece     = "(1977)"
}

voiceconsts = {
  \key f \major
  \time 2/2
  \clef "treble"
% \numericTimeSignature
  \compressEmptyMeasures
  % Set default beaming for all staves
%  \set Timing.beamExceptions = #'()
%  \set Timing.baseMoment     = #(ly:make-moment 1 4)
%  \set Timing.beatStructure  = 1,1,1
  \tempo "Vivace " 2=130
}

mifl = "english horn"
mikl = "french horn"
mist = "string ensemble 1"
%minstr = "accordion"
miba = "cello"
%miba = "electric bass (pick)"
%miba = "electric bass (finger)"
%milo = "drawbar organ"
milo = "harpsichord"

sest = \markup \italic "sempre staccato"

\include "v1.ily"
\include "v2.ily"
\include "v3.ily"
\include "v4.ily"

music = \new StaffGroup <<
      \new Staff {
	\set Staff.midiInstrument = \mikl
	\set Staff.instrumentName = \markup \center-column { "English" "horn" }
	\transpose f c { \va }
      }

      \new Staff {
	\set Staff.midiInstrument = \mikl
	\set Staff.instrumentName = \markup \center-column { "French" "horn" }
	\transpose f c { \vb }
      }

      \new Staff {
	\set Staff.midiInstrument = \mikl
	\set Staff.instrumentName = \markup \center-column { "Viola" }
	\transpose f f { \vc }
      }

      \new Staff {
	\set Staff.midiInstrument = \miba
	\set Staff.instrumentName = \markup \center-column { "Violon-" "cello" }
	\transpose f f { \vd }
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
