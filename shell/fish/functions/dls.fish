# Defined in - @ line 1
function dls --wraps='docker container ls -a' --description 'alias dls docker container ls -a'
  docker container ls -a $argv;
end
