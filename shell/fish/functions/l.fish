# Defined in - @ line 1
function l --wraps='ls -CF' --wraps='ls -CFA' --description 'alias l ls -CFA'
  ls -CFA $argv;
end
