\version "2.24.0"
\include "deutsch.ly"

#(define (find-lowest-pitch smmusic)
   (define (compare-pitches a b)
     (if (ly:pitch<? (ly:event-property a 'pitch) (ly:event-property b 'pitch))
         a
         b))
   (let ((notes (ly:music-property smmusic 'elements)))
     (fold compare-pitches (car notes) (cdr notes))))

#(define (display-lowest-pitch smmusic)
   (let ((lowest (find-lowest-pitch smmusic)))
     (if lowest
         (format #t "Lowest pitch: ~a\n" (ly:event-property lowest 'pitch))
         (format #t "No pitches found\n"))))

#(set-global-staff-size 17)

\header {
  title     = \markup \bold \italic "Sonata Prima in C-Dur"
  composer  = "Pierre Hyacinthe Azaïs"
  arranger  = "(1741-1796)"
  enteredby = "cellist (2022-04-12)"
  piece     = "12 Cello Sonaten, Nr. 1"
}

voiceconsts = {
  \key c \major
  \time 4/4
  \clef "treble"
%  \numericTimeSignature
%  \compressEmptyMeasures
  % Set default beaming for all staves
%  \set Timing.beamExceptions = #'()
%  \set Timing.baseMoment     = #(ly:make-moment 1 4)
%  \set Timing.beatStructure  = #'(1 1 1)
}

micl = "clarinet"
mifl = "flute"
miob = "oboe"
mifh = "french horn"
misx = "tenor sax"
mist = "string ensemble 1"
mivl = "violin"
miba = "cello"


trio = \mark \markup \box \italic "Trio"

introa = {        \tempo "1. Allegro "           4=110 }
introb = { \break \tempo "2. Tempo di Minuetto " 4=100 \time 3/4 }
introc = { \break \tempo "3. Allegro "           4=130 \time 4/4 }

\include "v1.ily"
\include "v2.ily"


\display-lowest-pitch \music

music = \new StaffGroup <<
      \new Staff {
	\set Staff.midiInstrument = \miob
	\set Staff.instrumentName = \markup \center-column { "English" "Horn"}
	\transpose c g' { \displayLilyMusic \va }
      }

      \new Staff {
	\set Staff.midiInstrument = \mifh
	\set Staff.instrumentName = \markup \center-column { "French" "Horn" }
	\transpose c g' { \displayLilyMusic \vb }
      }
>>

\book {
   \paper {
    print-page-number = ##t
    print-first-page-number = ##t
    ragged-last-bottom = ##f
    oddHeaderMarkup = \markup \null
    evenHeaderMarkup = \markup \null
    oddFooterMarkup = \markup {
      \fill-line {
        \if \should-print-page-number
        "Pierre Hyacinthe Azaïs - Sonata Prima in C-Dur" \fromproperty #'page:page-number-string
      }
    }
    evenFooterMarkup = \oddFooterMarkup
  } \score {
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

