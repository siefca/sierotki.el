;;; sierotki.el --- Introduce tildes after single-letter words

;; Copyright (C) 1999-2003  Micha� Jankowski, Jakub Nar�bski

;; Author: 	Ryszard Kubiak   <rysiek@ipipan.gda.pl>
;;		Micha� Jankowski <michalj@fuw.edu.pl>
;;		Jakub Nar�bski   <jnareb@fuw.edu.pl>
;; Maintainer: 	Jakub Nar�bski <jnareb@fuw.edu.pl>
;; Version: 	2.6.1
;; RCS version:	$Revision$
;; Date: 	$Date$
;; Keywords: 	TeX, wp, convenience
;; Created: 	03-11-1999
;; URL: 	http://www.fuw.edu.pl/~jnareb/sierotki.el
;;
;; Compatibility:   Emacs21, XEmacs21
;; Incompatibility:

;; $Id$

;;{{{ GPL

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of
;; the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.

;; You should have received a copy of the GNU General Public
;; License along with this program; if not, write to the Free
;; Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
;; MA 02111-1307 USA

;;}}}

;;; Installation:

;; To use this package, put the following line in your .emacs:
;;
;;    (require 'sierotki)
;;
;; If you do not want to load this package before it is necessary, you 
;; can make use of the `autoload' feature, e.g. adding to your .emacs 
;; the following lines
;;
;;    (autoload 'tex-magic-space-mode "sierotki"
;;              "TeX Magic Space minor mode" t)
;;    (define-key mode-specific-map " " 'tex-magic-space-mode)
;;
;; Then after turning on `tex-magic-space-mode' via `C-c SPC' 
;; the whole package will be loaded.  Attention: using autoload means
;; that this mode _won't_ be turned on automatically in LaTeX modes.

;;; Installation[pl]:

;; Aby u�y� tego pakietu, umie�� nast�puj�c� linijk� w swoim pliku .emacs
;;
;;    (require 'sierotki)
;;
;; Je�li nie chcesz go �adowa� zanim nie b�dzie potrzebny, mo�esz u�y�
;; �adowania na ��danie, np. dodaj�c do .emacs nast�puj�ce linie
;;
;;    (autoload 'tex-magic-space-mode "sierotki"
;;              "TeX Magic Space minor mode" t)
;;    (define-key mode-specific-map " " 'tex-magic-space-mode)
;;
;; W�wczas po wci�ni�ciu `C-c SPC' zostanie w��czony TeX Magic Space mode
;; i zostanie za�adowana reszta funkcji.  Uwaga: przy u�ywaniu
;; automatycznego �adowania ten tryb _nie_ b�dzie automatycznie w��czany
;; w trybach LaTeX-owych.


;;; Commentary:

;; The purpose of this package is to connect some defined words (by default
;; one letter Polish prepositions) with the following words by tilde, which
;; is the non-breakable space in TeX.  This is needed to avoid one letter
;; prepositions at line endings in TeX documents, which is required by
;; the Polish and Czech ortography/typography rules.
;;
;; This program serves two purposes.  First of them is to check the text
;; and suggest adding missing tildes in some places.  This function is
;; implemented in `tex-hard-spaces' via `query-replace-regexp'.  It is
;; provided for convenience only to have both functionalities in the
;; same module.  More elaborated implementation can be found in the
;; `tildify' package which is part of GNU Emacs (ATTENTION: default
;; variable settings in the tildify package are suited for Czech
;; language, those here are for Polish).
;;
;; The second purpose is the automatic, in-the-fly insertion of tildes
;; after one letter prepositions during writing.  It is implemented
;; via the `tex-magic-space' command which is a kind of electric space
;; and should be bound to SPC to work.  To activate this functionality
;; you have to turn on `tex-magic-space-mode'.  The minor mode TeX Magic
;; Space can be turned on from the modeline minor mode menu.  This mode
;; is denoted by " ~" in the modeline.
;;
;; The TeX Magic Space mode is automatically turned on in the TeX modes
;; by adding the equivalent of `turn-on-tex-magic-space-mode' to the
;; hooks defined in the variable `tex-magic-space-mode-hooks-list'.

;; Documentation and comments: Jakub Nar�bski.

;;; Commentary[pl]:

;; Ten pakiet s�u�y do dowi�zywania zdefiniowanych wyraz�w (domy�lnie
;; jednoliterowych sp�jnik�w) do nast�puj�cych po nich s��w za pomoc� znaku
;; `~' (tyldy), nie�amliwej spacji TeX-owej.  S�u�y to temu, aby w
;; dokumentach TeX-owych unikn�� jednoliterowych sp�jnik�w na ko�cach linii,
;; co jest wymagane przez polskie (i czeskie) regu�y typograficzne.
;;
;; Pakiet ten dostarcza dwu funkcjonalno�ci.  Pierwsz� z nich jest
;; sprawdzenie (istniej�cego) tekstu i zasugerowanie dodania brakuj�cych
;; tyld.  Jest ona implementowana przez komend� `tex-hard-spaces', za pomoc�
;; `query-replace-regexp'.  T� sam� (a nawet rozszerzon�) funkcjonalno��
;; znale�� mo�na w pakiecie `tildify' (UWAGA: domy�lne ustawienia w tym
;; pakiecie s� dostosowane do j�zyka czeskiego).
;;
;; Drug� z funkcjonalno�ci jest automatyczne wpisywanie tyld po
;; jednoliterowych sp�jnikach podczas pisania tekstu (w locie).  Jest ona
;; implementowana przez komend� `tex-magic-space', kt�r� nale�y podpi�� do
;; spacji.  Do aktywowania tej funkcjonalno�ci nale�y w��czy�
;; `tex-magic-space-mode'.  Tryb (minor mode) TeX Magic Space mo�na
;; aktualnie w��czy� tak�e z modeline minor mode menu; jest on oznaczany za
;; pomoc� " ~".  Ewentualne dodatkowe oznaczenia po " ~" informuj�, ze
;; porady s� aktywne i pokazuj� kt�re porady s� w��czone.
;;
;; Funkcjonalno�� ta jest automatycznie w��czana w trybach TeX-owych
;; za pomoc� dodania odpowiednika `turn-on-tex-magic-space-mode' do
;; odpowiednich haczyk�w (zdefiniowanych w zmiennej
;; `tex-magic-space-mode-hooks-list') za pomoc� `add-hook'.

;; Dokumentacja i komentarze: Jakub Nar�bski.


;;; Notes:

;; Turning on and activation the `tex-magic-space-texmathp' advice or its
;; equivalent (with the standard configuration for `texmathp') makes
;; `tex-magic-space' around 10 times slower
;; (measured using "elp" package).

;;; Notes[pl]:

;; W��czanie i aktywacja porady `tex-magic-space-texmathp', lub jej
;; odpowiednika (ze standardowymi warto�ciami zmiennych dla `texmathp')
;; powoduje oko�o 10-krotne zwolnienie dzia�ania `tex-magic-space'
;; (zmierzono za pomoca pakietu "elp").


;;; To do[pl]:

;; TO DO: Ulepszy� wyra�enie regularne b�d� da� do wyboru wersj� prost�
;; (i szybk�) lub skomplikowan� (i mog�c� wi�cej).  By� mo�e wyra�enie
;; regularne powinno by� "sk�adane" z kilku: definiuj�cego granic� s�owa z
;; lewej strony, definiuj�cego jednoliterowe sp�jniki, definiuj�cego inne
;; wyrazy po kt�rych stawiamy nie�amliw� spacj�, definiuj�cego dowi�zanie z
;; prawej strony t.j. co� jak "\\'", definiuj�cego jakie znaki zamieniamy na
;; pojedyncz� nie�amliw� spacj� (granic� s�owa z prawej).
;;
;; TO DO: Osobna porada (domy�lnie wy��czona) sprawdzaj�ca czy jeste�my w
;; komentarzu u�ywaj�c kodu jak w `comment-beginning', t.j. sprawdzaj�c czy
;; u�ywamy `font-lock-comment-face' i ewentualnie szukaj�c znaku komentarza
;; `%' w bie��cej linii na lewo od bie��cej pozycji (`point').
;;
;; TO DO: Zgadywanie, czy nale�y w��czy� TeX Magic Space mode (czy w inny
;; spos�b uaktywni� magiczn� spacj�) na podstawie nag��wka pliku TeX-owego.
;;
;; TO DO: U�y� `defcustom' do zdefiniowania zmiennych (via `customize').
;;
;; TO DO: Doda� tex-magic-space-regexp-len zamiast 2 (np. dowi�zywanie 'tys.')
;;        do `tex-magic-space'.
;;
;; TO DO: Doda� `tex-magic-space-checking-why' (a la `texmathp-why'), kt�re
;;        b�dzie podawa�o dlaczego magiczna spacja jest nieaktywna.
;;
;; Ponadto dokumentacja po angielsku (zw�aszcza docstrings) wymaga poprawienia.
;;
;; Zawarto�� "History:" nie jest kompletna.


;;; History:

;; There is no "History:" section in English because all references 
;; are in Polish.

;;; History[pl]:

;; Kod `tex-hard-spaces' pojawi� si� po raz pierwszy w:
;;
;; From: rysiek@IPIPAN.GDA.PL (Ryszard Kubiak)
;; Newsgroups: pl.comp.dtp.tex.gust
;; Subject: Re: tylda do samotnych
;; Date: 25 Oct 1999 21:12:54 GMT
;;
;; Wpisywanie tyld "w locie", tzn `tex-magic-space' pojawi�o si� w:
;;
;; From: Michal Jankowski <michalj@fuw.edu.pl>
;; Newsgroups: pl.comp.dtp.tex
;; Subject: Dowiazywanie samotnich literek do nastepnego slowa.
;; Date: 03 Nov 1999 12:45:22 +0100
;;
;; Nast�pnie wyra�enia regularne w obu funkcjach by�y sukcesywnie
;; poprawiane.  W wyniku do�wiadcze� z u�ywania `tex-magic-space' przy
;; pisaniu tekst�w z du�� ilo�ci� matematyki zosta�o napisane
;; `tex-toggle-magic-space'.  Nast�pnie zosta� zg�oszony b��d w wyra�eniu
;; regularnym w `tex-magic-space', a w wyniku dyskusji powsta�a obecna
;; wersja `tex-magic-space', u�ywaj�ca zmiennej `last-command-char'
;; i funkcji `self-insert-command'
;;
;; From: Michal Jankowski <Michal.Jankowski@fuw.edu.pl>
;; Subject: Re: Test sierotek
;; Date: 30 Oct 2001 13:02:16 +0100
;;
;; W wyniku por�wnania z inn� implementacj� magicznej spacji (`spacja')
;; z artyku�u "GNU Emacs Lisp" rzyjontka na debian.otwarte.pl
;; http://debian.otwarte.pl/article.php?aid=39
;; (w szczeg�lno�ci innego jej zachowania) powsta�o pytanie o to, jakie
;; w�asno�ci powinno mie� `tex-magic-space'
;;
;; From: "Jakub Nar�bski" <jnareb@fuw.edu.pl>
;; Subject: RFC: sierotki.el
;; Newsgroups: pl.comp.dtp.tex
;; Date: 14 Nov 2002 14:13:26 GMT
;;
;; Dyskusja trwa...


;;; Change Log:

;; Version 2.3 (RCS revision 1.12):
;; * TeX Magic Space minor mode (bound to `C-c SPC')
;; Version 2.4 (RCS revision 1.22):
;; * Added checking if the `tex-magic-space' should be active or not
;;   (e.g. it should be inactive in math mode detected using `texmathp').
;;   It was implemented using advices.
;; Version 2.6 (RCS revision 1.31):
;; * Checking if `tex-magic-space' should be active changed from 
;;   the around advice(s) to the conditional in main function.

;;; Change Log[pl]:

;; Wersja 2.3 (RCS revision 1.12):
;; * Pojawi� si� TeX Magic Space minor mode (przypisany do `C-c SPC').
;; Wersja 2.4 (RCS revision 1.22):
;; * Dodane porady i polecenie do ich w��czana (przypisane do `C-c @'), aby
;;   `tex-magic-space' pozostawa�a nieaktywna tam gdzie nie trzeba (np.
;;   w trybie matematycznym wykrywanym za pomoc� `texmathp').
;; Wersja 2.6 (RCS revision 1.31):
;; * Sprawdzania czy `tex-magic-space' powinno by� nieaktywne zosta�o
;;   przepisane za pomoc� instrukcji warunkowej w g��wnej funkcji zamiast
;;   u�ywania do tego porad (advice).

;;; Code:


;;;; ======================================================================
;;;; Add non-breakable spaces in existing document, interactively.
;;;; Usuwanie sierotek w istniej�cym dokumencie, interaktywne.

;;; Hard spaces by Ryszard Kubiak <rysiek@ipipan.gda.pl>
;;; Modified by Jakub Nar�bski <jnareb@fuw.edu.pl>

;; Zast�puje znaki odst�pu przez znaki tyldy `~', czyli TeX-ow� nie�amliw�
;; spacj�, po jednoliterowych [polskich] sp�jnikach w ca�ym buforze.
;; Poni�sza zmienna definiuje wyra�enie regularne u�ywane w `tex-hard-spaces'
(defvar tex-hard-spaces-regexp "\\<\\([aeiouwzAEIOUWZ]\\)\\s +"
  "*Regular expression which detects single [aeiouwz] for `tex-hard-spaces'.
The part of regular expression which matches string to be saved
should be in parentheses, so the replace part \\\\1~ will work.

Used as first argument to `query-replace-regexp'.")

;; Zwyk�e `query-replace-regexp', czyli C-M-% dla odpowiedniego
;; wyra�enia regularnego, zapisanego w `tex-hard-spaces-regexp'
(defun tex-hard-spaces ()
  "Replace whitespace characters after single-letter word with `~'.
Replaces whitespace characters following single-letter conjunctions by `~',
the TeX non-breakable space in whole buffer, interactively.
Uses `tex-hard-spaces-regexp' for single-letter conjunctions detection.

It can be used to bind single-letter conjunction to the word following it in
the existing text, using `~' (the TeX non-breakable space), so there are no
single-letter conjunctions at the end of the line (known as 'orphans').

For on-the-fly 'tildification' turn on TeX Magic Space minor mode using
command \\[tex-magic-space-mode].

It is implemented using `query-replace-regexp'."
 (interactive)
 (query-replace-regexp tex-hard-spaces-regexp
                       "\\1~"))


;;;; ======================================================================
;;;; On-the-fly inserting of non-breakable spaces.
;;;; Zapobieganie powstawaniu sierotek 'w locie'

;;; Magic space by Michal Jankowski <michalj@fuw.edu.pl>
;;; Modified by Jakub Nar�bski <jnareb@fuw.edu.pl>


;;; ----------------------------------------------------------------------
;;; Tests for `tex-magic-space'
;;; Testy dla `tex-magic-space'

(defun texinverbp ()
  "Determine if point is inside LaTeX \\verb command.
Returns nil or the pair (POINT-VERB-BEG . POINT-VERB-END) of positions where
\\verb argument begins and ends or the position POINT-VERB-BEG where \\verb
command argument begins if \\verb is unfinished (has no closing delimiter).

This command uses the fact that the argument to \\verb cannot contain end of
line characters.  Does not work with nested \\verb s."
  (interactive)
  (let ((point (point))
	beg
	end
	delim)
  (save-excursion
    (and (setq beg (and (re-search-backward "\\\\verb\\*?\\([^a-zA-Z*\\n]\\)"
					   (line-beginning-position) t)
		       (match-end 0)))
	 (setq delim (regexp-quote (match-string-no-properties 1)))
	 (goto-char beg)
	 ;;(or (insert "!") t)
	 (setq end (and (skip-chars-forward (concat "^" delim)
					    (line-end-position))
			(point)))
	 (or (eolp)
	     (looking-at (concat "[" delim "]")))
	 ;;(or (insert "!") t)
	 (cond ((>= point end) nil)
	       ((eolp) beg)
	       (t (cons beg end)))))))

;;; ......................................................................
;;; Turning on tests for tex-magic-space
;;; Aktywacja sprawdzania/test�w dla tex-magic-space i podobne
(defvar tex-magic-space-do-checking nil
  "Non-nil if `tex-magic-space' checks `tex-magic-space-tests'.

Set by `tex-magic-space-toggle-checking'")

(defvar tex-magic-space-tests 
  (list
   'texinverbp
   (if (fboundp 'texmathp) 'texmathp))
  "List of functions which are invoked, in order, to determine whether
`tex-magic-space' could insert a ~ (i.e., a tex non-breakable
space).  The tilde can be inserted only when every function returns
a nil value")


;;; ----------------------------------------------------------------------
;;; On-the-fly tildes insertion
;;; Wstawianie tyld w locie

;; UWAGA: [czasami] polskie literki s� traktowane jako koniec s�owa dla 8bit
;;        tzn. przy u�yciu `standard-display-european' do ich wprowadzania.
;;        B�d� pr�bowac znale�� dok�adne warunki wyst�pienia b�edu.
(defvar tex-magic-space-regexp "\\<[aeiouwzAEIOUWZ]\\'"
  "*Regular expression which detects single [aeiouwz] for `tex-magic-space'.
`tex-magic-space' inserts `~' if this expression matches two characters before
point, otherwise it inserts the key it is bound to (\\[tex-magic-space]),
usually SPC.

This regular expression should end with [aeiouwzAEIOUWZ]\\\\' to match possible
single letter conjunction against the letter directly before the point.  The
part before [aeiouwzAEIOUWZ] should match word beginning/boundary.

ATTENTION: sometimes in unibyte mode the non US-ASCII letters are considered
word boundary, even when they are word constituents.")


(defun tex-magic-space (&optional prefix)
  "Magic-space - insert non-breakable space after a single-letter word.
Interactively, PREFIX is the prefix arg (default 1).
Uses `tex-magic-space-regexp' for single-letter words detection.

Works well with auto filling unless `~' is in the table `auto-fill-chars',
in which case `~' is inserted but might be followed by line break.
Works with abbrev expansion with the following exceptions:
 - doesn't do abbrev expansion if abbrev is single letter word
   and `~' is word constituent (according to current syntax table)
 - abbrevs ending with single-letter word will have `~' instead of space
   after the expansion
 - abbrevs with expansion ending with single-letter word won't have
   the SPC following single-letter word substituted with `~'

Should not be used directly.

To use it turn on TeX Magic Space minor mode using command
`tex-magic-space-mode' (\\[tex-magic-space-mode]).

See also: `tex-hard-spaces'"
  (interactive "p")	               ; Prefix arg jako liczba.  Nie robi I/O.
  ;; Tests
  (unless (and tex-magic-space-do-checking
	       (some (lambda (f) (funcall f prefix)) tex-magic-space-tests))
    ;; tests failed
    (when (string-match
	   tex-magic-space-regexp      ; wyra�enie rozpoznaj�ce samotne sp�jniki
	   (buffer-substring (max (point-min) (- (point) 2)) (point)))
      (setq last-command-char ?~)))    ; wstawiamy `~' zamiast SPC
  (self-insert-command (or prefix 1))) ; daje obs�ug� auto-fill, abbrev, blinkin-paren

(defun debug-tex-magic-space (&optional prefix)
  "Version of `tex-magic-space' which does'n do any testing."
  (interactive "p")
  (let ((tex-magic-space-do-checking nil))
    (tex-magic-space prefix)))


;;; ----------------------------------------------------------------------
;;; The TeX Magic Space mode definition and initialization
;;; Definicja trybu i inicjalizacja


(defvar tex-magic-space-mode nil
  "*Determines if TeX Magic Space mode is active.
You can set it directly or use the command `tex-magic-space-mode'.")
(make-variable-buffer-local 'tex-magic-space-mode)

(defvar tex-magic-space-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map " " 'tex-magic-space)
    (define-key map [?\C-c ?\C- ] 'tex-magic-space-toggle-checking)
    map)
  "Keymap for TeX Magic Space mode.")

;;;###autoload
(defun turn-on-tex-magic-space-mode ()
  "Turn on TeX Magic Space mode."
  (tex-magic-space-mode t))

;;;###autoload
(defun tex-magic-space-mode (&optional arg)
  "Toggle TeX Magic Space mode.
With prefix argument ARG, turn on if positive, otherwise off.
Returns non-nil if the new state is enabled.
\\<tex-magic-space-mode-map>
In this minor mode `\\[tex-magic-space]' runs the command `tex-magic-space'."
  (interactive "P")
  (setq tex-magic-space-mode
	(if (null arg) (not tex-magic-space-mode)
	  (> (prefix-numeric-value arg) 0)))
  ;; alternative, less clear and slower
;;;  (setq tex-magic-space-mode
;;;	(not (or (and (null arg) tex-magic-space-mode)
;;;		 (<= (prefix-numeric-value arg) 0))))
  ;; uaktualnij modeline
  ;; IDEA: mo�na by doda� informowanie o w(y)��czeniu tego trybu
  (force-mode-line-update))


(defun tex-magic-space-toggle-checking (&optional arg)
  "Toggle whether `tex-magic-space' checks `tex-magic-space-tests'.
With prefix argument ARG, activate checking if ARG is positive,
otherwise deactivate it.

Sets `tex-magic-space-do-checking'."
  (interactive "P")
  (setq tex-magic-space-do-checking
	(if (null arg) (not tex-magic-space-checking-string)
	  (> (prefix-numeric-value arg) 0)))
  (if tex-magic-space-mode
      (force-mode-line-update)
    (message "Checking tests for tex-magic-space %sctivated."
	     (if tex-magic-space-do-checking "a" "dea"))))


;;; NOTES:
;;; * "Hide ifdef" mode z hideif.el u�ywa "pseudotrybu" `hide-ifdef-hiding' do
;;;   wy�wietlania opcjonalnego " Hiding", tzn. dodaje do `minor-mode-alist'
;;;   (hide-ifdef-hiding . " Hiding") opr�cz (hide-ifdef-mode . " Ifdef").
;;; * "CC Mode" analogicznie, dodaje (c-auto-hungry-string
;;;   . c-auto-hungry-string), gdzie c-auto-hungry-string to odpowiednio "/ah"
;;;   lub analogiczne; automagicznie si� zmienia.
;;; * elementami `minor-mode-alist' powinny by� pary (VARIABLE STRING), gdzie
;;;   STRING to mo�e by� (patrz `mode-line-format'):
;;;   - STRING, u�yty jak jest, z wykorzystaniem %-sth
;;;   - SYMBOL, u�yta jest jego warto�� (je�li r�na od t lub nil); %-sth
;;;     nie s� rozpoznawane gdy warto�ci� jest string
;;;   - (:eval FORM), FORM jest obliczana i umieszczany wynik (Emacs 21)
;;;   - (STRING REST...), (LIST REST...), oblicz rekurencyjnie i po��cz wyniki
;;;   - (SYMBOL THEN ELSE) lub (SYMBOL THEN), np. u�ycie `minor-mode-alist'
;;;   - (WIDTH REST...), dope�nione WIDTH spacjami je�li WIDTH > 0, skr�cony
;;;     do -WIDTH kolumn je�li WIDTH < 0; przyk�ad: (-3 "%p"), procent pliku
;;; * wi�kszo�� tryb�w "r�cznie" dodaje si� do modeline...

;;; 'Zarejestrowanie' trybu; na podstawie kodu z reftex.el
(if (fboundp 'add-minor-mode)
    ;; Je�li dost�pna jest funkcja `add-minor-mode' (w FSF Emacs jest to funkcja
    ;; kompatybilno�ci z XEmacsem, zdefiniowana w `subr'), to u�yj jej aby
    ;; uzyska� ekstra funkcjonalno��, tzn. wpis do minor mode menu w modeline.
    (progn
      ;; W�asno�� (property) :included ustala, czy dany trub jest widoczny w
      ;; minor mode menu w modeline.  Teoretycznie podana warto�� powinna
      ;; spowodowa� wpisanie do menu tylko dla podanych tryb�w; w FSF Emacs 21.2-7
      ;; jednak�e w�asno�� ta jest sprawdzana tylko przy wykonywaniu
      ;; `add-minor-mode'; w XEmacs 21.4.6-7 nie jest w og�le sprawdzana
      (put 'tex-magic-space-mode :included '(memq major-mode '(latex-mode
							       tex-mode)))
      ;; W�asno�� (property) :menu-tag podaje tekst pojawiaj�cy si� w minor mode
      ;; menu w modeline; w XEmacs 21.4.6-7 nie daje �adnego efektu, w minor
      ;; mode menu s� wszystkie minor mode, ten tryb jako "tex-magic-space-mode"
      ;; IDEA: mo�na by doda� do 'tex-magic-space-mode w�asno��
      ;; `menu-enable'; i tak (nie wiem dlaczego) nie dzia�a; mo�e FORM nie eval?
;;;   (put 'tex-magic-space-mode 'menu-enable '(memq major-mode '(latex-mode
;;;						                  tex-mode)))
      ;; je�li `add-minor-mode' u�ywa `menu-item' to u�y� w�asno�ci :visible
      ;; FORM lub :included FORM, :key-sequence KEY (aby przyspieszy� �adowanie)
      ;; NOTE: `add-minor-mode' u�ywa (define-key mode-line-menu... :button ...)
      (put 'tex-magic-space-mode :menu-tag "TeX Magic Space")
      ;; IDEA: tutaj mo�na by doda� za pomoc� funkcji `propertize' dodatkowe
      ;; w�asno�ci typu :help-echo, :local-map, :display czy :face
      (add-minor-mode 'tex-magic-space-mode
		      (list " ~" '(tex-magic-space-do-checking ":Chk"))
		      tex-magic-space-mode-map))
  ;; Standardowy spos�b dodania minor mode, za "Emacs Lisp Reference Manual"
;;;(define-key mode-line-mode-menu
;;; (vector 'tex-magic-space-mode)
;;; ;; mo�na by u�y� ` do "cytowania" (quote) tylko cz�ci
;;; (list 'menu-item "TeX Magic Space"
;;;		'tex-magic-space-mode
;;;		:visible '(memq major-mode '(latex-mode tex-mode))
;;;		:button   (cons :toggle tex-magic-space-mode)))
  (unless (assq 'tex-magic-space-mode minor-mode-alist)
    (setq minor-mode-alist
	  (cons '(tex-magic-space-mode (" ~" (tex-magic-space-checking-string
					      tex-magic-space-checking-string)))
		;; (propertize " ~"
		;;	       'local-map mode-line-minor-mode-keymap
		;;	       'help-echo "mouse-3: minor mode menu")
		minor-mode-alist)))
  (unless (assq 'tex-magic-space-mode-map minor-mode-map-alist)
    (setq minor-mode-map-alist
	  (cons (cons 'tex-magic-space-mode tex-magic-space-mode-map)
		minor-mode-map-alist))))


;;;; ======================================================================
;;;; Inicjalizacja dla zapobiegania powstawaniu sierotek 'w locie'

;;; Initialization by Jakub Nar�bski <jnareb@fuw.edu.pl>
;;; and Adam Przepi�rkowski <adamp_at@at_ipipan.waw.pl>

;; Przypisz globalnie `tex-magic-space-mode' do `C-c SPC'
;; `mode-specific-map' to (globalna) mapa klawiatury dla prefiksu C-c
;; IDEA: `tex-magic-space-toggle-checking' mo�e by� w mapie dla TeX Magic
;; Space mode, tzn. w `tex-magic-space-mode-map'; jako prefiksu mo�na by
;; u�y� `C-c C-SPC', a jako klawiszy " ", "m", "f", "u".
(define-key mode-specific-map " " 'tex-magic-space-mode)
(define-key mode-specific-map "@" 'tex-magic-space-toggle-checking)
;; aby wpisa� 'C-SPC' trzeba u�y� wektora zamiast �a�cucha, t.j. [?\C- ]

;; TO DO: przepisa� to z powrotem na LaTeX-mode-hook, TeX-mode-hook,
;; reftex-mode-hook i tym podobne.  `define-key' dla odpowiedniej mapy
;; wystarczy zdefiniowa� raz w chwili gdy mapa jest dost�pna (za pomoc�
;; `eval-after-load') i domy�lnie w danym trybie we wszystkich buforach
;; `tex-magic-space' b�dzie w��czone lub nie.  `tex-magic-space-mode' (lub
;; ustawienie zmiennej) jest lokalne dla bufora (i takie powinno pozosta�),
;; wi�c nale�y doda� je do odpowiednich hak�w za pomoc� `add-hook' (uwaga:
;; jako argument pobiera on FUNCTION, a nie FORM!).

;; HAKI: reftex-mode-hook, reftex-load-hook (RefTeX), TeX-mode-hook,
;; LaTeX-mode-hook (AUCTeX, nieudokumentowane),
;; TeX-auto-prepare-hook/TeX-auto-cleanup-hook (AUCTeX), bibtex-mode-hook
;; (BibTeX), tex-mode-hook, plain-tex-mode-hook/latex-mode-hook (tex-mode);
;; uruchamia si� tak�e text-mode-hook (AUCTeX, tex-mode)

;; W��cz TeX Magic Space mode dla znanych tryb�w (La)TeX-owych
(defmacro tex-magic-space-mode-add-to-hook (hook)
  "Add `(setq 'tex-magic-space-mode t)' to HOOK."
  `(add-hook ,hook (function (lambda () (setq tex-magic-space-mode t)))))

(defmacro tex-magic-space-mode-initialize (hooks)
  "Add `(setq 'tex-magic-space-mode t)' to each of HOOKS."
  `(dolist (hook ,hooks)
     (tex-magic-space-mode-add-to-hook hook)))

(defvar tex-magic-space-mode-hooks-list
  '(TeX-mode-hook LaTeX-mode-hook 	; for AUCTeX
    tex-mode-hook			; for tex-mode
    reftex-mode-hook			; for RefTeX minor mode
    bibtex-mode-hook)			; for BibTeX
  "List of hooks to which add turning on TeX Magic Space minor mode.
You must set this using (setq tex-magic-space-mode-hooks-list VALUE) before
loading this file i.e. before (require 'sierotki).")

(tex-magic-space-mode-initialize tex-magic-space-mode-hooks-list)


^L
;;;; ======================================================================
;;;; Announce
;;;; Zako�czenie
;; Aby mo�na by�o �adowa� ten plik zar�wno za pomoc�
;; (load "sierotki") jak i (requires 'sierotki)

(provide 'sierotki)

;; Local variables:
;; coding: iso-latin-2
;; End:

;;; sierotki.el ends here
