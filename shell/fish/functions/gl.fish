# Defined in - @ line 1
function gl --wraps='git log --all --graph --oneline --decorate' --wraps='git log --all --graph --oneline --decorate -n 10' --wraps='git log --all --graph --oneline --decorate -n 15' --description 'alias gl git log --all --graph --oneline --decorate -n 15'
  git log --all --graph --oneline --decorate -n 15 $argv;
end
