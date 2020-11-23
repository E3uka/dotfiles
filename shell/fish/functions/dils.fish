# Defined in - @ line 1
function dils --wraps='docker image ls' --description 'alias dils docker image ls'
  docker image ls $argv;
end
