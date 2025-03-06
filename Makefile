# ======================================
# Makes it possible to run "make aaa bbb" instead of "make aaa ARGS=bbb"
ARGS := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
%:
	@:
# ======================================

.PHONY: db

test: rspec
lint: rubocop
lint!: rubocop!

build:
	@docker-compose up -d --build

rebuild:
	@docker-compose up -d --build --force-recreate

db:
	@docker-compose run --rm web bundle exec rails db:create db:migrate

test-db:
	@docker-compose run --rm -e RAILS_ENV=test web bundle exec rails db:create db:migrate

rspec:
	@docker-compose run --rm -e RAILS_ENV=test web bundle exec rspec $(ARGS)

rubocop:
	@docker-compose run --rm web bundle exec rubocop $(ARGS)

rubocop!:
	@docker-compose run --rm web bundle exec rubocop -A $(ARGS)

console:
	@docker-compose run --rm web bundle exec rails console $(ARGS)

test-console:
	@docker-compose run --rm -e RAILS_ENV=test web bundle exec rails console $(ARGS)