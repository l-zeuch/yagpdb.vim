" File for snippet-logic related functions.

" Copyright (C) 2021   Lucas Ritzdorf

" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation; either version 2 of the License, or
" (at your option) any later version.

" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.

" You should have received a copy of the GNU General Public License along
" with this program; if not, write to the Free Software Foundation, Inc.,
" 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

" don't spam the user when Vim is started in Vi compat
let s:cpo_save = &cpoptions
set cpoptions&vim

function! yagpdbcc#snippets#UltiSnips() abort
    if get(g:, 'did_plugin_ultisnip') isnot 1
        return
    endif

    if !exists('g:UltiSnipsSnippetDirectories')
        let g:UltiSnipsSnippetDirectories = ['snippets/UltiSnips']
    else
        let g:UltiSnipsSnippetDirectories += ['snippets/UltiSnips']
    endif
endfunction

function! yagpdbcc#snippets#Neosnippet() abort
    if get(g:, 'loaded_neosnippet') isnot 1
        return
    endif

    let g:neosnippet#enable_snipmate_compatibility = 1

    let l:yag_snip_dir = globpath(&runtimepath, 'snippets/neosnippet')
    if type(g:neosnippet#snippets_directory) == type([])
        let g:neosnippet#snippets_directory += [l:yag_snip_dir]
    elseif type(g:neosnippet#snippets_directory) == type('')
        if strlen(g:neosnippet#snippets_directory) > 0
            let g:neosnippet#snippets_directory =
                        \ g:neosnippet#snippets_directory . ',' . l:yag_snip_dir
        endif
    else
        let g:neosnippet#snippets_directory = l:yag_snip_dir
    endif
endfunction

" Restore Vi compat
let &cpoptions = s:cpo_save
unlet s:cpo_save
