# Defined in - @ line 1
function dstatus --wraps='sudo service docker status' --description 'alias dstatus sudo service docker status'
  sudo service docker status $argv;
end
