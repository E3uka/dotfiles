# Defined in - @ line 1
function ta --wraps='tmux attach' --wraps='tmux attach -t' --description 'alias ta tmux attach -t'
  tmux attach -t $argv;
end
