# Defined in - @ line 1
function dstop --wraps='sudo service docker stop' --description 'alias dstop sudo service docker stop'
  sudo service docker stop $argv;
end
