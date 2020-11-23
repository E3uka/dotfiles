# Defined in - @ line 1
function stop-pg --wraps='sudo service postgresql stop' --description 'alias stop-pg sudo service postgresql stop'
  sudo service postgresql stop $argv;
end
