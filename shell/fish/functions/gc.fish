# Defined in - @ line 1
function gc --wraps='git checkout' --description 'alias gc git checkout'
  git checkout $argv;
end
