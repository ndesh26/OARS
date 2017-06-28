mkdir -p tmp/pids
chmod 755 tmp/pids
echo "" > .env
export RAILS_ENV=development
docker-compose -f docker-compose.yml -f docker-compose-development.yml up -d
