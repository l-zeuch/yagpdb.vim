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

" commonly used extesions are: .go.tmpl .gotmpl .yag .yagpdb .yagcc .yagpdbcc
autocmd BufNewFile,BufRead *.go.tmpl,*.gotmpl setfiletype yagpdbcc
autocmd BufNewFile,BufRead *.yag,*.yagpdb,*.yagcc setfiletype yagpdbcc
autocmd BufNewFile,BufRead *.yag-cc,*.yagpdbcc *.yagpdb-cc setfiletype yagpdbcc
