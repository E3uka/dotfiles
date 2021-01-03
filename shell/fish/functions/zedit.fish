# Defined in - @ line 1
function zedit --wraps='z nvim && vi init.vim' --description 'alias zedit z nvim && vi init.vim'
  z nvim && vi init.vim $argv;
end
