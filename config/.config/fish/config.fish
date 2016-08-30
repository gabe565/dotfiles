set fish_greeting ""

if status --is-interactive
    powerline-daemon -q
    set fish_function_path $fish_function_path "/usr/lib/python3.5/site-packages/powerline/bindings/fish"
    powerline-setup

    neofetch
end
