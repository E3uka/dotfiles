# Defined in - @ line 1
function run-pg --wraps='sudo -u postgres psql' --description 'alias run-pg sudo -u postgres psql'
  sudo -u postgres psql $argv;
end
