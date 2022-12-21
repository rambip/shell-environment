fun! s:get_terminal_windows()
    return map(filter(copy(getwininfo()), {k,v -> getbufvar(v.bufnr, '&buftype') == 'terminal'}), 'v:val')
endfu


if has("nvim")
    fu! SendToTerm(...)
        " select terminal window
        let term_window = s:get_terminal_windows()[0].winnr

        " copy text (current line)
        silent exe 'normal! "ayy'

        " copied text
        let text = @a
        text .= "\n"

        " send to terminal
        call term_sendkeys(winbufnr(term_window+0), text)
    endfu
else
    fu! SendToTerm(...)
        " select terminal window
        let term_window = s:get_terminal_windows()[0].winnr

        " copy text (current line)
        silent exe 'normal! "ayy'

        " copied text
        let text = @a

        " send to terminal
        call term_sendkeys(winbufnr(term_window+0), text)
    endfu
endif

