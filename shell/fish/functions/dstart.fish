# Defined in - @ line 1
function dstart --wraps='sudo service docker start' --description 'alias dstart sudo service docker start'
  sudo service docker start $argv;
end
