#!/bin/zsh

docker compose exec web bundle exec ridgepole --config ./config/database.yml -E test --file ./db/Schemafile --apply
docker compose exec web bundle exec ridgepole --config ./config/database.yml -E development --file ./db/Schemafile --apply
docker compose exec web rails db:schema:dump
