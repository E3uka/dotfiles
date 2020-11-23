# Defined in - @ line 1
function start-pg --wraps='sudo service postgresql start' --description 'alias start-pg sudo service postgresql start'
  sudo service postgresql start $argv;
end
