# Defined in - @ line 1
function tkill --wraps='tmux kill-session -t ' --description 'alias tkill tmux kill-session -t '
  tmux kill-session -t  $argv;
end
