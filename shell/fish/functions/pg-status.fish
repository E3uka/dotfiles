# Defined in - @ line 1
function pg-status --wraps='sudo service postgresql status' --description 'alias pg-status sudo service postgresql status'
  sudo service postgresql status $argv;
end
