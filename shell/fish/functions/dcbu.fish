# Defined in - @ line 1
function dcbu --wraps='docker-compose build --parallel && dip -f && docker-compose up -d' --description 'alias dcbu docker-compose build --parallel && dip -f && docker-compose up -d'
  docker-compose build --parallel && dip -f && docker-compose up -d $argv;
end
