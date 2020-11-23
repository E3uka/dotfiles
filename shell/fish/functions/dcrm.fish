# Defined in - @ line 1
function dcrm --wraps='docker container rm -f' --description 'alias dcrm docker container rm -f'
  docker container rm -f $argv;
end
