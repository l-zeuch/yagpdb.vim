" File used to detect the filetype of extensions used for YAGPDB Custom
" Commands.

" Copyright (C) 2021    Lucas Ritzdorf, Luca Zeuch

" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation; either version 2 of the License, or
" (at your option) any later version.

" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
" GNU General Public License for more details.

" You should have received a copy of the GNU General Public License along
" with this program; if not, write to the Free Software Foundation, Inc.,
" 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

" vint: -ProhibitAutocmdWithNoGroup
" should not use augroups in ftdetect, see :help ftdetect
"
" [...] there is no "augroup" command, this has already been done when
" sourcing your file. You could also use the pattern "*" and then check the
" contents of the file to recognize it.


" Detect our 'own' extensions, which are usually used by a
" vast majority of the userbase.
au BufRead,BufNewFile   *.yag         setfiletype yagpdbcc
au BufRead,BufNewFile   *.yagpdb      setfiletype yagpdbcc
au BufRead,BufNewFile   *.yagcc       setfiletype yagpdbcc
au BufRead,BufNewFile   *.yag-cc      setfiletype yagpdbcc
au BufRead,BufNewFile   *.yagpdbcc    setfiletype yagpdbcc
au BufRead,BufNewFile   *.yagpdb-cc   setfiletype yagpdbcc

" Also use *.tmpl, *.gotmpl et al., which are originally only Go.
if get(g:, 'yagpdbcc_override_ft')
    " Here, we need to explicitly override the default "template" syntax for
    " .tmpl files:
    au BufRead,BufNewFile   *.tmpl    setlocal filetype=yagpdbcc
    au BufRead,BufNewFile   *.gotmpl  setfiletype yagpdbcc
endif
