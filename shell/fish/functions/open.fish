# Defined in - @ line 1
function open --wraps=wsl-open --description 'alias open wsl-open'
  wsl-open  $argv;
end
