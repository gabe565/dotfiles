function fish_prompt --description 'Write out the prompt'
   printf '%s%s %s%s %s> ' (set_color green) (whoami) (set_color blue) (prompt_pwd) (set_color yellow)
end
