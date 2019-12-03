se (){du -a (dir) | awk '{print $3}' | fzf | xargs -r $EDITOR;}
sv (){vcopy "$(du -a (dir) | awk "{print $#}" | fzf )";}
vf(fzf | xargs -r -I % $EDITOR %;)
