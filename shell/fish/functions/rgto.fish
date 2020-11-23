# Defined in - @ line 1
function rgto --wraps='rg -i todo --trim' --description 'alias rgto rg -i todo --trim'
  rg -i todo --trim $argv;
end
