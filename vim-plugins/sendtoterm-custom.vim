" get all terminal windows
fun! s:get_terminal_windows()
    return map(filter(copy(getwininfo()), {k,v -> getbufvar(v.bufnr, '&buftype') == 'terminal'}), 'v:val')
endfu

fu! SendToTerm(...)
    " select terminal window
    let term_window = s:get_terminal_windows()[0].winnr

    " copy text (current line)
    silent exe 'normal! "ayy'

    " copied text
    let text = @a

    " send to terminal
    if has("nvim")
        " with nvim, the easiest way is to send the text to the terminal "job"
        " with ´jobsend´
        exe term_window . " wincmd w"
        let term_id = b:terminal_job_id
        wincmd p

        call jobsend(term_id, text)
    else
        call term_sendkeys(winbufnr(term_window), text)
    endif
endfu
