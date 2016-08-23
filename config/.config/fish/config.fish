set fish_greeting ""

powerline-daemon -q
set fish_function_path $fish_function_path "/usr/lib/python3.5/site-packages/powerline/bindings/fish"
powerline-setup

if begin; status --is-interactive; and test "$COLORTERM" = gnome-terminal; end
    set -gx TERM xterm-256color
end

neofetch
