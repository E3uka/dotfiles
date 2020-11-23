# Defined in - @ line 1
function dip --wraps='docker image prune' --description 'alias dip docker image prune'
  docker image prune $argv;
end
