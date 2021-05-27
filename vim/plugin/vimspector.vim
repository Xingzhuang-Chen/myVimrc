" ===
" === vimspector
" ===
let g:vimspector_enable_mappings = 'HUMAN'
" function! s:read_template_into_buffer(template)
" 	" has to be a function to avoid the extra space fzf#run insers otherwise
" 	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
" endfunction
" command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
" 			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
" 			\   'down': 20,
" 			\   'sink': function('<sid>read_template_into_buffer')
" 			\ })
" noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
" sign define vimspectorBP text=☛ texthl=Normal
" sign define vimspectorBPDisabled text=☞ texthl=Normal
" sign define vimspectorPC text=�� texthl=SpellBad

let g:vimspector_sign_priority = {
  \    'vimspectorBP':         999,
  \    'vimspectorBPCond':     999,
  \    'vimspectorBPDisabled': 999,
  \    'vimspectorPC':         999,
  \ }


" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

" for normal mode - the word under the cursor
" nnoremap <silent> <Leader>dp <Plug>VimspectorBalloonEval
nnoremap <silent> <Leader>dp
      \ :<c-u>call vimspector#ShowEvalBalloon( 0 )<CR>
" for visual mode, the visually selected text
" xnoremap <silent> <Leader>dp <Plug>VimspectorBalloonEval
xnoremap <silent> <Leader>dp
      \ :<c-u>call vimspector#ShowEvalBalloon( 1 )<CR>

" 关闭调试
nnoremap <F2> :VimspectorReset<cr>

" watch
nnoremap <Leader>dw :VimspectorWatch 
" Eval
nnoremap <Leader>de :VimspectorEval 

sign define vimspectorPC         text=\  texthl=MatchParen linehl=CursorLine
sign define vimspectorPCBP       text=\  texthl=MatchParen linehl=CursorLine
