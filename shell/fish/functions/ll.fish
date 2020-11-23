# Defined in - @ line 1
function ll --wraps='ls -alhF' --description 'alias ll ls -alhF'
  ls -alhF $argv;
end
