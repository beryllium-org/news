if [[ -n "$NEWS_SS_LOADED" ]]; then
    return
fi

export NEWS_SS_LOADED=1
export NEWS_SS_MAIN_PID=$$
export NEWS_SS_SHOULD_RUN=1

kill_timer() {
    if [[ -n "$NEWS_SS_PID" ]]; then
        kill "$NEWS_SS_PID" 2>/dev/null
        unset NEWS_SS_PID
    fi
}

reset_timer() {
    kill_timer
    (
        sleep 3
        kill -WINCH "$NEWS_SS_MAIN_PID"
        NEWS_SHOULD_RUN=0
    ) &
    NEWS_SS_PID=$!
    disown "$NEWS_SS_PID"
}

trigger_news_update() {
    if [[ "$NEWS_SS_SHOULD_RUN" == 1 ]]; then
        NEWS_SS_SHOULD_RUN=0
        beryllium-news -s
    fi
}

trap trigger_news_update SIGWINCH

prompt_hook() {
    NEWS_SS_SHOULD_RUN=1
}

PROMPT_COMMAND="prompt_hook;reset_timer;${PROMPT_COMMAND:-:}"
trap reset_timer DEBUG

reset_timer
