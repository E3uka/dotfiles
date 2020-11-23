# Defined in - @ line 1
function dcls --wraps='docker container ls -a' --description 'alias dcls docker container ls -a'
  docker container ls -a $argv;
end
